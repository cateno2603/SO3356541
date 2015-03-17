exec sp_executesql N'SELECT 
    [Project4].[companyID] AS [companyID], 
    [Project4].[Name] AS [Name], 
    [Project4].[C12] AS [C1], 
    [Project4].[C2] AS [C2], 
    [Project4].[C3] AS [C3], 
    [Project4].[C4] AS [C4], 
    [Project4].[C5] AS [C5], 
    [Project4].[C1] AS [C6], 
    [Project4].[C6] AS [C7], 
    [Project4].[C7] AS [C8], 
    [Project4].[C8] AS [C9], 
    [Project4].[C9] AS [C10], 
    [Project4].[C10] AS [C11], 
    [Project4].[C11] AS [C12]
    FROM ( SELECT 
        [Limit1].[companyID] AS [companyID], 
        [Limit1].[Name] AS [Name], 
        [UnionAll1].[C1] AS [C1], 
        [UnionAll1].[employeeID] AS [C2], 
        [UnionAll1].[employeeID1] AS [C3], 
        [UnionAll1].[companyId] AS [C4], 
        [UnionAll1].[Name] AS [C5], 
        [UnionAll1].[employee_CarId] AS [C6], 
        [UnionAll1].[employeeID2] AS [C7], 
        [UnionAll1].[Name1] AS [C8], 
        [UnionAll1].[C2] AS [C9], 
        [UnionAll1].[C3] AS [C10], 
        [UnionAll1].[C4] AS [C11], 
        CASE WHEN ([UnionAll1].[employeeID] IS NULL) THEN CAST(NULL AS int) ELSE 1 END AS [C12]
        FROM   (SELECT TOP (1) 
            [Extent1].[companyID] AS [companyID], 
            [Extent1].[Name] AS [Name]
            FROM [dbo].[Company] AS [Extent1]
            WHERE [Extent1].[companyID] = @p__linq__0 ) AS [Limit1]
        OUTER APPLY  (SELECT 
            CASE WHEN ([Extent3].[employee_CarId] IS NULL) THEN CAST(NULL AS int) ELSE 1 END AS [C1], 
            [Extent2].[employeeID] AS [employeeID], 
            [Extent2].[employeeID] AS [employeeID1], 
            [Extent2].[companyId] AS [companyId], 
            [Extent2].[Name] AS [Name], 
            [Extent3].[employee_CarId] AS [employee_CarId], 
            [Extent3].[employeeID] AS [employeeID2], 
            [Extent3].[Name] AS [Name1], 
            CAST(NULL AS int) AS [C2], 
            CAST(NULL AS int) AS [C3], 
            CAST(NULL AS varchar(1)) AS [C4]
            FROM  [dbo].[Employee] AS [Extent2]
            LEFT OUTER JOIN [dbo].[Employee_Car] AS [Extent3] ON [Extent2].[employeeID] = [Extent3].[employeeID]
            WHERE [Limit1].[companyID] = [Extent2].[companyId]
        UNION ALL
            SELECT 
            2 AS [C1], 
            [Extent4].[employeeID] AS [employeeID], 
            [Extent4].[employeeID] AS [employeeID1], 
            [Extent4].[companyId] AS [companyId], 
            [Extent4].[Name] AS [Name], 
            CAST(NULL AS int) AS [C2], 
            CAST(NULL AS int) AS [C3], 
            CAST(NULL AS varchar(1)) AS [C4], 
            [Extent5].[Employee_CountryId] AS [Employee_CountryId], 
            [Extent5].[employeeID] AS [employeeID2], 
            [Extent5].[Name] AS [Name1]
            FROM  [dbo].[Employee] AS [Extent4]
            INNER JOIN [dbo].[Employee_Country] AS [Extent5] ON [Extent4].[employeeID] = [Extent5].[employeeID]
            WHERE [Limit1].[companyID] = [Extent4].[companyId]) AS [UnionAll1]
    )  AS [Project4]
    ORDER BY [Project4].[companyID] ASC, [Project4].[C12] ASC, [Project4].[C3] ASC, [Project4].[C1] ASC',N'@p__linq__0 int',@p__linq__0=2