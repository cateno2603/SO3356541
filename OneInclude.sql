exec sp_executesql N'SELECT 
    [Project4].[companyID] AS [companyID], 
    [Project4].[Name] AS [Name], 
    [Project4].[C3] AS [C1], 
    [Project4].[employeeID] AS [employeeID], 
    [Project4].[companyID1] AS [companyID1], 
    [Project4].[Name1] AS [Name1], 
    [Project4].[C2] AS [C2], 
    [Project4].[employee_CarId] AS [employee_CarId], 
    [Project4].[employeeID1] AS [employeeID1], 
    [Project4].[Name2] AS [Name2], 
    [Project4].[employeeID2] AS [employeeID2], 
    [Project4].[companyID2] AS [companyID2], 
    [Project4].[Name3] AS [Name3], 
    [Project4].[C1] AS [C3], 
    [Project4].[Employee_CountryId] AS [Employee_CountryId], 
    [Project4].[employeeID3] AS [employeeID3], 
    [Project4].[Name4] AS [Name4]
    FROM ( SELECT 
        [Project3].[companyID] AS [companyID], 
        [Project3].[Name] AS [Name], 
        [Project3].[employeeID] AS [employeeID], 
        [Project3].[companyID1] AS [companyID1], 
        [Project3].[Name1] AS [Name1], 
        [Project3].[employee_CarId] AS [employee_CarId], 
        [Project3].[employeeID1] AS [employeeID1], 
        [Project3].[Name2] AS [Name2], 
        [Project3].[employeeID2] AS [employeeID2], 
        [Project3].[companyID2] AS [companyID2], 
        [Project3].[Name3] AS [Name3], 
        [Project3].[Employee_CountryId] AS [Employee_CountryId], 
        [Project3].[employeeID3] AS [employeeID3], 
        [Project3].[Name4] AS [Name4], 
        CASE WHEN ([Project3].[employeeID] IS NULL) THEN CAST(NULL AS int) WHEN ([Project3].[employee_CarId] IS NULL) THEN CAST(NULL AS int) WHEN ([Project3].[Employee_CountryId] IS NULL) THEN CAST(NULL AS int) ELSE 1 END AS [C1], 
        CASE WHEN ([Project3].[employeeID] IS NULL) THEN CAST(NULL AS int) WHEN ([Project3].[employee_CarId] IS NULL) THEN CAST(NULL AS int) ELSE 1 END AS [C2], 
        CASE WHEN ([Project3].[employeeID] IS NULL) THEN CAST(NULL AS int) ELSE 1 END AS [C3]
        FROM ( SELECT 
            [Project2].[companyID] AS [companyID], 
            [Project2].[Name] AS [Name], 
            [Project2].[employeeID] AS [employeeID], 
            [Project2].[companyID1] AS [companyID1], 
            [Project2].[Name1] AS [Name1], 
            [Project2].[employee_CarId] AS [employee_CarId], 
            [Project2].[employeeID1] AS [employeeID1], 
            [Project2].[Name2] AS [Name2], 
            [Project2].[employeeID2] AS [employeeID2], 
            [Project2].[companyID2] AS [companyID2], 
            [Project2].[Name3] AS [Name3], 
            [Project2].[Employee_CountryId] AS [Employee_CountryId], 
            [Project2].[employeeID3] AS [employeeID3], 
            [Project2].[Name4] AS [Name4]
            FROM ( SELECT 
                [Limit1].[companyID] AS [companyID], 
                [Limit1].[Name] AS [Name], 
                [Join3].[employeeID1] AS [employeeID], 
                [Join3].[companyId1] AS [companyID1], 
                [Join3].[Name1] AS [Name1], 
                [Join3].[employee_CarId] AS [employee_CarId], 
                [Join3].[employeeID2] AS [employeeID1], 
                [Join3].[Name2] AS [Name2], 
                [Join3].[employeeID3] AS [employeeID2], 
                [Join3].[companyId2] AS [companyID2], 
                [Join3].[Name3] AS [Name3], 
                [Join3].[Employee_CountryId] AS [Employee_CountryId], 
                [Join3].[employeeID4] AS [employeeID3], 
                [Join3].[Name4] AS [Name4]
                FROM   (SELECT TOP (1) 
                    [Extent1].[companyID] AS [companyID], 
                    [Extent1].[Name] AS [Name]
                    FROM [dbo].[Company] AS [Extent1]
                    WHERE [Extent1].[companyID] = @p__linq__0 ) AS [Limit1]
                LEFT OUTER JOIN  (SELECT [Extent2].[employeeID] AS [employeeID1], [Extent2].[companyId] AS [companyId1], [Extent2].[Name] AS [Name1], [Join2].[employee_CarId], [Join2].[employeeID2], [Join2].[Name2], [Join2].[employeeID3], [Join2].[companyId2], [Join2].[Name3], [Join2].[Employee_CountryId], [Join2].[employeeID4], [Join2].[Name4]
                    FROM  [dbo].[Employee] AS [Extent2]
                    LEFT OUTER JOIN  (SELECT [Extent3].[employee_CarId] AS [employee_CarId], [Extent3].[employeeID] AS [employeeID2], [Extent3].[Name] AS [Name2], [Extent4].[employeeID] AS [employeeID3], [Extent4].[companyId] AS [companyId2], [Extent4].[Name] AS [Name3], [Extent5].[Employee_CountryId] AS [Employee_CountryId], [Extent5].[employeeID] AS [employeeID4], [Extent5].[Name] AS [Name4]
                        FROM   [dbo].[Employee_Car] AS [Extent3]
                        INNER JOIN [dbo].[Employee] AS [Extent4] ON [Extent3].[employeeID] = [Extent4].[employeeID]
                        LEFT OUTER JOIN [dbo].[Employee_Country] AS [Extent5] ON [Extent3].[employeeID] = [Extent5].[employeeID] ) AS [Join2] ON [Extent2].[employeeID] = [Join2].[employeeID2] ) AS [Join3] ON [Limit1].[companyID] = [Join3].[companyId1]
            )  AS [Project2]
        )  AS [Project3]
    )  AS [Project4]
    ORDER BY [Project4].[companyID] ASC, [Project4].[C3] ASC, [Project4].[employeeID] ASC, [Project4].[C2] ASC, [Project4].[employee_CarId] ASC, [Project4].[employeeID2] ASC, [Project4].[C1] ASC',N'@p__linq__0 int',@p__linq__0=2