import 'package:ecom_amazon/misc/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool pseudoInitState = true;
  late RouterProvider _routerProvider;
  TextEditingController _textEditingController = TextEditingController();
  String verificationID = "";

  @override
  Widget build(BuildContext context) {

    if(pseudoInitState) {
      _routerProvider = Provider.of<RouterProvider>(context);
      pseudoInitState = false;
    }


    return Material(
      child: Container(
        child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(onTap:() async{

                        /*  await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: '+91 9967034669',
                            verificationCompleted: (PhoneAuthCredential credential) {
                              print("Verification completed with credentials : $credential");
                            },
                            verificationFailed: (FirebaseAuthException e) {
                              print("Verification falied with exception : $e");
                            },
                            codeSent: (String verificationId, int? resendToken) {
                              verificationID = verificationId;
                              print("Code sent with verification ID : $verificationId");
                            },
                            codeAutoRetrievalTimeout: (String verificationId) {
                              print("Timeout !!!");
                            },
                          ); */
                  },child: Text("Login")),
                TextField(controller: _textEditingController,),
                RaisedButton(onPressed: (){
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationID, smsCode: _textEditingController.text);
                  FirebaseAuth.instance.signInWithCredential(credential).then((value){
                    _routerProvider.isLoggedIn = true;
                    _routerProvider.loginToggle = false;
                    _routerProvider.notifyMyListener();
                  });
                },child: Text("Verify"),)

              ],
            ),
        ),
      ),
    );
  }
}
