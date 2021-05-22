FROM ghcr.io/chia-network/chia

WORKDIR /app
RUN apt-get install -y htop
RUN git clone https://github.com/swar/Swar-Chia-Plot-Manager.git --branch v.0.1.0 ./

copy ./run/startup.sh /app
RUN chmod 655 /app/startup.sh

RUN python3 -m venv venv
RUN /bin/bash -c "source ./venv/bin/activate && pip install -r requirements.txt && pip install -r requirements-notification.txt"

ENTRYPOINT [ "./startup.sh" ]
CMD ["./startup.sh"]
