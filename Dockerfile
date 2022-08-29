FROM nginx:alpine

ENV GIT_USERNAME=username
ENV GIT_PASSWORD=password
ENV GIT_REPOSITORY='example.com/myrepo.git'
ENV GIT_BRANCH=main

RUN apk add --no-cache git

COPY run-nginx-with-repo.sh /run-nginx-with-repo.sh
RUN chmod +x /run-nginx-with-repo.sh

# Expose server port
EXPOSE 80

ENTRYPOINT ["/run-nginx-with-repo.sh"]
