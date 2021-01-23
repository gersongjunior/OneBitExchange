FROM ruby:2.5.1

# add nodejs and yarn dependencies for the frontend
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

#Instala nossas dependecias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
nodejs yarn build-essential libpq-dev imagemagick git-all nano

# seta noss path
ENV INSTALL_PATH /onebitexchange

# cria o nosso diretorio
RUN mkdir -p $INSTALL_PATH

#seta o nosso path como diretorio principal
WORKDIR $INSTALL_PATH

# Copia o nosso gemfile para dentro do container
COPY Gemfile ./

#Seta o path para as Gems
ENV BUNDLE_PATH /gems

#Copia nosso codigo para dentro do container
COPY . .