FROM rasa/rasa:2.8.22-full

USER root

RUN apt install -y git \
    htop \
    make \
    time 

RUN pip install black \
    line_profiler \
    memory_profiler \
    py-spy \
    psutil \
    snakeviz 