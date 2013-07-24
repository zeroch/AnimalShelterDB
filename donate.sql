select extract(MONTH from d_date) as d_Month, D.name, D.phone, o.email,max(amount) 
from Donates AS D 
INNER JOINT donor as o 
on D.name=o.name and D.phone=o.phone
  and extract(YEAR from d_date)=2013
group by d_Month

