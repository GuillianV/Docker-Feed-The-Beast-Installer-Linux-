FROM ubuntu:22.10                                                                                               
RUN apt update                                                                                
RUN apt install curl -y                                                                     
RUN apt install screen -y                                                                    
ADD ./server-data /app                                                                       
WORKDIR /app       
ARG FILES_URL ""                                                                          
RUN curl -JLO "$FILES_URL"                   
RUN export INSTALL_FILENAME=$(ls -d serverinstall* | head -n 1)                                                                                                     
RUN chmod +x $(ls -d serverinstall* | head -n 1)                                              
RUN ./$(ls -d serverinstall* | head -n 1)                                                   
RUN chmod +x ./start.sh                                                                      
COPY ./entrypoint.sh /entrypoint.sh                                                         
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh && tail -f /dev/null
