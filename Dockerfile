FROM python

COPY app app
WORKDIR /app

COPY requirements.txt requirements.txt 
RUN python3 -m venv venv 
RUN venv/bin/pip install -r requirements.txt 
RUN pip3 install -r requirements.txt 

COPY boot.sh boot.sh 
RUN chmod +x boot.sh 

EXPOSE 5000

RUN ./boot.sh 

CMD ["uvicorn", "app:app", "--reload", "--port=5000", "--host:0.0.0.0"]

