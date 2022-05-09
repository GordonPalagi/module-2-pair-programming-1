
-- select the park name and the total number of campgrounds for each park ordered by park name
SELECT p.name, COUNT (c.name) AS total_number_campground
FROM park AS p
JOIN campground AS c ON c.campground_id = p.park_id
GROUP by p.name
ORDER BY p.name;


-- select the park name, campground name, site number, max occupancy, accessible, max rv length, utilities where the campground name is 'Blackwoods'
SELECT p.name, c.name, s.site_number, s.max_occupancy,s.accessible, s.max_rv_length, s.utilities
FROM park AS p
JOIN campground AS c ON c.campground_id = p.park_id
JOIN site AS s ON s.site_id = c.campground_id
WHERE c.name = 'Blackwoods';


-- /*
--   -- select park name, campground, total number of sites (column alias 'number_of_sites') ordered by park
--   -------------------------------------------------

--     Acadia	Blackwoods	276
--     Acadia	Seawall	198
--     Acadia	Schoodic Woods	92
--     Arches	"Devil's Garden"	49
--     Arches	Canyon Wren Group Site	1
--     Arches	Juniper Group Site	1
--     Cuyahoga Valley	The Unnamed Primitive Campsites	5
--   -------------------------------------------------
-- */

SELECT p.name, c.name, COUNT (s.site_id) AS number_of_sites
FROM park AS p
JOIN campground AS c ON c.park_id = p.park_id
JOIN site AS s ON s.campground_id = c.campground_id
GROUP BY p.name, c.campground_id
ORDER BY p.name;

-- -- select site number, reservation name, reservation from and to date ordered by reservation from date

-- SELECT s.site_number, r.name, r.from_date, r.to_date
-- FROM site AS s
-- JOIN reservation AS r ON r.reservation_id = s.site_number
-- ORDER BY r.from_date ;


-- /*
--   -- select campground name, total number of reservations for each campground ordered by total reservations desc
--   -------------------------------------------------
--     Seawall	13
--     Blackwoods	9
--     "Devil's Garden"	7
--     Schoodic Woods	7
--     The Unnamed Primitive Campsites	5
--     Canyon Wren Group Site	4
--     Juniper Group Site	4
--   -------------------------------------------------
-- */


SELECT c.name, COUNT(r.reservation_id) AS total_number_of_reservations
FROM campground as c
JOIN site AS s ON s.campground_id = c.campground_id
JOIN reservation AS r ON r.site_id = s.site_id
GROUP BY c.name
ORDER BY total_number_of_reservations DESC;






