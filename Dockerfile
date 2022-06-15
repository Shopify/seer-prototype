FROM ruby:3.1

ENV INSTALL_PATH /srv/seer
RUN mkdir -p ${INSTALL_PATH}
WORKDIR ${INSTALL_PATH}

COPY . .

RUN bundle install
RUN bin/rails assets:precompile db:reset db:migrate db:seed # Seeding takes time, please be patient

EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0"]
