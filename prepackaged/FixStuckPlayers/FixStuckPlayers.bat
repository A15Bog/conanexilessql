::Fixes characters that are exiled
@echo off
for %%a in (game*.db) do (
echo "%%a"
sqlite3 %%a < FixStuckPlayers.sql
)
pause
