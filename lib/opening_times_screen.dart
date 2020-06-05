import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OpeningTimesScreen extends StatefulWidget {
  const OpeningTimesScreen({
    Key key,
  }) : super(key: key);

  @override
  _OpeningTimesScreenState createState() => _OpeningTimesScreenState();
}

// TODO expanded causes error : Another exception was thrown: Instance of 'ErrorSummary'
class _OpeningTimesScreenState extends State<OpeningTimesScreen> {
  TextEditingController monMorOp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //                                                              TODO titles
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    '',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Opening',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Closing',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Active',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Opening',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Closing',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Active',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),

          // TODO UI builds without a problem
//              TextField(
//                keyboardType: TextInputType.numberWithOptions(),
//                controller: monMorOp,
//                onChanged: (value) {
//                  monMorOp.text = validateTimeFormat(value);
//                },
//              ),

          // TODO UI builds without a problem
//              Expanded(
//                flex: 1,
//                child: TextField(
//                  keyboardType: TextInputType.numberWithOptions(),
//                  controller: monMorOp,
//                  onChanged: (value) {
//                    monMorOp.text = validateTimeFormat(value);
//                  },
//                ),
//              ),
          // TODO UI builds without a problem
          //                                                              TODO monday
//          Expanded(
//            flex: 1,
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              mainAxisSize: MainAxisSize.max,
//              //title row
//              children: <Widget>[
//                Expanded(
//                  flex: 2,
//                  child: Text(
//                    'Monday',
//                    style: TextStyle(color: Colors.white, fontSize: 20),
//                  ),
//                ),
//                SizedBox(
//                  width: 20,
//                ),
//                Expanded(
//                  flex: 2,
//                  child: TextField(
//                    keyboardType: TextInputType.numberWithOptions(),
//                    controller: monMorOp,
//                    onChanged: (value) {
//                      monMorOp.text = validateTimeFormat(value);
//                    },
//                  ),
//                ),
//              ],
//            ),
//          ),

          // TODO UI build problem
          //                                                              TODO monday
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              //title row
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    'Monday',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 2,
                  child: Platform.isIOS
                      ? CupertinoTextField(
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: monMorOp,
                          onChanged: (value) {
                            monMorOp.text = validateTimeFormat(value);
                          },
                        )
                      : TextField(
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: monMorOp,
                          onChanged: (value) {
                            monMorOp.text = validateTimeFormat(value);
                          },
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    monMorOp.dispose();
    super.dispose();
  }

  String validateTimeFormat(String value) {
    print('call back method called');
//    String numb = event.text;
    print('input text is $value');
    String cleanNumb = value.replaceAll(RegExp(':'), '').substring(0);
    print('cleaned input text is $cleanNumb');
    RegExp isDigit = RegExp(r'^[\d]{1,4}$'); // is digit 1 to 4 characters
//    RegExp isDigit = RegExp(r'^[\d]$'); // is digit
    RegExp input;
    String text;
    int lenght;
    String replaced;

    if (isDigit.hasMatch(cleanNumb)) {
      print('text is 1-4 digits');
      text = cleanNumb;
      lenght = text.length;
//      print('lenght is $lenght');

      if (lenght == 1) {
        // first digit
        //allow 0-2
        input = RegExp(r'^[0-2]$');
        input.hasMatch(text[0])
            ? print('text is : $text')
            : print('text is: not valid');
        return input.hasMatch(text[lenght - 1]) ? text : '';
      } else if (lenght == 2) {
        // second digit
        int first = int.parse(text[0]);
        print('firstDigit is $first');
        if (first == 008 || first == 1) {
          // allow 0-9
          input = RegExp(r'^[0-9]$');
          input.hasMatch(text[lenght - 1])
              ? print('text is : $text')
              : print('text is : ${text.substring(0, lenght - 1)}');
          return input.hasMatch(text[lenght - 1])
              ? text
              : text.substring(0, lenght - 1);
        } else {
          // allow 0-3
          input = RegExp(r'^[0-3]$');
          input.hasMatch(text[lenght - 1])
              ? print('text is : $text')
              : print('text is : ${text.substring(0, lenght - 1)}');
          return input.hasMatch(text[lenght - 1])
              ? text
              : text.substring(0, lenght - 1);
        }
      }
      if (lenght == 3) {
        //third digit
        // add : at lenght-1
        // allow 0-5
        input = RegExp(r'^[0-5]$');
        input.hasMatch(text[lenght - 1])
            ? replaced = text.replaceRange(2, lenght, ':${text.substring(2)}')
            : replaced = text.substring(0, lenght - 1);
        print('text is : $replaced');
        return replaced;
      }
      if (lenght == 4) {
        // fourth digit
        // allow 0-9
        input = RegExp(r'^[0-9]$');
        input.hasMatch(text[lenght - 1])
            ? replaced = text.replaceRange(2, lenght, ':${text.substring(2)}')
            : replaced = text.substring(0, lenght - 1);
        print('text is : $replaced');
        return replaced;
      }
    } else {
      // discard extra digit
      print('more than 4 digits');
      lenght = cleanNumb.length;
      replaced =
          cleanNumb.replaceRange(2, lenght, ':${cleanNumb.substring(2, 4)}');
      print('text is : $replaced');
      return replaced;
    }
  }
}
