
--
-- sed -E s%^\(..\)/\(..\)/\(....\)%\\3-\\2-\\1%g covid-19.csv \
--    > covid-19-datesafe.csv
--
-- hdfs dfs -put covid-19-datesafe.csv
--

drop table covid19;

create table covid19(
 daterep timestamp,
 dd int,
 mm int,
 yyyy int,
 cases int,
 deaths int,
 country string,
 geoid string,
 cc string,
 population int,
 continent string,
 cum14per100k double
 )
stored as parquet
tblproperties ('transactional'='false');

drop table covid19_text;
create table covid19_text like covid19 stored as textfile;
alter table covid19_text
set serdeproperties ('serialization.format'=',', 'field.delim'=',');

load data inpath '/tmp/impala/covid-19-datesafe.csv' into table covid19_text;

select count(*) from covid19_text;
select * from covid19_text limit 10;

insert into covid19 select * from covid19_text;

select count(*) from covid19;
select * from covid19 limit 10;

create table covid19_kudu(
 cc string,
 daterep timestamp,
 dd int,
 mm int,
 yyyy int,
 cases int,
 deaths int,
 country string,
 geoid string,
 population int,
 continent string,
 cum14per100k double,
 primary key (cc,daterep)
 )
partition by hash partitions 2
stored as kudu;

insert into covid19_kudu
select cc,daterep,dd,mm,yyyy,cases,deaths,country,geoid,population,
       continent,cum14per100k 
from covid19;

select count(*) from covid19_kudu;
select * from covid19_kudu limit 10;
