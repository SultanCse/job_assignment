import 'package:assignment/controllers/login_controller.dart';
import 'package:assignment/dialogs/app_exit_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../widgets/text_input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = LoginController();
  LoginController value = LoginController();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.initController(context);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    controller = Provider.of<LoginController>(context, listen: false);
    value = Provider.of<LoginController>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () => showAppExitDialog(context: context),
      child: Scaffold(
        body: Stack(
          fit: StackFit.loose,
          clipBehavior: Clip.antiAlias,
          children: [
            SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Login Here",
                      style: GoogleFonts.acme(fontSize: 48),
                    ),
                    const SizedBox(height: 32),
                    TextInputField(
                      textEditingController: controller.phone,
                      textInputType: TextInputType.phone,
                      hintText: 'Enter Your Phone Number',
                    ),
                    const SizedBox(height: 16),
                    TextInputField(
                      textEditingController: controller.password,
                      textInputType: TextInputType.text,
                      isPass: true,
                      hintText: 'Enter Your Password',
                    ),
                    const SizedBox(height: 32),
                    InkWell(
                      onTap: () => controller.loginOnTap(context),
                      child: Container(
                        child: Text('Log In', style: GoogleFonts.acme(fontSize: 24)),
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: const ShapeDecoration(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            !value.loader
                ? SizedBox.shrink()
                : Container(
                    width: width,
                    height: height,
                    color: Colors.white.withOpacity(0.6),
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(color: Colors.black.withOpacity(0.7)),
                  ),
          ],
        ),
      ),
    );
  }
}
