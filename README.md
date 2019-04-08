# README

**Were used on this API:**

Ruby: 2.5.3 

Rails: 5.2.3

DB: PostgreSQL


**To create a new Survivor**:

use POST method at localhost:3000/api/v1/survivors with the following json:

{

 	"name":"*Insert name here*",  
  
	"age":"*Insert Age here*",
	
	"gender":"*Insert gender here*",
	
	"last_location":"*Insert a location here(Format [+-]XX, [+-]XXX)*"
	
}

**To see all the Survivors:**

use GET method at localhost:3000/api/v1/survivors to see the list of survivors. Obs: They're ordenated alphabetically by their name.


**To update a Survivor location:**

use PUT method at localhost:3000/api/v1/survivors/<*id> to edit the location with the following json:

{

	"last_location":"*Insert a location here(Format [+-]XX, [+-]XXX)*"
	
}
  

**To see the percentage of survivors that are alive:**

use GET method at localhost:3000/api/v1/alive

**To change de amount of missing_count for a specific survivor**

use POST method at localhost:3000/api/v1/alive/ to add 1 to the missing_count for a respective ID. A id_user is the one that is accusing and the id_target is the id being accused of abduction. Attention: If a survivor missing_count goes to 3 or more, he will be abducted. use the Json as it follows:

{

	"id_user":"*insert a value here*"
	"id_target":"*insert a value here*"
	
}

**To see the percentage of survivors that are abducted**

use GET method at localhost:3000/api/v1/abducted to see the percentage of missing survivors.