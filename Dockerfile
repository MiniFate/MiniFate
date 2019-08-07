
FROM ubuntu

RUN apt-get -y update

# Avoid prompt for time zone info. 
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y make pandoc

# These packages are pretty big. Let's save a few minutes by putting
# each in their own layer while we figure things out.
RUN apt-get install -y texlive-latex-base
RUN apt-get install -y texlive-fonts-recommended
RUN apt-get install -y texlive-latex-recommended

CMD ["/bin/bash"]
