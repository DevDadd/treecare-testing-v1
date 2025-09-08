import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testtree/cubit/tree_cubit.dart';
import 'package:testtree/cubit/tree_state.dart';
import 'package:testtree/cubit/user_cubit.dart';
import 'package:testtree/cubit/user_state.dart';
import 'package:testtree/widget/setting_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      FontAwesomeIcons.circleHalfStroke,
      FontAwesomeIcons.language,
    ];
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<TreeCubit, TreeState>(
        builder: (context, treestate) {
          return BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if(state.users == null){
                  return CircularProgressIndicator();
                }
                final imageUrl = state.users!.imageUrl;
                debugPrint("Image URL: ${state.users?.imageUrl}");
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(child: CircleAvatar(radius: 70,backgroundImage: NetworkImage(imageUrl))),
                      SizedBox(height: 15,),
                      Text(state.users!.userName, style: GoogleFonts.cairo(fontWeight: FontWeight.w700, fontSize: 20,color: Colors.green),),
                      SizedBox(height: 15,),
                      Container(
                        height: size.height * 0.04,
                        width: size.width * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Row(
                          children: [
                            Center(child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Number leaves detected: ",style: GoogleFonts.cairo(color: Colors.green),),
                            )),
                            SizedBox(width: 2,),
                            Center(child: Text(treestate.treeHistory.length.toString(),style: GoogleFonts.cairo(color: Colors.green),)),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        height: size.height * 0.09,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.separated(itemCount: 2, itemBuilder: (context, index) {
                            return SettingWidget(icons: icons[index], title: "Change Theme",);
                          }, separatorBuilder: (context, index) {
                            return Divider(color: Colors.black,);
                          },),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
        },
      ),
    );
  }
}
