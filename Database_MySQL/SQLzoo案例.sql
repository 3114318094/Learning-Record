-- 1
select population from world where name='Germany'

-- 2

-- 3
select name,population
from world
where name in ('Ireland','Iceland','Denmark')

-- 4
select name,area 
from world
where area between 200000 and 250000

-- 5
-- B为开头的国家
select name
from  world
where name like 'B%'

-- 14
-- 首都是国家名字的延伸

select name,capital
from world
where  capital  like concat(name,'_%')
