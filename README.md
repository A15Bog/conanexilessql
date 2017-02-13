# conanexilessql
SQLite DB Maintenance Script

1.) Download the game.db, sqlite3.exe, and CE_DB_Maintenance.bat into the same directory.

2.) Run DB_Maintenance.bat.

This script removes all bedrolls and campfires from the server as well as changes the default memory page and cache size of the database, then reindexs, shrinks, and analyzes the database.


Code contained in .bat:

PRAGMA synchronous = 0; --makes the following queries run faster
delete from buildable_health where object_id in (select distinct object_id from properties where name in ('BP_PL_Bedroll_Fiber_C.HasHitGround','BP_PL_Bedroll_Fiber_C.SourceItemTemplateID','BasePlayerChar_C.BedRollID','BP_PL_Crafting_CampFire_C.HasHitGround','BP_PL_Crafting_CampFire_C.SourceItemTemplateID')); --removes bedrolls and campfires from the table that contains the health of built objects
delete from buildings where object_id in (select distinct object_id from properties where name in ('BP_PL_Bedroll_Fiber_C.HasHitGround','BP_PL_Bedroll_Fiber_C.SourceItemTemplateID','BasePlayerChar_C.BedRollID','BP_PL_Crafting_CampFire_C.HasHitGround','BP_PL_Crafting_CampFire_C.SourceItemTemplateID')); --removes bedroll and campfire from the table that contains all built structures
delete from item_inventory where template_id in ('12001','10001'); --removes bedrolls and campfire from item inventory
delete from properties where name in ('BP_PL_Bedroll_Fiber_C.HasHitGround','BP_PL_Bedroll_Fiber_C.SourceItemTemplateID','BasePlayerChar_C.BedRollID','BP_PL_Crafting_CampFire_C.HasHitGround','BP_PL_Crafting_CampFire_C.SourceItemTemplateID'); --removes bedrolls and campfires from ingame locations
PRAGMA default_cache_size=700000; --increases default db cache size from 2000 to 700000
PRAGMA cache_size=700000; --increases cache size from 2000 to 700000
PRAGMA PAGE_SIZE = 4096; --increases memory page size from 1024 to 4096
VACUUM; --removes all unused space from the database after auto-growth due to adds/deletes
REINDEX; --rebuilds all current indexes for best use
ANALYZE; --helps make better query planning choices
pragma integrity_check --makes sure database integrity is still good
