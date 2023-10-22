import 'package:animated_button/animated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:minenger/Component/New_Password_Popup.dart';
import 'package:minenger/Pages/Login.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';
import '../Pages/PasswordRefresh.dart';

final Refresh_controller = TextEditingController();
const button_color = Color.fromRGBO(235, 189, 94 ,1);

class Refresh_Validation_Popup extends StatefulWidget {
  @override
  _Refresh_Validation_Popup createState() => _Refresh_Validation_Popup();
}

class _Refresh_Validation_Popup extends State<Refresh_Validation_Popup> {
  int _otpCodeLength = 8;
  bool _isLoadingButton = false;
  bool _enableButton = false;
  String _otpCode = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: 350,
      color: Colors.grey[200],
      child: Column(
        children: [

          Text("Doğrulama Kodu",style: TextStyle(fontSize: 30,color: Colors.orange.shade400,fontWeight: FontWeight.bold),textAlign: TextAlign.center),

          SizedBox(
            height: 10,
          ),

          Text("*Lütfen Mail Adresinize Gelen Doğrulama Kodunu Yazınız",style: TextStyle(fontSize: 11,color: Colors.orange.shade200,fontWeight: FontWeight.normal),textAlign: TextAlign.center,),


          SizedBox(height: 15),

          Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                TextFieldPin(
                  textController: Refresh_controller,
                  autoFocus: true,
                  codeLength: 4,
                  alignment: MainAxisAlignment.center,
                  defaultBoxSize: 30.0,
                  margin: 12,
                  selectedBoxSize: 47.0,
                  textStyle: TextStyle(fontSize: 16),
                  defaultDecoration: _pinPutDecoration.copyWith(
                      border: Border.all(
                          color: Theme.of(context)
                              .primaryColor
                              .withOpacity(0.6))),
                  selectedDecoration: _pinPutDecoration,
                  onChange: (code) {
                    _onOtpCallBack(code,false);
                  }),

                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.orangeAccent,
                  child: Center(
                    child: Column(
                      children:[
                        SizedBox(
                          height: 8,
                        ),

                        Text('Kalan Süre',style: TextStyle(color: Colors.grey.shade200,fontSize: 10)),

                        Text('180 sn',style: TextStyle(color: Colors.white,fontSize: 14)),
                      ],
                    ),
                  ),
                ),

                TextButton(
                  child: Text('İşlemi İptal Et',style: TextStyle(color: Colors.red.shade400,fontSize: 14)),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> Login()), (_) => false);
                  },
                ),

                SizedBox(
                  height: 5,
                ),

                AnimatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'ONAYLA',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Akrobat-Regular',
                          ),
                        ),
                      ],
                    ),
                  ),

                  color: button_color,
                  enabled: true,
                  duration: 30,
                  shadowDegree: ShadowDegree.dark,
                  height: 50,
                  onPressed: () {
                    if(passwordRefreshBox.get('refresh')!= null && passwordRefreshBox.get('refresh').toString() == Refresh_controller.value.text){
                      Navigator.of(context).pop();
                      Dialogs.materialDialog(
                          context: context,
                          barrierDismissible: false,
                          actions: [
                            New_Password_Popup()
                          ]);
                    }else{
                      Dialogs.materialDialog(
                          color: Colors.white,
                          msg: 'Şifre Hatalı',
                          context: context,
                          actions: [
                            IconsButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              text: 'Kapat',
                              iconData: CupertinoIcons.xmark_circle_fill,
                              color: Colors.red,
                              textStyle: TextStyle(color: Colors.white),
                              iconColor: Colors.white,
                            ),
                          ]);
                    }
                  },
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }



  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  _onOtpCallBack(String otpCode, bool isAutofill) {
    setState(() {
      this._otpCode = otpCode;
      if (otpCode.length == _otpCodeLength && isAutofill) {
        _enableButton = false;
        _isLoadingButton = true;
        //_verifyOtpCode();
      } else if (otpCode.length == _otpCodeLength && !isAutofill) {
        _enableButton = true;
        _isLoadingButton = false;
      }else{
        _enableButton = false;
      }
    });
  }
}