CREATE DATABASE ig_clone;
USE ig_clone;
-- users, photos, comments, likes, hashtags, followers followees
CREATE TABLE users 
(
 id int primary key auto_increment,
 username varchar(255) not null unique,
 created_at timestamp default now()
);

CREATE TABLE photos (
	id int primary key auto_increment,
    image_url varchar(500) not null,
    user_id int not null,
    photo_date timestamp default now(),
    foreign key (user_id) references users(id)
);

CREATE TABLE comments (
	id int primary key auto_increment,
    comm_text varchar(1000) not null,
    user_id int not null,
    photo_id int not null,
    comment_date timestamp default now(),
    foreign key (user_id) references users(id),
    foreign key (photo_id) references photos(id)
);

create table likes (
user_id int not null,
photo_id int not null,
like_date timestamp default now(),
foreign key (user_id) references users(id),
foreign key (photo_id) references photos(id), 
primary key (user_id, photo_id) -- this prevents the same user liking a photo more than once or: CONSTARINT unique_user_photo_like UNIQUE (user_id, photo_id)
);

create table follows (
	follower_id int not null,
    followee_id int not null,
    foreign key (follower_id) references users(id),
    foreign key (followee_id) references users(id),
    follow_date timestamp default now(),
    constraint no_auto_follow check (follower_id != followee_id), 
    constraint no_duplicated_follow  unique (follower_id, followee_id) 
);

create table tags (
	id int primary key auto_increment,
    tag_name varchar(100)
);

create table photo_tag (
	photo_id int,
    tag_id int, 
    foreign key (photo_id) references photos(id),
    foreign key (tag_id) references tags(id),
    constraint no_duplicate_tag_in_photo unique (photo_id, tag_id)
);

