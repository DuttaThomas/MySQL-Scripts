#Get the list of all the Indexes


SELECT SUBSTRING_INDEX(t.name, '/', 1) AS `Database`,
	SUBSTRING_INDEX(t.name, '/', -1) AS `Table`,
	i.name AS `Index`,
	GROUP_CONCAT(f.name ORDER BY f.pos) AS `Columns`
FROM information_schema.innodb_sys_tables t 
INNER JOIN information_schema.innodb_sys_indexes i 
ON t.table_id = i.table_id
INNER JOIN information_schema.innodb_sys_fields f
ON i.index_id = f.index_id
GROUP BY 1,2,3
ORDER BY 1,2,3