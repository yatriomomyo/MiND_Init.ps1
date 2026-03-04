# PowerShellのバージョンによる文字コードの挙動差を回避するため、このスクリプトファイルは [BOM付きUTF-8] で保存してください。
# - v5.1以前：BOMがないと日本語が文字化けします
# - v6.0以降：BOMの有無に関わらず動作します
# 両環境での互換性を維持するため [BOM付きUTF-8] を推奨します。

$ErrorActionPreference = 'Stop'

Add-Type -AssemblyName System.Windows.Forms

# PowerShell6.0以降の場合は Shift-JIS を扱うためにプロバイダー登録が必要。
if ($IsCoreCLR) {
    [System.Text.Encoding]::RegisterProvider([System.Text.CodePagesEncodingProvider]::Instance)
}

function Write-File {
    param (
        [string]$Path,
        [string]$Data
    )

    try {
        # PowerShellのバージョンによるデフォルトエンコーディングの挙動差を回避するための処理です。
        # - v5.1以前：デフォルト ANSI (日本語環境は Shift-JIS)
        # - v6.0以降：デフォルト UTF-8 (BOMなし)
        # PowerShell標準の Set-Content 等は環境依存が強いため、.NET クラスでエンコーディングを固定します。
        $utf8NoBom = [System.Text.UTF8Encoding]::new($false)
        $utf8WithBom = [System.Text.UTF8Encoding]::new($true)
        $sjis = [System.Text.Encoding]::GetEncoding('shift_jis')

        # 用途に合わせて上記の変数を第3引数へ渡してください。
        [System.IO.File]::WriteAllText($Path, $Data, $sjis)
    }
    catch {
        [void][System.Windows.Forms.MessageBox]::Show(
            "ファイルの初期化に失敗しました。`r`n`r`n$Path`r`n`r`n$($_.Exception.Message)",
            "エラー",
            [System.Windows.Forms.MessageBoxButtons]::OK,
            [System.Windows.Forms.MessageBoxIcon]::Error
        )
    }
}

Write-File "C:\NumberCall_Host\FixNumber.dat" ""
Write-File "C:\NumberCall_Host\NumColor.css" ""
