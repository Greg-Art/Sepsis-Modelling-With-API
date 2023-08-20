
# Use the official Python image as the base image
#FROM python:3.9-slim
 FROM python:3.10.6

# Set the working directory in the container
WORKDIR /dev/app

# Copy the requirements file into the container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the  xgb_model.joblib files to the container
COPY /model/xgb.joblib .

# Copy the current directory contents into the container at /app
COPY . /dev/app
# Expose the port that the FastAPI application will run on
EXPOSE 7860

# Command to run the FastAPI application when the container starts
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "7860"]