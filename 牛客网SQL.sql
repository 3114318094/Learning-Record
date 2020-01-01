----- 时间：2019年4月25日

-- 题目：
-- --1.查找最晚入职员工的所有信息
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));

--solution：

select * 
from employees
order by hire_date desc
limit 0,1;

--2.查找入职员工时间排名倒数第三的员工所有信息
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));

--solution：

select * from employees
order by hire_date desc
limit 2,1;

-- limit 1 offset 3

--3.查找各个部门当前(to_date='9999-01-01')领导当前薪水详情以及其对应部门编号dept_no
CREATE TABLE `dept_manager` (
`dept_no` char(4) NOT NULL,
`emp_no` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));


CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));

--solution：

select s.*,d.dept_no 
from salaries s,dept_manager d
where s.emp_no=d.emp_no
and s.to_date='9999-01-01'
and d.to_date='9999-01-01';

-- 2:
select s.*,d.dept_no
from salaries s join dept_manager d
on s.emp_no=d.emp_no
where s.to_date='9999-01-01'and d.to_date='9999-01-01';



--4.查找所有已经分配部门的员工的last_name和first_name
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));


CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));

--solution：

select e.last_name,e.first_name,d.dept_no 
from employees e inner join dept_emp d
on e.emp_no=d.emp_no;

--5.查找所有员工的last_name和first_name以及对应部门编号dept_no，也包括展示没有分配具体部门的员工
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));


CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));

--solution：

select e.last_name,e.first_name,d.dept_no 
from employees e left join dept_emp d
on e.emp_no=d.emp_no;

--6.查找所有员工入职时候的薪水情况，给出emp_no以及salary， 并按照emp_no进行逆序
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));


CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));

--solution：

select e.emp_no,s.salary 
from employees e,salaries s
where e.emp_no=s.emp_no and e.hire_date=s.from_date
order by e.emp_no desc;

--7.查找薪水涨幅超过15次的员工号emp_no以及其对应的涨幅次数t
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));

--solution：

select emp_no,count(emp_no) as t
from salaries
group by emp_no
having t>15;

--8.找出所有员工当前(to_date='9999-01-01')具体的薪水salary情况，对于相同的薪水只显示一次,并按照逆序显示
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));

--solution：

select distinct salary from salaries 
where to_date='9999-01-01'
order by salary desc;

--9.获取所有部门当前manager的当前薪水情况，给出dept_no, emp_no以及salary，当前表示to_date='9999-01-01'
CREATE TABLE `dept_manager` (
`dept_no` char(4) NOT NULL,
`emp_no` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));


CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));

--solution：

select d.dept_no,d.emp_no,s.salary 
from dept_manager d,salaries s
on d.emp_no=s.emp_no
where d.to_date='9999-01-01'
and s.to_date='9999-01-01';

--10.获取所有非manager的员工emp_no
CREATE TABLE `dept_manager` (
`dept_no` char(4) NOT NULL,
`emp_no` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));


CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));

--solution：

select e.emp_no 
from employees e
where e.emp_no not in(
    select dept_manager.emp_no from dept_manager);

--11.获取所有员工当前的manager，如果当前的manager是自己的话结果不显示，当前表示to_date='9999-01-01'。
结果第一列给出当前员工的emp_no,第二列给出其manager对应的manager_no。
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));


CREATE TABLE `dept_manager` (
`dept_no` char(4) NOT NULL,
`emp_no` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));

--solution：

select e.emp_no,m.emp_no as manager_no
from dept_emp e,dept_manager m
where e.to_date='9999-01-01' 
and m.to_date='9999-01-01' 
and e.dept_no=m.dept_no 
and e.emp_no !=m.emp_no ;

--12.获取所有部门中当前员工薪水最高的相关信息，给出dept_no, emp_no以及其对应的salary
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));


CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));

--solution：

select d.dept_no,d.emp_no,max(s.salary)
from dept_emp d,salaries s
where d.emp_no=s.emp_no
and d.to_date=s.to_date
group by d.dept_no;

--13.从titles表获取按照title进行分组，每组个数大于等于2，给出title以及对应的数目t。
CREATE TABLE IF NOT EXISTS "titles" (
`emp_no` int(11) NOT NULL,
`title` varchar(50) NOT NULL,
`from_date` date NOT NULL,
`to_date` date DEFAULT NULL);

--solution：

select title,count(title) as t
from titles
group by title
having count(title)>=2;

--14.从titles表获取按照title进行分组，每组个数大于等于2，给出title以及对应的数目t。
注意对于重复的emp_no进行忽略。
CREATE TABLE IF NOT EXISTS "titles" (
`emp_no` int(11) NOT NULL,
`title` varchar(50) NOT NULL,
`from_date` date NOT NULL,
`to_date` date DEFAULT NULL);

--solution：

select title,count(distinct emp_no) as t
from titles 
group by title
having count(title)>=2;

--15.查找employees表所有emp_no为奇数，且last_name不为Mary的员工信息，并按照hire_date逆序排列
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));

--solution：

select *from employees
where emp_no%2!=0
and last_name is not 'Mary'
order by hire_date desc;

--16.统计出当前各个title类型对应的员工当前薪水对应的平均工资。结果给出title以及平均工资avg。
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));


CREATE TABLE IF NOT EXISTS "titles" (
`emp_no` int(11) NOT NULL,
`title` varchar(50) NOT NULL,
`from_date` date NOT NULL,
`to_date` date DEFAULT NULL);

--solution：

SELECT title , AVG(salary) AS avg
FROM salaries s,titles t
WHERE s.emp_no = t.emp_no 
AND s.to_date = '9999-01-01' 
AND t.to_date = '9999-01-01'
GROUP BY t.title;

注：我不是很懂为什么日期要为9999-01-01，我觉得这是没必要的，估计和牛客网内部有关

--17.获取当前（to_date='9999-01-01'）薪水第二多的员工的emp_no以及其对应的薪水salary
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));

--solution：

select emp_no,salary
from salaries
where to_date='9999-01-01'
order by salary desc
limit 1,1;

--18.查找当前薪水(to_date='9999-01-01')排名第二多的员工编号emp_no、薪水salary、last_name以及first_name，不准使用order by
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));


CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));

--solution：

select e.emp_no, s.salary, e.last_name, e.first_name 
from employees e, salaries s
where s.to_date = "9999-01-01"
and e.emp_no = s.emp_no
and s.salary = (select max(salary) 
              from salaries where to_date = "9999-01-01"
              and salary != (select max(salary) 
                             from salaries where to_date = "9999-01-01"));

--19.查找所有员工的last_name和first_name以及对应的dept_name，也包括暂时没有分配部门的员工
CREATE TABLE `departments` (
`dept_no` char(4) NOT NULL,
`dept_name` varchar(40) NOT NULL,
PRIMARY KEY (`dept_no`));


CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));


CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));

--solution：

select e.last_name,e.first_name,d.dept_name
from employees e
left join dept_emp de
on e.emp_no=de.emp_no 
left join departments d
on de.dept_no=d.dept_no;

--20.查找员工编号emp_no为10001其自入职以来的薪水salary涨幅值growth
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));

--solution：

select 
(select salary from salaries
where emp_no='10001'
order by salary desc
limit 0,1)-
(select salary from salaries
 where emp_no='10001'
 order by salary 
 limit 0,1
) as growth;