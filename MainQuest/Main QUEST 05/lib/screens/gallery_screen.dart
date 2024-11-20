// 사진 갤러리 화면

import 'package:flutter/material.dart';
import '../widgets/photo_grid.dart';

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('사진사진'),  // 상단 앱바의 제목 설정
      ),
      body: PhotoGrid(),  // 화면의 본문에 PhotoGrid 위젯 추가, 사진 그리드를 보여줌
    );
  }
}
