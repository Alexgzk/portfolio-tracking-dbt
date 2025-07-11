{% test no_hash_collisions(model,column_name,hashed_fields) %}

WITH
all_tuples as (
       SELECT distinct {{column_name}} as HASH, {{ hashed_field  }}
       FROM {{ model }}
),
validation_errors as (
    SELECT HASH, count(*)
    FROM all_tuples
    GROUP BY HASH
    HAVING count(*) > 1
)
SELECT * FROM validation_errors

{%- endtest %}

