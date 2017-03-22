--IF YOU PREVIOUSLY USED BOG DECAY TOOL V1, YOU SHOULD RUN THIS TO REMOVE MY TIMESTAMP. V2 OF THIS TOOL NOW USES THE GAME'S IN GAME TIMESTAMP.

drop trigger characters_bog_time_modify;
PRAGMA foreign_keys=off;
BEGIN TRANSACTION;
ALTER TABLE characters RENAME TO temp_characters;
CREATE TABLE characters(playerId TEXT, id BIGINT NOT NULL, char_name TEXT NOT NULL, level INTEGER, rank INTEGER, guild BIGINT, isAlive BOOLEAN, killerName TEXT, lastTimeOnline INTEGER, FOREIGN KEY(guild) REFERENCES guilds(guildId));
INSERT INTO characters (playerId, id, char_name, level, rank, guild, isAlive, killerName, lastTimeOnline)
  SELECT playerId, id, char_name, level, rank, guild, isAlive, killerName, lastTimeOnline
  FROM temp_characters;
DROP TABLE temp_characters;
CREATE INDEX characters_idx ON characters(playerId);
COMMIT;
