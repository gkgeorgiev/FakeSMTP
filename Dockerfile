FROM java:8

ENV OUTPUT_DIR /output
ENV SMTP_PORT 25

RUN mkdir -p $OUTPUT_DIR

ADD http://nilhcem.github.com/FakeSMTP/downloads/fakeSMTP-latest.zip /fakeSMTP-latest.zip

RUN unzip -p fakeSMTP-latest.zip fakeSMTP-*.jar >fakeSMTP-latest.jar

VOLUME $OUTPUT_DIR

EXPOSE $SMTP_PORT

ENTRYPOINT java -jar fakeSMTP-latest.jar --background --output-dir $OUTPUT_DIR --port $SMTP_PORT --start-server
