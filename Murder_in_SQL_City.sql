	-- Generate the list of table
	SELECT name 
  	FROM sqlite_master
 	where type = 'table';
 
 	/* 
	Querying the table to view which city, date and type of the crime commited
	*/
	SELECT*
	FROM crime_scene_report
	WHERE city = 'SQL City' AND date = '20180115' AND type = 'murder';
	
	--Generating the first witness with address_street_name '%Northwestern Dr%'
	 SELECT *
 	FROM person
 	WHERE address_street_name LIKE "%Northwestern Dr%"
 	ORDER BY address_number DESC
 	LIMIT 1;
	
	--Generating of second witness, whose name is annabel and stays on Franklin Ave
 	SELECT *
 	FROM person
 	WHERE name LIKE "%Annabel%" 
 	AND address_street_name = "Franklin Ave";
	
	--Generating the interview session from the 1st and 2nd witnesses. 
 	SELECT *
 	FROM Person p
 	Left Join interview i
	ON p.id = i.person_id
 	WHERE p.id IN ("14887", "16371")
 	LIMIT 10;
	
	/*
	Generation of members with membership id starting with '48z', 
	check in date of 9 January and gold status
	*/
 	SELECT gi.membership_id, gi.check_in_date, gm.name, gm.membership_status
	FROM get_fit_now_check_in gi
 	LEFT JOIN get_fit_now_member gm
 	ON gi.membership_id = gm.id
 	WHERE gi.membership_id LIKE '48Z%' AND gi.check_in_date LIKE '%0109'
 	LIMIT 10;
	
	--Generation of plate number and gender. 
 	SELECT *
 	FROM drivers_license
 	WHERE plate_number LIKE '%H42W%' AND gender = "male";
	
	--Generating the transcript of the 2 suspect
	SELECT *
 	FROM person p
 	JOIN interview i
 	ON p.id = i.person_id
 	WHERE name IN ('Joe Germuska','Jeremy Bowers');
 
 	--Confirmation of the Alleged murderer
	INSERT INTO solution VALUES (1, 'Jeremy Bowers');
        
        SELECT value FROM solution;
	
	-- Jeremy Bowers is the killer of the victim.
	
	--Generation of event in december 2017 and person id who attended over 3 times.
	SELECT DISTINCT person_id, COUNT(person_id) AS attended
	FROM facebook_event_checkin
	WHERE date LIKE '201712%' AND event_name LIKE '%SQL SYMPHONY%'
	GROUP BY person_id
	ORDER BY attended DESC
	LIMIT 2;
	
	--Generating of prescription from the suspect interview to 
	--match the villian behind the crime. 
	SELECT *
	FROM drivers_license
	WHERE gender = "female" 
	AND car_make LIKE 'Tesla%' 
	AND car_model LIKE '%Model s%'
	AND hair_color = "red"
	AND id LIKE '%202298%'
	LIMIT 10;
	
	--Generating the real villian behind the crime.
	SELECT p.id, p.name, dl.id
	FROM person p
	JOIN drivers_license dl
	ON P.license_id = dl.id
	WHERE dl.id LIKE '%202298%';
	
	--This shows MIRANDA PRIESTLY is the rreal villian that sponsor 
	--JEREMY BOWERS TO MURDER THE VICTIM 