## This is a Dockerfile for Django project
FROM python:3.9-alpine3.13
LABEL maintainer="nikhilbhagat.com.np"

## Set environment variables
ENV PYTHONUNBUFFERED=1

## Copy the requirements.txt file and install the dependencies
COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

## Create a new user and set the working directory
ARG DEV=false
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ $DEV = "true" ]; \
        then /py/bin/pip install -r /tmp/requirements.dev.txt; \
    fi && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

## Set the path
ENV PATH="/py/bin:$PATH"

## Switch to the new user
USER django-user
