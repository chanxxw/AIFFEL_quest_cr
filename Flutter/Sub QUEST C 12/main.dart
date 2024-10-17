import 'package:flutter/material.dart';

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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('플러터 앱 만들기'),
        backgroundColor: Colors.blue, // 퀘스트에서 appbar 색상 blue로 지정
        leading: Icon(Icons.menu),  // 좌측 상단에 아이콘 추가(메뉴 3줄로 지정)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                print('버튼이 눌렸습니다');
              },
              child: Text('Text'),
            ),
            SizedBox(height: 50),
            // 컨테이너들이 가장 큰 컨테이너의 왼쪽 상단에 겹치도록 설정
            Stack(
              children: [
                // 가장 큰 바깥 컨테이너
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                ),
                // 하위 컨테이너들이 가장 큰 컨테이너의 왼쪽 상단에 겹치도록 설정
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 240,
                    height: 240,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/* 회고. 아래 컨테이너를 왼쪽 상단에 맞추는 과정에서 약간 헤메었지만, 원하는 결과물을 얻었다. 내 기준엔 가장 간결한 코드인데, 더 간결하게 할 수 있는 부분이 있을지 모르겠다.
