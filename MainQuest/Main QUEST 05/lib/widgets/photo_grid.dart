// 작가들 소재찾기 위해 누르면 아무거나 키워드 찾아주고 스토리 짜주는 프로그램?
import 'dart:math';
import 'package:flutter/material.dart';
import '../models/photo.dart';
import '../screens/photo_view_screen.dart';

class PhotoGrid extends StatelessWidget {
  // 더미 사진 데이터 생성
  final List<Photo> dummyPhotos = List.generate(
    18,  // 총 18개의 더미 사진 생성 (3 * 6 = 18)
        (index) {
      int randomId = Random().nextInt(1000); // 0에서 1000 사이의 랜덤 숫자 생성
      return Photo(
        url: 'https://picsum.photos/id/$randomId/200.jpg',  // 랜덤 ID를 사용하여 사진 URL 생성
        description: 'Sample Photo $index',  // 사진 설명 생성
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),  // 그리드의 전체적인 여백 설정
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,  // 그리드의 열 개수 설정 (3열)
          mainAxisSpacing: 4.0,  // 그리드 아이템 간의 세로 간격 설정
          crossAxisSpacing: 4.0,  // 그리드 아이템 간의 가로 간격 설정
        ),
        itemCount: dummyPhotos.length,  // 그리드에 표시할 아이템 개수 설정
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // 아이템 클릭 시 PhotoViewScreen으로 이동하여 사진을 확대하여 보여줌
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoViewScreen(imageUrl: dummyPhotos[index].url),  // 선택한 사진의 URL을 전달
                ),
              );
            },
            child: Image.network(
              dummyPhotos[index].url,  // 네트워크에서 사진을 불러와 표시
              fit: BoxFit.cover,  // 사진을 그리드 셀에 꽉 차게 표시
            ),
          );
        },
      ),
    );
  }
}
