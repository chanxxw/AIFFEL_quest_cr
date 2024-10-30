// main.dart: 앱의 기본 설정과 초기 화면을 설정.
// main.py: 서버, vgg16과 openai를 통한 분석을 담당
// gallery_screen.dart: 갤러리 화면으로, 전체 사진을 그리드로 보여줌.
// photo_view_screen.dart: 개별 사진 클릭 시 사진을 확대해 보여주는 화면.
// photo.dart: 사진의 URL과 설명을 담는 모델 클래스.
// photo_grid.dart: 사진 리스트를 그리드 형태로 보여주는 위젯.

import 'package:flutter/material.dart';  // Flutter의 Material Design 위젯을 사용하기 위해 import
import 'screens/gallery_screen.dart';  // 갤러리 화면을 import하여 초기 화면으로 사용

void main() {
  runApp(MyApp());  // 앱의 시작점으로 MyApp 클래스를 실행
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // 디버그 모드 배너를 숨김
      title: 'Photo Gallery',  // 앱의 제목 설정
      theme: ThemeData(
        primarySwatch: Colors.blue,  // 앱의 기본 테마 색상을 파란색으로 설정
      ),
      home: GalleryScreen(),  // 앱의 초기 화면으로 GalleryScreen 위젯을 설정
    );
  }
}
