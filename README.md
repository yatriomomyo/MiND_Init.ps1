2027年にWindows11でのVBScriptが廃止され機能自体が削除されます。\
代替策として同機能のPowerShellスクリプト（ps1ファイル）を作成しました。\
使用方法等は添付のps1ファイルのコードをご覧ください。各種テキストエディターで開けます。

ps1ファイルの実行方法ですが、以下のコマンドをコマンドプロンプトから実行します。コマンドはPowerShellのバージョンによって異なります。\
違いは実行するexeの名前のみです。-File は環境に合わせてください。\
v5.1以前：powershell.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -File "C:\Users\User\Desktop\MiND_Init.ps1"\
v6.0以降：pwsh.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -File "C:\Users\User\Desktop\MiND_Init.ps1"

お使いのPCでどのバージョンのPowerShellがインストールされているかは、以下のディレクトリーの有無で判断できます。\
v5.1以前：C:\Windows\System32\WindowsPowerShell\v1.0\
v6.0以降：C:\Program Files\PowerShell\7 ← バージョン毎のフォルダーがあります。この場合は7系統ということです。

スタートアップで実行する場合は、コマンドをバッチファイル等にして登録すればOKです。
