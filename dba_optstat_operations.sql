SELECT
x.*,
    a.*
FROM
    dba_optstat_operations a 
    , xmltable('/params/param'
PASSING xmlparse(document a.notes)
COLUMNS
name path '@name' ,
val path '@val'

) x
where 
1=1 
--and name='method_opt'
and name='degree'
--and  operation='gather_database_stats' 
--and id=3366
;
