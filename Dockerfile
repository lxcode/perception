FROM python:3.7

WORKDIR /usr/src
RUN apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*
COPY ./versioneer.py ./
COPY ./setup* ./
COPY ./Pipfile* ./
COPY ./docs/requirements.txt ./docs/requirements.txt
COPY ./Makefile ./
COPY ./pyproject.toml ./
COPY ./perception/benchmarking/extensions.pyx ./perception/benchmarking/extensions.pyx
RUN pip install pipenv && make init && rm -rf /root/.cache/pip