FROM ubuntu:latest

LABEL "com.github.actions.name"="Lintly-cfn-nag"
LABEL "com.github.actions.description"="Runs cfn-nag and uses lintly to provide PR feedback."
LABEL "com.github.actions.icon"="code"
LABEL "com.github.actions.color"="gray-dark"

LABEL "repository"="https://github.com/23andme-private/security-cfn-nag-lintly-action.git"
LABEL "homepage"="https://github.com/23andme-private/security-cfn-nag-lintly-action"
LABEL "maintainer"="Patrick Kelley <patrickk@23andme.com>"

RUN apt-get update \
    && apt-get -y install python3 python3-pip ruby ruby-dev \ 
    && python3 -m pip install --upgrade pip \
    && python3 -m pip install lintly \
    && gem install cfn-nag --no-format-exec \
    && rm -rf /var/lib/apt/lists/*

ADD entrypoint.sh /entrypoint.sh
ADD cfn_nag_exclude.yml /cfn_nag_exclude.yml
ENTRYPOINT ["/entrypoint.sh"]
