localhost:9200/ldgourmet/restaurant

GET _search
{
  "query": {
    "term": {
      "name": {
        "value": "aka"
      }
    }
    
  }
}


GET _search
{
  "from": 9,
  "size": 3, 
  "query": {
    "term": {
      "name": {
        "value": "aka"
      }GET _search
{
  "query": {
    "match": {
      "name":"akamai"
    }
    
  }
}
    }
    
  }
}


GET _search
{
  "from": 0,
  "min_score":0.4,
  "query": {
    "term": {
      "name":"aka"
    }
    
  }
}

GET _search
{
  "query": {
    "match": {
      "name":"akamai"
    }
    
  }
}


akamaiでor検索（analyzerで分割されたどれかの単語に当てはまればOK）

GET _search
{
  "query": {
    "match": {
      "name": {
        "query": "akamai",
        "operator": "or"
      }
    }
    
  }
}
GET _search
{
  "query": {
    "match_phrase": {
      "name": {
        "query": "kara kara",
        "slop" : 2
      }
    }
    
  }
}
akamaiでand検索（analyzerで分割された単語すべてがマッチすればOK）
analyzerはデフォルト

GET _search
{
  "query": {
    "match": {
      "name": {
        "query": "aka",
        "operator": "and"
      }
    }
    
  }
}

phraseとしてあっているかを見る。
slopは単語間の未知の単語を何単語取るかを決められる。
大きいほうが柔軟。（ためしに１にすると結果が変わる。）

GET _search
{
  "query": {
    "match_phrase": {
      "name": {
        "query": "kara kara",
        "slop" : 2
      }
    }
    
  }
}

akaで始まる単語をマッチ。
autocompleteとかに使えるかも


GET _search
{
  "query": {
    "prefix": {
      "name": "aka"
    }
    
  }
}


GET _search
{
  "query": {
    "more_like_this": {
      "fields": ["name", "address"], 
      "like_text": "ホ"
    }
    
  }
}

statin_id1が７９００〜８０００

GET _search
{
  "query": {
    "range": {
      "station_id1": {
        "from": 7900, 
        "to": 8000
      }
    }
    
  }
}

7930でfilterしたあと、その範囲でtermのqueryを投げる。

GET _search
{
  "query": {
    "filtered": {
      "query": {
        "term": {"name": "アフ"}
      },
      "filter": {
        "term": {
          "station_id1": 7930
        }
      }
    }
    
  }
}

Filterには名前を付けれる。返り値にどのFilterから連れたのかわかる。

GET _search
{
  "query": {
    "filtered": {
      "query": {
        "term": {"name": "アフ"}
      },
      "filter": {
        "term": {
          "station_id1": 7930,
          "_name" : "huee"
        }
      }
    }
    
  }
}

{
   "took": 2,
   "timed_out": false,
   "_shards": {
      "total": 5,
      "successful": 5,
      "failed": 0
   },
   "hits": {
      "total": 1,
      "max_score": 1.3996501,
      "hits": [
         {
            "_index": "ldgourmet",
            "_type": "restaurant",
            "_id": "215816",
            "_score": 1.3996501,
            "_source": {
               "name": "アフタヌーンティー・ティールーム 博多井筒屋",
               "property": "",
               "alphabet": "",
               "name_kana": "あふたぬーんてぃーてぃーるーむはかたいづつや",
               "pref_id": "40",
               "area_id": "503",
               "station_id1": "7930",
               "station_time1": "1",
               "station_distance1": "118",
               "station_id2": "7570",
               "station_time2": "9",
               "station_distance2": "723",
               "station_id3": "7971",
               "station_time3": "17",
               "station_distance3": "1375",
               "category_id1": "601",
               "category_id2": "0",
               "category_id3": "0",
               "category_id4": "0",
               "category_id5": "0",
               "zip": "〒812-8678",
               "address": "福岡市博多区博多駅中央街1-1博多井筒屋M2F",
               "north_latitude": "33.35.13.110",
               "east_longitude": "130.25.19.938",
               "description": "",
               "purpose": "",
               "open_morning": "0",
               "open_lunch": "1",
               "open_late": "0",
               "photo_count": "0",
               "special_count": "0",
               "menu_count": "0",
               "fan_count": "0",
               "access_count": "2112",
               "created_on": "2005-11-21 06:25:59",
               "modified_on": "2011-04-22 12:25:04",
               "closed": "0"
            },
            "matched_queries": [
               "huee"
            ]
         }
      ]
   }
}




orで複数のFilterをまとめられる。
（and、notも存在する。）

GET _search
{
  "query": {
    "filtered": {
      "query": {
        "term": {"name": "アフ"}
      },
      "filter": {
        "or": {
          "filters": [
            {
              "term": {
                "station_id1": 7930
              }
            },
            {
              "term": {
                "station_id1": 7931
              }
            }
          ]
        }
      }
    }
    
  }
}
