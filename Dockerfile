FROM python:3.8.10
LABEL maintainer="Udacity"

COPY . /app
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt
# command to run on container start
CMD [ "python3", "app.py" ]