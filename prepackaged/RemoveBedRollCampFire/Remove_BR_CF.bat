::This removes all placed bedrolls and campfires from the server
@echo off
for %%a in (game*.db) do (
echo "%%a"
sqlite3 %%a < Remove_BR_CF.sql
)
pause
