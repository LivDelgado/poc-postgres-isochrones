/*
Information table
*/
CREATE TABLE brand_info (
  id integer PRIMARY KEY,
  name varchar UNIQUE NOT NULL
);

/* 
Geometries table
*/
CREATE TABLE area_by_brand (
  id integer,
  brand_id integer REFERENCES brand_info (id),
  area geometry,
  PRIMARY KEY (id, brand_id)
);

ALTER TABLE area_by_brand
  ALTER COLUMN area
  TYPE Geometry(Polygon, 4326)
  USING ST_SetSRID(area, 4326)
