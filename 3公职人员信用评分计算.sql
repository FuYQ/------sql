BEGIN  
DELETE from person_credit_score;
 SET @i = 1 ;
SELECT @max_row :=max(sid) from personnel_info;
 WHILE @i <= @max_row
DO  
SELECT @dd := id_code from personnel_info where sid = @i;
INSERT INTO `person_credit_score` (`icard`,`level1_id`,`level1_name`,`score`,`created`,`updated`,`status`)  
SELECT e.icard,e.level1_id,e.level1_name,
	(SUM(e.score*f.level4_weight*f.level3_weight*f.level2_weight*f.level1_weight)+300) score,NOW() `created`,NOW() `updated`,0 `status`
FROM
(
	SELECT c.icard,c.level1_id,c.level1_name,c.level2_id,c.level2_name,c.level3_id,c.level3_name,c.level4_id,c.level4_name,(c.level4_score+IFNULL(d.increment,0)) score,IFNULL(d.increment,0) increment,flag
	FROM
	(
		SELECT DISTINCT icard,level1_id,level1_name,level2_id,level2_name,level3_id,level3_name,level4_id,level4_name,level4_score
		FROM
		(
			SELECT DISTINCT icard
			FROM person_credit_data_aggregation
			WHERE icard=@dd
		) icard_t1,person_credit_score_rule
		ORDER BY icard,level1_id,level2_id,level3_id,level4_id,level4_name
	) c 
	LEFT JOIN
	(
		SELECT a.icard,a.level4,b.level4_id,avg(b.`value`*b.flag) increment,b.flag
		FROM
		(
			SELECT person_credit_data_aggregation.* FROM 
			(
				SELECT DISTINCT icard
				FROM person_credit_data_aggregation
				WHERE icard=@dd
			) icard_t2 
			LEFT JOIN person_credit_data_aggregation ON icard_t2.icard=person_credit_data_aggregation.icard
		) a
		LEFT JOIN
		person_credit_score_rule b
		ON a.level4=b.level4_id AND a.level5=b.level5_name GROUP BY b.level4_id
	) d 
	ON c.level4_id=d.level4_id AND c.icard=d.icard
) e
LEFT JOIN
person_credit_weight_flat f
ON e.level4_id=f.level4_id
GROUP BY icard,level1_id,level1_name;
SET @i=@i+1;
END WHILE ; 
commit;  
  END