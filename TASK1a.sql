SELECT pro.[Name] PropertyName,pro.Id PropertyId 
FROM [dbo].[Property] pro 
INNER JOIN [dbo].[OwnerProperty] ownpro ON pro.Id=ownpro.[PropertyId]
WHERE ownpro.[OwnerId]=1426
