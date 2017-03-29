::Runs many reports including character and guild list, foundation spam, out of bounds building, number of buildings per owner
@echo off
for %%a in (game*.db) do (
echo "%%a"
sqlite3 %%a < Remove_BR_CF.sql
)
pause
