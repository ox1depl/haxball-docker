FROM ubuntu:18.04

RUN UBUNTU_FRONTEND=noninteractive \
  apt-get update && \
  apt-get -y install \
    npm

RUN npm install haxroomie -g

RUN UBUNTU_FRONTEND=noninteractive \
  apt-get -y install \
    curl \
    screen \
    gconf-service \
    libasound2 \
    libatk1.0-0 \
    libc6 libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgcc1 \
    libgconf-2-4 \
    libgdk-pixbuf2.0-0 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libstdc++6 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    ca-certificates \
    fonts-liberation \
    libappindicator1 \
    libnss3 \
    lsb-release \
    xdg-utils \
    wget \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY root/ /

CMD ["/bootstrap.sh"]

HEALTHCHECK --interval=5s --timeout=2s --retries=20 CMD /healthcheck.sh || exit 1
