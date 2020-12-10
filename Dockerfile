FROM ubuntu

# ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y --no-install-recommends python3-pip
# RUN apt-get install -y --no-install-recommends python3-pip libsndfile1 ffmpeg libcudart10.1
# # RUN apt-get install -y libsndfile1
# # RUN apt-get install -y ffmpeg
# # RUN apt-get install -y libcudart10.1
# RUN rm -rf /var/lib/apt/lists/*
# RUN pip3 install spleeter Flask --no-cache-dir -i https://mirrors.aliyun.com/pypi/simple
RUN pip3 install Flask gunicorn gevent --no-cache-dir -i https://mirrors.aliyun.com/pypi/simple

WORKDIR /app
COPY . /app
EXPOSE 9000
# EXPOSE 5000
CMD ["gunicorn", "app:app", "-c", "./gunicorn.conf.py"]
# RUN export FLASK_APP=app.py
# ENTRYPOINT ["flask", "run", "--host=0.0.0.0", "--port=9000"]
