import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:note_taker/ui/shared/constants/exports.dart';
import 'package:note_taker/ui/shared/widgets/reusable_text.dart';

import 'notes_controller.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotesViewController>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          controller.noteFocusNode.unfocus();
          controller.titleFocusNode.unfocus();
        },
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(kDarkRed.value),
              title: ReusableText(
                text: 'Notes',
                style: appMStyle(24, Color(kLight.value), FontWeight.w500),
              ),
              actions: [
                Obx(
                  () {
                    if (controller.showDoneIcon.value) {
                      return IconButton(
                        onPressed: () => controller.updateNotes(),
                        icon: Icon(
                          Icons.done,
                          color: Color(kLight.value),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: controller.notes.time,
                        style:
                            appMStyle(18, Color(kDark.value), FontWeight.w500),
                      ),
                      TextFormField(
                        controller: controller.titleController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        textInputAction: TextInputAction.newline,
                        focusNode: controller.titleFocusNode,
                        onSaved: (value) => controller.notes.title = value!,
                        decoration: const InputDecoration(
                          hintText: 'Title',
                          border: InputBorder.none,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      TextFormField(
                        controller: controller.noteController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        focusNode: controller.noteFocusNode,
                        onSaved: (value) => controller.notes.body = value!,
                        textInputAction: TextInputAction.newline,
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                          hintText: 'Note something down',
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      );
    });
  }
}
