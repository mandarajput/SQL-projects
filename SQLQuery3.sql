select * from artist$
select * from canvas_size$
select * from image_link$
select * from museum$
select * from museum_hours$
select * from product_size$
select * from subject$
select * from work$

/* To find duplicates in artist$ table*/
select artist_id, full_name,nationality,style, count(*)
from artist$
group by artist_id, full_name,nationality,style
having count(*)>1

/* NO. paintings where sale price is equal to regular price */
select count(work_id) as No_painting
from product_size$
where sale_price = regular_price

/*which 3 canva size cost most*/
select top (3) size_id, regular_price
 from product_size$
 group by size_id, regular_price
 order by regular_price desc
 
 /* Top 10 most famous painting subject*/
 select top(10) subject
  from subject$
  group by subject

 /* Identify museums which are open on both Sunday and Monday*/
 select museum_id
 from museum_hours$ mh1
  where day= 'sunday'
  and exists (select museum_id from museum_hours$ as MH2
               where MH2.museum_id=mh1.museum_id
                and MH2.day='monday')
				
				
/*Identify museums ( names  ,city,country)which are open on both Sunday and Monday*/
 select name, city, country 
 from museum_hours$ m1
 join museum$ m0 on m1.museum_id=m0.museum_id
 where day='sunday'
  and exists (select 1 from museum_hours$ m2
               where m2.museum_id=m1.museum_id
			   and m2.day='monday')


/* top 5 most popular artists ( based on No. of paintings)*/

select top (5) artist_id, count(*) as number_of_paintings
 from work$
group by artist_id
order by number_of_paintings desc


