CREATE INDEX planet_osm_polygon_building_index ON planet_osm_polygon USING btree (building);
CREATE INDEX planet_osm_point_amenity_idx ON planet_osm_point USING btree (amenity);
