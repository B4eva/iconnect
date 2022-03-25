import 'package:flutter/material.dart';
import 'package:iconnect/core/network/toast.dart';
import 'package:iconnect/core/viewmodels/signup_viewmodel.dart';
import 'package:iconnect/ui/views/base_view.dart';
import 'package:iconnect/ui/widgets/app_input_field.dart';
import 'package:iconnect/ui/widgets/social_auth.dart';
import 'package:iconnect/utils/loading_widget.dart';

import '../../../../core/enums.dart';
import '../../shared/app_colors.dart';
import '../../shared/app_logo.dart';
import '../../shared/app_text.dart';
import '../../shared/ui_helpers.dart';
import '../../widgets/iconnect_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
      onModelReady: (model) {},
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    children: <Widget>[
                      UIHelper.verticalSpaceLarge(),
                      const AppLogo(logoUri: 'assets/images/iclan.png'),
                      UIHelper.verticalSpaceLarge(),
                      AppInputField(
                        controller: model.userNameController,
                        hintPlaceHolder: 'Username',
                        validator: (v) => model.validator.validateName(v),
                      ),
                      UIHelper.verticalSpaceMedium(),
                      AppInputField(
                        controller: model.emailController,
                        hintPlaceHolder: 'Email',
                        validator: (v) => model.validator.validateEmail(v),
                      ),
                      UIHelper.verticalSpaceMedium(),
                      AppInputField(
                        password: model.obscurePass,
                        controller: model.passWordController,
                        hintPlaceHolder: 'Password(Atleast 8 characters)',
                        validator: (v) => model.validator.validatePassWord(v),
                        trailing: Icon(
                          model.obscurePass
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 15,
                        ),
                        onTrailingTapped: () {
                          model.obscure();
                        },
                      ),
                      UIHelper.verticalSpaceMedium(),
                      AppInputField(
                        password: model.obscurePass,
                        controller: model.confirmPassWordController,
                        hintPlaceHolder: 'Confirm password',
                        validator: (v) {
                          if (model.passWordController.text != v) {
                            return 'Password not Equal';
                          }
                          return null;
                        },
                        trailing: Icon(
                          model.obscurePass
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 15,
                        ),
                        onTrailingTapped: () {
                          model.obscure();
                        },
                      ),
                      UIHelper.verticalSpaceMedium(),
                      AppButton(
                          color: kWarninngColor,
                          child: model.state == ViewState.busy
                              ? loadWidget
                              : const AppText.extraSmallText('Next ->'),
                          onClicked: () {
                            if (_formKey.currentState!.validate()) {
                              model.performSignUp(
                                context,
                              );
                            }
                          }),

                      // socialAuth(),
                      UIHelper.verticalSpaceMedium(),
                      socialAuth(),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }

  Widget socialAuth() {
    return Container(
      child: Column(
        children: [
          const Text(
            'Or Sign up with',
            style: TextStyle(
                fontSize: 13,
                //color:
                fontWeight: FontWeight.w500),
          ),
          UIHelper.verticalSpaceSmall(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialAuth(onTap: () {}, iconUrl: 'assets/images/facebook.png'),
              SocialAuth(onTap: () {}, iconUrl: 'assets/images/google.png'),
            ],
          )
        ],
      ),
    );
  }
}
