DECLARE @actualTaskMinId BIGINT, @taskMinId BIGINT;
SELECT @actualTaskMinId = min(id)-1 from UJ_Tasks;
SET @taskMinId =
CASE
    WHEN @actualTaskMinId=0 THEN -1
    ELSE @actualTaskMinId
END;

insert into uj_tasks (Id, Identifier, DisplayName_L1, TaskType, Connector_Id, LogLevel, Level)
(select @taskMinId - row_number() over (order by Identifier), CONCAT(Identifier, '_ConnectorRefreshSchema'), CONCAT(Identifier, '_ConnectorRefreshSchema'), 52, Id, 6, -1 from UC_Connectors);

GO
