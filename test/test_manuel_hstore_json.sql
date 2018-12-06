--temp testjsonb

--update hstore direct

UPDATE "qgep_od"."vw_qgep_reach"
SET
"custom_data_hstore"=E'"id_topobase"=>"dfdf"'::hstore,
"custom_data_json"=E'"id_SIGE"=>"sige21"'::hstore
WHERE "obj_id"::text='ch13p7mzRE010334';


-- update field extracted from Hstore
select topobase_id   from "qgep_od"."vw_qgep_reach" WHERE "obj_id"::text='ch13p7mzRE010334';


UPDATE "qgep_od"."vw_qgep_reach" SET "topobase_id"='dfdf' WHERE "obj_id"::text='ch13p7mzRE010334';
q
select topobase_id   from "qgep_od"."vw_qgep_reach" WHERE "obj_id"::text='ch13p7mzRE010334';

-- INSERT
INSERT INTO "qgep_od"."vw_qgep_reach"("progression_geometry","obj_id","clear_height","material","ch_usage_current","ch_function_hierarchic","ws_status","ws_fk_owner","ch_function_hydraulic","width","coefficient_of_friction","elevation_determination","horizontal_positioning","inside_coating","length_effective","_slope_per_mill","reliner_material","reliner_nominal_size","relining_construction","relining_kind","ring_stiffness","slope_building_plan","wall_roughness","fk_pipe_profile","identifier","remark","last_modification","fk_dataowner","fk_provider","fk_wastewater_structure","custom_data_hstore","topobase_id","ch_bedding_encasement","ch_connection_type","ch_jetting_interval","ch_pipe_length","ch_usage_planned","ws_obj_id","ws_accessibility","ws_contract_section","ws_financing","ws_gross_costs","ws_identifier","ws_inspection_interval","ws_location_name","ws_records","ws_remark","ws_renovation_necessity","ws_replacement_value","ws_rv_base_year","ws_rv_construction_type","ws_structure_condition","ws_subsidies","ws_year_of_construction","ws_year_of_replacement","ws_fk_operator","rp_from_obj_id","rp_from_elevation_accuracy","rp_from_identifier","rp_from_level","rp_from_outlet_shape","rp_from_position_of_connection","rp_from_remark","rp_from_last_modification","rp_from_fk_dataowner","rp_from_fk_provider","rp_from_fk_wastewater_networkelement","rp_to_obj_id","rp_to_elevation_accuracy","rp_to_identifier","rp_to_level","rp_to_outlet_shape","rp_to_position_of_connection","rp_to_remark","rp_to_last_modification","rp_to_fk_dataowner","rp_to_fk_provider","rp_to_fk_wastewater_networkelement") 
VALUES (st_geomfromwkb('\x01f10300000100000001ea030000030000002cae853738fa4441ad7e5ffc2f4c33410000000000000000af1471b03cfa4441be0b4676244c33410000000000000000a91c26ee42fa444109d6e6fe214c3341000000000000f87f'::bytea,2056),'00000000RE017206',NULL,NULL,4514,5071,NULL,NULL,2546,NULL,NULL,NULL,NULL,250,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-06T00:00:00',NULL,NULL,'00000000CL017601',NULL,'455',NULL,186,NULL,NULL,4515,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'00000000RP034432',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'00000000RP034433',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL) 





