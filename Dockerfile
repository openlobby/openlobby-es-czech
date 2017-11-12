FROM docker.elastic.co/elasticsearch/elasticsearch:5.6.4

RUN elasticsearch-plugin remove --purge x-pack
RUN elasticsearch-plugin install analysis-icu

ADD hunspell/ /usr/share/elasticsearch/config/hunspell/
