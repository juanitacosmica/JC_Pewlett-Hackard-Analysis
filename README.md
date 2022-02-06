# JC_Pewlett-Hackard-Analysis
Module 7 - Exploring Databases with SQL

# Overview of the analysis:

The purpose of this analysis is to provide an insight to Pewlett Hackard about their upcoming several number of employees retiring as part of their campaign "Silver Tsunami". The company needs to prepare the pension packages and be ready to welcoming new employees to fulfill the vacancies. For a smooth onboarding, the analysis provides a handfull of details not limited to: number of employees retiring by title, the total count of people grouped by position, how many amongst them are entitle to participate of the mentorship program, the vacancies to be filled with new employees by title and department and who qualifies to train the new staff.


# Resources:
 
 **Data source** All data used (and exported) in this analysis is in the [Data Folder](https://github.com/juanitacosmica/JC_Pewlett-Hackard-Analysis/Data) and sample images of the results are in the [Resources Folder](https://github.com/juanitacosmica/JC_Pewlett-Hackard-Analysis/Resources)

  **Software** Excel, pgAdmin4, PostgresSQL, QuickDBD.


# Results:

A list of retiring employees was done including employee #, first and last name, title and from-to dates.

![Retiring Employees at a glance](/Resources/retirement_titles_data_sample.png)

To fetch this data, the SQL prompted to JOIN two tables (employees and titles), then filtered by birth date indicating who will be retiring in the upcoming years.

Note: The code had to be formated in order to remove the duplicated names.

![Retiring Employees (unique names) at a glance](/Resources/unique_retirement_titles_data_sample.png)

As mentioned, this analysis also allowed to view the # of employees retiring by title, using the GROUPBY function:

![Count of Retiring Employees by title at a glance](/Resources/most_recent_job_titles_list.png)

Finally, to view who was eligilible for the mentorship program, tables were merged (employees, dept_emp and titles) using INNER JOIN.

![Employees entitled for the mentorship program at a glance](/Resources/mentorship_eligibility_data_sample.png)

All data results were imported from pgAdmin, using the Export feature on each table created, and can be found in the [Data Folder](https://github.com/juanitacosmica/JC_Pewlett-Hackard-Analysis/Data).

# Summary:

Pewlett Hackard is getting ready for a massive retirement, the campaign called "silver tsunami" is the preparation for them to retire their employees and welcome the new generation. With the analysis previously presented, the company has the glance of who is retiring and from which departments:

![Retiring Employees per dept. at a glance](/Resources/unique_retirement_titles_data_sample.png)

As part of the Onboarding the new generation plan under the umbrella of the Silver Tsunami campaign, this analysis allowed Pewlett Hackard to respond to:

1. How many roles will need to be filled as the "silver tsunami" begins to make an impact?
The table shown below breaks down the count of roles to be filled upon retirements per title and department:

![Count of roles to fill per title and dept at a glance](/Resources/roles_to_fill_data_sample.png)

2. Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
The table shown below breaks down the count of qualified people to be hired upon retirements per title and department:

![Count of qualified staff to fill per title and dept at a glance](/Resources/qualified_people_data_sample.png)