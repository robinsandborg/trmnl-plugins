FROM ruby:3.4-slim

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends build-essential && \
    gem install trmnl_preview -v 0.7.1 --no-document && \
    apt-get purge -y build-essential && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /plugin
EXPOSE 4567

ENTRYPOINT ["trmnlp"]
CMD ["serve", "--bind", "0.0.0.0"]
