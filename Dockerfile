FROM python:3.7.0-alpine3.7

WORKDIR /usr/src/app

# PYTHONPATH に追加
ENV PYTHONPATH=/usr/src/app:$PYTHONPATH

# ライブラリをインストール
COPY ./requirements.txt ./
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

COPY src/ ./

CMD [ "python", "./run.py" ]
