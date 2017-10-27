# ディスク
resource "sakuracloud_disk" "disk01"{
    # ディスク名
    name = "disk01"
# https://sacloud.github.io/terraform-provider-sakuracloud/configuration/resources/disk/
    source_archive_id = "${data.sakuracloud_archive.ubuntu.id}"
    # パスワード
    password = "password1"
}

# サーバー
resource "sakuracloud_server" "server01" {
    # サーバー名
    name = "server01"
    # 接続するディスク
    disks = ["${sakuracloud_disk.disk01.id}"]
    # タグ(NICの準仮想化モード有効化)
    tags = ["@virtio-net-pci"]

    depends_on = ["sakuracloud_disk.disk01"]
}

data sakuracloud_archive "ubuntu" {
  os_type = "ubuntu"
}

# アウトプット(SSHコマンド)
output "ssh_command" {
    value = "ssh root@${sakuracloud_server.server01.base_nw_ipaddress}"
}
