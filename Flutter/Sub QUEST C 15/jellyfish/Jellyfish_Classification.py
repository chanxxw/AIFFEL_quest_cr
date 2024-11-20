from fastapi import FastAPI, File, UploadFile #fastAPI 불러오기
from pydantic import BaseModel  #pip install pydantic 했음
from typing import Dict #pip install typing 했음
from PIL import Image
import io
import uvicorn

app = FastAPI()

# 가정: 미리 학습된 모델을 로드하는 함수
def load_model():
    # 모델 로드 (예시 코드, 실제 모델 코드로 대체)
    return None

# 가정: 이미지로부터 예측을 수행하는 함수
def predict(image: Image.Image) -> Dict[str, float]:
    # 예시 예측 결과, 실제 모델 예측으로 대체
    return {"jellyfish": 0.85, "fish": 0.1, "other": 0.05}

# 모델 로드
model = load_model()

@app.post("/classify")
async def classify_image(file: UploadFile = File(...)):
    image = Image.open(io.BytesIO(await file.read()))
    predictions = predict(image)
    highest_class = max(predictions, key=predictions.get)
    return {"class": highest_class, "confidence": predictions[highest_class]}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=3000)
