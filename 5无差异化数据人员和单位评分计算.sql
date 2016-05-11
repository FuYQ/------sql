####公职人员

SELECT ID FROM (  
     SELECT DISTINCT personnel_info.id_code AS ID FROM personnel_info
    UNION ALL  
    SELECT DISTINCT person_credit_data_aggregation.icard AS ID FROM person_credit_data_aggregation 
)TEMP GROUP BY ID HAVING COUNT(ID) = 1  


###机关事业单位
SELECT ID FROM (  
     SELECT DISTINCT organization_info.org_code AS ID FROM organization_info 
    UNION ALL  
    SELECT DISTINCT office_credit_data_aggregation.icard AS ID FROM office_credit_data_aggregation 
)TEMP GROUP BY ID HAVING COUNT(ID) = 1 


####去重
delete from person_credit_score where id not in 
( select b.id from (select max(id)id from person_credit_score group by icard )b);


delete from office_credit_score where id not in 
( select b.id from (select max(id)id from office_credit_score group by icard )b);

