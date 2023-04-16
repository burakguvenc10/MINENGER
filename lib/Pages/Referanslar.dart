import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final referanskodu_controller = TextEditingController();

class Referanslar extends StatefulWidget {
  @override
  _Referanslar createState() => _Referanslar();
}

class _Referanslar extends State<Referanslar> {

  String copyCode = referanskodu_controller.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    color: Colors.grey.shade200,
                    elevation: 5,
                    shadowColor: Colors.grey,
                    child: Container(
                      height: 200,
                      padding: const EdgeInsets.all(20.0),
                      child:Column(
                        children: [
                          TextFormField(
                            textAlign: TextAlign.center,
                            showCursor: false,
                            enableInteractiveSelection: false,
                            obscureText: false,
                            keyboardType: TextInputType.none,
                            autofocus: false,
                            controller: referanskodu_controller,
                            decoration: InputDecoration(
                              labelText: 'Referans Kodu',
                              labelStyle: TextStyle(color: Colors.black),
                              suffixIcon: IconButton(
                                onPressed: (){
                                  Clipboard.setData(ClipboardData(text: '$copyCode')).then((_) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Kopyalandı')));
                                  });
                                },
                                icon: Icon(Icons.copy),
                                color: Colors.black54,
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
      ),
    );
  }
}