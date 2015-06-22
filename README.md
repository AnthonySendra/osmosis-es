# Osmosis + Elasticsearch + Docker

[Osmosis](http://wiki.openstreetmap.org/wiki/Osmosis) with [Elasticsearch plugin](https://github.com/ncolomer/elasticsearch-osmosis-plugin/) working with [Elasticsearch](https://registry.hub.docker.com/u/library/elasticsearch/) 1.6 in container

# How to use

Run an elasticsearch container

```
docker run -d --name=elasticsearch elasticsearch
```

You can now run osmosis for import a file:

```
docker run \
--link elasticsearch:elasticsearch \
-v path/host/to/file.pbf:/path/container/to/file.pbf \
patatra/osmosis-es \
--read-pbf /path/container/to/file.pbf --tf accept-ways amenity=restaurant --write-elasticsearch cluster.hosts="elasticsearch"
```