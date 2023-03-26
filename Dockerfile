FROM python:3.8.10
LABEL maintainer="Udacity"

COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt

# command to run on container start
CMD [ "python3", "app.py" ]