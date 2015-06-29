sudo service mongod stop
mkdir shard0
mkdir shard1
mkdir config

# Start the config server
mongod --fork --syslog --configsvr --dbpath config --port 27019

# Start the shard servers
mongod --fork --syslog --dbpath shard0 --port 30000
mongod --fork --syslog --dbpath shard1 --port 30001

# Start the mongos process
mongos --fork --syslog --configdb localhost:27019

# Add shards
mongo initSharding.js
