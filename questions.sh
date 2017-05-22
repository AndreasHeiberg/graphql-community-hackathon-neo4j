#!/usr/bin/env bash

QUESTIONS=$(curl \
	'https://graphql.communitygraph.org/graphql/' \
	-H 'content-type: application/json' \
	-H 'accept: application/json' \
	-H 'Connection: keep-alive' --data-binary '{"query":"{\n  Question(is_answered: false, orderBy: [view_count_desc], first: 10) {\n    title\n    link\n  }\n}","variables":null,"operationName":null}' \
)

echo $QUESTIONS | jq .