USE `classicmodels`;
alter table `customers` add index idx_customerName (customerName);
explain
select * 
from `customers` where customerName = 'Land of Toys Inc.' ;