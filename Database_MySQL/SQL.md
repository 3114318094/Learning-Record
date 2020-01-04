# SQL 学习笔记

[TOC]

## 基本概念

关系型数据库/数据/表 table
数据类型 DataType
primery Key/Foreign Key
事务处理、触发器

## 命令行模式

```SQL
    SHOW　databases;

```

## SQL 语法要点

1. 语句顺序
2. **_NULL（novalue)_** 与字段包含 0/空字符串/仅仅包含空格是**不同的**
3. 使用日期或者时间时使用函数 Date()|Time().
4. GROUP BY 和 ORDER BY 应当同时使用，保持数据正确排序。
5. select 做嵌套时应当注意限制有歧义的列名

6. 语法顺序
   > select -> from -> where ->group by -> order by -> limit

| 子句     | 说明             | 是否必须使用             |
| -------- | ---------------- | ------------------------ |
| SELECT   | 返回列或者表达式 | 是                       |
| FROM     | 检索的表         | 仅在从表格中选择数据时用 |
| WHERE    | 行级过滤         | 否                       |
| GROUP BY | 分组             | 分组计算使用             |
| HAVING   | 组级过滤         | 否                       |
| ORDER BY | 输出排序顺序     | 否                       |
| LIMIT    | 要检索的行数     | 否                       |

### 检索数据 SELECT

1. 简单检索

```mysql
select [field]|* from table_name
-- find all column
select (DISTINCT)* from table_name
-- DISTINCT apply all the column_names
-- LIMIT 5,6-->start from 4(first row is 0),and get 6 rows
-- LIMIT 4(num_rows) OFFSET 3(start)(从第三行开始取四行)
-- keyword
```

> limit用法：limit n：限制n条信息；limit index,n：从index开始的n条记录（包含index）

2. 排序

```mysql
select prod_name from products
order by pro_name (DESC/ASC-defult)
```

3. 计算字段以及别名 AS

**Concat**:拼接字段

**RTrim/LTrim/Trim**

4. 函数 Function

[Function](https://mariadb.com/kb/en/library/beginner-mariadb-articles/ "mariadb Help doc")

### 聚集函数

AVG：忽略列值为 NULL 的行
COUNT：(\*):all rows；(column):特定列具有数值的行，忽略 NULL
MAX/MIN
SUM

### WHERE

字符串的引用 **' '**

1. Between & IN
2. IS NULL
3. AND/OR--运算的优先次序
   > 使用 **( )**改变优先级顺序，调整次序满足要求
4. IN
5. NOT
6. 通配符的使用

   **LIKE**:SQL 关键字
   **%**:任何字符出现任意次数，匹配 0 个，1 个或者多个字符，**但是无法匹配 NULL**|**"jet%"**

   _ 当做匹配单个字符

   **\_**(下划线)：匹配单个字符

### 分组数据(GROUP BY| HAVING)

1. **过滤分组 HAVING**
   WHERE 在数据分组前进行过滤，HAVING 在数据分组后进行过滤

### SQL 正则表达式

**REGEXP**:SQL 关键字

> REGEXP&LIKE：**like**匹配整个列，REG 在整个列值中进行匹配

1. "|"--OR

XOR--->异或运算

2. **^**开头 **\$**结尾
3. "."表示匹配任何一个字符

### 联结Joint
1. 基本概念
   
    **笛卡尔积**/表别名**AS**
2. inner Join 内连接

两个表均可以匹配到

```mysql
select vend_name,prod_name,pro_price 
-- focus on this "from" line
from vendors INNER JOIN products
ON vendors.vend_id = products.vend_id
```
![内连接](./img/InnerJoint.jpg)

2. left Or right outer Join

3. Full Outer Join(not usually use)

### SQL子查询（subquery）




### SQL逻辑函数

1. IF
2. CASE WHEN END

```sql
SELECT CASE cleaned_users.country
            WHEN "US" THEN "In US"
            WHEN "N/A" THEN "Not Applicable"
            ELSE "Outside US"
            END AS US_user, 
      count(cleaned_users.user_guid)   
```






## 在线学习资源

1. [ERDplus](https://erdplus.com/)
2.

## 服务器设置

1. jupyter notebook

```python
%load_ext sql
%sql mysql://studentuser:studentpw@mysqlserver/dognitiondb
%sql USE dognitiondb
```

```sql
%%sql  
SELECT  IF(cleaned_users.country='US','In  US','Outside  US')  AS  user_location,count(cleaned_users.user_guid)  AS  num_guids      
FROM (SELECT  DISTINCT  user_guid,country                
FROM  users              
WHERE  user_guid IS  NOT  NULL  AND  country  IS  NOT  NULL)  AS  cleaned_users    
GROUP  BY  user_location  
```

2. 天瑞数据库

```c

uatdviewpoint.waltoncollege.uark.edu

Your Teradata login is: DUKESQLMOOC28650
Your Teradata password is: HW30mic$

DATABASE ua_dillards; 
```

## 聚合函数

timestampdiff(minute,start_time,end_time)

The GROUP BY clause comes **after** the WHERE clause, but **before** ORDER BY or LIMIT:



天瑞数据库系统
日期时间不加双引号
引用时采用的是单引号

select \* from trnsact where saledate > 2004-08-10

SELECT TOP 10 \*
FROM strinfo
ORDER BY city （ASC/DESC）



