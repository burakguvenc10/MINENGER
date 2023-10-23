import 'package:animated_button/animated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:minenger/Pages/Login.dart';

final newpassword_Controller = TextEditingController();
final newpasswordAgain_Controller = TextEditingController();
const button_color = Color.fromRGBO(235, 189, 94 ,1);

class New_Password_Popup extends StatefulWidget {
  @override
  _New_Password_Popup createState() => _New_Password_Popup();
}

class _New_Password_Popup extends State<New_Password_Popup> {
  bool _isLoadingButton = false;
  bool _newHiddenPassword = true;
  bool _newAgainHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: 350,
      color: Colors.grey[200],
      child: Column(
        children: [

          Text("Şifre Yenileme",style: TextStyle(fontSize: 30,color: Colors.orange.shade400,fontWeight: FontWeight.bold),textAlign: TextAlign.center),

          SizedBox(
            height: 10,
          ),

          Text("*Lütfen En Az 8 Karakterli Bir Şifre Belirleyiniz!",style: TextStyle(fontSize: 11,color: Colors.orange.shade200,fontWeight: FontWeight.normal),textAlign: TextAlign.center,),


          SizedBox(height: 15),

          Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                TextFormField(
                  textAlign: TextAlign.left,
                  showCursor: true,
                  cursorColor: Colors.black26,
                  enableInteractiveSelection: false,
                  obscureText: _newHiddenPassword,
                  style: TextStyle(fontSize: 17),
                  keyboardType: TextInputType.visiblePassword,
                  autofocus: false,
                  controller: newpassword_Controller,
                  decoration: InputDecoration(
                    labelText: 'Yeni Şifre',
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: IconButton(
                      onPressed: (){},
                      icon: Icon(Bootstrap.lock),
                      color: Colors.black54,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(_newHiddenPassword? Bootstrap.eye: CupertinoIcons.eye),
                      color: Colors.black54,
                      onPressed: (){
                        _newHiddenPassword = !_newHiddenPassword;
                        setState(() {
                        });
                      },
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orange,
                      ),
                    ),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 1,
                  onSaved: (deger) {
                  },
                  onChanged: (deger) {
                  },

              ),

              SizedBox(
                height: 15,
              ),

               TextFormField(
                 textAlign: TextAlign.left,
                 showCursor: true,
                 cursorColor: Colors.black26,
                 enableInteractiveSelection: false,
                 obscureText: _newAgainHiddenPassword,
                 style: TextStyle(fontSize: 17),
                 keyboardType: TextInputType.visiblePassword,
                 autofocus: false,
                 controller: newpasswordAgain_Controller,
                 decoration: InputDecoration(
                   labelText: '*Yeni Şifre Tekrar',
                   labelStyle: TextStyle(color: Colors.black),
                   prefixIcon: IconButton(
                     onPressed: (){},
                     icon: Icon(Bootstrap.lock),
                     color: Colors.black54,
                   ),
                   suffixIcon: IconButton(
                     icon: Icon(_newAgainHiddenPassword? Bootstrap.eye: CupertinoIcons.eye),
                     color: Colors.black54,
                     onPressed: (){
                       _newAgainHiddenPassword = !_newAgainHiddenPassword;
                       setState(() {

                       });
                     },
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                       color: Colors.orange,
                     ),
                   ),
                   errorStyle: TextStyle(color: Colors.redAccent),
                   border: OutlineInputBorder(),
                 ),
                 maxLines: 1,
                 onSaved: (deger) {
                 },
                 onChanged: (deger) {
                 },
               ),

               SizedBox(
                 height: 20,
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
                    var newPassword = newpassword_Controller.value.text;
                    var newPasswordAgain = newpasswordAgain_Controller.value.text;
                    var characterNewPassword = newPassword.length;
                    var characterNewPasswordAgain = newPasswordAgain.length;
                    if((newPassword.isNotEmpty && newPasswordAgain.isNotEmpty) && (newPassword == newPasswordAgain)){
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> Login()), (_) => false);
                      Dialogs.materialDialog(
                          color: Colors.white,
                          msg: 'İşleminiz Başarılı',
                          context: context,
                          actions: [
                            IconsButton(
                              onPressed: () {
                              },
                              text: 'Şifreniz Değiştirildi',
                              iconData: Iconsax.chart_success,
                              color: Colors.green,
                              textStyle: TextStyle(color: Colors.white),
                              iconColor: Colors.white,
                            ),
                          ]);
                    }
                    else if(newPassword.isNotEmpty && newPasswordAgain.isNotEmpty && (newPassword != newPasswordAgain) ){
                      Dialogs.materialDialog(
                          color: Colors.white,
                          msg: 'Şifre alanları birbiriyle aynı olmalıdır!',
                          context: context,
                          actions: [
                            IconsButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              text: 'Kapat',
                              iconData: Iconsax.warning_2,
                              color: Colors.red,
                              textStyle: TextStyle(color: Colors.white),
                              iconColor: Colors.white,
                            ),
                          ]);
                    }
                    else if((newPassword.isNotEmpty && newPasswordAgain.isNotEmpty) && (characterNewPassword < 8 || characterNewPasswordAgain < 8 )){
                      Dialogs.materialDialog(
                          color: Colors.white,
                          msg: 'Şifre Uzunluğu 8 Karakterden Az Olamaz!',
                          context: context,
                          actions: [
                            IconsButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              text: 'Kapat',
                              iconData: Iconsax.warning_2,
                              color: Colors.red,
                              textStyle: TextStyle(color: Colors.white),
                              iconColor: Colors.white,
                            ),
                          ]);
                    }
                    else{
                      Dialogs.materialDialog(
                          color: Colors.white,
                          msg: 'Şifre alanları boş bırakılamaz!',
                          context: context,
                          actions: [
                            IconsButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              text: 'Kapat',
                              iconData: Iconsax.warning_2,
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
}