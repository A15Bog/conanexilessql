CREATED BY =A15=Bog. Last modified 3/7.
Search the server browser for A15.
We are ranked #3 on topgameservers, #5 on gametracket, #11 on battlemetrics as of 3/7.
US PVP. No exploits, 1x raid on a target per day, 1 person stack limit, no racism, unradable bases allowed, .4 claim radius, 0 admin abuse.

CURRENT PRODUCTION SCRIPTS AS OF 3/18:
* Add recipe points to level 50 players - HOT! (Updated to be simpler. Please run if you have run previously for performance.) - UPDATE
* Script to remove Bog Decay Tool V1 due to the game putting in its own timestamp. Bog Decay Tool V2 replaces the original decay tool without the need for an extra column or trigger, but the removal of the column and the trigger to update it is necessary for performance. - UPDATE
* Bog Decay Tool V2 - can be run without any column or trigger additions due to the addition of a timestamp by the game devs! Fully customizable. - NEW
* Easy mode script to find id - NEW
* Wipe tool to remove all buildings and items, but leave players and guilds in place. - NEW
* Find the number of buildings that each owner has (each building can have x amount of peices attached) - NEW
* Find buildings past the maximum directional values of the green wall.
* Merge clans together (cannot merge thralls)
* Find all single or double foundation spam with location (actually works)
* Export excel list of all players, guilds, levels, steamids, last time online
* Delete no ownership objects
* Delete all buildings, placeables, items, players and guilds for defined ids
* Fix for players stuck out of bounds in the Upside Down
* Delete all campfires and bedrolls from the server (one time wipe)
* Export excel list of all player owned placeables and buildings
* Change character names
* Activity timestamp (will be phased out soon due to game implemented timestamp)
* DB Maintenance (shrink, reindex, analyze for best query path, integrity check)

* Depreciated: DB Optimization for cache and memory (added to game in 3/14 patch)
* Depreciated: Activity timestamp (functional in game as of 3/14 path)
* Depreciated: Decay Tool V1 - leaving the script only for people who already added the timestamp, use V2 for use with in game timestamp


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
