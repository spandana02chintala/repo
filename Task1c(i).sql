SELECT pro.[Name] AS PropertyName, ownpro.PropertyId, 

tenpro.[StartDate],tenpro.[EndDate] ,tenpayfre.[Name] AS PaymentFrequencies, prorenpay.Amount AS RentalPaymentAmount,

ROUND(ISNULL(CASE

WHEN tenpayfre.[Name] = 'Weekly' THEN prorenpay.Amount*52

WHEN tenpayfre.[Name] = 'Fortnightly' THEN prorenpay.Amount*26

WHEN tenpayfre.[Name] = 'Monthly' THEN prorenpay.Amount*12

ELSE null END/52*DATEDIFF(Week,tenpro.StartDate,tenpro.EndDate),0),2) AS TotalPayment

FROM [dbo].[OwnerProperty] ownpro

INNER JOIN [dbo].[Property] pro ON ownpro.PropertyId = pro.Id

INNER JOIN [dbo].[PropertyRentalPayment] prorenpay ON pro.Id = prorenpay.[PropertyId]

INNER JOIN [dbo].[PropertyFinance] profin ON pro.Id = profin.[PropertyId] 


INNER JOIN [dbo].[TenantProperty] tenpro ON ownpro.PropertyId = tenpro.PropertyId

INNER JOIN [dbo].[TenantPaymentFrequencies] tenpayfre ON tenpro.[PaymentFrequencyId]=tenpayfre.Id

WHERE ownpro.OwnerId=1426 