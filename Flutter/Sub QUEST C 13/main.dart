import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());  // MyApp을 실행하도록 설정
}

// MyApp 클래스 추가
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),  // 첫 페이지를 FirstPage로 설정
    );
  }
}

// FirstPage 클래스 추가
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool isCat = true;  // 초기값 true 설정

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        leading: Icon(Icons.pets),  // 고양이 모양 아이콘 추가
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Next'),
              onPressed: () async {
                setState(() {
                  isCat = false;  // 버튼 클릭 시 isCat 값을 false로 변경
                });
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(isCat: isCat),
                  ),
                );
                if (result != null && result == true) {
                  setState(() {
                    isCat = true;  // 반환된 값이 true이면 isCat을 true로 설정
                  });
                }
              },
            ),
            if (isCat)
              GestureDetector(
                onTap: () {
                  print('is_cat: $isCat');
                },
                child: Image.asset(
                  'assets/image/cat.jpeg',  // 로컬 고양이 이미지
                  width: 300,
                  height: 300,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final bool isCat;

  SecondPage({required this.isCat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        leading: Icon(Icons.pets),  // 강아지 모양 아이콘
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Back'),
              onPressed: () {
                // FirstPage로 돌아갈 때 isCat 값을 전달
                Navigator.pop(context, true);  // isCat을 true로 설정하여 반환
              },
            ),
            GestureDetector(
              onTap: () {
                print('is_cat: $isCat');
              },
              child: Image.asset(
                'assets/image/dog.jpeg',  // 로컬 강아지 이미지
                width: 300,
                height: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
