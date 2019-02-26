FROM python:3.6

# Set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

ENV http_proxy http://Yayun_Liu:Aaron90727*@10.143.18.126:80
ENV https_proxy http://Yayun_Liu:Aaron90727*@10.143.18.126:80

#RUN mkdir /app
WORKDIR /app

# By copying over requirements first, we make sure that Docker will cache
# our installed requirements rather than reinstall them on every build
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

# Now copy in our code, and run it
COPY . /app
#EXPOSE 8000

#CMD ["python manage.py makemigrations"]
#CMD ["python migrate"]
#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]