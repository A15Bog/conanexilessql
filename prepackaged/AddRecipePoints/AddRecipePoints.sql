--ADDS 200 POINTS AVAILABLE TO RECIPES AFTER HITTING LEVEL 50. FIRST STATEMENT ALTERS EXISINGT LEVEL 50's.
update character_stats set stat_value = '554.0' where stat_value >= '354.0' and stat_type = '0' and stat_id = '3';
DROP TRIGGER character_stats_bog_add_recipe_points_ins;
CREATE TRIGGER character_stats_bog_add_recipe_points_ins
AFTER INSERT
ON character_stats
FOR EACH ROW
BEGIN
UPDATE character_stats set stat_value = '554.0'
WHERE stat_value >= '354.0'
AND stat_type = '0'
AND stat_id = '3';
END;
