# Campus Navigator

This is the group proejct

Updating this so that we can create a schema of whom is doing what:

So far I have added a few view controllers, but no meat to them. I am gonna put all our names here and we can add what we have done / are going to do.

I am creating a template, and if you have an idea of what you want to add to the project as your part, then just email me / us and we can figure it out.

So far Peter has used PLists for favourites (or so far they are just classrooms), but I think we should use a database to hold a list of "all' the classrooms (though I htink we will just have like 10 hardcoded in, as I'm and I assume you guys aren't going to go around getting classroom locations, lol).

Possibly another database, with a way to add events that are around campus (just for some more stuff to do).

Here is a list of all the stuff we HAVE to have from the requirments, and what we have so far:

At least 6 views (this one is easily covered)
At least six classes (Two each)
  - Gordon - I will use the table cell view, as well as Classroom customer class
  - Jun - ?
  - Peter - ?
  - Alex - ?

View Controllers: One will be made for each views, so easily covered as well

Data structures (See below)

NSArray, NSDictionary
  - I (gordon) will use an NSArray, populated from the DB when the program loads
  - NSDictionary, not sure so far

Properties and Synthezize
  -we will all use this stuff
  
IBOutlet & IBAction
  -Most views will use this as well
  
App Delegate
  -I (gordon) can use this for database reading / writing and populating my arrays
  
Memory Management
  -I think this is handled using ARC, but we will be using [[Object alloc] init]; as well
  
Tab bars, pickers, text boxes, and sliders
  - We've got a tab bar on the map page
  - Pickers, we will still need to implement one
  - Text boxes, lots of those
  - Sliders, need one as well
  - 

Each memeber must use a web view and a table view
  - Gordon, I've got mine in mind
  - Peter, has a table, not sure about web view
  - Jun, unknown
  - Alex, unknown

Each memeber must incorporate 1 tech not covered in class
  - Peter, the map kit
  - Gordon, I'm thinking of using sounds, or possibly a link to facebook / twitter, but will probably end up with sounds
  - Jun, ?
  - Alex, ?
  - 

Gordon
  - ?
  - 
  
Peter (so far)
  - MapViewController and supporting file
  - FavouritesViewController / supporting files
  - AddRoomToFavouritesViewController / supporting files
  - EditFavouritesClassroom / supporting files
  
Jun
  - ?
  - 
  
Alex
  - Home Screen View controller
  - 
  

Then it will just be commenting our code and saying who does what

As for the rest, we will have to figure it out. But I wanna get this DONE!
