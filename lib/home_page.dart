import 'package:aula01/pages/hello_page1.dart';
import 'package:aula01/pages/hello_page2.dart';
import 'package:aula01/pages/hello_page3.dart';
import 'package:aula01/widgets/blue_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hello Flutter",
        ),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return  Container(
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _text(),
        _pageView(),
        _buttons(context)
      ],
    ),
    );
  }

  Container _pageView() {
    return Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
          height: 300,
          child: PageView(
            children: <Widget>[
              _img("assets/images/dog1.png"),
              _img("assets/images/dog2.png"),
              _img("assets/images/dog3.png"),
              _img("assets/images/dog4.png"),
              _img("assets/images/dog5.png")
            ],
          ),
        );
  }

    _buttons(context) {
    return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("ListView", () => _onClickNavigator(context, HelloPage1())),
                BlueButton( "Page 2", () => _onClickNavigator(context, HelloPage2())),
                BlueButton( "Page 3", () => _onClickNavigator(context, HelloPage3())),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton( "Snack", _onClickSnack),
                BlueButton( "Dialog", _onClickDialog),
                BlueButton( "Toast", _onClickToast),
              ],
            ),
          ],
        );
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s =  await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      return page;
    }));

    print(">>$s");
  }



  _onClickSnack() {
  }

  _onClickDialog() {
  }

  _onClickToast() {
  }
}

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }

  _text() {
    return Text(
      "Hello Word",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.wavy,
      ),
    );
  }


