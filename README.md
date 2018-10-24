# BigSurv18-Spark-for-Social-Science

Slides: Spark_4_Social Science_Short_Course.pdf

Running the Example Notebook

1. Install Docker

   To run the exercises on you're own computer you'll need to have Docker Installed. More information about getting started with docker can be found here:  https://docs.docker.com/get-started/#prepare-your-docker-environment

2. Run Jupyter notebook

   Run 

   ```docker run --rm -p 8888:8888 -v "$PWD":/home/jovyan/work ianthomas/bigsurv-s4ss```

   This will downlod ~4GB of data so be sure to do this before the course.

   When successful this will start generating log output. The last line will be something similar to: 

   `http://(fb7264d089ae or 127.0.0.1):8888/?token=27f232ee7634f282bf12ee49a9b0c588a4528d2c539d9e7b`

   Copy the token 

3. Connect to the notebook 

    In a web browser go to http:// http://localhos:8888/?token=<copied token> 




