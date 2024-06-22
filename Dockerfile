# Dockerfile

# Use the official Python image from Docker Hub
FROM python:latest

# Set environment variables (optional)
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install dependencies
RUN pip install Django==2.2 Pillow==6.0.0

# Set work directory within the Docker image
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Run database migrations (assuming Django project structure)
RUN python manage.py migrate

# Expose port 8001 to allow communication to/from server
EXPOSE 8001

# Command to run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8001"]

