FROM alpine:3.9

LABEL "com.github.actions.name"="Push new files back to master."
LABEL "com.github.actions.description"="A GitHub Action to push any new files back to master"
LABEL "com.github.actions.icon"="arrow-up"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/mikeal/publish-to-github-action"
LABEL "homepage"="https://github.com/mikeal/publish-to-github-action"
LABEL "maintainer"="peaceiris"

RUN apk add --no-cache git openssh-client

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
