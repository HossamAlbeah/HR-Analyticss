-- create join table 
select * from [dbo].[Absenteeism_at_work] a 
left join [dbo].[compensation] c 
on a.ID =c.[ID] 
left join [dbo].[Reasons] r
on a.Reason_for_absence = r.[Number];

--- find the healtiest employees for the bouns
select * from [dbo].[Absenteeism_at_work] 
where Social_drinker = 0 and Social_smoker = 0 and Body_mass_index <25
and [Absenteeism_time_in_hours]<(select AVG([Absenteeism_time_in_hours]) from [dbo].[Absenteeism_at_work])

--compensation rate increse for non-smoker
select count(*) as non_Smoker from [dbo].[Absenteeism_at_work] 
where Social_smoker = 0 ;

--optimize thius query
select a.ID,
       r. [Reason],
	   [Month_of_absence],
	   [Body_mass_index],
case when [Body_mass_index]   <18.5                    then  'under weight'   
     when [Body_mass_index]   between 18.5 and 24.9    then  'Healty weight'
	 when [Body_mass_index]   between 25   and 30      then  'Over weight'
	 when [Body_mass_index]   >18.5                    then  'Obese'
	 else 'Unknown' end as BMI_Category,
case when [Month_of_absence] in (12,1,2)               then   'Winter'
     when [Month_of_absence] in (3,4,5)                then   'spring'
	 when [Month_of_absence] in (6,7,8)                then   'summer'
	 when [Month_of_absence] in (9,10,11)              then   'fall'

	 else'Unkown'end as season_names,
Month_of_absence,
Day_of_the_week,
Transportation_expense,
Seasons,
Education,
Son,
Social_drinker,
Social_smoker,
Pet,
Disciplinary_failure,
Age,
Work_load_Average_day,
Absenteeism_time_in_hours
from [dbo].[Absenteeism_at_work] a 
left join [dbo].[compensation] c 
on a.ID =c.[ID] 
left join [dbo].[Reasons] r
on a.Reason_for_absence = r.[Number];