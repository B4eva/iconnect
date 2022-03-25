import 'package:get_it/get_it.dart';
import 'package:iconnect/core/services/auth_service.dart';
import 'package:iconnect/core/services/database.dart';
import 'package:iconnect/core/services/firebase_auth_service.dart';
import 'package:iconnect/core/viewmodels/auth_viewmodel.dart';
import 'package:iconnect/core/viewmodels/chat_viewmodel.dart';
import 'package:iconnect/core/viewmodels/search_viewmodel.dart';
import 'package:iconnect/core/viewmodels/signin_viewmodel.dart';
import 'package:iconnect/core/viewmodels/signup_viewmodel.dart';
import 'package:iconnect/core/viewmodels/welcome_viewmodel.dart';
import 'package:iconnect/ui/views/auth_view.dart';
import 'package:iconnect/ui/views/chats/chat_view.dart';
import 'package:iconnect/ui/views/search_view.dart';

import 'package:iconnect/ui/views/signin_view.dart';
import 'package:iconnect/ui/views/signup/complete_signup.dart';
import 'package:iconnect/ui/views/signup/signup_view.dart';

import 'package:iconnect/ui/views/welcome_view.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => const WelcomeView());
  locator.registerLazySingleton(() => const AuthView());
  locator.registerLazySingleton(() => const SignUpView());
  locator.registerLazySingleton(() => const CompleteSignUp());
  locator.registerLazySingleton(() => const SignInView());
  locator.registerLazySingleton(() => const ChatView());
  locator.registerLazySingleton(() => const SearchView());

  locator.registerFactory<WelcomeViewModel>(() => WelcomeViewModel());
  locator.registerFactory<AuthViewModel>(() => AuthViewModel());
  locator.registerFactory<ChatViewModel>(() => ChatViewModel());
  locator.registerFactory<SignInViewModel>(() => SignInViewModel());
  locator.registerFactory<SignUpViewModel>(() => SignUpViewModel());
  locator.registerFactory<SearchViewModel>(() => SearchViewModel());

  locator.registerLazySingleton(() => FireBaseAuthService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => DatabaseService());
}
