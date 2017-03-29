::Removes all no ownership buildings and items from the server
@echo off
for %%a in (game*.db) do (
echo "%%a"
sqlite3 %%a < RemoveNoOwnership.sql
)
pause
