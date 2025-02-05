ALTER TABLE "UU_EntityInstances" ADD "FilterEntityInstance_Id" BIGINT NULL;
ALTER TABLE "UU_EntityInstances" ADD CONSTRAINT "FK_EntityInstances_FilterEntityInstance" FOREIGN KEY("FilterEntityInstance_Id") REFERENCES "UU_EntityInstances" ("Id");
ALTER TABLE "UU_EntityInstances" NOCHECK CONSTRAINT "FK_EntityInstances_FilterEntityInstance";
GO
