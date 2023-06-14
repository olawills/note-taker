import 'package:get/get.dart';
import 'package:note_taker/ui/views/home/home_view.dart';
import 'package:note_taker/ui/views/notes/notes_controller.dart';
import 'package:note_taker/ui/views/notes/notes_view.dart';
import 'package:note_taker/ui/views/post_note_view/post_note_view.dart';
import 'package:note_taker/ui/views/signin/signin_view.dart';
import 'package:note_taker/ui/views/signup/signup_view.dart';

class AppRoute {
  static List<GetPage> routes() => [
        // GetPage(name: '/', page: () => const SplashView()),
        GetPage(
          name: '/signin',
          page: () => const SigninView(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(seconds: 0, milliseconds: 500),
        ),
        GetPage(
          name: '/signup',
          page: () => const SignupView(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(seconds: 0, milliseconds: 500),
        ),
        GetPage(
          name: '/home',
          page: () => const HomeView(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(seconds: 0, milliseconds: 500),
        ),
        GetPage(
          name: '/post-note',
          page: () => const PostNoteView(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(seconds: 0, milliseconds: 500),
        ),
        GetPage(
          name: '/notes',
          page: () => const NotesView(),
          binding: BindingsBuilder(() {
            Get.lazyPut<NotesViewController>(() => NotesViewController());
          }),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(seconds: 0, milliseconds: 500),
        ),
      ];
}
