import 'package:flutter/material.dart';
import 'package:iconnect/core/network/toast.dart';
import 'package:iconnect/core/viewmodels/signup_viewmodel.dart';
import 'package:iconnect/ui/shared/app_colors.dart';
import 'package:iconnect/ui/shared/app_text.dart';
import 'package:iconnect/ui/views/base_view.dart';
import 'package:iconnect/ui/views/chats/signup/signup_view.dart';
import 'package:iconnect/ui/widgets/app_input_field.dart';
import 'package:iconnect/ui/widgets/iconnect_button.dart';
import 'package:iconnect/ui/widgets/social_auth.dart';

import '../../../../core/enums.dart';
import '../../../shared/app_logo.dart';
import '../../../shared/ui_helpers.dart';

class CompleteSignUp extends StatelessWidget {
  final String? name;
  final String? email;
  final String? password;
  const CompleteSignUp({Key? key, this.name, this.email, this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as SignUpView;
    final _formKey = GlobalKey<FormState>();
    return BaseView<SignUpViewModel>(
      onModelReady: (model) {},
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              )),
                        ),
                        const AppLogo(logoUri: 'assets/images/iclan.png'),
                        UIHelper.verticalSpaceLarge(),
                        AppInputField(
                          controller: model.firstNameController,
                          hintPlaceHolder: 'First name',
                          validator: (v) => model.validator.validateName(v),
                        ),
                        UIHelper.verticalSpaceMedium(),
                        AppInputField(
                          controller: model.lastNameController,
                          hintPlaceHolder: 'Last name',
                          validator: (v) => model.validator.validateName(v),
                        ),
                        UIHelper.verticalSpaceMedium(),
                        AppInputField(
                          controller: model.phoneNumberController,
                          hintPlaceHolder: 'phone number',
                          //  validator: (v) => model.validator.validateNumber(v),

                          onTrailingTapped: () {
                            model.obscure();
                          },
                        ),
                        UIHelper.verticalSpaceMedium(),
                        AppInputField(
                          password: model.obscurePass,
                          controller: model.addressController,
                          hintPlaceHolder: 'Address',
                        ),
                        UIHelper.verticalSpaceMedium(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                                value: model.checkVal,
                                onChanged: (value) {
                                  model.setCheckVal(value!);
                                }),
                            Expanded(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                  text: 'By sigining up you agree to our  ',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: KContentColorPurple),
                                  children: [
                                    TextSpan(
                                        text: 'Terms & conditions',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blue))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        AppButton(
                            color: kWarninngColor,
                            child: model.state == ViewState.busy
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : const AppText.extraSmallText('Sign Up'),
                            onClicked: () {
                              if (_formKey.currentState!.validate()) {
                                showToast(msg: 'User created', status: true);
                                model.navigateToSignin(
                                  context,
                                );
                                // model.navigateToSignin(context);
                                // showToast(
                                //   msg: 'success',
                                //   status: true,
                                // );
                              }

                              // if (model.checkVal == false) {
                              //   showToast(
                              //       msg: 'Terms & condition', status: false);
                              // }
                            }),

                        // socialAuth(),
                        UIHelper.verticalSpaceMedium(),
                        socialAuth(),
                      ],
                    )),
              ),
            ),
          ),
        );
      },
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
