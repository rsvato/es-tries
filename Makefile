clean:
	curl -XDELETE http://localhost:9200/searchpg

settings:
	curl -XPUT http://localhost:9200/searchpg -H 'Content-type: application/json' -d @settings.json


testsettings:
	curl -XPUT http://localhost:9200/searchpg2 -H 'Content-type: application/json' -d @vanilla-settings.json

mappings:
	curl -XPUT http://localhost:9200/searchpg/rudoc/_mapping -H 'Content-type: application/json' -d @text.json

all: clean settings mappings examples

examples:
	curl -H 'Content-type: application/json' -XPOST 'http://localhost:9200/searchpg/rudoc/_bulk?pretty' --data-binary @bulk.json