#!/bin/bash
cat ./*.csv | grep-email | sort | uniq | cat > final-list.csv
cat final-list.csv | xargs -I {} echo "INSERT INTO \`domnaskale\`.\`dnsjom_jinc_subscriber\` (\`id\`, \`news_id\`, \`email\`) VALUES (NULL, '1', '"{}"');"
