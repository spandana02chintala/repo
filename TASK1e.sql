SELECT pro.[Name]  AS PropertyName, 

CONCAT(per.[FirstName],' ', per.[LastName]) ,

TF.[Name] AS PaymentFrequency,

PR. [Amount] FROM [dbo].[Property] pro

INNER JOIN [dbo].[OwnerProperty] OP ON pro.Id=OP.PropertyId

INNER JOIN [dbo].[PropertyRentalPayment] PR ON PR.[PropertyId]= pro.Id

INNER JOIN [dbo].[TenantPaymentFrequencies] TF ON TF.[Id]=PR.FrequencyType

INNER JOIN [dbo].[TenantProperty] TP ON TP.[PropertyId]= pro.Id 

INNER JOIN [dbo].[Tenant] T ON TP.[TenantId]= T.Id

INNER JOIN [dbo].[Person] per ON T.[Id]=per.Id


 WHERE OP.[OwnerId]=1426  AND T.IsActive=1
