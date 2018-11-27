# hexakomb-inteview-taxi24-api

To develop Taxi24 Api I used play 2.5.9 and MySQL as database.

Prerequisite to run this project:

>JDK 1.8 or later

>MySQL

>SBT build tool in order to run the 2.5.9 play framework

>Git as version control (Thi will help if you wish to clone this project)

Result displayed by using below API routes/

/Drivers			                  get list of all drivers

/Drivers/Available		          get list of all available drivers

/Drivers/:id			              get drivers by ID

/Drivers/: location		          get list of all drivers with 3km of a specific location by location name

/Drivers/ location /:id	        get list of all drivers with 3km of a specific location by location ID

/riders				                  get list of all riders

/riders/:id			                get rider by id

/trips/active			              get list of active trips

/ new /trip			                send new trip request

NB: You can find a sample backup script into public/db folder


Thanks to Hexakomb LTD.
