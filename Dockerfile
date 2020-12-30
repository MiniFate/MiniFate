FROM ubuntu:20.04

# Avoid prompt for time zone info.
ENV DEBIAN_FRONTEND=noninteractive

# For PDF generation with LaTeX
RUN apt-get -y update && apt-get install -y \
#    librsvg2-bin \
    make \
    pandoc \
    xvfb \
    libfontconfig \
    wkhtmltopdf

CMD ["/bin/bash"]
