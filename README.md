
# med-ELIZA Archive

**Medical English Linking Keywords Finder for PubMed Zipped Archive**

ELIZA cgi-bash version **rev. 1.91**

![License](https://img.shields.io/badge/License-MIT-blue.svg)
![Language](https://img.shields.io/badge/Language-Bash%20%2B%20Awk-green.svg)

---

## 概要

**med-ELIZA** は、PubMedの論文アブストラクト全体を対象とした高速キーワード連結検索ツールです。

PubMed Zipped Archive（テキスト形式）をインデックス化し、以下の4段階検索を瞬時に行えます：

- **KWIC** — キーワードの左右文脈（共起語頻度付き）
- **InLine** — 複数キーワードが**同じ文**に出現
- **Multi** — 複数キーワードが**同じアブストラクト**に出現
- **Link** — 関連語（共起語）分析

医療論文執筆、文献レビュー、用語研究に最適です。

---

## 特徴

- 純粋Bash + Awk で書かれた軽量CGI（外部DB不要）
- ユーザーごとのプライベートキャッシュ（`/tmp/`）
- Ajax対応UI（jQuery）
- WordNet・Gene辞書連携
- Triplet words / Verb dictionary 対応
- Strict / Loose 検索モード切替
- 履歴・restore機能

---

## ファイル構成

```bash
med-eliza/
├── pd-cgi                  # 本体スクリプト（実行権限必要）
├── pd.conf.example         # 設定ファイル見本
├── install.sh              # インストールスクリプト
├── README.md
├── LICENSE
├── docs/
│   └── architecture.md     # 内部構造解説（後日追加）
├── scripts/                # データ更新用スクリプト（任意）
└── pubmedxml/              # ← ここにPubMed *.txt を置く
```

---

## クイックスタート

### 1. リポジトリをクローン

```bash
git clone https://github.com/yourname/med-eliza-archive.git
cd med-eliza-archive
```

### 2. インストール

```bash
chmod +x install.sh
./install.sh
```

### 3. 設定

```bash
cp pd.conf.example pd.conf
# 必要に応じて pd.conf を編集（特に XMLDIR）
```

### 4. PubMedデータの配置

pubmedxml/ フォルダに以下のファイルを置いてください：

- pubmed*.txt（PubMed Zipped Archive をテキスト変換したもの）
- gene-utf8.txt（任意）

### 5. Apacheへの配置（例）

```bash
sudo cp pd-cgi /usr/lib/cgi-bin/pd-cgi
sudo cp pd.conf /usr/lib/cgi-bin/pd.conf
sudo chmod 755 /usr/lib/cgi-bin/pd-cgi
sudo systemctl restart apache2
```

その後、http://your-server/cgi-bin/pd-cgi にアクセスしてください。

---

## ライセンス

MIT License（商用利用・改変・再配布自由）

---

## 元サイト

[https://med-eliza.pw/](https://med-eliza.pw/) （2026年閉鎖予定）

---

## 作者

- **lapidem** (Qus)
- 作成年：2019〜2025

---

## 貢献・連絡

このアーカイブは**公開保存用**です。 バグ報告・機能改善のPull Requestは大歓迎です！

GitHub Issues または X（旧Twitter）でご連絡ください。

---

**Enjoy powerful medical literature search with ELIZA!** 🧬📚