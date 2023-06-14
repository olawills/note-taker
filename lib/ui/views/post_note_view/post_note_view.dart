import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:note_taker/ui/shared/constants/exports.dart';
import 'package:note_taker/ui/shared/widgets/reusable_text.dart';

import 'post_note_controller.dart';

class PostNoteView extends StatelessWidget {
  const PostNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostNoteController>(
        init: PostNoteController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                  backgroundColor: Color(kDarkRed.value),
                  title: ReusableText(
                    text: 'Notes',
                    style: appMStyle(18, Color(kLight.value), FontWeight.w500),
                  ),
                  actions: [
                    Obx(
                      () {
                        if (controller.showDoneIcon.value) {
                          return IconButton(
                            onPressed: () => controller.createNotes(),
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
                  ]),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                          text: DateFormat('kk:mm a').format(controller.now),
                          style: appMStyle(
                              18, Color(kDark.value), FontWeight.w500),
                        ),
                        TextFormField(
                          controller: controller.titleController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          textInputAction: TextInputAction.newline,
                          onChanged: (value) {
                            // Check if the text is empty
                            if (value.trim().isEmpty) {
                              controller.titleController
                                  .clear(); // Clear the text field
                            }
                          },
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
                          textInputAction: TextInputAction.newline,
                          onChanged: (value) {
                            // Check if the text is empty
                            if (value.trim().isEmpty) {
                              controller.noteController
                                  .clear(); // Clear the text field
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'Note something down',
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}
