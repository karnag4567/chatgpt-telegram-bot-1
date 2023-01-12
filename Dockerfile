FROM python:3.10-slim

RUN useradd -m appuser
USER appuser
WORKDIR /opt/render/

ENV PATH="/opt/render/.local/bin:$PATH"
RUN pip install --user pipenv

WORKDIR /opt/render/
COPY . .
COPY .env .
RUN pipenv install --system --deploy --ignore-pipfile

CMD ["python", "main.py"]
