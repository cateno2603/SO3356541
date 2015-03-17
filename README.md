Looking at ways to specify multiple grandchild (or deeper) eager loading via the [Strongly typed Include](https://msdn.microsoft.com/en-us/library/gg671236(v=vs.103).aspx)


Option 1
--------

Multiple `.Include` specifications, one for each `leaf` node entity


    var company = context.Companies
                         .Include(co => co.Employees.Select(emp => emp.Employee_Car))
                         .Include(co => co.Employees.Select(emp => emp.Employee_Country))
                         .FirstOrDefault(co => co.companyID == companyID);


Option 2
--------

Single `.Include` specification, by walking back up the tree before heading down another branch to the next leaf node. NB: This does NOT work with `.AsNoTracking()`

    var company = context.Companies
             .Include(co => 
                 co.Employees
                    .Select(emp => emp.Employee_Car
                        .Select(ec => ec.Employee)
                        .Select(emp2 => emp2.Employee_Country)))
             .FirstOrDefault(co => co.companyID == companyID);

=> Comparison of the resulting Sql for Option 1 here and Option 2 here 
