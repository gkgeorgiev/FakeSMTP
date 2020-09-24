FROM java:8

ENV OUTPUT_DIR /output
ENV SMTP_PORT 25

RUN mkdir -p $OUTPUT_DIR

ADD https://github-production-registry-package-file-4f11e5.s3.amazonaws.com/298035745/6e750880-fe94-11ea-8777-ded5ffa0f8ba?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20200924%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20200924T163353Z&X-Amz-Expires=300&X-Amz-Signature=1b8a5725b852bb379336de31692143ff2658af3d176d9f88ee6fc24081fa53fe&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=0&response-content-disposition=filename%3Dfakesmtp-2.2-20200924.163323-1.jar&response-content-type=application%2Foctet-stream fakeSMTP-latest.jar

VOLUME $OUTPUT_DIR

EXPOSE $SMTP_PORT

ENTRYPOINT java -jar fakeSMTP-latest.jar --background --output-dir $OUTPUT_DIR --port $SMTP_PORT --start-server
