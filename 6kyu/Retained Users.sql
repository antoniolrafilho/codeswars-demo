-- You are a data analyst at a rapidly growing social media startup. Your team is interested in understanding user engagement and specifically wants to track monthly user retention. They define 'retained users' as users who logged in during a specific month, and also logged in the month immediately prior to that.

-- Your task is to write a SQL query that calculates the number of retained users per month from a given logins table, which has the following columns:

-- user_id (integer): An identifier for the user. Each user has a unique user_id.
-- date (date): The date on which the user logged in.
-- The SQL query should return a result with two columns:

-- month (string): The timestamp for the given month, formatted as 'FMMonth, YYYY'. For example, 'July, 2023'.
-- retained_users (integer): The number of retained users for the given month.
-- The results should be sorted by the month in ascending chronological order.

-- Notes:

-- multiple logins per month for a user are possible;
-- it is possible for users to potentially "skip" a month (or more) before logging in again.
-- GLHF!

-- Desired Output
-- The desired output should look like this:

-- month	retained_users
-- February, 2023	16
-- March, 2023	15
-- April, 2023	17

SELECT
    month,
    retained_users
FROM
    (
        SELECT
            TO_CHAR(DATE_TRUNC('month', l1.date), 'FMMonth, YYYY') AS month,
            COUNT(DISTINCT l1.user_id) AS retained_users
        FROM
            logins l1
        JOIN
            logins l2 ON l1.user_id = l2.user_id
                     AND DATE_TRUNC('month', l1.date) = DATE_TRUNC('month', l2.date + INTERVAL '1 month')
        GROUP BY
            month
    ) AS subquery
ORDER BY
    TO_DATE(month, 'FMMonth, YYYY');