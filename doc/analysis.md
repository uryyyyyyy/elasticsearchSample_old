
## 仕組み

構文解析（analyze）は、

文字列ストリーム（入力）→事前フィルタリング（Character filters）→単語に分割（Tokenizer）→事後処理（TokenFilter）→保存（or検索）

という流れで処理される。


### analyzer

analyzerとは文字列の分割方法を定義するtokenizerと、分割後の文字列の整形処理を定義するfilterによって構成されます。

（先の流れ全体をまとめたものをanalyzerと呼ぶ。）

例えば、tokenizerがngramで文字列を分割し、filterで大文字小文字を小文字に統一してしまうなどといった定義をすることが出来ます。

analyzerはいくつでも定義することが出来き、Field毎にどのanalyzerを利用するか決めることが出来ます。

http://engineer.wantedly.com/2014/02/25/elasticsearch-at-wantedly-1.html

#### Character filters

入力文字列の事前処理を行う。

この時点では文字列を意味のある単位に分けられていないので、条件に合った文字を処理するだけ。

例：

* mapping → 特定の文字を置換する。
* HTMLStripe → HTMLタグを消す。
* pattern　→正規表現パターンがマッチした文字を置換する。

#### Tokenizer

文字列をどう分割するかをまとめたもの。スペース区切り、N-gramや形態素解析が一般的

文字列ストリームを意味のある単位（term・token）に分割していく。

例：

* ngram tokenizer → 検索対象を、後続の N-1 文字を含めた文字列の単位で分割する。
* whitespace tokenizer → space 改行毎に文字列を分割する。
* kuromoji_tokenizer → 日本語として意味のある単位に分割する（詳細は知らない。）

#### TokenFilter

Tokenizeされた後のTermsを処理する。

例：

* lowercase token filter → 名前の通り。
* ength token filter → removes words that are too long or too short
* stop token filter → 前置詞とか助詞とかを省く。


### analyzerをどう使い分けるの？

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
