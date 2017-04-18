@echo off
set db_file="game.db"
if NOT exist %db_file% (
	echo No game.db file in this directory!
	PAUSE
	EXIT /B
)

echo Cleaning up %db_file%...
call :deleteFrom buildings
call :deleteFrom building_instances
call :deleteFrom buildable_health

echo    - Deleting non-feat data
sqlite3.exe %db_file% "DELETE FROM item_properties WHERE item_properties.inv_type != 6 AND item_properties.inv_type != 7 AND item_properties.inv_type != 3;"
sqlite3.exe %db_file% "DELETE FROM item_inventory WHERE item_inventory.inv_type != 6 AND item_inventory.inv_type != 7 AND item_inventory.inv_type != 3;"

echo    - Deleting non-character data
sqlite3.exe %db_file% "DELETE FROM properties WHERE properties.object_id in (select id from actor_position where id not in (select id from characters));"
sqlite3.exe %db_file% "DELETE FROM actor_position WHERE actor_position.id in (select id from actor_position where id not in (select id from characters));"
sqlite3.exe %db_file% "REINDEX"
sqlite3.exe %db_file% "ANALYZE"
sqlite3.exe %db_file% "VACUUM"
EXIT /B

:deleteFrom
echo    - Deleting %1%
sqlite3.exe %db_file% "DELETE FROM %1%;"
goto:EOF