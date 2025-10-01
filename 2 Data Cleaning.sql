# Data Cleaning
# see the dataframe
Select *
From electronic_sales 
order by Customer_ID DESC ;

# Check Gender value
SELECT Gender , count(Gender)
FROM electronic_sales
Group by Gender ;

# Update Gender fill in median imputation is "Male"
UPDATE electronic_sales
SET Gender = 'Male'
Where Gender = '#N/A' ;

# Replace Add_on_purchase from " " to Null
UPDATE electronic_sales 
SET Add_ons_Purchased = NULL
WHERE TRIM(Add_ons_Purchased) = '';

# Update Add_on_purchase fill in "None" Where is Null
UPDATE electronic_sales 
SET Add_ons_Purchased = 'None'
WHERE Add_ons_Purchased is NULL ;

# See the Null
SELECT Gender
FROM electronic_sales
Where Gender is NULL;

SELECT Add_ons_Purchased
FROM electronic_sales
WHERE Add_ons_Purchased is NULL 

# Duplicate rows
with duplicate_cte as
(select *,
row_number() over(Partition by 
Customer_ID, Product_Type ,Total_Price ,Purchase_Date) as row_num
From electronic_sales
)
select *
from duplicate_cte
where row_num > 1;


