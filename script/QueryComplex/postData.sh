

curl -XPOST http://localhost:9200/query_complex/test/ -d '
{
	"title"      : "title1",
	"available"     : true,
	"year"     : "2014",
	"outline"    : "My son ran to me.",
	"tag" : "tag1",
	"add_date"  : "'`/bin/date +%Y/%m/%d`'"
}'

curl -XPOST http://localhost:9200/query_complex/test/ -d '{
	"title"      : "title2",
	"available"     : true,
	"year"     : "2014",
	"outline"    : "My son ran to me.",
	"tag" : "tag2",
	"add_date"  : "'`/bin/date +%Y/%m/%d`'"
}'

curl -XPOST http://localhost:9200/query_complex/test/ -d '
{
	"title"      : "title3",
	"available"     : true,
	"year"     : "2014",
	"outline"    : "My son ran to me.",
	"tag" : "tag1",
	"add_date"  : "'`/bin/date +%Y/%m/%d`'"
}'

curl -XPOST http://localhost:9200/query_complex/test/ -d '
{
	"title"      : "title4",
	"available"     : true,
	"year"     : "2014",
	"outline"    : "My son ran to me.",
	"tag" : "tag3",
	"add_date"  : "'`/bin/date +%Y/%m/%d`'"
}'
