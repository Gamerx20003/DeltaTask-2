FROM manjaro

RUN pacman -Syyu

COPY . /
WORKDIR /

RUN chmod +x /alias.sh
RUN chmod +x /attendance.sh
RUN chmod +x /genMOM.sh
RUN chmod +x /getMOM.sh
RUN chmod +x /permit.sh
RUN chmod +x /schedule.sh
RUN chmod +x /genUser.sh
RUN chmod +r /attendance.log
RUN chmod +r /future.txt

RUN /alias.sh
RUN /attendance.sh
RUN /genMOM.sh
RUN /getMOM.sh
RUN /permit.sh
RUN /schedule.sh
RUN /genUser.sh

CMD["server created"]
