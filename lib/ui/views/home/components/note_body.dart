import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taker/services/model/notes_model.dart';
import 'package:note_taker/ui/shared/constants/exports.dart';
import 'package:note_taker/ui/shared/widgets/reusable_text.dart';

class NotesBody extends StatelessWidget {
  final NotesModel notes;
  final Function() onTap;
  const NotesBody({
    super.key,
    required this.notes,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.toNamed('/notes', arguments: notes);
      },
      tileColor: Color(kLowRed.value),
      shape: RoundedRectangleBorder(
        borderRadius: miniMediumBorderRadius,
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Align(
          alignment: Alignment.topLeft,
          child: ReusableText(
            text: notes.title,
            style: appMStyle(24, Color(kDark.value), FontWeight.w500),
          ),
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ReusableText(
              text: notes.time,
              style: appMStyle(15, Color(kDark.value), FontWeight.w500),
            ),
            IconButton(
              onPressed: onTap,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
