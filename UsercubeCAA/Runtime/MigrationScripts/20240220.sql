IF COL_LENGTH('dbo.UT_AssignedTinyInts', 'AssignedResourceType_Id') IS NULL
    BEGIN
        CREATE TABLE "UT_AssignedTinyInts" (
            [AssignedResourceType_Id] [bigint] NOT NULL,
            [OwnerType] [bigint] NULL,
            [Owner_Id] [bigint] NULL,
            [Value] [tinyint] NOT NULL,
             CONSTRAINT [CK_AssignedTinyInts] UNIQUE CLUSTERED
                 (
                 [OwnerType] ASC,
                 [Owner_Id] ASC,
                 [AssignedResourceType_Id] ASC
        ));
    END
GO
