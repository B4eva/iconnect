import 'package:flutter/material.dart';
import 'package:iconnect/core/enums.dart';
import 'package:iconnect/core/viewmodels/signin_viewmodel.dart';
import 'package:iconnect/ui/shared/app_colors.dart';
import 'package:iconnect/ui/shared/app_logo.dart';
import 'package:iconnect/ui/shared/app_text.dart';
import 'package:iconnect/ui/shared/ui_helpers.dart';
import 'package:iconnect/ui/views/base_view.dart';
import 'package:iconnect/ui/widgets/app_input_field.dart';
import 'package:iconnect/ui/widgets/iconnect_button.dart';
import 'package:iconnect/ui/widgets/social_auth.dart';
import 'package:iconnect/utils/loading_widget.dart';

import '../../core/network/toast.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BaseView<SignInViewModel>(
        onModelReady: (model) {},
        builder: (context, model, child) => Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          UIHelper.verticalSpaceLarge(),
                          UIHelper.verticalSpaceLarge(),

                          const AppLogo(logoUri: 'assets/images/iclan.png'),
                          UIHelper.verticalSpaceLarge(),
                          AppInputField(
                            controller: model.emailController,
                            hintPlaceHolder: 'email',
                            validator: (v) => model.validator.validateEmail(v),
                          ),
                          UIHelper.verticalSpaceMedium(),
                          AppInputField(
                            password: model.obscurePass,
                            controller: model.passWordController,
                            hintPlaceHolder: 'Password(Atleast 8 characters)',
                            validator: (v) =>
                                model.validator.validatePassWord(v),
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
                          UIHelper.verticalSpaceLarge(),
                          AppButton(
                              color: kWarninngColor,
                              child: model.state == ViewState.busy
                                  ? loadWidget
                                  : const AppText.extraSmallText('Sign In'),
                              onClicked: () {
                                if (_formKey.currentState!.validate()) {
                                  model.performLogin(context);
                                }
                              }),

                          // socialAuth(),
                          UIHelper.verticalSpaceMedium(),
                          socialAuth(),
                        ],
                      )),
                ),
              ),
            ));
  }

  Widget socialAuth() {
    return Container(
      child: Column(
        children: [
          const Text(
            'Or Sign In with',
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
