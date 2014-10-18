curl -XGET http://localhost:9200/_cluster/health?pretty

# shutdown cluster (allNodes)
curl -XPOST http://localhost:9200/_cluster/nodes/_shutdown

# state
curl localhost:9200/_cluster/state?pretty


