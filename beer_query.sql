
# Find all beers with at least "d" distinct reviewers
# GOAL:  We want to choose an integer "d" such that we get back 
# no more than 10000 beers from this query

WITH x as (
SELECT beer_beerid as user, COUNT(DISTINCT review_profilename) as num_reviews
FROM beer_reviews
GROUP BY beer_beerid
HAVING COUNT(DISTINCT review_profilename) >= 69 # tweak this value experimentally
)
SELECT COUNT(*) FROM x;

# This was an exploratory query done to find the value of "d"