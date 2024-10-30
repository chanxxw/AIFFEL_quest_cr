import tensorflow as tf
from tensorflow.keras.applications.vgg16 import VGG16, preprocess_input, decode_predictions
import numpy as np
from PIL import Image
import io
from fastapi import FastAPI, Request
import openai
import requests

# FastAPI 앱 초기화 및 OpenAI API 키 설정
app = FastAPI()
openai.api_key = "PASSWORD"

# VGG16 모델 로드
model = VGG16(weights="imagenet")

# 이미지 전처리 및 예측
def predict_image_class(image_data):
    # 이미지를 바이트 형태에서 PIL 이미지로 변환하고 크기 조정
    image = Image.open(io.BytesIO(image_data)).resize((224, 224))
    # 이미지가 RGB 형식이 아니면 RGB로 변환
    if image.mode != 'RGB':
        image = image.convert('RGB')
    # 이미지를 numpy 배열로 변환
    image_array = np.array(image)
    # 배치 차원을 추가하여 모델 입력 형식에 맞춤
    image_array = np.expand_dims(image_array, axis=0)
    # VGG16 모델에 필요한 전처리 수행
    image_array = preprocess_input(image_array)
    # 모델을 사용해 예측 수행
    predictions = model.predict(image_array)
    # 예측 결과를 사람이 이해할 수 있는 레이블로 디코딩
    decoded_predictions = decode_predictions(predictions, top=1)[0]
    # 가장 높은 확률의 클래스 이름 추출
    class_name = decoded_predictions[0][1]
    return class_name

@app.post("/analyze/")
async def analyze_image(request: Request):
    # 클라이언트로부터 JSON 데이터 수신
    data = await request.json()
    imageUrl = data['imageUrl']  # JSON에서 이미지 URL 추출

    # 이미지 URL로부터 이미지 데이터 가져오기
    image_response = requests.get(imageUrl)
    if image_response.status_code != 200:
        # 이미지 가져오기에 실패한 경우 에러 메시지 반환
        return {"error": "이미지를 가져올 수 없습니다."}
    image_data = image_response.content

    # VGG16 모델로 이미지 클래스 예측
    class_name = predict_image_class(image_data)

    # OpenAI API를 사용해 엉뚱한 이야기 생성
    prompt = f"Write a funny and imaginative story about a {class_name}."
    response = openai.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=[
            {"role": "user", "content": prompt}
        ]
    )
    # OpenAI 응답에서 생성된 이야기 추출
    story = response['choices'][0]['message']['content'].strip()

    # 예측된 클래스 이름과 생성된 이야기 반환
    return {"class_name": class_name, "story": story}

if __name__ == "__main__":
    import uvicorn
    # FastAPI 서버 실행 (로컬 호스트에서 포트 8000번 사용)
    uvicorn.run(app, host="127.0.0.1", port=8000)
