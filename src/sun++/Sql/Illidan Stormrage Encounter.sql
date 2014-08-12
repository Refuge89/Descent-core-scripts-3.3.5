#
# Removing data
#

DELETE FROM creature_names WHERE entry IN (30001, 22917, 22990, 23069, 23259, 23336, 30003, 30000, 22997, 23375, 23498, 23410, 23411, 22996, 30002, 23197, 23292, 23304, 23195);
DELETE FROM creature_proto WHERE entry IN (30001, 22917, 22990, 23069, 23259, 23336, 30003, 30000, 22997, 23375, 23498, 23410, 23411, 22996, 30002, 23197, 23292, 23304, 23195);
DELETE FROM creature_spawns WHERE entry IN (30001, 22990, 22917);
DELETE FROM gameobject_names WHERE entry IN (200000, 200001, 185916, 185905);
DELETE FROM gameobject_spawns WHERE entry IN (200000, 200001, 185916, 185905);
DELETE FROM npc_text WHERE entry IN (229901, 229902);


#
# Dumping data for table 'creature_names'
#

INSERT INTO `creature_names` (`entry`, `name`, `subname`, `info_str`, `Flags1`, `type`, `family`, `rank`, `unk4`, `spelldataid`, `male_displayid`, `female_displayid`, `male_displayid2`, `female_displayid2`, `unknown_float1`, `unknown_float2`, `civilian`, `leader`) VALUES
   ('23498','Parasitic Shadowfiend','','','0','3','0','0','0','0',19110,0,0,0,'0.5','1','0',0),
   ('23411','Spirit of Olum','','','8','7','0','0','0','0',21475,0,0,0,'1.3','1','0',0),
   ('23410','Spirit of Udalo','','','192','7','0','0','0','0',21476,0,0,0,'1.3','1','0',0),
   ('23375','Shadow Demon','','','96','3','0','1','0','0',21447,0,0,0,'3','1','0',0),
   ('23292','Cage Trap Trigger - 1','','','1024','10','0','0','0','0',16925,0,0,0,'1.35','1','0',0),
   ('22990','Akama','','','0','7','0','3','0','0',20681,0,0,0,'1','1','0',0),
   ('23197','Maiev Shadowsong','','','0','10','0','3','0','0',20628,0,0,0,'1','1','0',0),
   ('23259','Blaze','Blaze Effect','','0','0','0','0','0','0',15294,0,0,0,'1','1','0',0),
   ('23336','Flame Crash','Flame Crash Effect','','0','0','0','0','0','0',15294,0,0,0,'1','1','0',0),
   ('30000','Trigger','','','0','0','0','0','0','0',15294,0,0,0,'1','1','0',0),
   ('23069','Demon Fire',' ','','0','0','0','0','0','0',15294,0,0,0,'1','1','0',0),
   ('22996','Blade of Azzinoth','','','0','0','0','0','0','0',21431,0,0,0,'1','1','0',0),
   ('22997','Flame of Azzinoth','','','0','3','0','0','0','0',20431,0,0,0,'1','1','0',0),
   ('22917','Illidan Stormrage','The Betrayer','','0','3','0','3','0','0',21135,0,0,0,'2','1','0',1),
   ('30001','Door Event Trigger',' ','','0','0','0','0','0','0',15294,0,0,0,'1','1','0',0),
   ('30002','Face Trigger',' ','','0','0','0','0','0','0',15294,0,0,0,'1','1','0',0),
   ('30003','Illidan Stormrage',' ',' ','0','0','0','0','0','0',15294,0,0,0,'1','1','0',0),
   ('23304','Cage Trap Disturb Trigger',' ',' ','1024','10','0','0','0','0',15294,0,0,0,'1.35','1','0',0),
   ('23195','Illidan Demon Form','The Betrayer',' ','0','0','0','0','0','0',21322,0,0,0,'1','1','0',0);


#
# Dumping data for table 'creature_proto'
#

INSERT INTO `creature_proto` (`entry`, `minlevel`, `maxlevel`, `faction`, `minhealth`, `maxhealth`, `mana`, `scale`, `npcflags`, `attacktime`, `attacktype`, `mindamage`, `maxdamage`, `rangedattacktime`, `rangedmindamage`, `rangedmaxdamage`, `mountdisplayid`, `equipmodel1`, `equipinfo1`, `equipslot1`, `equipmodel2`, `equipinfo2`, `equipslot2`, `equipmodel3`, `equipinfo3`, `equipslot3`, `respawntime`, `armor`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `combat_reach`, `bounding_radius`, `auras`, `boss`, `money`, `invisibility_type`, `death_state`, `walk_speed`, `run_speed`, `fly_speed`, `extra_a9_flags`) VALUES
   ('23411','70','70','35','100000','100000','3155','1','0','1500',0,'300','400','0','0','0','0','0','0','0','0','0','0','0','0','0','0','6807','0','0','0','0','0','0','2','1','0','0',0,'0','0','2.5','8','14',0),
   ('23410','70','70','1820','9200','9200','3155','1','0','0',0,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','6807','0','0','0','0','0','0','1','0','','0',0,'0','0','2.5','8','14',0),
   ('30000','70','70','1825','100000','100000','0','1','0','0',0,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','1','0','0',0,'0','0','7','8','14',0),
   ('23069','70','70','1825','100000','100000','0','0.5','0','0',0,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','1','0','0',0,'0','0','2.5','8','14',0),
   ('23336','70','70','1825','6000','6000','6000','1','0','2000',0,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','1','0','0',0,'0','0','2.5','8','14',0),
   ('23259','70','70','1825','6000','6000','6000','0.5','0','2000',0,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','1','0','0',0,'0','0','2.5','8','14',0),
   ('23197','73','73','1867','27000','27000','3387','2','0','2000',0,'643','898','0','0','0','0','44850','33490690','781','0','0','0','20779','33492994','25','360000','0','0','0','0','0','0','0','2','1','','1',0,'0','0','2.5','8','14',0),
   ('22997','73','73','1825','1100000','1100000','0','1.3','0','2000',0,'650','1000','0','0','0','0','0','0','0','0','0','0','0','0','0','3600','0','0','0','0','0','0','0','2','3','','0',0,'0','0','2.5','8','14',0),('23292','70','70','35','100000','100000','0','0','0','0',0,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',' ','0',0,'0','0','2.5','8','14',0),
   ('23375','70','70','15','20000','20000','0','1','0','2000',0,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','1',' ','0',0,'0','0','2.5','4','14',0),
   ('22996','73','73','35','16000','16000','0','1','0','0',0,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',' ','1',0,'0','0','2.5','8','14',0),
   ('30003','70','70','15','100000','100000','0','1','0','0',0,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','1',' ','0',0,'0','0','2.5','8','14',0),
   ('22990','73','73','1858','480000','480000','338700','2','1','2000',0,'350','550','0','0','0','0','43903','33488898','781','43903','33488898','781','0','0','0','360000','0','0','0','0','0','0','0','1.3','1.3','','0',0,'0','0','2.5','8','14',0),
   ('30001','70','70','35','100000','100000','0','2','0','0',0,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','1','0','0',0,'0','0','2.5','8','14',0),
   ('22917','73','73','1825','5534309','5534309','6774','1','0','1400',0,'10000','14000','0','0','0','0','45150','33490690','269','45146','33490690','269','0','0','0','360000','8000','25','25','25','25','25','25','1.25','1','','1',0,'0','0','4','12','14',0),
   ('23498','70','70','1825','3500','3500','0','1','0','2000',0,'650','850','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','1',' ','0',0,'0','0','2.5','10','14',0),
   ('30002','70','70','14','100000','100000','0','1','0','0',0,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','1','0','0',0,'0','0','2.5','8','14',0),
   ('23304','70','70','35','100000','100000','0','1.05','0','0',0,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',' ','0',0,'0','0','2.5','8','14',0);


#
# Dumping data for table 'creature_spawns'
#

INSERT INTO `creature_spawns` (`entry`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `movetype`, `displayid`, `faction`, `flags`, `bytes`, `bytes2`, `emote_state`, `npc_respawn_link`, `channel_spell`, `channel_target_sqlid`, `channel_target_sqlid_creature`, `standstate`) VALUES
   (30001,564,'771.5','304.7','319','3.10568',0,'15294',35,0,0,0,0,0,0,0,0,0),
   (22990,564,'661.563','305.711','271.689','0.00628138',4,'20681',1858,256,0,1,0,0,0,0,0,0),
   (22917,564,'704.539','305.282','353.919','6.14417',0,'21135',1825,256,0,0,0,0,0,0,0,0);


#
# Dumping data for table 'gameobject_names'
#

INSERT INTO `gameobject_names` (`entry`, `Type`, `DisplayID`, `Name`, `spellfocus`, `sound1`, `sound2`, `sound3`, `sound4`, `sound5`, `sound6`, `sound7`, `sound8`, `sound9`, `unknown1`, `unknown2`, `unknown3`, `unknown4`, `unknown5`, `unknown6`, `unknown7`, `unknown8`, `unknown9`, `unknown10`, `unknown11`, `unknown12`, `unknown13`, `unknown14`) VALUES
   ('200000','0','7421','BT_ILLIDAN_DOOR_RIGHT','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
   ('200001','0','7422','BT_ILLIDAN_DOOR_LEFT','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
   ('185905','0','7388','Gate','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
   ('185916','1','1247','Cage Trap','0','0','0','1310720','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');


#
# Dumping data for table 'gameobject_spawns'
#

INSERT INTO `gameobject_spawns` (`Entry`, `map`, `position_x`, `position_y`, `position_z`, `Facing`, `orientation1`, `orientation2`, `orientation3`, `orientation4`, `State`, `Flags`, `Faction`, `Scale`, `stateNpcLink`) VALUES
   ('200000','564','745.07','241.802','354.292','0.79225','0','0','0.385846','0.922563','0','1','0','1','0'),
   ('185905','564','774.7','304.6','314.85','1.53','0','0','0.706767','0.707446','1','1','0','1','0'),
   ('200001','564','744.829','369.276','354.324','2.35855','0','0','0.92433','0.381594','0','1','0','1','0');


#
# Dumping data for table 'npc_text'
#

INSERT INTO npc_text
   (`entry`, `prob0`, `text0_0`, `text0_1`, `lang0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `prob1`, `text1_0`, `text1_1`, `lang1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `prob2`, `text2_0`, `text2_1`, `lang2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `prob3`, `text3_0`, `text3_1`, `lang3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `prob4`, `text4_0`, `text4_1`, `lang4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `prob5`, `text5_0`, `text5_1`, `lang5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `prob6`, `text6_0`, `text6_1`, `lang6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `prob7`, `text7_0`, `text7_1`, `lang7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`)
VALUES
   (229901, 1, 'The time has come to face Illidan, $N. Are you ready?', 'The time has come to face Illidan, $N. Are you ready?', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0);

INSERT INTO npc_text
   (`entry`, `prob0`, `text0_0`, `text0_1`, `lang0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `prob1`, `text1_0`, `text1_1`, `lang1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `prob2`, `text2_0`, `text2_1`, `lang2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `prob3`, `text3_0`, `text3_1`, `lang3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `prob4`, `text4_0`, `text4_1`, `lang4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `prob5`, `text5_0`, `text5_1`, `lang5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `prob6`, `text6_0`, `text6_1`, `lang6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `prob7`, `text7_0`, `text7_1`, `lang7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`)
VALUES
   (229902, 1, 'Be wary, friends. The Betrayer meditates in the court just beyond.', 'Be wary, friends. The Betrayer meditates in the court just beyond.', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0);










