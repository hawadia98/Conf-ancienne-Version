IF COL_LENGTH('UJ_TaskInstances', 'Agent_Id') IS NOT NULL
BEGIN
    SET NOEXEC ON; 
END

ALTER TABLE "uj_taskinstances" ADD "Agent_id" BIGINT NULL CONSTRAINT "FK_TaskInstances_Agent" FOREIGN KEY ("agent_id") REFERENCES "uc_agents" ("id");
GO
UPDATE "uj_taskinstances" SET "agent_id" = t."agent_id" FROM "uj_taskinstances" ti JOIN "uj_tasks" t ON ti."task_id" = t."id" WHERE t."agent_id" is not null;

SET NOEXEC OFF;

