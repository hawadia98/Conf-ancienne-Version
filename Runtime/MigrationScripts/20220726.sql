CREATE TABLE #TempTable
(
    DisplayTableColumnId bigint NOT NULL,
    PropertyId           bigint NOT NULL,
) INSERT INTO #TempTable(DisplayTableColumnId, PropertyId)
SELECT dtc.Id, (SELECT TOP 1 Property_Id FROM UM_BindingItems WHERE Binding_Id = dtc.DisplayBinding_Id ORDER BY [Order] desc)
FROM UI_DisplayTableColumns dtc
WHERE dtc.CanBeFiltered = 1 AND dtc.Tile_Id IS NULL

DECLARE @DisplayTableColumnId bigint;
DECLARE @PropertyId bigint;
DECLARE @PropertyType int;

While (Select Count(*) From #TempTable) > 0
Begin
	SET @DisplayTableColumnId = (SELECT TOP 1 DisplayTableColumnId FROM #TempTable);
	SET @PropertyId = (SELECT TOP 1 PropertyId FROM #TempTable);
	SET @PropertyType = (SELECT [Type] FROM UM_EntityProperties WHERE Id = @PropertyId);

	IF @PropertyType = 4
    BEGIN
        UPDATE UI_DisplayTableColumns SET CanBeFiltered = 0 WHERE Id = @DisplayTableColumnId;
    END

    Delete #TempTable Where DisplayTableColumnId = @DisplayTableColumnId
End

DROP TABLE #TempTable;
