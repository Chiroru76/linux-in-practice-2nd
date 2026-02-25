# ベースイメージ: Ubuntu 20.04 (x86_64)
# --platform=linux/amd64 で Apple Silicon Mac でも x86_64 環境を再現する
FROM --platform=linux/amd64 ubuntu:20.04

# apt-get install 中の対話的プロンプト（タイムゾーン選択など）をスキップする
ENV DEBIAN_FRONTEND=noninteractive

# 必要パッケージのインストール
# - binutils        : バイナリ解析ツール（objdump など）
# - build-essential : C コンパイラ（gcc）や make などのビルドツール
# - golang          : Go 言語のコンパイラ
# - sysstat         : システム統計ツール（iostat, sar など）
# - python3-matplotlib : Python グラフ描画ライブラリ
# - python3-pil     : Python 画像処理ライブラリ
# - fonts-takao     : 日本語フォント
# - fio             : ストレージのベンチマークツール
# - strace          : システムコールのトレースツール
# - jq              : JSON 整形・操作ツール
RUN apt-get update && apt-get install -y \
    binutils \
    build-essential \
    golang \
    sysstat \
    python3-matplotlib \
    python3-pil \
    fonts-takao \
    fio \
    strace \
    jq \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# コンテナ起動時のデフォルト作業ディレクトリ
WORKDIR /work
