#Get the list of all the indexes


SELECT t.name AS `Table`,
       i.name AS `Index`,
       GROUP_CONCAT(f.name ORDER BY f.pos) AS `Columns`
FROM information_schema.innodb_sys_tables t 
INNER JOIN information_schema.innodb_sys_indexes i 
ON t.table_id = i.table_id
INNER JOIN information_schema.innodb_sys_fields f
ON t.index_id = f.index_id
WHERE t.schema = 'sakila'
GROUP BY 1,2;
