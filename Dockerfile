FROM manjaro

RUN pacman -Syyu

COPY alias.sh /
COPY attendance.log /
COPY attendance.sh /
COPY future.txt /
COPY genMOM.sh /
COPY genUser.sh /
COPY getMOM.sh /
COPY permit.sh /
COPY schedule.sh /

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
