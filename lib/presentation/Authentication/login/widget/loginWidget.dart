import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/button.dart';
import '../../../../core/colors.dart';
import '../../../../core/custom_text_form_field.dart';
import '../../../../core/image_constant.dart';
import '../../../../core/textstyles.dart';
import '../../register/registerpage.dart';

Widget loginWidget({
  @required TextEditingController? emailController,
  @required TextEditingController? passwordController,
  @required FocusNode? emailFocusNode,
  @required FocusNode? passwordFocusNode,
  @required void Function()? onLogin,
  @required void Function()? onForgetPassword,
  @required Key? key,
  required BuildContext? context,
  required bool isLoading,
}) {
  return SingleChildScrollView(
    child: Form(
      key: key,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(50),
            Center(
              child: SizedBox(
                  height: 180,
                  width: 230,
                  child: Image.asset(ImageConstant.logo)),
            ),
            Text(
              "WELCOME",
              style: headerText,
            ),
            Text(
              "Enter credentials to signin",
              style: subheaderText,
            ),
            SizedBox(height: MediaQuery.of(context!).size.height * 0.02),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Email",
                      style: subheaderText,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomTextFormField(
                      hintText: "Enter email",
                      controller: emailController,
                      focusNode: emailFocusNode,
                      fillColor: WHITE,
                      hintStyle: subheaderText,
                      suffix: const Icon(
                        Iconsax.message,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Password",
                      style: subheaderText,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomTextFormField(
                      hintText: "Enter password",
                      controller: passwordController,
                      focusNode: passwordFocusNode,
                      fillColor: WHITE,
                      hintStyle: subheaderText,
                      suffix: IconButton(
                        onPressed: () {},
                        icon: const Icon(Iconsax.eye),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "Forgot Password",
                          style: subheaderText,
                        )),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ButtonTheme(
                      minWidth: 500,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: button(
                          buttonRadius: 10,
                          height: 55,
                          onPressed: (() => onLogin!()),
                          text: "Login",
                          color: Colors.transparent,
                          context: context,
                          showLoadingIndicator: isLoading,
                          useGradient: true),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ButtonTheme(
                    minWidth: 500,
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: button(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                          
                            builder: (context) => const RegisterPage()));
                      },
                      text: "Don't have an Account? Register",
                      color: Colors.transparent,
                      context: context,
                      elevation: 0,
                      textColor: PRIMARYCOLOR,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
