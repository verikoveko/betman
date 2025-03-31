INSERT INTO cats (firstname, weight,age,breed,color)
VALUES ('Alfie',25, 3,'British Shorthair','Black'),
        ('Ashes',30, 4,'British Shorthair','Black'),
        ('Charlie',15, 8,'Maine Coon','Brown'),
        ('Felix',18, 4,'Persian','Brown'),
        ('Millie',12, 2,'Persian','Brown'),
        ('Misty',30, 1, 'Persian','Tortoiseshell');
        
        SELECT * FROM  cats;
        
        SELECT firstname, SUM(weight) OVER (ORDER BY firstname) AS running_total_weight FROM cats;
        
         SELECT firstname,breed, sum(weight) OVER (PARTITION BY breed ORDER BY firstname) AS running_total_weight FROM cats;
         
            SELECT firstname, weight, avg(weight) over (order by weight ROWS between 1 preceding and 1 following) as average_weight from cats order by weight;
            
       select firstname, sum(weight) over (order by weight DESC ROWS between unbounded preceding and current row) as running_total_weight from cats order by running_total_weight;
       
    select row_number() over (order by color,firstname) as unique_number, firstname, color from cats;
    
    select rank() over (order by weight desc) as ranking, weight, firstname from cats order by ranking, firstname;
     select DENSE_RANK() over (order by weight desc) as ranking, weight, firstname from cats order by ranking, firstname;
     
     SELECT 
     firstname, 
     weight, 
     PERCENT_RANK() OVER(ORDER BY weight)*100 as percent from cats order by weight;
     
     
   select firstname, weight, cast(cume_dist() over (order by weight) * 100 as integer) as percent from cats order by weight;