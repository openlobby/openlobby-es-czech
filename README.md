# Elasticsearch with Czech analyzer

Docker image: [openlobby/openlobby-es-czech](https://hub.docker.com/r/openlobby/openlobby-es-czech/)

Batteries included:
 - ICU Analysis Plugin
 - Czech Hunspell dictionaries (from OpenOffice)

X-Pack plugin is removed.

## Usage

Create Index with these settings:

```
{
    'settings': {
        'analysis': {
            'filter': {
                'czech_stop': {
                    'type': 'stop',
                    'stopwords': '_czech_',
                },
                'czech_stemmer': {
                    'type': 'stemmer',
                    'language': 'czech',
                },
                'cs_CZ': {
                    'type': 'hunspell',
                    'locale': 'cs_CZ',
                    'dedup': True,
                }
            },
            'analyzer': {
                'czech': {
                    'tokenizer': 'standard',
                    'filter': [
                        'icu_folding',
                        'lowercase',
                        'czech_stop',
                        'czech_stemmer',
                        'cs_CZ',
                    ]
                }
            }
        }
    }
}
```

You can use `'czech'` analyzer on text fields now.

## Build

If you don't want to use pre-built container from [openlobby/openlobby-es-czech](https://hub.docker.com/r/openlobby/openlobby-es-czech/)
you can build it locally: `make build`

## Run for local development

Run on port 9200: `make run`

Stop: `make stop`

Stop and/or remove all data: `make destroy`
