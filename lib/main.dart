import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:note_taker/firebase_options.dart';
import 'package:note_taker/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // AppBindings().dependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initializeDateFormatting('en').then((_) {
    // Call runApp or your main application logic here
    runApp(const MyApp());
  });
}
