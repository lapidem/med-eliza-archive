#!/bin/bash
# =============================================
# med-ELIZA インストールスクリプト
# rev. 1.91 Archive 対応
# =============================================

set -e  # エラー発生時に即終了

echo "=== med-ELIZA Installer ==="

# ------------------- 依存チェック -------------------
echo "依存ツールをチェックしています..."

command -v awk >/dev/null 2>&1 || { echo "Error: awk が見つかりません。"; exit 1; }
command -v sed >/dev/null 2>&1 || { echo "Error: sed が見つかりません。"; exit 1; }
command -v grep >/dev/null 2>&1 || { echo "Error: grep が見つかりません。"; exit 1; }
command -v bash >/dev/null 2>&1 || { echo "Error: bash が見つかりません。"; exit 1; }

echo "✓ 基本コマンド OK"

# WordNet（任意）
if command -v wn >/dev/null 2>&1; then
    echo "✓ WordNet 発見"
else
    echo "⚠ WordNet (wn) が見つかりません。WordNet機能は無効になります。"
fi

# TreeTagger（任意）
if command -v tte >/dev/null 2>&1; then
    echo "✓ TreeTagger (tte) 発見"
else
    echo "⚠ TreeTagger が見つかりません。一部の機能が制限されます。"
fi

# ------------------- ディレクトリ作成 -------------------
echo "ディレクトリを準備しています..."

mkdir -p pubmedxml
mkdir -p /tmp/pd
mkdir -p /tmp/kw

echo "✓ ディレクトリ作成完了"

# ------------------- 権限設定 -------------------
echo "権限を設定しています..."

chmod +x pd-cgi
chmod +x install.sh

if [ -f update_pubmed.sh ]; then
    chmod +x update_pubmed.sh
fi

echo "✓ 実行権限付与完了"

# ------------------- 設定ファイル -------------------
if [ ! -f pd.conf ]; then
    echo "pd.conf を作成しています..."
    cp pd.conf.example pd.conf
    echo "✓ pd.conf.example から pd.conf を作成しました"
    echo "   → 必要に応じて pd.conf を編集してください"
else
    echo "✓ pd.conf は既に存在します"
fi

# ------------------- CGI配置の案内 -------------------
echo ""
echo "=== 設置完了 ==="
echo ""
echo "次の手順でApacheに配置してください："
echo ""
echo "1. pd-cgi を CGI ディレクトリにコピー"
echo "   sudo cp pd-cgi /usr/lib/cgi-bin/pd-cgi"
echo "   sudo chmod 755 /usr/lib/cgi-bin/pd-cgi"
echo ""
echo "2. 設定ファイルも一緒に配置"
echo "   sudo cp pd.conf /usr/lib/cgi-bin/pd.conf"
echo ""
echo "3. PubMedデータ配置"
echo "   あなたの PubMed *.txt ファイルを pubmedxml/ フォルダに入れてください"
echo ""
echo "4. Apache再起動"
echo "   sudo systemctl restart apache2"
echo ""
echo "5. ブラウザで確認"
echo "   http://あなたのサーバー/cgi-bin/pd-cgi"
echo ""
echo "========================================"
echo "インストール完了！"
echo "何か問題があれば issue に投稿してください。"
echo "========================================"
