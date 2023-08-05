# Graph-generating query
# Run subqueries to find beers and reviews with a minimum number of reviews associated with them (see test queries in this folder)
# For a given review between a reviewer and beer, select the most recent review
# Store this most recent review inthe result set
# The result set lists the edges of the desired bipartite graph along  with the scores given in the review


WITH beer_list as (
    SELECT beer_beerid as beer_id, COUNT(DISTINCT review_profilename) as num_reviews
    FROM beer_reviews
    GROUP BY beer_beerid
    HAVING COUNT(DISTINCT review_profilename) >= 30
),
reviewer_list AS (
    SELECT review_profilename as user, COUNT(DISTINCT beer_beerid) as num_reviews
    FROM beer_reviews
    GROUP BY review_profilename
    HAVING COUNT(DISTINCT beer_beerid) >= 20
),
most_recent_fibres AS (
    SELECT rl.user, bl.beer_id, MAX(br.review_time) as most_recent_time
    FROM beer_reviews br JOIN reviewer_list rl ON br.review_profilename = rl.user
                         JOIN beer_list bl ON br.beer_beerid = bl.beer_id
    GROUP BY rl.user, bl.beer_id
)
SELECT mrf.user, mrf.beer_id, br.review_overall, br.review_aroma, br.review_appearance, br.review_palate, br.review_taste
FROM beer_reviews br JOIN most_recent_fibres mrf ON br.review_profilename = mrf.user
                                                 AND br.beer_beerid = mrf.beer_id
                                                 AND br.review_time = mrf.most_recent_time;