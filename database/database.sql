CREATE DATABASE IF NOT EXISTS video_application;
USE video_application;

CREATE TABLE user(
    id          int(255) auto_increment not null,
    role        varchar(20),
    name        varchar(255),
    surname     varchar(255),
    email       varchar(255),
    password    varchar(255),
    image       varchar(255),
    created_at  datetime,
    
    CONSTRAINT pk_users PRIMARY KEY(id)
)ENGINE=InnoDb;

CREATE TABLE video(
    id          int(255) auto_increment not null,
    user_id     int(255),
    title       varchar(255),
    description text,
    status      varchar(20),
    image       varchar(255),
    video_path  varchar(255),
    created_at  datetime DEFAULT NULL,
    updated_at  datetime DEFAULT NULL,
    
    CONSTRAINT pk_videos PRIMARY KEY(id),
    CONSTRAINT fk_videos_users FOREIGN KEY(user_id) REFERENCES user(id)
)ENGINE=InnoDb;

CREATE TABLE comment(
    id          int(255) auto_increment not null,
    video_id    int(255) not null,
    user_id     int(255) not null,
    body        text,
    created_at  datetime DEFAULT NULL,
    updated_at  datetime DEFAULT NULL,
    
    CONSTRAINT pk_videos PRIMARY KEY(id),
    CONSTRAINT fk_comments_videos FOREIGN KEY(video_id) REFERENCES video(id),
    CONSTRAINT fk_comments_users FOREIGN KEY(user_id) REFERENCES user(id)
)ENGINE=InnoDb;