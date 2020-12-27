FROM ubuntu:20.04

# Avoid prompt for time zone info.
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && apt-get install -y \
    librsvg2-bin \
    make \
    pandoc \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-latex-recommended

CMD ["/bin/bash"]
