.open game_backup_1.db
delete from buildable_health where object_id in (select distinct object_id from buildings where object_id in (select distinct object_id from properties where name like '%Bedroll%' or name like '%CampFire%'));
delete from building_instances where object_id in (select distinct object_id from buildings where object_id in (select distinct object_id from properties where name like '%Bedroll%' or name like '%CampFire%'));
delete from actor_position where id in (select distinct object_id from buildings where object_id in (select distinct object_id from properties where name like '%Bedroll%' or name like '%CampFire%'));
delete from item_inventory where template_id in ('12001','10001');
delete from buildings where object_id in (select distinct object_id from properties where name like '%Bedroll%' or name like '%CampFire%');
delete from properties where name like '%Bedroll%' or name like '%CampFire%';
update character_stats set stat_value = '484.0' where stat_value='284.0' and stat_type = '0' and stat_id = '3';
DROP TRIGGER character_stats_bog_add_recipe_points;
DROP TRIGGER CREATE TRIGGER character_stats_bog_add_recipe_points_ins;
CREATE TRIGGER character_stats_bog_add_recipe_points_ins
AFTER INSERT
ON character_stats
FOR EACH ROW
BEGIN
UPDATE character_stats set stat_value = '484.0'
WHERE stat_value = '284.0'
AND stat_type = '0'
AND stat_id = '3';
END;
update characters set lastTimeOnline = '1489470357' where lastTimeOnline is NULL;
delete from buildable_health where object_id in (select distinct object_id from buildings where owner_id in (select id from characters where datetime(lastTimeOnline, 'unixepoch') < datetime('now','-30 days') and owner_id not in (select distinct guild from characters where datetime(lastTimeOnline, 'unixepoch') > datetime('now','-30 days') and guild is not null)));
delete from buildable_health where object_id in (select distinct object_id from buildings where owner_id in (select guildid from guilds where guildid not in (select distinct guild from characters where datetime(lastTimeOnline, 'unixepoch') > datetime('now','-30 days') and guild is not null)));
delete from building_instances where object_id in (select distinct object_id from buildings where owner_id in (select id from characters where datetime(lastTimeOnline, 'unixepoch') < datetime('now','-30 days') and owner_id not in (select distinct guild from characters where datetime(lastTimeOnline, 'unixepoch') > datetime('now','-30 days') and guild is not null)));
delete from building_instances where object_id in (select distinct object_id from buildings where owner_id in (select guildid from guilds where guildid not in (select distinct guild from characters where datetime(lastTimeOnline, 'unixepoch') > datetime('now','-30 days') and guild is not null)));
delete from properties where object_id in (select distinct object_id from buildings where owner_id in (select id from characters where datetime(lastTimeOnline, 'unixepoch') < datetime('now','-30 days') and owner_id not in (select distinct guild from characters where datetime(lastTimeOnline, 'unixepoch') > datetime('now','-30 days') and guild is not null)));
delete from properties where object_id in (select distinct object_id from buildings where owner_id in (select guildid from guilds where guildid not in (select distinct guild from characters where datetime(lastTimeOnline, 'unixepoch') > datetime('now','-30 days') and guild is not null)));
delete from actor_position where id in (select distinct object_id from buildings where owner_id in (select id from characters where datetime(lastTimeOnline, 'unixepoch') < datetime('now','-30 days') and owner_id not in (select distinct guild from characters where datetime(lastTimeOnline, 'unixepoch') > datetime('now','-30 days') and guild is not null)));
delete from actor_position where id in (select distinct object_id from buildings where owner_id in (select guildid from guilds where guildid not in (select distinct guild from characters where datetime(lastTimeOnline, 'unixepoch') > datetime('now','-30 days') and guild is not null)));
delete from buildings where owner_id in (select id from characters where datetime(lastTimeOnline, 'unixepoch') < datetime('now','-30 days') and guild is null);
delete from buildings where owner_id in (select guildid from guilds where guildid not in (select distinct guild from characters where datetime(lastTimeOnline, 'unixepoch') > datetime('now','-30 days') and guild is not null));
delete from item_properties where owner_id in (select id from characters where datetime(lastTimeOnline, 'unixepoch') < datetime('now','-30 days') and owner_id not in (select distinct guild from characters where datetime(lastTimeOnline, 'unixepoch') > datetime('now','-30 days') and guild is not null));
delete from item_properties where owner_id in (select guildid from guilds where guildid not in (select distinct guild from characters where datetime(lastTimeOnline, 'unixepoch') > datetime('now','-30 days') and guild is not null));
delete from item_inventory where owner_id in (select id from characters where datetime(lastTimeOnline, 'unixepoch') < datetime('now','-30 days') and owner_id not in (select distinct guild from characters where datetime(lastTimeOnline, 'unixepoch') > datetime('now','-30 days') and guild is not null));
delete from item_inventory where owner_id in (select guildid from guilds where guildid not in (select distinct guild from characters where datetime(lastTimeOnline, 'unixepoch') > datetime('now','-30 days') and guild is not null));
delete from actor_position where id in (select id from characters where datetime(lastTimeOnline, 'unixepoch') < datetime('now','-30 days') and guildid not in (select distinct guild from characters where datetime(lastTimeOnline, 'unixepoch') > datetime('now','-30 days') and guild is not null));
delete from actor_position where id in (select guildid from guilds where guildid not in (select distinct guild from characters where datetime(lastTimeOnline, 'unixepoch') > datetime('now','-30 days') and guild is not null));
delete from guilds where guildid not in (select distinct guild from characters where datetime(lastTimeOnline, 'unixepoch') > datetime('now','-30 days') and guild is not null);
delete from character_stats where char_id in (select id from characters where datetime(lastTimeOnline, 'unixepoch') < datetime('now','-30 days') and guild is null);
delete from character_stats where char_id in (select id from characters where datetime(lastTimeOnline, 'unixepoch') < datetime('now','-30 days') and guild not in (select distinct guild from characters where datetime(lastTimeOnline, 'unixepoch') > datetime('now','-30 days') and guild is not null));
delete from characters where id in (select id from characters where datetime(lastTimeOnline, 'unixepoch') < datetime('now','-30 days') and guild is null);
delete from characters where id in (select id from characters where datetime(lastTimeOnline, 'unixepoch') < datetime('now','-30 days') and guild not in (select distinct guild from characters where datetime(lastTimeOnline, 'unixepoch') > datetime('now','-30 days') and guild is not null));
delete from buildable_health where object_id in (select distinct object_id from buildings where owner_id not in (select id from characters) and owner_id not in (select guildid from guilds));
delete from building_instances where object_id in (select distinct object_id from buildings where owner_id not in (select id from characters) and owner_id not in (select guildid from guilds));
delete from properties where object_id in (select distinct object_id from buildings where owner_id not in (select id from characters) and owner_id not in (select guildid from guilds));
delete from actor_position where id in (select distinct object_id from buildings where owner_id not in (select id from characters) and owner_id not in (select guildid from guilds));
delete from item_properties where owner_id in (select distinct owner_id from buildings where owner_id not in (select id from characters) and owner_id not in (select guildid from guilds));
delete from properties where object_id in (select distinct object_id from properties where name like '%Player%') and object_id not in (select id from characters) and object_id not in (select guildid from guilds);
delete from item_inventory where owner_id in (select distinct owner_id from buildings where owner_id not in (select id from characters) and owner_id not in (select guildid from guilds));
delete from buildings where owner_id not in (select id from characters) and owner_id not in (select guildid from guilds);
insert into actor_position (class,map,id,x,y,z,sx,sy,sz,rx,ry,rz,rw) select 'BasePlayerChar_C', 'ConanSandbox', id, '-11875.3369140625','123886.0625', '-9016.935546875', '0.949999988079071', '0.949999988079071', '0.949999988079071', '1.87273170603776e-13', '1.7312404764977e-14', '0.092052161693573', '0.995754182338715' from characters where id in (select id from characters where id not in (select id from actor_position));
update actor_position set x='59939.539063', y='310979.625', z='-21411.023438' where x = '1.0' or x = '0.0' or z < '-99999.0';
VACUUM;
REINDEX;
ANALYZE;
pragma integrity_check;
--EXPORT REPORT outofbounds.csv SHOWING ALL STRUCTURES BUILT OUT OF MAXIMUM DIRECTIONAL VALUES FOR THE GREEN WALL. THIS CAN FIND ANY STRUCTURES FUTHRER OUT THAN A TRIP AROUND THE OUTSIDE WILL FIND.
CREATE TEMPORARY TABLE outofbounds AS
select g.name as guild_name, g.guildid as guild_id, c.char_name as char_name, c.id as char_id, ap.id as object_id, class as object, 'TeleportPlayer '||x||' '||y||' '||z as location, 'north' as direction from actor_position as ap left outer join buildings as b on ap.id = b.object_id left outer join characters as c on c.id = b.owner_id left outer join guilds as g on g.guildid = b.owner_id where y < '-19197.0'
UNION ALL
select g.name as guild_name, g.guildid as guild_id, c.char_name as char_name, c.id as char_id, ap.id as object_id, class as object, 'TeleportPlayer '||x||' '||y||' '||z as location, 'south' as direction from actor_position as ap left outer join buildings as b on ap.id = b.object_id left outer join characters as c on c.id = b.owner_id left outer join guilds as g on g.guildid = b.owner_id where y > '352550.0'
UNION ALL
select g.name as guild_name, g.guildid as guild_id, c.char_name as char_name, c.id as char_id, ap.id as object_id, class as object, 'TeleportPlayer '||x||' '||y||' '||z as location, 'west' as direction from actor_position as ap left outer join buildings as b on ap.id = b.object_id left outer join characters as c on c.id = b.owner_id left outer join guilds as g on g.guildid = b.owner_id where x < '-296876.0'
UNION ALL
select g.name as guild_name, g.guildid as guild_id, c.char_name as char_name, c.id as char_id, ap.id as object_id, class as object, 'TeleportPlayer '||x||' '||y||' '||z as location, 'east' as direction from actor_position as ap left outer join buildings as b on ap.id = b.object_id left outer join characters as c on c.id = b.owner_id left outer join guilds as g on g.guildid = b.owner_id where x > '158989.0' order by direction;;
.headers on
.mode csv
.once outofbounds.csv
SELECT * FROM outofbounds;
drop table outofbounds;
--EXPORT REPORT TO FIND ALL SINGLE FOUNDATION SPAM (just run the query from 'select' onward if using an editor that doesnt support the . commands)
.headers on
.mode csv
.once single_foundation_spam.csv
select ap.id, c.char_name, c.playerid, c.id, g.name, g.guildid, 'TeleportPlayer ' || ap.x || ' ' || ap.y || ' ' || ap.z from actor_position as ap inner join buildings as b on ap.id = b.object_id left outer join characters as c on c.id = b.owner_id left outer join guilds as g on g.guildid = b.owner_id inner join building_instances as bi on bi.object_id = b.object_id where bi.instance_id = '0' and bi.object_id not in (select object_id from building_instances where instance_id = '1') and ap.class like '%found%';
--EXPORT REPORT FIND ALL DOUBLE FOUNDATION SPAM (just run the query from 'select' onward if using an editor that doesnt support the . commands)
.headers on
.mode csv
.once double_foundation_spam.csv
select ap.id, c.char_name, c.playerid, c.id, g.name, g.guildid, 'TeleportPlayer ' || ap.x || ' ' || ap.y || ' ' || ap.z from actor_position as ap inner join buildings as b on ap.id = b.object_id left outer join characters as c on c.id = b.owner_id left outer join guilds as g on g.guildid = b.owner_id inner join building_instances as bi on bi.object_id = b.object_id where bi.instance_id = '1' and bi.object_id not in (select object_id from building_instances where instance_id = '2') and ap.class like '%found%';
--EXPORT ALL GUILDS AND PLAYERS
.headers on
.mode csv
.once guildplayers.csv
select quote(g.name) as GUILD, quote(g.guildid) as GUILDid, quote(c.char_name) as NAME, case c.rank WHEN '2' then 'Leader' WHEN '1' then 'Officer' WHEN '0' then 'Peon' ELSE c.rank END RANK, c.level as LEVEL, quote(c.playerid) as STEAMid, quote(c.id) as DBid, datetime(c.lastTimeOnline, 'unixepoch') as LASTONLINE from guilds g inner join characters c on g.guildid = c.guild order by g.name, c.rank desc, c.level desc, c.char_name;
.headers on
.mode csv
.once soloplayers.csv
select quote(char_name) as NAME, level as LEVEL, quote(playerID) as STEAMid, quote(id) as DBid, datetime(lastTimeOnline, 'unixepoch') as LASTONLINE from characters where id not in (select distinct c.id from guilds g inner join characters c on g.guildid = c.guild order by g.name, c.rank desc, c.level desc, c.char_name) order by char_name, level;
