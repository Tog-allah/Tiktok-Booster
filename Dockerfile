FROM python:3.12-slim

WORKDIR /app

# Installer les dépendances système nécessaires
RUN apt-get update && apt-get install -y \
    # Pour tesseract/pytesseract
    tesseract-ocr \
    tesseract-ocr-eng \
    # Pour pyperclip
    xclip \
    xsel \
    # Pour opencv et autres
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgomp1 \
    libglib2.0-dev \
    # Nettoyage
    && rm -rf /var/lib/apt/lists/*

# Copier et installer les dépendances Python
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copier le code source
COPY . .

# Variables d'environnement pour pyperclip
ENV DISPLAY=:99

CMD ["python", "main.py"]
