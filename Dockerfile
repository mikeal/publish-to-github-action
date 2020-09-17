FROM alpine:3.9

LABEL "com.github.actions.name"="Push new files back to supplied branch name."
LABEL "com.github.actions.description"="A GitHub Action to push any new files back to supplied branch name"
LABEL "com.github.actions.icon"="arrow-up"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/mikeal/publish-to-github-action"
LABEL "homepage"="https://github.com/mikeal/publish-to-github-action"
LABEL "maintainer"="peaceiris"

RUN apk --no-cache add openssl git curl openssh-client bash
    
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

RUN echo CWD `pwd` \
    && mkdir /tmp/lfs \
    && cd /tmp/lfs \
    && curl -sLO https://github.com/git-lfs/git-lfs/releases/download/v2.6.0/git-lfs-linux-amd64-v2.6.0.tar.gz \
    && tar -zxf git-lfs-linux-amd64-v2.6.0.tar.gz \
    && ./install.sh \
    && cd / \
    && rm -rf /tmp/lfs
