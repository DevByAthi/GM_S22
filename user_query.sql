# Find all reviewers with at least "d" distinct reviews
# GOAL:  We want to choose an integer "d" such that we get back 
# no more than 10000 reviewers from this query


WITH x as (
SELECT review_profilename as user, COUNT(DISTINCT beer_beerid) as num_reviews
FROM beer_reviews
GROUP BY review_profilename
HAVING COUNT(DISTINCT beer_beerid) >= 69 # tweak this value experimentally
)
SELECT COUNT(*) FROM x;

# This was an exploratory query done to find the value of "d"