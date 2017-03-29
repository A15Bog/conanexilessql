--FIX PLAYERS THAT ARE STUCK IN THE UPSIDE DOWN (EXILED OR STUCK AT LOADING SCREEN)
insert into actor_position (class,map,id,x,y,z,sx,sy,sz,rx,ry,rz,rw) select 'BasePlayerChar_C', 'ConanSandbox', id, '-11875.3369140625','123886.0625', '-9016.935546875', '0.949999988079071', '0.949999988079071', '0.949999988079071', '1.87273170603776e-13', '1.7312404764977e-14', '0.092052161693573', '0.995754182338715' from characters where id in (select id from characters where id not in (select id from actor_position));
update actor_position set x='59939.539063', y='310979.625', z='-21411.023438' where x = '1.0' or x = '0.0' or z < '-99999.0';
VACUUM;
REINDEX;
ANALYZE;
pragma integrity_check;
