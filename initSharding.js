sh.addShard("localhost:30000");
sh.addShard("localhost:30001");
for (i = 0; i < 10000; i++) {
    db.testdata.insert({"i": i})
}
db.testdata.createIndex({"i": 1});
sh.enableSharding("test")
sh.shardCollection("test.testdata", {i:1})
for(i = 1; i < 20; i++) {
    sh.splitAt("test.testdata", {"i": i*500})
}
print(sh.status(true));
