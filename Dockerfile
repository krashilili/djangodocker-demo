FROM python:3.6

# Set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

ENV http_proxy http://USERNAME:PASSWORD*@proxy.corp.com:80
ENV https_proxy http://USERNAME:PASSWORD**@proxy.corp.com:80

#RUN mkdir /app
WORKDIR /app

# By copying over requirements first, we make sure that Docker will cache
# our installed requirements rather than reinstall them on every build
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

# Now copy in our code, and run it
COPY . /app
