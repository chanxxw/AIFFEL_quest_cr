// photo 모델 클래스 정의

class Photo {
  final String url;  // 사진의 URL을 저장하는 변수
  final String description;  // 사진에 대한 설명을 저장하는 변수

  Photo({required this.url, required this.description});  // 생성자, URL과 설명을 필수로 받음
}
