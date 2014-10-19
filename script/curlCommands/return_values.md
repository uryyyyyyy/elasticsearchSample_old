GET _search
{
  "from": 9,
  "size": 3, 
  "query": {
    "term": {
      "name": {
        "value": "aka"
      }
    }
    
  }
}


{
   "took": 12,
   "timed_out": false,
   "_shards": {
      "total": 5,
      "successful": 5,
      "failed": 0
   },
   "hits": {
      "total": 108,
      "max_score": 3.2155375,
      "hits": [
         {
            "_index": "ldgourmet",
            "_type": "restaurant",
            "_id": "451601",
            "_score": 2.6793232,
            "_source": {
               "name": "Makale'a",
               "property": "",
               "alphabet": "",
               "name_kana": "まかれあ",
               "pref_id": "27",
               "area_id": "408",
               "station_id1": "5506",
               "station_time1": "13",
               "station_distance1": "1027",
               "station_id2": "5674",
               "station_time2": "14",
               "station_distance2": "1158",
               "station_id3": "5491",
               "station_time3": "17",
               "station_distance3": "1374",
               "category_id1": "601",
               "category_id2": "429",
               "category_id3": "0",
               "category_id4": "0",
               "category_id5": "0",
               "zip": "",
               "address": "高槻市北柳川町2-3",
               "north_latitude": "34.49.25.532",
               "east_longitude": "135.35.45.632",
               "description": "",
               "purpose": "",
               "open_morning": "0",
               "open_lunch": "0",
               "open_late": "0",
               "photo_count": "0",
               "special_count": "0",
               "menu_count": "0",
               "fan_count": "0",
               "access_count": "111",
               "created_on": "2009-12-25 04:28:39",
               "modified_on": "2011-04-15 01:15:09",
               "closed": "0"
            }
         },
         {
            "_index": "ldgourmet",
            "_type": "restaurant",
            "_id": "379033",
            "_score": 2.652176,
            "_source": {
               "name": "Makapu'u",
               "property": "",
               "alphabet": "",
               "name_kana": "まかぷぅ",
               "pref_id": "27",
               "area_id": "408",
               "station_id1": "5499",
               "station_time1": "18",
               "station_distance1": "1449",
               "station_id2": "5152",
               "station_time2": "27",
               "station_distance2": "2177",
               "station_id3": "5844",
               "station_time3": "27",
               "station_distance3": "2188",
               "category_id1": "429",
               "category_id2": "204",
               "category_id3": "605",
               "category_id4": "0",
               "category_id5": "0",
               "zip": "",
               "address": "",
               "north_latitude": "34.47.16.213",
               "east_longitude": "135.32.24.731",
               "description": "女子会、懇親会などのランチパーティ予約が大好評！ボリュームも大満足なプレートメニューはどれもおいしいと人気です。  カワイイハワイアン雑貨も豊富です。",
               "purpose": "1,2,3,5",
               "open_morning": "1",
               "open_lunch": "1",
               "open_late": "1",
               "photo_count": "0",
               "special_count": "0",
               "menu_count": "0",
               "fan_count": "0",
               "access_count": "1055",
               "created_on": "2009-02-01 13:30:39",
               "modified_on": "2011-04-21 20:25:06",
               "closed": "0"
            }
         },
         {
            "_index": "ldgourmet",
            "_type": "restaurant",
            "_id": "356841",
            "_score": 2.652176,
            "_source": {
               "name": "Saka-Bar",
               "property": "",
               "alphabet": "",
               "name_kana": "さかばー",
               "pref_id": "1",
               "area_id": "101",
               "station_id1": "8211",
               "station_time1": "3",
               "station_distance1": "265",
               "station_id2": "8230",
               "station_time2": "4",
               "station_distance2": "313",
               "station_id3": "266",
               "station_time3": "5",
               "station_distance3": "420",
               "category_id1": "185",
               "category_id2": "0",
               "category_id3": "0",
               "category_id4": "0",
               "category_id5": "0",
               "zip": "",
               "address": "札幌市中央区南5条西6丁目エイト会館1F",
               "north_latitude": "43.03.05.040",
               "east_longitude": "141.21.11.984",
               "description": "",
               "purpose": "",
               "open_morning": "0",
               "open_lunch": "0",
               "open_late": "1",
               "photo_count": "0",
               "special_count": "0",
               "menu_count": "0",
               "fan_count": "0",
               "access_count": "525",
               "created_on": "2008-10-30 13:01:29",
               "modified_on": "2011-04-17 13:30:17",
               "closed": "0"
            }
         }
      ]
   }
}
