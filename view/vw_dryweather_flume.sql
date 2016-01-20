DROP VIEW IF EXISTS qgep.vw_dryweather_flume;


--------
-- Subclass: od_dryweather_flume
-- Superclass: od_structure_part
--------
CREATE OR REPLACE VIEW qgep.vw_dryweather_flume AS

SELECT
   DF.obj_id
   , DF.material
   , SP.identifier
   , SP.remark
   , SP.renovation_demand
   , SP.fk_dataowner
   , SP.fk_provider
   , SP.last_modification
  , SP.fk_wastewater_structure
  FROM qgep.od_dryweather_flume DF
 LEFT JOIN qgep.od_structure_part SP
 ON SP.obj_id = DF.obj_id;

-----------------------------------
-- dryweather_flume INSERT
-- Function: vw_dryweather_flume_insert()
-----------------------------------

CREATE OR REPLACE FUNCTION qgep.vw_dryweather_flume_insert()
  RETURNS trigger AS
$BODY$
BEGIN
  INSERT INTO qgep.od_structure_part (
             obj_id
           , identifier
           , remark
           , renovation_demand
           , fk_dataowner
           , fk_provider
           , last_modification
           , fk_wastewater_structure
           )
     VALUES ( COALESCE(NEW.obj_id,qgep.generate_oid('od_dryweather_flume')) -- obj_id
           , NEW.identifier
           , NEW.remark
           , NEW.renovation_demand
           , NEW.fk_dataowner
           , NEW.fk_provider
           , NEW.last_modification
           , NEW.fk_wastewater_structure
           )
           RETURNING obj_id INTO NEW.obj_id;

INSERT INTO qgep.od_dryweather_flume (
             obj_id
           , material
           )
          VALUES (
            NEW.obj_id -- obj_id
           , NEW.material
           );
  RETURN NEW;
END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- DROP TRIGGER vw_dryweather_flume_ON_INSERT ON qgep.dryweather_flume;

CREATE TRIGGER vw_dryweather_flume_ON_INSERT INSTEAD OF INSERT ON qgep.vw_dryweather_flume
  FOR EACH ROW EXECUTE PROCEDURE qgep.vw_dryweather_flume_insert();

-----------------------------------
-- dryweather_flume UPDATE
-- Rule: vw_dryweather_flume_ON_UPDATE()
-----------------------------------

CREATE OR REPLACE RULE vw_dryweather_flume_ON_UPDATE AS ON UPDATE TO qgep.vw_dryweather_flume DO INSTEAD (
UPDATE qgep.od_dryweather_flume
  SET
       material = NEW.material
  WHERE obj_id = OLD.obj_id;

UPDATE qgep.od_structure_part
  SET
       identifier = NEW.identifier
     , remark = NEW.remark
     , renovation_demand = NEW.renovation_demand
           , fk_dataowner = NEW.fk_dataowner
           , fk_provider = NEW.fk_provider
           , last_modification = NEW.last_modification
     , fk_wastewater_structure = NEW.fk_wastewater_structure
  WHERE obj_id = OLD.obj_id;
);

-----------------------------------
-- dryweather_flume DELETE
-- Rule: vw_dryweather_flume_ON_DELETE ()
-----------------------------------

CREATE OR REPLACE RULE vw_dryweather_flume_ON_DELETE AS ON DELETE TO qgep.vw_dryweather_flume DO INSTEAD (
  DELETE FROM qgep.od_dryweather_flume WHERE obj_id = OLD.obj_id;
  DELETE FROM qgep.od_structure_part WHERE obj_id = OLD.obj_id;
);

