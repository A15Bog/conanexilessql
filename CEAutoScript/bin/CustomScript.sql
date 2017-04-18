--REPLACE THE SCRIPTS BELOW WITH WHATEVER YOU WANT TO USE FOR A CUSTOM SCRIPT
--Leave the .quit at the end, regardless of what you add

--FIX PLAYERS THAT ARE EXILED
update actor_position set x='59939.539063', y='310979.625', z='-21411.023438' where x = '1.0' or x = '0.0' or z < '-99999.0' or z = '0.0';
insert into actor_position (class,map,id,x,y,z,sx,sy,sz,rx,ry,rz,rw) select 'BasePlayerChar_C', 'ConanSandbox', id, '-11875.3369140625','123886.0625', '-9016.935546875', '0.949999988079071', '0.949999988079071', '0.949999988079071', '1.87273170603776e-13', '1.7312404764977e-14', '0.092052161693573', '0.995754182338715' from characters where id in (select id from characters where id not in (select id from actor_position));
--MAINTENANCE
VACUUM;
REINDEX;
ANALYZE;
pragma integrity_check;
--EXPORT CSV OF ALL PLAYERS, GUILDS, LEADERS, CHARACTERS, LEVEL, RANK, LOCATION, LAST TIME ONLINE DATE
.headers on
.mode csv
.once allplayers.csv
select quote(g.name) as GUILD, quote(g.guildid) as GUILDid, quote(c.char_name) as NAME, case c.rank WHEN '2' then 'Leader' WHEN '1' then 'Officer' WHEN '0' then 'Peon' ELSE c.rank END RANK, c.level as LEVEL, quote(c.playerid) as STEAMid, quote(c.id) as DBid, 'TelportPlayer '||ap.x||' '||ap.y||' '||ap.x as LOCATION, datetime(c.lastTimeOnline, 'unixepoch') as LASTONLINE from characters as c left outer join guilds as g on g.guildid = c.guild left outer join actor_position as ap on ap.id = c.id order by g.name, c.rank desc, c.level desc, c.char_name;
.quit
