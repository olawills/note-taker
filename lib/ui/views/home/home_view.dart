import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:note_taker/services/model/notes_model.dart';
import 'package:note_taker/ui/shared/constants/exports.dart';
import 'package:note_taker/ui/shared/widgets/reusable_text.dart';
import 'package:note_taker/ui/views/home/components/note_body.dart';
import 'package:note_taker/ui/views/home/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (state) {},
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(kDarkRed.value),
            title: ReusableText(
              text: 'Notes',
              style: appMStyle(18, Color(kLight.value), FontWeight.w500),
            ),
            actions: [
              Row(
                children: [
                  ReusableText(
                    text: 'Logout',
                    style: appMStyle(18, Color(kLight.value), FontWeight.w500),
                  ),
                  IconButton(
                    onPressed: () => controller.signOut(),
                    icon: const Icon(Icons.logout),
                  ),
                ],
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 12),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            text: 'Notes',
                            style: appMStyle(
                                40, Color(kDark.value), FontWeight.w500),
                          ),
                          SizedBox(height: 10.h),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: StreamBuilder<QuerySnapshot>(
                        stream: controller.getNotes(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            controller.noteList = snapshot.data!.docs;
                            if (controller.noteList.isNotEmpty) {
                              return ListView.separated(
                                itemCount: snapshot.data!.docs.length,
                                physics: const NeverScrollableScrollPhysics(),
                                controller: controller.listScrollController,
                                shrinkWrap: true,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(height: 10.h);
                                },
                                itemBuilder: (context, index) {
                                  NotesModel notes = NotesModel.fromSnapshot(
                                      snapshot.data!.docs[index]);
                                  final deleteNote =
                                      snapshot.data!.docs[index].id;
                                  return NotesBody(
                                    notes: notes,
                                    onTap: () =>
                                        controller.deleteNote(deleteNote),
                                  );
                                },
                              );
                            } else {
                              return Align(
                                alignment: Alignment.center,
                                child: ReusableText(
                                    text: 'Nothing yet',
                                    style: appMStyle(18, Color(kDark.value),
                                        FontWeight.w500)),
                              );
                            }
                          } else {
                            return const Align(
                              alignment: Alignment.bottomCenter,
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: SizedBox(
            height: 80.h,
            width: 80.w,
            child: FloatingActionButton(
              backgroundColor: Color(kDarkRed.value),
              onPressed: () => Get.toNamed('/post-note'),
              child: Icon(Icons.add, size: 30.sp),
            ),
          ),
        );
      },
    );
  }
}
