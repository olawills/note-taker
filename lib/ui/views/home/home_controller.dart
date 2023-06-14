import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taker/services/firebase/user_auth.dart';
import 'package:note_taker/services/model/notes_model.dart';

class HomeController extends GetxController {
  final userAuth = UserAuthentication();
  NotesModel noteModel = NotesModel();
  final searchController = TextEditingController();
  List<QueryDocumentSnapshot> noteList = [];
  final ScrollController listScrollController = ScrollController();

  int limit = 20;
  int limitIncrement = 20;

  @override
  void onInit() async {
    listScrollController.addListener(scrollListener);

    update();
    super.onInit();
  }

  void scrollListener() {
    if (listScrollController.offset >=
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange) {
      limit += limitIncrement;
      update();
    }
  }

  Stream<QuerySnapshot> getNotes() {
    return FirebaseFirestore.instance
        .collection('user notes')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('notes')
        .snapshots();
  }

  Future<void> getUpdatedNotes() async {
    final updatedNotes = await userAuth.refreshUserNotes();
    noteModel = NotesModel(
      time: updatedNotes['time'],
      title: updatedNotes['title'],
      body: updatedNotes['body'],
    );
    update();
  }

  Future<void> deleteNote(String noteId) async {
    await userAuth.deleteNotesFromFirebase(noteId);
    update();
  }

  void signOut() async {
    await userAuth.logOut();
  }
}
