FROM python:3-slim

WORKDIR /app

RUN git clone https://github.com/rhelmer/caching-s3-proxy.git && \
  cd caching-s3-proxy && \
  python setup.py install

RUN pip install uwsgi

EXPOSE 8000

CMD ["uwsgi", "-w", "proxy.wsgi", "--http=0.0.0.0:8000", "--workers=10"]
