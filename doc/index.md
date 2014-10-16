
### elasticsearchとは？

何が便利なの？

・複数のフィールド（カラム）をまたいだ全文検索

・autocompleteやsuggest

・各種分析（trend・集計・ログ解析）ができる。（Kibanaなどで可視化できる）

・特定の条件になった際のpush通知

### 用語

#### analysis

どういうロジックでデータの保存・取得をしているかをまとめます。

#### tokenizer

文字列をどう分割するかをまとめたもの。スペース区切り、N-gramや形態素解析が一般的


### 論理構成

#### index

RDBのスキーマに相当

#### Type

RDBのテーブルに相当

#### Field

RDBのカラムに相当。

#### Document

RDBのレコードに相当

### 物理構成

#### Cluster

複数のノードを束ねたもの。
データアクセスはクラスタ単位で受け取る。

#### Node

NoSQLなどで言われているNodeと同じ感じ。
実際にアプリケーションが動作している単位。１マシン１ノードが一般的

実際に処理を行う単位

./elasticsearch --cluster.name my_cluster_name --node.name my_node_name

デフォルトではelasticsearchというクラスタが立ち上がる。node名はランダム。

