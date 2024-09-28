# Date format gives year-month
select Date_format(trans_date, "%Y-%m") as month, country, count(id) as trans_count,
# Approved count using case when then else end
SUM(CASE WHEN state = "approved" THEN 1 ELSE 0 END) as approved_count,
# Total sum amount
SUM(amount) as trans_total_amount,
# Total sum amount that is approved
SUM(CASE WHEN state = "approved" THEN amount ELSE 0 END) as approved_total_amount
FROM Transactions
group by month, country