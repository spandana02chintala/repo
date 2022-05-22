SELECT pro.[Name] AS PropertyName,
       pro.Id AS PropertyId,
	   profin.[CurrentHomeValue]  
	   FROM [dbo].[Property] pro
	   INNER JOIN [dbo].[OwnerProperty] ownpro ON pro.Id=ownpro.[PropertyId] 
	   INNER JOIN [dbo].[PropertyFinance] profin ON profin.PropertyId=pro.[Id]
       WHERE ownpro.[OwnerId]=1426