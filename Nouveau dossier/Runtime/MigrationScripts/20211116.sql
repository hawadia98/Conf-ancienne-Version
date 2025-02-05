UPDATE t
SET IgnoreCookieFile = 1
FROM UJ_Tasks t
JOIN UC_Connections c ON t.ConnectionIdentifier = c.Identifier
WHERE c.Package521_Id = -21;
GO
