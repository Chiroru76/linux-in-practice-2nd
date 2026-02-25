# linux-in-practice-2nd

「Linuxのしくみ 増補改訂版」の実験コード

# 実験プログラム実行環境の作成

お手元のUbuntu 20.04環境で本書の実験プログラムを実行する際は、以下のコマンドを実行して必要パッケージのインストールおよびユーザ設定をしてください。

```console
$ sudo apt update && sudo apt install binutils build-essential golang sysstat python3-matplotlib python3-pil fonts-takao fio qemu-kvm virt-manager libvirt-clients virtinst jq docker.io containerd libvirt-daemon-system
$ sudo adduser `id -un` libvirt
$ sudo adduser `id -un` libvirt-qemu
$ sudo adduser `id -un` kvm
```

# Docker を使った実行環境の作成

## イメージのビルド（初回のみ）

プロジェクトのルートディレクトリで実行：

```console
$ docker build -t linux-in-practice .
```

## コンテナの起動

```console
$ docker run -it --rm \
  -v $(pwd):/work \
  -w /work \
  linux-in-practice bash
```

各オプションの意味：

| オプション | 意味 |
|-----------|------|
| `-it` | 対話的に操作できるようにする（ターミナルを接続する） |
| `--rm` | コンテナ終了時に自動削除する |
| `-v $(pwd):/work` | Mac の現在ディレクトリをコンテナ内の `/work` にマウントする |
| `-w /work` | コンテナ内の作業ディレクトリを `/work` に設定する |
| `linux-in-practice` | 使用するイメージ名 |
| `bash` | コンテナ内で bash を起動する |

- Mac 側でソースコードを編集し、コンテナ内でビルド・実行できます
- `-v $(pwd):/work` により Mac 側のファイルとコンテナ内の `/work` が同期されます
