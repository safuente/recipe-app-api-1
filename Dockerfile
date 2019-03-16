FROM python:3.7-alpine
MAINTAINER Santiago Alvarez

# Avoid python to buffer the output only print
ENV PYTHONUNBUFFERED 1

# Copy python requirements to docker image
# Install the requirements on the image
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Create dir on docker image and copy the code
# of the app to it
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Create a user to only run app without home dir
RUN adduser -D user
# Switch to the user created
USER user
