import 'package:flutter/material.dart';
import '/services/keyword_service.dart';

class PhotoViewScreen extends StatelessWidget {
  final String imageUrl;  // 이미지 URL을 저장하는 변수

  PhotoViewScreen({required this.imageUrl});  // 생성자, imageUrl을 필수로 받음

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('영감을 불어넣자'),  // 상단 앱바의 제목 설정
      ),
      body: FutureBuilder<Map<String, String>>(  // 비동기 데이터를 처리하기 위한 FutureBuilder 사용
        future: fetchKeywordAndStory(imageUrl),  // VGG16과 OpenAI를 통해 키워드와 이야기 데이터를 가져옴
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {  // 데이터가 로딩 중일 때
            return Center(child: CircularProgressIndicator());  // 로딩 표시기를 화면 중앙에 보여줌
          } else if (snapshot.hasError) {  // 데이터 로드 중 오류가 발생했을 때
            return Center(child: Text("에러 발생: \${snapshot.error}"));  // 오류 메시지를 화면에 표시
          } else {  // 데이터를 성공적으로 가져온 경우
            var data = snapshot.data!;  // 가져온 데이터를 변수에 저장
            String title = data['keyword'] ?? '키워드';  // 키워드가 없을 경우 기본값 설정
            String description = data['story'] ?? '스토리텔링 초안을 제공해드립니다.';  // 이야기 설명이 없을 경우 기본값 설정

            return SingleChildScrollView(  // 전체 화면을 스크롤 가능하도록 수정하여 긴 텍스트 처리
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,  // 텍스트를 왼쪽 정렬
                children: [
                  // 상단의 사진 부분
                  Image.network(
                    imageUrl,  // 네트워크에서 이미지를 불러옴
                    fit: BoxFit.cover,  // 이미지를 화면에 꽉 차게 보여줌
                    width: double.infinity,  // 이미지의 너비를 화면 전체로 설정
                    height: 300,  // 이미지의 높이를 고정값으로 설정
                  ),
                  // 사진 제목과 설명 부분
                  Padding(
                    padding: const EdgeInsets.all(16.0),  // 전체적으로 16픽셀의 여백 추가
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,  // 텍스트를 왼쪽 정렬
                      children: [
                        Text(
                          title,  // 키워드 제목을 표시
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),  // 텍스트 스타일 설정 (크기 및 굵기)
                        ),
                        SizedBox(height: 8),  // 제목과 설명 사이에 여백 추가
                        Text(
                          description,  // 설명 텍스트를 표시
                          style: TextStyle(fontSize: 16),  // 텍스트 스타일 설정 (크기)
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
