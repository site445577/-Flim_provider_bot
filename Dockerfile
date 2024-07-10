FROM python:3.10-slim

# Install build tools and dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    gfortran \
    libopenblas-dev \
    liblapack-dev \
    libatlas-base-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file and install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install numpy==1.21.0 --only-binary :all:  # Ensure using pre-built wheels for numpy
RUN pip install -r requirements.txt

# Copy application code
COPY . /app
WORKDIR /app

# Command to run the application
CMD ["python", "bot.py"]



Flask==2.2.2
numpy==1.21.0
pandas==1.3.0
scipy==1.7.0




