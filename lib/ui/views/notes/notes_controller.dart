import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:note_taker/services/firebase/user_auth.dart';
import 'package:note_taker/services/model/notes_model.dart';

class NotesViewController extends GetxController {
  final notes = Get.arguments as NotesModel;

  final userAuth = UserAuthentication();
  final noteController = TextEditingController();
  final titleController = TextEditingController();

  // FocusNodes
  final titleFocusNode = FocusNode();
  final noteFocusNode = FocusNode();

  // Get the current for the notes
  DateTime now = DateTime.now();

  // check if the user has started
  RxBool showDoneIcon = false.obs;

  void updateNotes() {
    showDoneIcon.value = true;
    update();
    userAuth.updateNotes(
        title: titleController.text,
        body: noteController.text,
        time: DateFormat("MMM dd, yyyy  HH:mm:ss").format(now));
    Get.back();
    showDoneIcon.value = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();

    textFieldChanged();

    titleController.text = notes.title;
    noteController.text = notes.body;
    update();
  }

  void textFieldChanged() {
    if (titleController.text.trim().isNotEmpty ||
        noteController.text.trim().isNotEmpty) {
      showDoneIcon.value = true;
      updateNotes();
    } else {
      showDoneIcon.value = true;
    }
  }

  @override
  void onClose() {
    super.onClose();

    // Clean up the controllers
    titleController.dispose();
    noteController.dispose();
  }
}
