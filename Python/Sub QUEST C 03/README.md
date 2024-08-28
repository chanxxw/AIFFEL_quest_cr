# AIFFEL Campus Online Code Peer Review Templete
- 코더 : 고은비/김우찬
- 리뷰어 : 조규원


# PRT(Peer Review Template)
- [ ]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
 네 잘 완성되었습니다(캡쳐하는 사진이 커서 결과만 첨부하겠습니다)
![q3 22](https://github.com/user-attachments/assets/4d7417f2-e716-44d3-9749-a8ff139e10d6)
![q3 33](https://github.com/user-attachments/assets/53582911-031e-4f23-9fe0-a3fff6a72fb6)

    
- [ ]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
![q3 44](https://github.com/user-attachments/assets/ddcb1d41-f214-4314-a0d4-1e8d74f195de)
처음 if문을 사용할때 if, elif, else의 순서로 작성하라고 배운걸 활용하셔서 쓰신 점이 인상깊었습니다.
넣어보고 오류를 찾는다고 하셨는데 문제없이 잘 작동하여 이렇게도 쓸 수 있구나 라고 생각했습니다.

- [ ]  **3. 에러가 난 부분을 디버깅하여 문제를 해결한 기록을 남겼거나
새로운 시도 또는 추가 실험을 수행해봤나요?**
  ![q3 55](https://github.com/user-attachments/assets/949541a5-bfdf-4f2b-b35f-bffbe9562189)
이 코드의 결과가 Hello Aiffel! 을 먼저 출력하는것이 아니고 실행횟수를 먼저 출력하는 에러가 있다고 하셔서
![q3 66](https://github.com/user-attachments/assets/b07153e8-4ba6-441f-981e-6349d3346ae5)
다시 작성하여 잘 작동하는 모습을 확인했습니다.
- [ ]  **4. 회고를 잘 작성했나요?**
네 퍼실님이 주석을 달아주셔서 쉽게 작성할 수 있다는 부분에 공감했고, @deco 에서 @deco() 가 사용되는 경우도 생기는구나를 알게 되었습니다.
*args, **kwargs 를 사용하는 부분을 잘 몰랐는데 같은 문제를 가지고 계신걸 확인했다. 코드의 '유연함'을 위해 사용된다고 하셨는데 그 '유연함'이 정확히 무슨 의미일까에 대해서 둘다 의문점이 있었다.
        
- [ ]  **5. 코드가 간결하고 효율적인가요?**
 ![q3 11](https://github.com/user-attachments/assets/9b141542-8824-4836-856a-0e4864aed112)
  # 만약 num 값이 min_value보다 작다면 min_value를 num 값으로 변경 O
        if num < min_value:
            min_value = num

        # 만약 num 값이 max_value보다 크다면 max_value를 num 값으로 변경 O
        elif num > max_value :
            max_value = num

        # ?? num 값이 min, max value와 같으면? - 어떡하죠 - 넣어보고 오류를 찾아보겠습니다 OO
        else :
            pass
이 부분을 우리 조는 

        # 만약 num 값이 min_value보다 작다면 min_value를 num 값으로 변경
        if num < min_value:
          min_value = num

        # 만약 num 값이 max_value보다 크다면 max_value를 num 값으로 변경
        if num > max_value:
          max_value = num
이렇게만 처리했는데 if, elif, else 를 사용하지 않고 if 만 사용해도 작동되는 것을 보면 없애도 되는것 아닐까 라는 생각을 했다.

# 회고(참고 링크 및 코드 개선)
```
# 리뷰어의 회고를 작성합니다.
# 코드 리뷰 시 참고한 링크가 있다면 링크와 간략한 설명을 첨부합니다.
# 코드 리뷰를 통해 개선한 코드가 있다면 코드와 간략한 설명을 첨부합니다.
```
