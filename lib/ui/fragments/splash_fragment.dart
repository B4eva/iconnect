import 'package:flutter/material.dart';
import 'package:iconnect/core/viewmodels/auth_viewmodel.dart';
import 'package:iconnect/ui/shared/app_colors.dart';
import 'package:iconnect/ui/shared/app_logo.dart';
import 'package:iconnect/ui/shared/media_query.dart';
import 'package:iconnect/ui/shared/ui_helpers.dart';
import 'package:iconnect/ui/views/base_view.dart';
import 'package:iconnect/ui/widgets/iconnect_button.dart';

class SplashFragment extends StatelessWidget {
  const SplashFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
        onModelReady: (model) {},
        builder: (context, model, child) => Container(
              height: fullHeight(context),
              width: fullWidth(context),
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Column(
                children: <Widget>[
                  Expanded(
                      flex: 10,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            // logo
                            AppLogo(logoUri: model.logoUrl),
                          ],
                        ),
                      )),
                  Expanded(flex: 3, child: buttons(context, model)
                      //auth choice buttons
                      )
                ],
              ),
            ));
  }

  Column buttons(BuildContext context, AuthViewModel model) {
    return Column(
      children: <Widget>[
        AppButton(
          color: kWarninngColor,
          child: const Text(
            'Sign Up',
            style: (TextStyle(color: Colors.white)),
          ),
          filled: true,
          radius: 10.0,
          onClicked: () {
            model.navigateToSignUp(context);
          },
        ),
        UIHelper.verticalSpaceSmall(),
        AppButton(
          color: grey,
          child: const Text('Sign In'),
          onClicked: () {
            model.navigateToSignIn(context);
          },

          // fixedSize: const Size(250, 250),
          radius: 10.0,
        )
      ],
    );
  }
}
