/*
아래 코드는 정민님 코드를 가져와서 실습해본 내용임다
pubspec.yaml에
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.5
  font_awesome_flutter: ^10.1.0
추가함. 이미지는 assets/images/ 경로에 저장함
 */

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //정민님 코드에 없던 부분
import 'dart:convert'; // 정민님 코드에 없던 부분
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // 정민님 코드에 없던 부분



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = "";
  TextEditingController urlController =
  TextEditingController(); // URL을 입력 받는 컨트롤러

  Future<void> fetchData(bool prediction) async {
    try {
      final enteredUrl = urlController.text; // 입력된 URL 가져오기
      final response = await http.get(
        Uri.parse(
            "https://67e2-49-163-223-235.ngrok-free.app/sample"), // sample을 해야만 출력되네
        headers: {
          'Content-Type': 'application/json',
          'ngrok-skip-browser-warning': '69420',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          result = prediction == true
              ? "예측 라벨: ${data['predicted_label']}"
              : "예측 확률: ${data['prediction_score']}";
        });
      } else {
        setState(() {
          result = "Failed to fetch data. Status Code: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        result = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(FontAwesomeIcons.fish),
        title: Text("Jellyfish classifier"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/jellyfish.jpg',
              width: 400,
              height: 400,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => fetchData(true),
                  child: Text("예측 결과"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => fetchData(false),
                  child: Text("예측 확률"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}