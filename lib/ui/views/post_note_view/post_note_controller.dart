import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taker/services/firebase/user_auth.dart';

class PostNoteController extends GetxController {
  final userAuth = UserAuthentication();
  final noteController = TextEditingController();
  final titleController = TextEditingController();
  final searchController = TextEditingController();

  // Get the current for the notes
  DateTime now = DateTime.now();

  // check if the user has started
  RxBool showDoneIcon = false.obs;

  void createNotes() async {
    try {
      final title = titleController.text.trim();
      final note = noteController.text.trim();

      if (title.isEmpty && note.isEmpty) {
        showDoneIcon.value = false;
        return;
      }

      showDoneIcon.value = true;
      update();
      userAuth.createNotes(
        body: note,
        title: title,
      );
      Get.offAllNamed('/home');
      showDoneIcon.value = false;
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();

    // Listen to changes in the text fields
    titleController.addListener(textFieldChanged);
    noteController.addListener(textFieldChanged);
  }

  void textFieldChanged() {
    // Check if any of the text fields have non-empty text
    if (titleController.text.trim().isNotEmpty ||
        noteController.text.trim().isNotEmpty) {
      showDoneIcon.value = true;
    } else {
      showDoneIcon.value = false;
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
