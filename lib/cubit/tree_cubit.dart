import 'dart:io';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:testtree/model/tree.dart';
import 'package:testtree/service/tree_service.dart';
import 'tree_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class TreeCubit extends HydratedCubit<TreeState> {
  TreeCubit() : super(TreeState());
  final logger = Logger();

  Future<Tree?> uploadTreeImage(File imageFile) async {
    try {
      final uploadedTree = await TreeService.postTree(imageFile);

      if (uploadedTree != null && uploadedTree.treeId != null) {
        await getTree(uploadedTree.treeId!);
      } else {
        throw Exception("Server did not return a valid tree ID");
      }

      return state.treeResult;
    } on DioException catch (dioErr) {
      logger.e(
        'Dio upload error',
        error: dioErr,
        stackTrace: dioErr.stackTrace,
      );
      logger.e('Server response: ${dioErr.response?.data}');
      return null;
    } catch (e, st) {
      logger.e('Unexpected error in uploadTreeImage', error: e, stackTrace: st);
      return null;
    }
  }

  Future<void> getTree(int id) async {
    try {
      final tree = await TreeService.getTree(id);
      emit(state.copyWith(treeResult: tree));
    } on DioException catch (dioErr) {
      logger.e(
        'Dio getTree error',
        error: dioErr,
        stackTrace: dioErr.stackTrace,
      );
      logger.e('Server response: ${dioErr.response?.data}');
    } catch (e, st) {
      logger.e('Unexpected error getting tree', error: e, stackTrace: st);
    }
  }

  void addHistory(Tree tree) {
    emit(state.copyWith(treeHistory: [...state.treeHistory, tree]));
  }

  @override
  TreeState? fromJson(Map<String, dynamic> json) {
    try {
      return TreeState.fromJson(json);
    } catch (e) {
      logger.e('Error decoding state from JSON', error: e);
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(TreeState state) {
    try {
      return state.toJson();
    } catch (e) {
      logger.e('Error encoding state to JSON', error: e);
      return null;
    }
  }
}
