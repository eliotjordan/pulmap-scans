Pulmap Scans
================

Docker Launch

```
docker run -itd --name pulmapscans \
	--env IMAGES_DATABASE_HOST="" \
	--env IMAGES_DATABASE="" \
	--env IMAGES_DATABASE_USERNAME="" \
	--env IMAGES_DATABASE_PASSWORD="" \
	--env SECRET_KEY_BASE="" \
	--env RAILS_RELATIVE_URL_ROOT="/pumapdata" \
	--env EZID_USER="" \
    --env EZID_PASSWORD="" \
    --env SECRET_KEY_BASE="" \
	-p 9005:3000 \
	pulmap/scans
```

For Apache config
```
ProxyPass /pumapdata  http://localhost:9005/pumapdata
ProxyPassReverse /pumapdata  http://localhost:9005/pumapdata
```