ARG PYTHON_VERSION=3.11
ARG DEBIAN_VERSION=bookworm
ARG VARIANT=-slim

FROM python:${PYTHON_VERSION}${VARIANT}-${DEBIAN_VERSION}

COPY setup.sh .

RUN chmod +x setup.sh && ./setup.sh && rm setup.sh
