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
	-p 3001:3000 \
	test/pulmap-scans
```