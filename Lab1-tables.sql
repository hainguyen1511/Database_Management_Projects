-- rchaney@pdx.edu
-- CS486/586
-- Fall 2023 CS486/586


drop schema if exists yelp_donut cascade;

create schema if not exists yelp_donut;

drop table if exists yelp_donut.donut_data;

create table if not exists yelp_donut.donut_data
(
	name				text not null
	, latitude			float
	, longitude			float
	, city				text null
	, county			text null
	, state				text null
	, country			text null
	, website			text null
	, rating			float null
	, review_count		int default 0
	, vegan_option		text null
	, price_indicator	text null
	, has_gluten_free	text null
	, liked_by_vegans	text null
);