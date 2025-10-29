
FROM node:20-alpine
RUN npm install -g newman
WORKDIR /app
COPY entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh
RUN sed -i 's/\r$//' /entrypoint.sh && chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
