@echo off
for %%a in (game*.db) do (
echo "%%a"
sqlite3.exe %%a "pragma integrity_check"
)
echo "Hit enter to continue if you see "ok" on the line above. If you do not see "ok", something is wrong. Hit X to close, check your setup, then retry."
pause