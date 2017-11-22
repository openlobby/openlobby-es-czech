# Elasticsearch with Czech analyzer

Batteries included:
 - ICU Analysis Plugin
 - Czech Hunspell dictionaries (from OpenOffice)

X-Pack plugin is removed.

## Usage

Create your index with these settings:

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

Build docker container: `make build`

## Run for local development

Run Elasticsearch on port 9200: `make run`
Stop Elasticsearch container: `make stop`

Stop and/or remove volume with data: `make destroy`
