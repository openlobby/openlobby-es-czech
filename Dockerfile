FROM docker.elastic.co/elasticsearch/elasticsearch-oss:6.1.4

RUN elasticsearch-plugin install analysis-icu

ADD hunspell/ /usr/share/elasticsearch/config/hunspell/
ADD analysis/ /usr/share/elasticsearch/config/analysis/
