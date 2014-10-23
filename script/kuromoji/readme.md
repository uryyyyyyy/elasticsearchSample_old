
## GUI（プラグイン）から確認してみる。

http://localhost:9200/_plugin/inquisitor/#/analyzers

日本語を入力してみて、kuromoji_sampleのところを見ると、意味のある単位で分割されている。

## curlで確認してみる。

sh script/kuromoji/analyzeString.sh 吾輩は猫である

## 検索してみる。

postSampleData.sh

searchQuery.sh
