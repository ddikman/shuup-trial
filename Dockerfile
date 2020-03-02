FROM python:alpine

# update pip
RUN pip install -U pip
RUN pip install -U setuptools
RUN pip install virtualenv

# gnu compiler collection, required by Shuup
RUN apk add build-base libffi-dev openssl-dev jpeg-dev zlib-dev
RUN apk add libxslt-dev

# create env and install shuup
RUN virtualenv shuup-venv
RUN . shuup-venv/bin/activate
RUN pip install shuup

# copy over required files
COPY ./src/ /app/
WORKDIR /app

# initialize based on custom settings
RUN python manage.py migrate
RUN python manage.py shuup_init

CMD python manage.py runserver