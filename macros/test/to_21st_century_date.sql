{% macro to_21st_century_date(date_column_name) -%}

    CASE 
       WHEN {{date_column_name}} >= '0100-01-01' THEN {{date_column_name}}
       ELSE DATEADD('YEAR', 2000, {{date_column_name}})
    END 

{%- endmacro %}