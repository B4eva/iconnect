import 'package:iconnect/core/network/logger.dart';
import 'package:iconnect/core/viewmodels/base_viewmodel.dart';

class AuthViewModel extends BaseViewModel {
  final logger = getLogger('AuthView_model');

  String _logoUrl = 'assets/images/iclan.png';
  double _logoWidth = 90.0;
  double _logoHeight = 50.0;

  String get logoUrl => _logoUrl;
  double get logoWidth => _logoWidth;
  double get logoHeight => _logoHeight;
}
