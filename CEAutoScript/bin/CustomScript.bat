::!!!!Edit CustomScript.sql, not this file!!!!
@echo off
for %%a in (game*.db) do (
echo "%%a"
sqlite3 %%a < C:\CEAutoScript\EDIT_THESE\CustomScript.sql
)
