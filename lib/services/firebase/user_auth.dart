import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:note_taker/services/model/notes_model.dart';
import 'package:note_taker/services/model/user_model.dart';

class UserAuthentication {
  final _firestore = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;

  // Registering with Email and password is done here in this function. The method taskes
  // in two parameters which are email and password, with these we will authenticate user and save their
  // registration on our cloud firebase

  Future<void> registerWithEmailAndPassword(
      {required String email,
      required String firstName,
      required String lastName,
      required String password}) async {
    final user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    UserModel userModel = UserModel(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );
    await _firestore
        .collection('users')
        .doc(user.user!.uid)
        .set(userModel.toMap());
  }

  // This function signin users, it takes in a email and password parameters

  Future<UserCredential?> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> createNotes(
      {required String body, required String title}) async {
    NotesModel notes = NotesModel(
      time: DateFormat("MMM dd, yyyy  hh:mm:ss a").format(DateTime.now()),
      body: body,
      title: title,
    );
    await _firestore
        .collection('user notes')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("notes")
        .doc()
        .set(notes.toMap());
  }

// method to update notes
  Future<void> updateNotes({
    required String title,
    required String body,
    required String time,
  }) async {
    final docRef = FirebaseFirestore.instance
        .collection('users notes')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('notes')
        .doc();
    Map<String, dynamic> data = <String, dynamic>{
      'title': title,
      'body': body,
      'time': time,
    };
    await docRef
        .update(data)
        .whenComplete(() => print('Note updated'))
        .catchError((e) => print(e));
  }

  Future<void> deleteNotesFromFirebase(String noteId) async {
    final docRef = FirebaseFirestore.instance
        .collection('users notes')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('notes')
        .doc(noteId);
    await docRef
        .delete()
        .whenComplete(() => print('Deleted from Database'))
        .catchError((e) => print(e));
  }

  /// refresh user notes through this function
  Future refreshUserNotes() async {
    final docRef = FirebaseFirestore.instance
        .collection('users notes')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('notes')
        .get()
        .then((QuerySnapshot doc) {
      final data = doc.docs;
      return data;
    });

    return docRef;
  }

// logout method
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed('/signin');
  }
}
