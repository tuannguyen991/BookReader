import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/features/home/home_page.dart';
import 'package:demo_book_reader/features/login/bloc/login_bloc.dart';
import 'package:demo_book_reader/features/register/register.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/customer_clip_rrect.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _phoneNumberController = TextEditingController();

  final _bloc = LoginBloc(userRepository: locator<UserRepository>());

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _bloc.add(LoginLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        body:
            // ? const Center(child: CircularProgressIndicator())
            _buildBody(),
      ),
    );
  }

  Future<void> _signInWithPhoneNumber(BuildContext context) async {
    try {
      setState(() {
        _isLoading = true;
      });
      // Start the phone number verification process
      verified(AuthCredential authResult) {}

      verificationFailed(FirebaseAuthException authException) {
        setState(() {
          _isLoading = false;
        });
        // Handle phone verification failure
        if (authException.code == 'invalid-phone-number') {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: const Text('Lỗi số điện thoại không hợp lệ'),
                  content: const Text('Mời nhập lại số điện thoại'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.off();
                      },
                      child: const Text('OK'),
                    ),
                  ]);
            },
          );
        }
      }

      smsSent(String verificationId, [int? forceResendingToken]) async {
        // Navigate to the VerifyCodeScreen widget

        setState(() {
          _isLoading = false;
        });
        context.navigateTo(VerifyCodeScreen(verificationId: verificationId));
      }

      // }

      autoTimeout(String verificationId) {}

      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: _phoneNumberController.text,
        verificationCompleted: verified,
        verificationFailed: verificationFailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout,
        // timeout: const Duration(seconds: 30),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text('Lỗi xác thực số điện thoại'),
              content: const Text('Mời xác thực lại'),
              actions: [
                TextButton(
                  onPressed: () {
                    context.off();
                  },
                  child: const Text('OK'),
                ),
              ]);
        },
      );
    }
  }

  Widget _buildBody() {
    // if (!_isLoading)

    return Builder(
      builder: (context) {
        const percent = 0.2;
        final height = MediaQuery.of(context).size.height * percent;
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(double16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: double45,
                        child: CustomerClipRRect(
                          image: 'assets/image/logo.png',
                          isAssets: true,
                        ),
                      ),
                      horizontalSpace16,
                      CustomerText(
                        titleApp,
                        fontSize: fontSize32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
                const CustomerText(
                  'Đăng nhập',
                  fontSize: fontSize32,
                  fontWeight: FontWeight.bold,
                ),
                verticalSpace8,
                CustomerText(
                  'Nhập số điện thoại xác thực',
                  color: AppColors.secondaryColor,
                ),
                verticalSpace32,
                IntlPhoneField(
                  decoration: const InputDecoration(
                    labelText: 'Số điện thoại',
                  ),
                  initialCountryCode: 'VN',
                  initialValue:
                      _phoneNumberController.text.replaceFirst('+84', '0'),
                  onChanged: (phone) {
                    phone.number = phone.number.replaceFirst('0', '');
                    _phoneNumberController.text = phone.completeNumber;
                  },
                  disableLengthCheck: true,
                  flagsButtonPadding: const EdgeInsets.only(right: double16),
                ),
                verticalSpace32,
                ElevatedButton(
                  onPressed: () async {
                    await _signInWithPhoneNumber(context);
                  },
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ))
                      : const Text('Xác thực'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class VerifyCodeScreen extends StatefulWidget {
  final String verificationId;

  const VerifyCodeScreen({super.key, required this.verificationId});

  @override
  // ignore: library_private_types_in_public_api
  _VerifyCodeScreenState createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final _smsCodeController = TextEditingController();

  Future<void> _verifySMSCode(BuildContext context) async {
    try {
      // Create a PhoneAuthCredential with the SMS code
      var credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: _smsCodeController.text,
      );

      // Sign the user in with the credential
      final authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final user = authResult.user;
      if (user != null) {
        // ignore: use_build_context_synchronously
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('token', user.uid);

        var userRepository = locator<UserRepository>();
        final userInfor = await userRepository.getInfor(token: user.uid); // get

        if (userInfor.id == '') {
          // ignore: use_build_context_synchronously
          context.navigateOff(const RegisterPage());
        } else {
          // ignore: use_build_context_synchronously
          context.navigateOff(const HomePage());
        }
      } else {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: const Text('Mã SMS lỗi'),
                content: const Text('Mời xác thực lại'),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.off();
                      context.navigateOff(const LoginPage());
                    },
                    child: const Text('OK'),
                  ),
                ]);
          },
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text('Mã SMS lỗi'),
              content: const Text('Mời xác thực lại'),
              actions: [
                TextButton(
                  onPressed: () {
                    context.off();
                    context.off();
                  },
                  child: const Text('OK'),
                ),
              ]);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Nhập mã SMS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(double16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _smsCodeController,
              decoration: const InputDecoration(
                labelText: 'Mã SMS',
              ),
              keyboardType: TextInputType.number,
            ),
            // ignore: prefer_const_constructors
            SizedBox(height: double16),
            ElevatedButton(
              onPressed: () async {
                await _verifySMSCode(context);
              },
              child: const Text('Xác thức mã SMS'),
            ),
          ],
        ),
      ),
    );
  }
}
