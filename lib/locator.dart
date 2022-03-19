import 'package:get_it/get_it.dart';
import 'package:iconnect/core/viewmodels/auth_viewmodel.dart';
import 'package:iconnect/core/viewmodels/chat_viewmodel.dart';
import 'package:iconnect/core/viewmodels/welcome_viewmodel.dart';
import 'package:iconnect/ui/views/auth_view.dart';
import 'package:iconnect/ui/views/welcome_view.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => const WelcomeView());
  locator.registerLazySingleton(() => const AuthView());

  locator.registerLazySingleton(() => WelcomeViewModel());
  locator.registerFactory<AuthViewModel>(() => AuthViewModel());
  locator.registerFactory<ChatViewModel>(() => ChatViewModel());
}
