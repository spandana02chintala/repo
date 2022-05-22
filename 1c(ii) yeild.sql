SELECT pro.[Name] AS PropertyName, ownpro.PropertyId,

tenpro.[StartDate],TENPRO.[EndDate],

tenpayfre.[Name] AS PaymentFrequencies, prenpay.Amount AS RentalPaymentAmount,

ROUND(ISNULL(CASE

WHEN tenpayfre.[Name] = 'Weekly' THEN prenpay.Amount*52

WHEN tenpayfre.[Name] = 'Fortnightly' THEN prenpay.Amount*26

WHEN tenpayfre.[Name] = 'Monthly' THEN prenpay.Amount*12

ELSE null END/52*DATEDIFF(Week,tenpro.StartDate,tenpro.EndDate),0),2) AS TotalPayment,

ISNULL(((CASE

WHEN tenpayfre.[Name] = 'Weekly' THEN prenpay.Amount*52

WHEN tenpayfre.[Name] = 'Fortnightly' THEN prenpay.Amount*26

WHEN tenpayfre.[Name] = 'Monthly' THEN prenpay.Amount*12

ELSE NULL END/52*DATEDIFF(Week,tenpro.StartDate,tenpro.EndDate)-profin.[TotalExpense])/profin.[CurrentHomeValue]),0)*100 AS Yeild

FROM [dbo].[OwnerProperty] ownpro

INNER JOIN [dbo].[Property] pro ON ownpro.PropertyId = pro.Id
 
INNER JOIN [dbo].[PropertyRentalPayment] prenpay ON pro.Id = prenpay.[PropertyId]

INNER JOIN [dbo].[PropertyFinance] profin ON pro.Id = profin.[PropertyId] 
 

INNER JOIN [dbo].[TenantProperty] tenpro ON ownpro.PropertyId = tenpro.PropertyId

INNER JOIN [dbo].[TenantPaymentFrequencies] tenpayfre ON tenpro.[PaymentFrequencyId]=tenpayfre.Id

WHERE ownpro.OwnerId=1426 