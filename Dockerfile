FROM python:3.8.5

WORKDIR /code
COPY requirements.txt .
RUN pip install -r ./requirements.txt
COPY . .
ENTRYPOINT python manage.py collectstatic --no-input && gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000
CMD gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000