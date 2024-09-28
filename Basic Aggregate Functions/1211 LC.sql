Select query_name, 
    # Rating/Position gives individual values which are then summed up and rounded to 2 decimals
    ROUND(SUM(rating/position)/Count(query_name), 2) as quality,
    # AVG value of rating id if less than 3 then assign 1 else 0 and multiply by 100, rounded to 2 decimals
    ROUND(AVG(CASE WHEN rating < 3 THEN 1 ELSE 0 END)*100, 2) as poor_query_percentage
    # query_name is not null is to handle any null values
FROM Queries where query_name is not null
# Values grouped by or separated by query_name
Group by query_name;
