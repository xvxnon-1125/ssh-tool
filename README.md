# ssh-tool

SSH一括コマンド実行スクリプト

## 概要

複数のサーバに対して同一のコマンドを SSH 経由で一括実行するためのシンプルなシェルスクリプトです。

サーバ一覧を `server.txt` に記載し、実行時にコマンドを指定します。

---

## ファイル構成

```text
.
├── README.md
├── run.sh
└── server.txt
```

### server.txt

実行対象サーバを1行ずつ記載します。

```text
server01
server02
server03
```

ユーザ名を含めることも可能です。

```text
user1@server01
user2@server02
user3@server03
```

---

## インストール

実行権限を付与します。

```bash
chmod +x run.sh
```

---

## 使用方法

### ホスト名確認

```bash
./run.sh hostname
```

### ディスク使用量確認

```bash
./run.sh df -h
```

### サービス状態確認

```bash
./run.sh systemctl status sshd
```

### 複数引数を持つコマンド

```bash
./run.sh ls -l /tmp
```

---

## 前提条件

* SSH 接続が可能であること
* 公開鍵認証が設定されていること
* 実行ユーザに対象サーバへの接続権限があること

---

## 補足

本スクリプトは引数として受け取ったコマンドをそのまま SSH に渡します。

```bash
ssh "$SERVER" "$@"
```

`"$@"` を使用することで、実行時に指定した複数の引数を保持したままリモートサーバへ渡すことができます。

例：

```bash
./run.sh ls -l /var/log
```

実際には以下のように実行されます。

```bash
ssh server01 ls -l /var/log
ssh server02 ls -l /var/log
ssh server03 ls -l /var/log
```

---

## 出力例

```text
=== server01 2026-06-11 19:30:01 ===
server01

=== server02 2026-06-11 19:30:03 ===
server02
```

---

## 注意事項

* 対象サーバ数が多い場合は実行完了まで時間がかかります。
* 本スクリプトは順次実行（シリアル実行）です。
* 並列実行が必要な場合は GNU Parallel や Ansible の利用を検討してください。
