import 'package:flutter/material.dart';
// 용도: 이 코드는 Flutter의 Material Design 패키지를 임포트합니다.
// Material Design은 Flutter에서 시각적, 구조적, 인터랙티브한 위젯들을 제공
// 앱 개발에 필수적인 패키지

void main() {
  runApp(MyApp());  // MyApp을 실행하도록 설정
}
// 용도: main 함수는 모든 Dart 애플리케이션의 진입점입니다.
// runApp(MyApp());: Flutter에게 앱을 시작하고 MyApp을 루트 위젯으로 사용하라고 지시합니다.

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
// 용도: MyApp은 애플리케이션의 루트 위젯입니다.
// StatelessWidget: 상태를 유지하지 않는 위젯으로, 단순히 UI를 빌드합니다.
// MaterialApp: Material Design 애플리케이션에 필요한 여러 위젯들을 감싸는 위젯입니다.
//   title: 앱의 제목으로, OS의 작업 전환기에서 사용됩니다.
//   theme: 앱의 시각적 테마를 정의합니다.
//   home: 앱의 기본 경로로, 여기서는 FirstPage로 설정되어 있습니다.

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}
// 용도: FirstPage는 상태 변경이 가능한 위젯입니다.
// createState(): 상태와 로직이 정의된 _FirstPageState 인스턴스를 생성합니다.

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

// 상태 변수 isCat:
// bool isCat = true;
  // 고양이 이미지를 표시할지 여부를 추적하는 불리언 변수입니다.
  // 초기값이 true이므로 앱 시작 시 고양이 이미지가 표시됩니다.
// build 메서드:
  // 용도: FirstPage의 UI를 정의합니다.
  // Scaffold 위젯 반환:
    // appBar: 앱의 상단 바로, 제목과 아이콘을 포함합니다.
      // title: 'First Page'라는 제목을 표시합니다.
      // leading: 앱 바의 왼쪽에 펫 아이콘을 추가합니다.
    // body: 페이지의 주요 콘텐츠 영역입니다.
      // Center: 자식 위젯들을 가로세로 중앙에 배치합니다.
      // Column: 자식 위젯들을 세로로 배치합니다.
       // mainAxisAlignment: 메인 축(세로) 방향으로 자식들을 중앙에 배치합니다.
// 자식 위젯들:
// 1. ElevatedButton:
  // child: 버튼에 표시될 텍스트('Next')입니다.
  // onPressed:
  // 비동기 함수로서: setState를 호출하여 isCat을 false로 업데이트합니다.
    // setState: Flutter에게 상태가 변경되었음을 알리고 UI 재구성을 요청합니다.
    // Navigator.push를 사용하여 SecondPage로 이동하고 결과를 기다립니다.
      // Navigator.push: 새로운 경로를 스택에 추가하여 다른 페이지로 이동합니다.
      // MaterialPageRoute: 새로운 페이지로 전환하는 경로를 생성합니다.
      // await: SecondPage에서 돌아와 결과를 받을 때까지 기다립니다.
    // SecondPage에서 돌아온 후, 결과가 true인지 확인합니다.
    // 그렇다면 setState를 호출하여 isCat을 다시 true로 설정하여 고양이 이미지를 다시 표시합니다.
// 2. 고양이 이미지의 조건부 렌더링:
  // if (isCat): isCat이 true인지 확인합니다.
  // GestureDetector:
    // Image.asset 위젯을 감싸서 탭 제스처를 감지합니다.
    // onTap: 이미지가 탭될 때 현재 isCat 값을 콘솔에 출력합니다.
  // Image.asset:
    // 로컬 에셋에서 고양이 이미지를 표시합니다.
    // width와 height: 이미지의 크기를 설정합니다.

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
// 생성자:
  // SecondPage({required this.isCat});
    // 페이지가 생성될 때 불리언 isCat을 받습니다.
    // final: 클래스 내에서 isCat은 불변입니다.
// build 메서드:
  // Scaffold 위젯 반환:
    // appBar: FirstPage와 유사하게 'Second Page'라는 제목을 가집니다.
    // body: Center와 Column: 자식 위젯들을 중앙에 배치하고 세로로 정렬합니다.
    // 자식 위젯들:
    // ElevatedButton:
    // child: 버튼에 'Back'이라는 텍스트를 표시합니다.
    // onPressed:
      // Navigator.pop을 호출하여 이전 페이지(FirstPage)로 돌아갑니다.
      // 팝하면서 결과로 true를 반환합니다.
    // GestureDetector: 강아지 이미지를 감싸서 탭 제스처를 감지합니다.
    // onTap: 이미지가 탭될 때 isCat의 값을 콘솔에 출력합니다.
    // Image.asset: 로컬 에셋에서 강아지 이미지를 표시합니다.


// 이미지 에셋
// 고양이 이미지: 'assets/image/cat.jpeg'(폴더 만들어서 집어넣음)
// 강아지 이미지: 'assets/image/dog.jpeg'
// pubspec.yaml 파일에 에셋을 포함시켜야 합니다:
  // flutter:
  //   assets:
  //     - assets/image/cat.jpeg
  //     - assets/image/dog.jpeg

/* 8. 상태 관리 및 네비게이션 흐름
FirstPage:
- 초기 상태: isCat이 true이므로 고양이 이미지가 표시됩니다.
- 'Next' 버튼을 누를 때: isCat이 false로 설정됩니다. SecondPage로 이동하며 현재 isCat 값을 전달합니다.
SecondPage:
- 표시 내용: 강아지 이미지가 표시됩니다.
- 'Back' 버튼을 누를 때: Navigator.pop을 호출하고 결과로 true를 반환합니다.
FirstPage로 돌아올 때:
- Navigator.push가 완료된 후:
  - await 문에서 결과(true)를 받습니다.
  - 결과가 true인지 확인하고 isCat을 다시 true로 업데이트합니다.
  - UI가 재구성되어 고양이 이미지가 다시 표시됩니다.

[제스처 감지 및 콘솔 출력]
FirstPage의 고양이 이미지:
- GestureDetector로 감싸져 있습니다.
- onTap: 이미지가 탭될 때 콘솔에 is_cat: true를 출력합니다.
SecondPage의 강아지 이미지:
- 역시 GestureDetector로 감싸져 있습니다.
- onTap: 이미지가 탭될 때 콘솔에 is_cat: false를 출력합니다.
콘솔 출력: 이미지가 탭될 때 현재 isCat의 값을 디버그 콘솔에 출력하여 디버깅에 도움을 줍니다.
[추가 사항]
비동기 프로그래밍: async와 await: 'Next' 버튼의 onPressed 콜백에서 사용되어 SecondPage로부터 결과를 기다립니다.
setState()를 통한 상태 업데이트:
- 용도: 위젯의 내부 상태가 변경되었음을 Flutter에게 알립니다.
- 효과: 위젯 트리를 재구성하여 새로운 상태를 반영합니다.
네비게이션:
- Navigator.push: 새로운 경로를 스택에 추가합니다.
- Navigator.pop: 현재 경로를 스택에서 제거하여 이전 경로로 돌아갑니다.
조건부 렌더링:
- if (isCat): isCat이 true일 때만 고양이 이미지를 표시합니다.
- 효과: isCat이 false일 때 고양이 이미지가 표시되지 않습니다.

[앱 작동 방식 요약]
앱 시작: FirstPage가 표시되며 고양이 이미지가 나타납니다.
사용자 상호작용: 사용자가 'Next' 버튼을 누릅니다.
  - isCat이 false로 설정됩니다.
  - SecondPage로 이동합니다.
SecondPage: 강아지 이미지가 표시됩니다.
- 사용자가 'Back' 버튼을 누릅니다.
  - true를 반환하며 FirstPage로 돌아갑니다.
FirstPage로 돌아올 때:
- 결과로 true를 받습니다.
- isCat을 다시 true로 업데이트합니다.
- 고양이 이미지가 다시 표시됩니다.
제스처 감지: 이미지를 탭하면 현재 isCat의 값이 콘솔에 출력됩니다.

[Flutter에서 Stateful과 Stateless 위젯 이해하기]
- StatefulWidget (FirstPage):
  - 위젯의 상태가 수명 동안 변경될 수 있을 때 사용합니다.
  - 해당 State 클래스 (_FirstPageState)와 함께 사용합니다.
StatelessWidget (SecondPage):
- 위젯의 상태가 불변일 때 사용합니다.
- 변경이 필요하면 새로운 매개변수로 위젯을 재생성해야 합니다.
[코드가 제대로 작동하도록 보장하기 위한 팁]
에셋 디렉토리: 이미지들이 assets/image/ 디렉토리에 올바르게 위치해 있는지 확인합니다.
  - pubspec.yaml 파일의 경로가 실제 파일 위치와 일치하는지 확인합니다.
핫 리로드 vs. 핫 리스타트:
  - 변경 사항 후에는 핫 리스타트를 사용하여 모든 상태가 새로고침되도록 합니다.
  - 핫 리로드는 일부 경우, 특히 에셋을 추가할 때 변경 사항을 반영하지 않을 수 있습니다.
디버그 콘솔:
- 콘솔 출력을 확인하여 이미지가 탭될 때 isCat 값이 출력되는지 확인합니다.
- 출력이 없으면 콘솔이 제대로 연결되어 있는지, 또는 필터링되어 있지 않은지 확인합니다.
오류 처리:
- 콘솔에 에셋 누락이나 위젯 이름의 오타 등의 오류 메시지가 있는지 확인합니다.

[잠재적인 개선 사항]
사용자 피드백: 이미지가 탭될 때 리플 효과와 같은 시각적 피드백을 추가할 수 있습니다.
상태 관리 라이브러리: 더 큰 앱의 경우 Provider나 Bloc과 같은 상태 관리 솔루션을 고려해 볼 수 있습니다.
오류 확인: 네비게이션이 실패할 수 있는 경우에 대한 오류 처리를 추가합니다.
반응형 디자인: 다양한 화면 크기와 방향에 대응하도록 UI를 조정합니다.
*/