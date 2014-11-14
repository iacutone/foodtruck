module Score
  
# SELECT some_pk, 
#      regexp_split_to_table(some_column, '\s') as word
# FROM some_table

# SELECT DISTINCT word
# FROM ( 
#   SELECT regexp_split_to_table(some_column, '\s') as word
#   FROM some_table
# ) t

# SELECT word, count(*)
# FROM ( 
#   SELECT regexp_split_to_table(some_column, '\s') as word
#   FROM some_table
# ) t
# GROUP BY word
end