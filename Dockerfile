# Use the official python image as the base image
FROM python:3.9-slim-buster

#set a working directory in the container
WORKDIR /app

#copy the dependencies to be installed
COPY requirements.txt .

#Command to install the dependencies. You may need to add Google nameserver in /etc/resol.conf if you are building this in WSL2
RUN pip3 install --no-cache-dir -r requirements.txt 

#Copy application code to working directory including app.py and index.html
COPY . .

#Set the environment variables for the flask app
ENV FLASK_RUN_HOST=0.0.0.0

#Expose the port on which the flask app will run
EXPOSE 5000

#Command to start the flask app when the container is running
CMD ["flask", "run"]