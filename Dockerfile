FROM registry.hub.docker.com/library/python
COPY world.py .
CMD ["python","world.py"]

