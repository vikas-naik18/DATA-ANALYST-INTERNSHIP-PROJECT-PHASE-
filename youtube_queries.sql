create database youtube;
select * from youtube.youtube_data;
SELECT category_id,AVG(views) AS avg_views
FROM youtube.youtube_data
group by category_id
order by avg_views desc;
SELECT 
    channel_title,
    AVG((likes + comment_count) / views) AS avg_engagement
FROM youtube.youtube_data
GROUP BY channel_title
ORDER BY avg_engagement DESC
LIMIT 10;

SELECT title,COUNT(*) as total_videos 
FROM youtube.youtube_data
group by title;
