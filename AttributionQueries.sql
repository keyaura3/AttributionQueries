WITH last_touch AS (
    SELECT user_id,
        max(timestamp) as last_touch_at
    FROM page_visits
    where page_name = '4 - purchase'
    GROUP BY user_id)
SELECT lt.user_id,
    lt.last_touch_at,
    pv.utm_source,
    pv.utm_campaign,
    count(utm_campaign)
FROM last_touch lt
JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
group by utm_campaign
order by 5 desc;

select count(distinct user_id)
from page_visits 
where page_name = '4 - purchase';