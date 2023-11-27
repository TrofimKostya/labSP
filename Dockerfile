FROM almalinux:latest
RUN mkdir dir1
RUN mkdir dir2
COPY filelab.sh /dir1/filelab.sh
CMD ["/dir1/filelab.sh"]
WORKDIR /dir1/



