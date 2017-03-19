CREATED BY =A15=Bog. Last modified 3/7.
Search the server browser for A15.
We are ranked #3 on topgameservers, #5 on gametracket, #11 on battlemetrics as of 3/7.
US PVP. No exploits, 1x raid on a target per day, 1 person stack limit, no racism, unradable bases allowed, .4 claim radius, 0 admin abuse.

CURRENT PRODUCTION SCRIPTS AS OF 3/18:
* Add recipe points to level 50 players - HOT!
* Find buildings past the maximum directional values of the green wall - NEW
* Merge clans together - NEW
* Find all single or double foundation spam with location (actually works) - NEW
* Export excel list of all players, guilds, levels, steamids - NOW INCLUDES ACTIVITY DATE
* Delete no ownership objects
* Delete all buildings, placeables, items, players and guilds for defined ids
* Fix for players stuck out of bounds in the Upside Down
* Delete all campfires and bedrolls from the server (one time wipe)
* Export excel list of all player owned placeables and buildings
* Change character names
* Activity timestamp (will be phased out soon due to game implemented timestamp)
* Decay tool based on activity timestamp (will be updated to use game implmented timestamp)
* DB Maintenance (shrink, reindex, analyze for best query path, integrity check)


* UPDATE on 3/18 - added script to find buildings past the furthest directional boundary of the green wall
* UPDATE on 3/15 - Lots of script fixes, if you use decay tool you should be using the new version. If you used the old version please use the Fix for players unable to login or stuck in Exiled and everything will be ok.
* UPDATE on 3/9 - Moved script to production for removing all no ownership objects from the server.
* UPDATE on 3/9 - Added script to fix players or admins who may be stuck in the Upside Down (out of bounds of the map, may crash server).
* UPDATE on 3/9 - Added in script to add recipe points to characters when they hit 50, working on one to add points per level.
* UPDATE on 3/8 - Completed and added bedroll script to production after use on live A15 server.

All scripts have been revamped and verified working on 3/7 except for the non-production ready scripts listed at the bottom of the tools document. The batch file is an example of how to run queries from a batch file instead of manually.

To run these manually,

1) Download game.db and sqlite3.exe to a local directory.

2) Open sqlite3.exe

3) Type .open game.db

4) Hit enter

5) Copy and paste the script into the window

6) Hit enter

7) Type .quit

8) Hit enter

9) Reupload game.db
