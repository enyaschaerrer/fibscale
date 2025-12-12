FROM ruby:3.2-bookworm

RUN groupadd --system fibscale
RUN useradd --create-home --gid fibscale --system fibscale

WORKDIR /fibscale

COPY --chown=fibscale:fibscale ./ ./

RUN chown fibscale:fibscale .

RUN apt-get update
RUN apt-get install -y g++ make patch

USER fibscale

RUN bundle install

CMD ["bundle", "exec", "ruby", "fibscale.rb"]

EXPOSE 3000