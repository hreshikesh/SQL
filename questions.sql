questions on filtering and agregate

1. find total no of people on table

select count(*) from human_info;

2.Find the oldest person’s age and the youngest person’s age.
select human_name as name,age as Age from human_info order by age asc limit 1;
select human_name as name,age as Age from human_info order by age desc limit 1;

3.Calculate the average age of all people.
select avg(age) as Avg_age from human_info;

4.Count how many unique places are in the table.
select count(Distinct place) as unique_place ,place from human_info
group by place;

5.Show the number of people from each place.
select place,count(*) as no_of_people from human_info
group by place;

6.Show the average age for each place.
select place,avg(age) from human_info group by place;

7.Find the place with the highest number of people.
select place,count(*) as count from human_info
group by place 
order by count desc;

8.Find the minimum and maximum age for each place.
select place,min(age) as minimum,max(age) as maximum from human_info
group by place;

9.Find all places that have more than 1 people.

select place from human_info
group by place having count(*)>1;

10.Find places where the average age is above 30.
select place,avg(age) from human_info
group by place having avg(age)>30;

11.Show all (place, age) combinations where there are at least 2 people.
select place,age from human_info 
group by place,age having count(*)>=2;

12.Show all places,age where the youngest person is at least 25 years old.
select place,age from human_info
group by age having min(age)>=25
order by place asc;

13.Find the top 2 places with the highest average age.
select place,avg(age) as avg from human_info
group by place 
order by avg desc limit 2;

14.Find the top 3 most common ages in the entire table.
select age,count(*) as count from human_info
group by age 
order by count desc limit 3;  

15.Show the count of people in each place, sorted by count in descending order.
select place,count(*) as count  from human_info 
group by place
order by count desc;








