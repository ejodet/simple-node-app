#FROM node:6-alpine
#RUN apk add --no-cache bash

#ARG APP_BUILD_NUMBER=latest
#ENV NODE_ENV production
#ENV PORT 80

#ADD . /home/node

#ARG JQ_VERSION=jq-1.5
#ADD https://github.com/stedolan/jq/releases/download/${JQ_VERSION}/jq-linux64 /home/node/jq
#RUN chmod +x /home/node/jq

#WORKDIR /home/node
#EXPOSE 80

FROM ibmcom/ibmnode:6

ARG APP_BUILD_NUMBER=latest
ENV NODE_ENV production
ENV PORT 80

RUN useradd -ms /bin/bash node 

COPY . /home/node
WORKDIR /home/node

EXPOSE 80

CMD ["node", "app.js"]

