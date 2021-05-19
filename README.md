# kokororoom

## サイト概要
悩み事投稿、回答サイト

### サイトテーマ
オンラインで悩み事を投稿、回答出来るwebアプリケーション

### テーマを選んだ理由
前職でコロナ禍の影響により数ヶ月間会社が休業となったため、私を含め悩み事を抱えた方が多くいました。<br />
そんな中、日常生活や将来に不安を抱える方や悩み事を抱えていても周囲に話す機会が無く溜め込んでしまう方が多いことをニュースで知り、<br />
私の作ったwebサービスを通してこのような方々に貢献したいと思い作成いたしました。

### ターゲットユーザ
周囲に相談相手がいない人、話す勇気が無い人

### 主な利用シーン
投稿ユーザ：一人で解決できない悩み事を投稿し回答を通して悩み事を解決、気持ちの負担を減らす。<br />
回答ユーザ：自身の経験や事実に基づき回答を行うことで悩み事の投稿ユーザーに貢献する。

## 設計書
- ER図：![ER diagram of kokororoom](kokororoom.pdf)
- テーブル定義書：<https://docs.google.com/spreadsheets/d/15mzxt2WLSoebQSZWbUkkS85od3sn2AEkfnlARnMxiRg/edit#gid=1103207792>
- アプリケーション詳細設計：<https://docs.google.com/spreadsheets/d/18ZRYB34QpNBsdPuxD5K42SW8rg5RTCGZxvriq3ejUw8/edit#gid=1103207792>

## チャレンジ要素一覧（クラウド教養コース）
<https://docs.google.com/spreadsheets/d/1shkEyJwCbleSk7vb_zrenDIepNJFgTiWnPpfMmIJqHE/edit#gid=0>

## AWS構成図
![AWS configuration diagram of kokororoom](aws_construction.pdf)

## インフラ設計書
<https://docs.google.com/spreadsheets/d/1KrcxUMMjBToLkSamYS2bLmq3rh6_HS4C65Zxahq3hAA/edit#gid=0>

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 本番環境
- AWS(VPC,AZ,EC2,RDS for MySQL)
- MySQL2
- Nginx,Puma
