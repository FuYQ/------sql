DELETE from office_credit_data_aggregation;
INSERT INTO office_credit_data_aggregation (icard,level4,level5)
 SELECT p.`org_code` icard,'102010101' level4,p.`goal_completion` level5 
 FROM `gov_task_complet_credit` p WHERE p.`goal_completion` IN ( SELECT DISTINCT level5_name 
 FROM office_credit_score_rule WHERE level4_id='102010101' AND `value`>0);

INSERT INTO office_credit_data_aggregation (icard,level4,level5) SELECT p.`org_code` icard,'102010102' level4,p.`performance_rank` level5 FROM `gov_task_complet_credit` p WHERE p.`performance_rank` IN ( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102010102' AND `value`>0);

INSERT INTO office_credit_data_aggregation (icard,level4,level5) SELECT p.`org_code` icard,'102010103' level4,p.`false_information` level5 FROM `gov_task_complet_credit` p WHERE p.`false_information` IN ( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102010103' AND `value`>0);



INSERT INTO office_credit_data_aggregation (icard,level4,level5) SELECT p.`org_code` icard,'102010201' level4,p.`affair_public` level5 
FROM `gov_three_bill_credit` p WHERE p.`affair_public` IN ( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102010201' AND `value`>0);

INSERT INTO office_credit_data_aggregation (icard,level4,level5) 
SELECT icard,level4,CASE
WHEN level5<55 THEN '55������'
WHEN level5>=55 AND level5<70 THEN '55��-69��'
WHEN level5>=70 AND level5<85 THEN '70��-84��'
WHEN level5>=85.00 AND level5<100.00 THEN '85��-90��' 
WHEN level5>=100 AND level5<110 THEN '100��-110��' 
ELSE '����'
END level5 
FROM (SELECT p.`org_code` icard,'102010202' level4,avg(p.`three_rank`) level5
FROM `gov_three_bill_credit` p WHERE p.`three_rank` >0 and p.`org_code` IS NOT NULL GROUP BY p.`org_code`) a;

INSERT INTO office_credit_data_aggregation (icard,level4,level5) SELECT p.`org_code` icard,'102010301' level4,p.`affair_implement` level5 
FROM `gov_duty_finish_credit` p WHERE p.`affair_implement` IN 
( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102010301' AND `value`>0);

INSERT INTO office_credit_data_aggregation (icard,level4,level5) SELECT p.`org_code` icard,'102010302' level4,p.`clean_government` level5 FROM `gov_duty_finish_credit` p WHERE p.`clean_government` IN ( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102010302' AND `value`>0);

INSERT INTO office_credit_data_aggregation (icard,level4,level5) SELECT p.`org_code` icard,'102010303' level4,p.`public_security` level5 FROM `gov_duty_finish_credit` p WHERE p.`public_security` IN ( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102010303' AND `value`>0);

INSERT INTO office_credit_data_aggregation (icard,level4,level5) SELECT p.`org_code` icard,'102010304' level4,p.`birth_control` level5 FROM `gov_duty_finish_credit` p WHERE p.`birth_control` IN ( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102010304' AND `value`>0);

INSERT INTO office_credit_data_aggregation (icard,level4,level5) SELECT p.`org_code` icard,'102010305' level4,p.`safe_responsibility` level5 FROM `gov_duty_finish_credit` p WHERE p.`safe_responsibility` IN ( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102010305' AND `value`>0);

INSERT INTO office_credit_data_aggregation (icard,level4,level5) SELECT p.`org_code` icard,'102010306' level4,p.`leader_supervise` level5 FROM `gov_duty_finish_credit` p WHERE p.`leader_supervise` IN ( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102010306' AND `value`>0);


INSERT INTO office_credit_data_aggregation (icard,level4,level5) 
SELECT icard,level4,CASE
WHEN level5<=2 THEN 'ȱϯ-2��'
WHEN level5>2 AND level5<=4 THEN 'ȱϯ3-4��'
WHEN level5>=5 THEN 'ȱϯ5������'
ELSE '�������' 
END level5 
FROM (SELECT p.`org_code` icard,'102010307' level4,sum(p.`conference_absent`) level5
FROM `gov_duty_finish_credit` p WHERE p.`conference_absent` >0 and p.`org_code` IS NOT NULL GROUP BY p.`org_code`) a;

INSERT INTO office_credit_data_aggregation (icard,level4,level5) SELECT p.`org_code` icard,'102010308' level4,p.`assess_complain` level5 FROM `gov_duty_finish_credit` p WHERE p.`assess_complain` IN ( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102010308' AND `value`>0);


INSERT INTO office_credit_data_aggregation (icard,level4,level5) 
SELECT p.`org_code` icard,'102020101' level4,p.`contract_fulfil` level5 
FROM `gov_business_activit_credit` p WHERE p.`contract_fulfil` IN ( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102020101' AND `value`>0);

INSERT INTO office_credit_data_aggregation (icard,level4,level5) SELECT p.`org_code` icard,'102020102' level4,p.`debt` level5 FROM `gov_business_activit_credit` p WHERE p.`debt` IN ( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102020102' AND `value`>0);

INSERT INTO office_credit_data_aggregation (icard,level4,level5) 
SELECT icard,level4,CASE
WHEN level5=0 THEN '��'
WHEN level5<=2000 THEN '2000Ԫ���·���'
WHEN level5>2000 and level5<=10000 THEN '2000-1��Ԫ����'
WHEN level5>10000 and level5<=50000 THEN '1��Ԫ-5��Ԫ����'
WHEN level5>50000 and level5<=100000 THEN '5��Ԫ-10��Ԫ����'
ELSE '10�����Ϸ���' 
END level5 
FROM (SELECT p.`org_code` icard,'102020103' level4,sum(p.`violation_fine`) level5
FROM `gov_business_activit_credit` p WHERE p.`violation_fine` >0 and p.`org_code` IS NOT NULL GROUP BY p.`org_code`) a;

INSERT INTO office_credit_data_aggregation (icard,level4,level5) 
SELECT icard,level4,CASE
WHEN level5=0 THEN '��'
WHEN level5<=500 THEN 'Ƿ����500Ԫ����'
WHEN level5>500 and level5<=1000 THEN 'Ƿ����500Ԫ-1000Ԫ'
WHEN level5>1000 and level5<=5000 THEN 'Ƿ����1000Ԫ-5000Ԫ'
WHEN level5>5000 and level5<=10000 THEN 'Ƿ����5000Ԫ-10000Ԫ'
ELSE 'Ƿ����10000Ԫ����' 
END level5 
FROM (SELECT p.`org_code` icard,'102020104' level4,sum(p.`violation_debt`) level5
FROM `gov_business_activit_credit` p WHERE p.`violation_debt` >0 and p.`org_code` IS NOT NULL GROUP BY p.`org_code`) a;

INSERT INTO office_credit_data_aggregation (icard,level4,level5) SELECT p.`org_code` icard,'102020105' level4,p.`irregular_charge` level5 FROM `gov_business_activit_credit` p WHERE p.`irregular_charge` IN ( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102020105' AND `value`>0);


INSERT INTO office_credit_data_aggregation (icard,level4,level5)
 SELECT p.`org_code` icard,'102030101' level4,p.`arbitrary_conduct` level5 
 FROM `gov_org_violation_credit` p WHERE p.`arbitrary_conduct` IN 
 ( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102030101' AND `value`>0);

 INSERT INTO office_credit_data_aggregation (icard,level4,level5) 
SELECT icard,level4,CASE 
WHEN level5=1 THEN '1��'
WHEN level5=2 THEN '2��'
WHEN level5>2 THEN '2������' 
else '����'
END level5 
FROM (SELECT p.`org_code` icard,'102030102' level4,SUM(p.`criticize`) level5
FROM `gov_org_violation_credit` p WHERE p.`criticize` >0 and p.`org_code` IS NOT NULL GROUP BY p.`org_code`) a;


INSERT INTO office_credit_data_aggregation (icard,level4,level5) 
SELECT p.`org_code` icard,'102030201' level4,p.`administration_penalty` level5 
FROM `gov_org_illegal_credit` p WHERE p.`administration_penalty` IN 
( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102030201' AND `value`>0);

INSERT INTO office_credit_data_aggregation (icard,level4,level5) SELECT p.`org_code` icard,'102030202' level4,p.`criminal_penalty` level5 FROM `gov_org_illegal_credit` p WHERE p.`criminal_penalty` IN ( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102030202' AND `value`>0);

INSERT INTO office_credit_data_aggregation (icard,level4,level5) SELECT p.`org_code` icard,'102030203' level4,p.`judicial_document` level5 FROM `gov_org_illegal_credit` p WHERE p.`judicial_document` IN ( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102030203' AND `value`>0);

INSERT INTO office_credit_data_aggregation (icard,level4,level5) SELECT p.`org_code` icard,'102030204' level4,p.`social_payment` level5 FROM `gov_org_illegal_credit` p WHERE p.`social_payment` IN ( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102030204' AND `value`>0);


 INSERT INTO office_credit_data_aggregation (icard,level4,level5) 
SELECT icard,level4, '������Χ��' AS level5 
FROM (SELECT p.`org_code` icard,'102030301' level4,SUM(p.`national_honor`) level5
FROM `gov_org_honor_credit` p WHERE p.`national_honor` >0 and p.`org_code` IS NOT NULL GROUP BY p.`org_code`) a ;

INSERT INTO office_credit_data_aggregation (icard,level4,level5) 
SELECT icard,level4, '������Χ��' AS level5 
FROM (SELECT p.`org_code` icard,'102030302' level4,SUM(p.`provincial_honor`) level5
FROM `gov_org_honor_credit` p WHERE p.`provincial_honor` >0 and p.`org_code` IS NOT NULL GROUP BY p.`org_code`) a;

INSERT INTO office_credit_data_aggregation (icard,level4,level5) 
SELECT icard,level4, '������Χ��' AS level5 
FROM (SELECT p.`org_code` icard,'102030303' level4,SUM(p.`civic_honor`) level5
FROM `gov_org_honor_credit` p WHERE p.`civic_honor` >0 and p.`org_code` IS NOT NULL GROUP BY p.`org_code`) a ;

 INSERT INTO office_credit_data_aggregation (icard,level4,level5) 
SELECT icard,level4,CASE 
WHEN level5=1 THEN '1��'
WHEN level5>=2 THEN '2������' 
else '����'
END level5 
FROM (SELECT p.`org_code` icard,'102030304' level4,SUM(p.`commendation`) level5
FROM `gov_org_honor_credit` p WHERE p.`commendation` >0 and p.`org_code` IS NOT NULL GROUP BY p.`org_code`) a ;

 
 INSERT INTO office_credit_data_aggregation (icard,level4,level5) 
SELECT icard,level4, '��' AS level5 
FROM (SELECT p.`org_code` icard,'102030305' level4,SUM(p.`advanced_person`) level5
FROM `gov_org_honor_credit` p WHERE p.`advanced_person` >0 and p.`org_code` IS NOT NULL GROUP BY p.`org_code`) a ;

 INSERT INTO office_credit_data_aggregation (icard,level4,level5) 
SELECT icard,level4,CASE 
WHEN level5=1 THEN '����'
WHEN level5>=1 THEN '2������' 
else '����'
END level5 
FROM (SELECT p.`org_code` icard,'102030306' level4,SUM(p.`people_praise`) level5
FROM `gov_org_honor_credit` p WHERE p.`people_praise` >0 and p.`org_code` IS NOT NULL GROUP BY p.`org_code`) a ;


INSERT INTO office_credit_data_aggregation (icard,level4,level5) 
SELECT p.`org_code` icard,'102040101' level4,p.`civilization` level5 
FROM `gov_partake_activit_credit` p WHERE p.`civilization` IN ( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102040101' AND `value`>0);

INSERT INTO office_credit_data_aggregation (icard,level4,level5) SELECT p.`org_code` icard,'102040102' level4,p.`voluntary` level5 FROM `gov_partake_activit_credit` p WHERE p.`voluntary` IN ( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102040102' AND `value`>0);

INSERT INTO office_credit_data_aggregation (icard,level4,level5) SELECT p.`org_code` icard,'102040103' level4,p.`poverty_reduction` level5 FROM `gov_partake_activit_credit` p WHERE p.`poverty_reduction` IN ( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102040103' AND `value`>0);

INSERT INTO office_credit_data_aggregation (icard,level4,level5) SELECT p.`org_code` icard,'102040104' level4,p.`nvestment` level5 FROM `gov_partake_activit_credit` p WHERE p.`nvestment` IN ( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102040104' AND `value`>0);

INSERT INTO office_credit_data_aggregation (icard,level4,level5) SELECT p.`org_code` icard,'102040105' level4,p.`new_countryside` level5 FROM `gov_partake_activit_credit` p WHERE p.`new_countryside` IN ( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102040105' AND `value`>0);

INSERT INTO office_credit_data_aggregation (icard,level4,level5) SELECT p.`org_code` icard,'102040106' level4,p.`enterprise_support` level5 FROM `gov_partake_activit_credit` p WHERE p.`enterprise_support` IN ( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102040106' AND `value`>0);

INSERT INTO office_credit_data_aggregation (icard,level4,level5) SELECT p.`org_code` icard,'102040107' level4,p.`important_project_support` level5 FROM `gov_partake_activit_credit` p WHERE p.`important_project_support` IN ( SELECT DISTINCT level5_name FROM office_credit_score_rule WHERE level4_id='102040107' AND `value`>0);

DELETE from office_credit_data_aggregation where icard='' OR icard is NULL