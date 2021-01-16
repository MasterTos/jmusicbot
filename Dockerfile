FROM adoptopenjdk/openjdk8:ubuntu-slim

WORKDIR /usr/src/musicbot

RUN VERSION=$(curl --silent "https://api.github.com/repos/jagrosh/MusicBot/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")') \
    && curl "https://github.com/jagrosh/MusicBot/releases/download/$VERSION/JMusicBot-$VERSION.jar" -L -o /usr/src/musicbot/JMusicBot.jar

VOLUME /usr/src/musicbot/config
ENV APP_ENV=docker
CMD ["java", "-Dconfig=/usr/src/musicbot/config/config.txt", "-Dnogui=true" , "-jar", "JMusicBot.jar"]
