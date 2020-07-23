FROM alpine
RUN apk add --no-cache tar wget
RUN wget http://kindlegen.s3.amazonaws.com/kindlegen_linux_2.6_i386_v2_9.tar.gz -O /tmp/kindlegen_linux_2.6_i386_v2_9.tar.gz && \
    tar -xzf /tmp/kindlegen_linux_2.6_i386_v2_9.tar.gz -C /tmp

FROM alpine
COPY --from=0 /tmp/kindlegen /usr/bin
WORKDIR /kindle
CMD ["kindlegen"]
ENTRYPOINT [ "kindlegen" ]
