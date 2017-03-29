::Please read RecommendedRebootScript.sql for what this contains. This is what I use on my server every reboot.
::Place this file in a directory with the RecommendedRebootScript.sql.
::Make sure you backup a copy of your good database into a seperate directory just in case before running.
::Run.
@echo off
for %%a in (game*.db) do (
echo "%%a"
sqlite3 %%a < Remove_BR_CF.sql
)
pause
