FROM python:3.13-slim
WORKDIR /app

# TODO 1: copiar requirements.txt antes de copiar app.py
COPY requirements.txt .

# TODO 2: instalar as dependencias com pip --no-cache-dir
RUN pip install --no-cache-dir -r requirements.txt

# TODO 3: copiar app.py para /app
COPY app.py .

# TODO 4: criar utilizador sem privilegios e preparar /data com permissoes de escrita
RUN groupadd --system appgroup && useradd --system --gid appgroup --create-home appuser
RUN mkdir -p /data && chown -R appuser:appgroup /data

# TODO 5: definir USER para esse utilizador
USER appuser

EXPOSE 8000
CMD ["python", "-m", "uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
