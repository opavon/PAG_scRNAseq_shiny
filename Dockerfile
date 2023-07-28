FROM rocker/shiny
RUN NCPUS=${NCPUS:--1} && install2.r --error --skipinstalled -n $NCPUS shinylogs shinyWidgets DT
RUN sed -i "s|listen 3838|listen 3838 0.0.0.0 |g" /etc/shiny-server/shiny-server.conf
CMD ["/usr/bin/shiny-server"]