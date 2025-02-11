FROM python:3.7
ARG NGROK_AUTHTOKEN

RUN mkdir /app
EXPOSE 80
WORKDIR /app/
ADD . /app/

RUN pip3 install -r requirements.txt
RUN pip3 install flask_mysqldb

CMD python /app/app.py
