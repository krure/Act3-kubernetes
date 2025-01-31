FROM python:3.7
ARG NGROK_AUTHTOKEN
ENV ENV_NGROK_AUTHTOKEN $NGROK_AUTHTOKEN
RUN mkdir /app
EXPOSE 80
WORKDIR /app/
ADD . /app/
RUN pip3 install -r requirements.txt
RUN pip3 install flask_mysqldb
RUN curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
|  tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
&& echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
|  tee /etc/apt/sources.list.d/ngrok.list \
&&  apt update \
&&  apt install ngrok
CMD python /app/app.py
