

## analysis

analyzerを定義します。デフォルトではbuilt-inのものが適用されます。

（indexing時とsearch時でLogicalNameが異なるanalyzerを使ってるよう）

### analyzer

analyzerとは文字列の分割方法を定義するtokenizerと、分割後の文字列の整形処理を定義するfilterによって構成されます。

例えば、tokenizerがngramで文字列を分割し、filterで大文字小文字を小文字に統一してしまうなどといった定義をすることが出来ます。

analyzerはいくつでも定義することが出来き、フィールドごとにどのanalyzerを利用するか決めることが出来ます。

from：http://engineer.wantedly.com/2014/02/25/elasticsearch-at-wantedly-1.html


### どういうanalyzerがあってどう使い分けるの？


