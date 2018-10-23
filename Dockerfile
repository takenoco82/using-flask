FROM python:3.7.0-alpine3.7

WORKDIR /usr/src/app

# PYTHONPATH に追加
ENV PYTHONPATH=/usr/src/app:$PYTHONPATH

# ライブラリをインストール
COPY ./requirements.txt ./requirements.lock ./requirements_test.txt ./
RUN pip install --no-cache-dir -r ./requirements.lock && \
    pip install --no-cache-dir -r ./requirements.txt

# ソースをコピー
COPY src/ ./

# テスト時のみ、テスト用のライブラリをインストール
ARG TEST
RUN if [ -n "$TEST" ]; then \
    pip install --no-cache-dir -r /usr/src/app/requirements_test.txt; \
fi

CMD [ "python", "./run.py" ]
