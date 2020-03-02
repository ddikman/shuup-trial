# Django
FROM python:3.6
ENV PYTHONUNBUFFERED 1

# gnu compiler collection, required by Shuup
# RUN apk add build-base libffi-dev openssl-dev jpeg-dev zlib-dev
# RUN apk add libxslt-dev

# update pip and install shuup
RUN pip install -U pip
RUN pip install -U setuptools
RUN pip install shuup

# pip install requirement libraries
RUN mkdir -p /demo
WORKDIR /demo
COPY dockerfiles/shuup/wheels /demo/wheels
RUN pip install /demo/wheels/shuup_yaml-1.0.1b2-py2.py3-none-any.whl
RUN pip install /demo/wheels/django_parler-1.9.2-py2.py3-none-any.whl
COPY dockerfiles/shuup/requirements.txt /demo/
RUN pip install -r /demo/requirements.txt
