FROM docker.elastic.co/elasticsearch/elasticsearch:5.6.7

RUN elasticsearch-plugin remove --purge x-pack
RUN elasticsearch-plugin install analysis-icu

ADD hunspell/ /usr/share/elasticsearch/config/hunspell/
ADD analysis/ /usr/share/elasticsearch/config/analysis/
