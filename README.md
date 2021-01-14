# Turing Backend Mod 2 Mid-Mod Assessment

This repository was a timed assessment in Turing's Mod 2. 

# Assessment Description
We are creating an application to track movies. We have studios, which have movies, and movies have several actors, and actors can be in several movies.
* Studios have a name and location
* Movies have a title, creation year, and genre
* Actors have a name and age

## User Stories
 
```
Story 1
Studio Index
 
As a user,
When I visit the studio index page
I see a list of all of the movie studios
And underneath each studio, I see the names of all of its movies.
```
 
```
Story 2
Movie Show
 
As a user,
When I visit a movie's show page.
I see the movie's title, creation year, and genre,
and a list of all its actors from youngest to oldest.
And I see the average age of all of the movie's actors
```
 
```
Story 3
Add an Actor to a Movie
 
As a user,
When I visit a movie show page,
I do not see any actors listed that are not part of the movie
And I see a form to add an actor to this movie
When I fill in the form with the name of an actor that exists in the database
And I click submit
Then I am redirected back to that movie's show page
And I see the actor's name is now listed
(You do not have to test for a sad path, for example if the name submitted is not an existing actor)
```
 
## Extension
 
```
Extension
Coactors
 
As a user,
When I visit an actor's show page
I see that actors name and age 
And I see a unique list of all of the actors this particular actor has worked with.
```

