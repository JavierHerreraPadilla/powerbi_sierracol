
-- 5 oldest users
select * from users order by created_at limit 5;

-- most popular registration date
select dayname(created_at), count(created_at) as day_registered from users group by dayname(created_at) order by day_registered desc;
select monthname(created_at), count(created_at) as day_registered from users group by monthname(created_at) order by day_registered desc;

-- inactive users. users that have nerver posted photos
select username, image_url from users 
left join photos
on users.id = photos.user_id where photos.image_url is NULL;

select count(*) from users 
left join photos
on users.id = photos.user_id 
where image_url is NULL;

-- most liked photos
create view most_liked_photo as (
select  
users.username as photo_owner,
photos.id as photo_posted,
likes.user_id as user_who_liked
from photos
join likes on photos.id = likes.photo_id
join users on users.id = photos.user_id
);
select photo_owner, photo_posted, count(user_who_liked) as total from most_liked_photo  group by photo_posted order by total desc;

select username,
photos.id,
count(*) as total
from photos
join likes on likes.photo_id = photos.id
join users on users.id = photos.user_id
group by photos.id
order by total desc
;

-- how many times does the average user post
select avg(user_posts) from (
select users.id, username, count(photos.id)  as user_posts
from users 
left join photos on users.id = photos.user_id
group by username
) as posts_per_user;

select (select count(*) from photos) / (select count(*) from users);

-- top 5 most common hastags
select * from photo_tags;
select * from tags;
select tag_name, count(*) as most_pop
from photo_tags 
join tags on tags.id = photo_tags.tag_id
group by tag_name
order by most_pop desc;

-- detecting bots
select count(*) from photos;

-- user and the amounto of photos liked
select user_id, count(photo_id) as photos_liked from likes
group by user_id order by photos_liked desc;

select user_id, username, count(photo_id) as  photos_liked from likes 
join users on users.id = likes.user_id
group by user_id 
having photos_liked = (select count(*) from photos)
order by user_id desc
;


select * from comments;
select count(*) from comments; -- 7488
select distinct comment_text from comments;
select count(distinct comment_text) from comments; -- 7467

-- users with the most comments
select user_id, count(photo_id) as photos_commented from comments group by user_id order by photos_commented desc;

select user_id, count(photo_id) as photos_commented from comments group by user_id having photos_commented = (select count(*) from photos);

select user_id, count(photo_id) as photos_commented from comments group by user_id having photos_commented = (select count(*) from photos) 
order by user_id desc;

