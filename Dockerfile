FROM python:3.9-alpine

WORKDIR /code

COPY requirements.txt /code/
RUN pip install -r requirements.txt

COPY app.py /code/

EXPOSE 5000

CMD ["python", "app.py"]
