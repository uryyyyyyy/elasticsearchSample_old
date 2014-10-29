
## GUI（プラグイン）から確認してみる。

http://localhost:9200/_plugin/inquisitor/#/analyzers

任意の単語を入力してngram_sampleのところを見ると、分割されているはず。

## curlで確認してみる。

sh script/n-gram/analyzeString.sh [何か文字を入れる。]

## 検索してみる。

postSampleData.sh

searchQuery.sh

## 仕組み

```
"my_ngram_tokenizer" : {
 "type": "nGram",
 "min_gram": "2",
 "max_gram": "3",
 "token_chars": [
   "letter",
   "digit"
 ]
}
```

my_ngram_tokenizerという名前で定義した。

文字列の区切りを２〜3文字にしている。

token_charsで、tokenize処理をする文字を定義している。

* letter -> 一般文字全般
* digit -> 数字
* whitespace -> space tab
* punctuation -> !, "
* symbol -> $, &

## 試しにいじってみる。

tokenizerの定義を変えて、inquisitor pluginで実際の動きを見てみる。
