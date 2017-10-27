# https://hub.docker.com/r/sacloud/terraform/
# /workではなく/workdir
# https://knowledge.sakura.ad.jp/7660/
token=
secret=
SAKURA=init apply plan destroy

$(SAKURA):
	docker run -it --rm \
		-e SAKURACLOUD_ACCESS_TOKEN=$(token) \
		-e SAKURACLOUD_ACCESS_TOKEN_SECRET=$(secret) \
		-v $(PWD):/workdir \
		sacloud/terraform $@

