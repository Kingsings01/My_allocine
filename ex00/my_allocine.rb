requests['Display all actors'] = 
"SELECT * 
FROM actors;"

requests['Display all genres'] = 
"SELECT * 
FROM genres;"

requests['Display the name and year of the movies'] =
"SELECT mov_title, mov_year 
FROM movies;"

requests['Display reviewer name from the reviews table'] = 
"SELECT rev_name 
FROM reviews;"

requests["Find the year when the movie American Beauty released"] = 
"SELECT mov_year 
FROM movies 
WHERE mov_title = 'American Beauty';"

requests["Find the movie which was released in the year 1999"] = 
"SELECT mov_title 
FROM movies 
WHERE mov_year = '1999';"

requests["Find the movie which was released before 1998"] = 
"SELECT mov_title 
FROM movies 
WHERE mov_year < '1998';"

requests["Find the name of all reviewers who have rated 7 or more stars to their rating order by reviews rev_name (it might have duplicated names :-))"] = 
"SELECT rev_name 
FROM reviews 
INNER JOIN movies_ratings_reviews ON reviews.id = movies_ratings_reviews.rev_id 
WHERE rev_stars >= 7 
ORDER BY rev_name;"
#This query uses an inner join to join the 'reviews' table with the 'movies_ratings_reviews' table on the 'id' and 'rev_id' columns, respectively. It then filters the results to only include ratings that are 7 or greater, and finally orders the results by the reviewer's name.

requests["Find the titles of the movies with ID 905, 907, 917"] =
"SELECT mov_title
FROM movies
WHERE id IN (905, 907, 917);"
#This query uses the IN operator to match the id column of the movies table against a list of values (905, 907, 917) and returns the corresponding movie titles.

requests["Find the list of those movies with year and ID which include the words Boogie Nights"] = 
"SELECT id, mov_title, mov_year
FROM movies
WHERE mov_title LIKE '%Boogie Nights%';"
#This query uses the LIKE operator with the wildcard % symbol to match any movie title that includes the string "Boogie Nights" anywhere in the title.

requests["Find the ID number for the actor whose first name is 'Woody' and the last name is 'Allen'"] = 
"SELECT id
FROM actors
WHERE act_fname = 'Woody' AND act_lname = 'Allen';"

requests["Find the actors with all information who played a role in the movies 'Annie Hall'"] = 
"SELECT actors.*
FROM actors
JOIN movies_actors ON actors.id = movies_actors.act_id
JOIN movies ON movies_actors.mov_id = movies.id
WHERE movies.mov_title = 'Annie Hall';"

requests["Find the first and last names of all the actors who were cast in the movies 'Annie Hall', and the roles they played in that production"] = 
"SELECT act_fname, actors.act_lname, role
FROM actors
JOIN movies_actors ON actors.id = movies_actors.act_id 
JOIN movies ON movies.id = movies_actors.mov_id
WHERE mov_title = 'Annie Hall';"

requests["Find the name of movie and director who directed a movies that casted a role as Sean Maguire"] =
"SELECT directors.dir_fname, directors.dir_lname, movies.mov_title
FROM directors
INNER JOIN directors_movies ON directors.id = directors_movies.dir_id 
INNER JOIN movies ON directors_movies.mov_id = movies.id
INNER JOIN movies_actors ON movies.id = movies_actors.mov_id
WHERE movies_actors.role = 'Sean Maguire';"

requests["Find all the actors who have not acted in any movie between 1990 and 2000 (select only actor first name, last name, movie title and release year)"] =
"SELECT DISTINCT act_fname, act_lname, mov_title, mov_year
FROM actors
JOIN movies_actors ON actors.id = movies_actors.act_id
JOIN movies ON movies_actors.mov_id = movies.id
WHERE mov_year NOT BETWEEN 1990 AND 2000;"


# "SELECT act_fname, act_lname, mov_title, mov_year
# FROM movies, actors, movies_actors 
# WHERE movies_actors.mov_id = movies.id AND movies_actors.act_id = actors.id AND mov_year NOT BETEEN 1990 AND 2000;"


# "SELECT actors.act_fname, actors.act_lname, movies.mov_title, movies.mov_year 
# FROM actors
# INNER JOIN movies_actors ON actors.id = movies_actors.act_id
# INNER JOIN movies ON movies_actors.mov_id = movies.id
# WHERE actors.id NOT IN (
#     SELECT act_id
#     FROM movies_actors
#     INNER JOIN movies ON movies_actors.mov_id = movies.id
#     WHERE mov_year BETWEEN 1990 AND 2000
# );"
