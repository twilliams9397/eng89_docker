FROM python:3.8-alpine

WORKDIR	/app

COPY [".py*", "./"]

COPY . .

RUN pip3 install -r requirements.txt

EXPOSE 5000

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]