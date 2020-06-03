FROM registry.hub.docker.com/library/python:slim
COPY world.py .
CMD ["python", "world.py"]

