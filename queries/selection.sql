/*
Select brands that covers the point
*/
SELECT * 
FROM brand_info 
JOIN area_by_brand ON (brand_info.id = area_by_brand.brand_id)
WHERE 
    ST_Contains(
        area_by_brand.area, 
        ST_SetSRID(ST_MakePoint(39.096144,-84.5211357),
        4326)
    );

/*
Selects the brand that covers the closest area to the given point (within a certain distance in meters)
*/
SELECT *
FROM brand_info 
JOIN area_by_brand ON (brand_info.id = area_by_brand.brand_id)
WHERE 
    ST_DWithin(area_by_brand.area, ST_SetSRID(ST_MakePoint(39.106598, -84.504546), 4326), 1000) -- 1000 is the distance in meters
ORDER BY 
    ST_Distance(area_by_brand.area, ST_SetSRID(ST_MakePoint(39.106598, -84.504546), 4326)) 
LIMIT 1;
