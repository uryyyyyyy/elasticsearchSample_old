

## analysis

analyzerを定義します。デフォルトではbuilt-inのものが適用されます。

（indexing時とsearch時でLogicalNameが異なるanalyzerを使ってるよう）

### analyzer

analyzerとは文字列の分割方法を定義するtokenizerと、分割後の文字列の整形処理を定義するfilterによって構成されます。

例えば、tokenizerがngramで文字列を分割し、filterで大文字小文字を小文字に統一してしまうなどといった定義をすることが出来ます。

analyzerはいくつでも定義することが出来き、フィールドごとにどのanalyzerを利用するか決めることが出来ます。

from：http://engineer.wantedly.com/2014/02/25/elasticsearch-at-wantedly-1.html

### analyze処理の流れ

Character filters　→　Tokenizer　→　TokenFilter

#### Character filters

入力文字列を文字（not単語）単位で処理する。

mapping → 特定の文字を置換する。
HTMLStripe → HTMLタグを消す？
pattern　→パターンがマッチした文字を置換する。

#### TokenFilter

Tokenizeされた後のTerms（not文字）を処理する。

lowercase

#### Tokenizer

入力文字列を意味のある単位（term）に分割していく。




### どういうanalyzerがあってどう使い分けるの？

ngram

curl -XGET 'http://localhost:9200/ldgourmet/_analyze?pretty=true&analyzer=ngram_analyzer' -d '東京都目黒区'


### kuromoji

日本語の形態素解析ソフト。

elasticsearch向けにAnalyzerやtokenizerを提供しているみたい。

pluginをインストール後、導通確認。
`curl -XGET 'http://localhost:9200/ldgourmet/_analyze?pretty=true&analyzer=kuromoji' -d '東京都目黒区'`
東京 都 目黒 区 のように分かれてればkuromojiのアナライザは動作している。


curl -XGET 'http://localhost:9200/ldgourmet/_analyze?pretty=true' -d '東京都目黒区'

curl -XGET 'http://localhost:9200/ldgourmet/_analyze?pretty=true&analyzer=kuromoji' -d '東京都目黒区'
