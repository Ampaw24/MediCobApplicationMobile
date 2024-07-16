import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newmedicob/core/spec/string.dart';
import '../../../../core/button.dart';
import '../../../../core/colors.dart';
import '../../../../core/custom_text_form_field.dart';
import '../../../../core/image_constant.dart';
import '../../../../core/textstyles.dart';
import '../../login/login.dart';

Widget RegisterWidget({
  @required TextEditingController? emailController,
  @required TextEditingController? passwordController,
  @required TextEditingController? firstnameController,
  @required TextEditingController? surnameController,
  @required TextEditingController? confirmPasswordController,
  @required TextEditingController? PasswordController,
  @required FocusNode? emailFocusNode,
  @required FocusNode? passwordFocusNode,
  @required FocusNode? firstnameFocusNode,
  @required FocusNode? surnameFocusNode,
  @required FocusNode? confirmPasswordFocusNode,
  @required FocusNode? PasswordFocusNode,
  @required void Function()? onRegister,
  @required void Function()? onForgetPassword,
  @required Key? key,
  required BuildContext? context,
  required bool isLoading,
}) {
  return SingleChildScrollView(
      child: Form(
          key: key,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 250,
                      width: 300,
                      child: Image.asset(ImageConstant.registerpersonal)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Gap(20),
                    Text(
                      "Register",
                      style: headerText,
                    ),
                    Text(
                      "Register by Adding Personal Details",
                      style: subheaderText,
                    ),
                    const Gap(5),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 7),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Firstname",
                          style: subheaderText,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextFormField(
                        hintText: "Firstname",
                        controller: firstnameController,
                        focusNode: firstnameFocusNode,
                        fillColor: WHITE,
                        hintStyle: subheaderText,
                        validateMsg: REQUIREDFIELDMSG,
                        suffix: const Icon(
                          Iconsax.user,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 7),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Lastname",
                          style: subheaderText,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextFormField(
                        validateMsg: REQUIREDFIELDMSG,
                        autofocus: false,
                        hintText: "Lastname",
                        controller: surnameController,
                        focusNode: surnameFocusNode,
                        fillColor: WHITE,
                        hintStyle: subheaderText,
                        suffix: const Icon(
                          Iconsax.user,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 7),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Email",
                          style: subheaderText,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextFormField(
                        validateMsg: REQUIREDFIELDMSG,
                        autofocus: false,
                        hintText: "Add email",
                        controller: emailController,
                        focusNode: emailFocusNode,
                        fillColor: WHITE,
                        hintStyle: subheaderText,
                        suffix: const Icon(
                          Iconsax.message,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 7),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password",
                          style: subheaderText,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextFormField(
                        validateMsg: REQUIREDFIELDMSG,
                        autofocus: false,
                        hintText: "Create Password",
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        fillColor: WHITE,
                        hintStyle: subheaderText,
                        suffix: const Icon(
                          Iconsax.eye,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 7),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Confirm",
                          style: subheaderText,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextFormField(
                        validateMsg: REQUIREDFIELDMSG,
                        autofocus: false,
                        hintText: "Confirm Password",
                        controller: confirmPasswordController,
                        focusNode: confirmPasswordFocusNode,
                        fillColor: WHITE,
                        hintStyle: subheaderText,
                        suffix: const Icon(
                          Iconsax.eye,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ButtonTheme(
                        minWidth: 500,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: button(
                            buttonRadius: 10,
                            height: 55,
                            onPressed: (() => onRegister!()),
                            text: "Register",
                            color: Colors.transparent,
                            context: context,
                            showLoadingIndicator: isLoading,
                            useGradient: true),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                        onTap: () => Navigator.push(
                            context!,
                            CupertinoPageRoute(
                                builder: (context) => const LoginPage())),
                        child: Center(
                            child: Text(
                          "Back to login.",
                          style: subheaderText,
                        )))
                  ],
                ),
              ])));
}

String validateText({String? value}) {
  if (value == null || value.isEmpty) {
    return 'Please enter your first name';
  }
  return "";
}
