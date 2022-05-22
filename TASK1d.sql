Select P.Id AS PropertId,J.[Id] as JobId,J.JobDescription, JS.[Status] FROM [dbo].[Property] P
Inner JOIN [dbo].[Job] J ON J.[PropertyId]=P.[Id]
INNER JOIN [dbo].[JobMedia] JM ON JM.JobId=J.[Id]
INNER JOIN [dbo].[JobStatus] JS ON JS.[Id]=J.JobStatusId
WHERE JM.IsActive=1  AND 
JS.Status='open'