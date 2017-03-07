@echo off
for %%a in (game*.db) do (
echo "%%a"
sqlite3.exe %%a "VACUUM;REINDEX;ANALYZE;pragma integrity_check"
)
pause
