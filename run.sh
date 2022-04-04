docker run kafka-metrics:latest \
  --prometheus-url http://10.130.0.35:9090 \
  --partition-size-query 'max(kafka_log_log_size{kafka_cluster="kafka-mailings-dm-stable"}) by (topic,partition)' \
  --broker-storage-query 'node_filesystem_avail_bytes{node_group="kafka-mailings-dm-stable", mountpoint=~"/var/lib/kafka.*"}' \
  --broker-id-label instance \
  --broker-id-map "kafka-mailings-dm-stable-a-1-v1=1,kafka-mailings-dm-stable-a-2-v1=4,kafka-mailings-dm-stable-b-1-v1=2,kafka-mailings-dm-stable-b-2-v1=5,kafka-mailings-dm-stable-c-1-v1=3,kafka-mailings-dm-stable-c-2-v1=6" \
  --zk-addr 10.145.0.214:2181 \
  --prometheus-query-timeout 300s
