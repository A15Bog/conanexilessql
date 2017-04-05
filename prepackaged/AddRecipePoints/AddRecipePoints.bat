::Adds 200 recipe points to level 50. The amount can be adjusted in the AddRecipePoints.sql file
@echo off
for %%a in (game*.db) do (
echo "%%a"
sqlite3 %%a < AddRecipePoints.sql
)
pause
