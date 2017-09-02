/* Commenting out/removing ON 20170902 due to reports of this resetting some player levels and stats after use, and potentially causing crashes the comment out line below was removed on 20170825 for issues with it having an effect on chests and their contents
--DELETE OBJECTS FROM PLAYERS OR GUILDS WHO LONGER EXIST
delete from buildable_health where object_id in (select distinct object_id from buildings where owner_id not in (select id from characters) and owner_id not in (select guildid from guilds));
delete from building_instances where object_id in (select distinct object_id from buildings where owner_id not in (select id from characters) and owner_id not in (select guildid from guilds));
delete from properties where object_id in (select distinct object_id from buildings where owner_id not in (select id from characters) and owner_id not in (select guildid from guilds));
delete from actor_position where id in (select distinct object_id from buildings where owner_id not in (select id from characters) and owner_id not in (select guildid from guilds));
delete from item_properties where owner_id in (select distinct owner_id from buildings where owner_id not in (select id from characters) and owner_id not in (select guildid from guilds));
--delete from properties where object_id in (select distinct object_id from properties where name like '%Player%') and object_id not in (select id from characters) and object_id not in (select guildid from guilds);
delete from item_inventory where owner_id in (select distinct owner_id from buildings where owner_id not in (select id from characters) and owner_id not in (select guildid from guilds));
delete from buildings where owner_id not in (select id from characters) and owner_id not in (select guildid from guilds);
*/
VACUUM;
REINDEX;
ANALYZE;
pragma integrity_check;
.quit
