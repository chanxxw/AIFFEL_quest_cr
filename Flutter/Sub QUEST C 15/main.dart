import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For accessing assets
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(JellyfishClassifierApp());

class JellyfishClassifierApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JellyfishClassifierPage(),
    );
  }
}

class JellyfishClassifierPage extends StatefulWidget {
  @override
  _JellyfishClassifierPageState createState() => _JellyfishClassifierPageState();
}

class _JellyfishClassifierPageState extends State<JellyfishClassifierPage> {
  String? _className;
  double? _confidence;
  final String serverUrl = "https://07b7-49-163-223-235.ngrok-free.app"; // 서버 URL로 변경

  Future<void> _classifyImage() async {
    try {
      // assets에서 이미지를 로드
      ByteData bytes = await rootBundle.load('assets/images/jellyfish.jpg');
      List<int> imageData = bytes.buffer.asUint8List();

      final request = http.MultipartRequest("POST", Uri.parse(serverUrl));
      request.files.add(
        http.MultipartFile.fromBytes('file', imageData, filename: 'jellyfish.jpg'),
      );

      // 요청 헤더 설정 (필요 시)
      // request.headers['Content-Type'] = 'multipart/form-data';

      // 요청 전송 및 응답 수신
      final response = await request.send();

      // 상태 코드 확인
      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        print('서버 응답 데이터: $responseData'); // 디버깅을 위한 출력

        final result = json.decode(responseData);

        setState(() {
          _className = result["class"];
          _confidence = result["confidence"];
        });
      } else {
        // 에러 처리
        print('서버 응답 에러: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('서버 에러 발생: ${response.statusCode}')),
        );
      }
    } catch (e) {
      // 예외 처리
      print('예외 발생: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('예외 발생: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu), // 왼쪽에 아이콘 추가
        title: Text("Jellyfish Classifier"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/jellyfish.jpg', width: 300, height: 300), // 고정 이미지 표시
            SizedBox(height: 20),
            // 예측 결과와 확률을 화면에 표시
            _className != null
                ? Text(
              '예측 결과: $_className',
              style: TextStyle(fontSize: 18),
            )
                : Container(),
            _confidence != null
                ? Text(
              '예측 확률: ${(_confidence! * 100).toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 18),
            )
                : Container(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await _classifyImage();
                    // 결과는 화면에 표시됨
                  },
                  child: Text("예측하기"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_confidence != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('확률은 화면에 표시되어 있습니다.')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('먼저 "예측하기"를 눌러주세요.')),
                      );
                    }
                  },
                  child: Text("확률은?"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
