FROM python:3.13-alpine AS build

WORKDIR /app

RUN apk add --no-cache \
  gcc \
  musl-dev \
  libffi-dev \
  graphviz \
  build-base

COPY requirements.txt .

RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

COPY main.py .

FROM python:3.13-alpine

WORKDIR /app

RUN apk add --no-cache graphviz

COPY --from=build /install /usr/local

COPY main.py .

ENTRYPOINT ["python", "main.py"]
