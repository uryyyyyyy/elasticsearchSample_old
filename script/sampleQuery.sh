curl -XGET 'http://localhost:9200/ldgourmet/restaurant/_search?pretty=true' -d '
{
  "query" : {
    "simple_query_string" : {
      "query": "目黒 とんき",
      "fields": ["_all"],
      "default_operator": "and"
    }
  }
}
'



curl -XGET 'http://localhost:9200/ldgourmet/restaurant/_search?pretty=true' -d '
{
  "query" : {
    "simple_query_string" : {
      "query": "白金台 カフェ ボエム",
      "fields": ["name", "name_kana", "address"],
      "default_operator": "and"
    }
  }
}
'




curl -XGET 'http://localhost:9200/ldgourmet/restaurant/_search?pretty=true' -d '
{
  "query" : {
    "simple_query_string" : {
      "query": "東京 ラーメン",
      "fields": ["name", "name_kana", "address"],
      "default_operator": "and"
    }
  },
  "sort" : [{ "access_count" : {"order" : "desc", "missing" : "_last"}}]
}
'
