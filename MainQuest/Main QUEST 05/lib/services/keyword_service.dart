import 'package:http/http.dart' as http;
import 'dart:convert';

// VGG16과 OpenAI API를 사용하여 이미지에서 키워드와 스토리를 가져오는 함수
Future<Map<String, String>> fetchKeywordAndStory(String imageUrl) async {
  try {
    // 서버에 POST 요청을 보내어 분석 요청
    var response = await http.post(
      Uri.parse('https://7216-49-163-223-235.ngrok-free.app/analyze/'),  // 분석 API의 URL, ngrok 작동시 바꿔야함
      headers: {'Content-Type': 'application/json'},  // 요청 헤더에 JSON 타입 설정
      body: jsonEncode({'imageUrl': imageUrl}),  // 요청 본문에 이미지 URL을 JSON 형식으로 인코딩하여 전송
    );

    // 서버로부터 성공적인 응답(200)을 받은 경우
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);  // 응답 본문을 JSON으로 디코딩
      // jsonDecode(utf8.decode(response.bodyBytes));로 해야 한글로 추출이 가능함 - 정민님이 도와주심
      return {
        'keyword': result['class_name'],  // VGG16에서 추출한 키워드
        'story': result['story'],         // OpenAI API를 통해 생성된 스토리
      };
    } else {
      // 서버에서 에러 응답을 받은 경우 예외 발생
      throw Exception('Server error: ${response.statusCode}');
    }
  } catch (e) {
    // 네트워크 에러 또는 JSON 파싱 에러 처리
    throw Exception('Failed to fetch data: $e');
  }
}
