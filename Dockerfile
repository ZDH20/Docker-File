FROM python:3

RUN apt-get update -y
RUN apt-get install postgresql -y

RUN pip install --upgrade pip

RUN mkdir /app
WORKDIR /app

COPY DataWarehouse.egg-info/requires.txt requirements.txt

RUN pip install -r requirements.txt

COPY . /app

ENV FLASK_APP=datawarehouse
ENV DATABASE_URL=postgresql://zdh:silverfish@10.31.216.142:5432/data_warehouse

EXPOSE 5000

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "-p", "5000"]
