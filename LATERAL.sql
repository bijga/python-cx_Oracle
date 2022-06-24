
https://docs.oracle.com/database/121/LADBI/usr_grps.htm#LADBI7654
with left_tab as
( 
select 1 x,'a' y from dual union 
select 2 x,'b' y from dual union 
select 3 x,'b' y from dual union 
select 4 x,'d' y from dual )
,
right_tab as
( 
select 1 x,'a' y from dual union 
select 5 x,'b' y from dual )
--select * from left_tab l    cross join lateral        ( select * from right_tab r where r.x=l.x )                    ; --- inner join 
--select * from left_tab l    cross   apply             ( select * from right_tab r where r.x=l.x /*and 1=2*/)         ; ---  inner join 
--select * from left_tab l    inner join lateral        ( select * from right_tab r where r.x=l.x ) r on  r.x=l.x      ; ---  inner join 
--select * from left_tab l    outer  apply              ( select * from right_tab r where r.x=l.x /*and 1=2*/)         ; --- left outer join
--select * from left_tab l    left join lateral         ( select * from right_tab r where r.x=l.x /*and 1=2*/) r on  r.x=l.x        ; ---  outer join
--select * from left_tab l    left outer join lateral   ( select * from right_tab r where r.x=l.x /*and 1=2*/) r on  r.x=l.x        ; ---  outer join
/*select * from left_tab l    right outer join lateral  ( select * from right_tab r where r.x=l.x  ) r on  r.x=l.x        ;
ORA-32798: impossible d'utiliser une jointure externe ANSI RIGHT ou FULL avec une corrélation gauche
*/
select * from left_tab l     , lateral  ( select * from right_tab r where r.x=l.x  )  --- inner join 
;
 
