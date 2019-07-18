FROM python:3.7-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN apk update \
    && apk add --no-cache --virtual bash \
    && apk add gcc \
    && apk add musl-dev \
    && apk add linux-headers \
    && apk add jpeg-dev \
    && apk add zlib-dev \
    && apk add mariadb-dev \
    && apk add libffi-dev

RUN pip install --trusted-host pypi.python.org -r requirements.txt \
    && rm /usr/bin/mysql*

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]