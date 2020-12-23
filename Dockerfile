FROM ubuntu:20.04

# Avoid prompt for time zone info.
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && apt-get install -y \
    make \
    pandoc \
    texlive-latex-base \
    texlive-fonts-recommended \
    texlive-latex-recommended \
    texlive-latex-extra

CMD ["/bin/bash"]
