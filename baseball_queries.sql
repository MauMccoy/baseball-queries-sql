/* 
    The Best Of Baseball Awards project

    n this project, we will be looking at a massive baseball database to try to find some
    of the most notable achievements throughout baseball history .
*/

/* 
    Heaviest hitters
    -> This award goes to the team with the highest average weight of its batters on a given year.
*/
SELECT teams.name, AVG(people.weight) AS average_weight
FROM people
JOIN batting ON people.playerID = batting.playerID
JOIN teams ON batting.teamID = teams.teamID
GROUP BY teams.name
ORDER BY AVG(people.weight);

/* 
    Shortest Sluggers
    -> This award goes to the team with the smallest average height of its batters on a given year.
    This query should look very similar to the one you wrote to find the heaviest teams.
*/
SELECT teams.name, AVG(people.height) AS average_height
FROM people
JOIN batting ON people.playerID = batting.playerID
JOIN teams ON batting.teamID = teams.teamID
GROUP BY teams.name
ORDER BY (people.height);

/* 
    Biggest Spenders
    -> This award goes to the team with the largest total salary of all players in a given year.
*/
SELECT teams.name, salaries.yearID, SUM(salaries.salary) AS total_salary
FROM salaries
JOIN teams ON salaries.teamID = teams.teamID
GROUP BY teams.name, salaries.yearID
ORDER BY teams.name, salaries.yearID;

/* 
    Most Bang For Their Buck In 2010
    -> This should look very similar to your last query. 
    You'll still need to join the salaries and teams table. This time you want to divide the sum
    of the players salaries by the w column from the teams table. Because of this, you'll also
    need to add w to the GROUP BY clause. Finally, we added the round() function to the number
    we're reporting to make our output a little more readable.
*/
SELECT teams.name, salaries.yearID, ROUND(SUM(salaries.salary) / teams.w)  AS average_salary_per_w
FROM salaries
JOIN teams ON salaries.teamID = teams.teamID
GROUP BY teams.name, salaries.yearID, teams.w
ORDER BY teams.name, salaries.yearID;