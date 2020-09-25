FROM java:8

ENV OUTPUT_DIR /output
ENV SMTP_PORT 25

RUN mkdir -p $OUTPUT_DIR

ADD https://github.com/gkgeorgiev/FakeSMTP/suites/1244270540/artifacts/18864979 fakeSMTP-latest.jar.zip

CMD unzip fakeSMTP-latest.jar.zip -p target/fakeSMTP-*.jar > fakeSMTP-latest.jar

VOLUME $OUTPUT_DIR

EXPOSE $SMTP_PORT

ENTRYPOINT java -jar fakeSMTP-latest.jar --background --output-dir $OUTPUT_DIR --port $SMTP_PORT --start-server
