# Start from an image containing R, rmarkdown stuff and shiny server
FROM rocker/shiny:latest
MAINTAINER Upendra Devisetty
LABEL Description="This image is used for testing shinyFile"

# Update the image and install XML dependencies
RUN apt-get update

# Install packages required by my app
#RUN Rscript -e "install.packages('shiny', dependencies=TRUE, repos='http://cran.rstudio.com/')"
#RUN Rscript -e "install.packages('shinyFiles')"
RUN install2.r --error -r 'http://cran.rstudio.com' shiny shinyFiles ggplot2

# Remove Shiny example inherited from the base image
RUN rm -rf /srv/shiny-server/* 

# Copy the source code of the app from my hard drive to the container (in this case we use the app "wordcloud" from http://shiny.rstudio.com/gallery/word-cloud.html)
COPY server.R ui.R /srv/shiny-server/

# change permission of the shiny folder where the app sits
RUN chmod -R 777 /srv/shiny-server

# Start the server with the container
CMD ["/usr/bin/shiny-server.sh"]

