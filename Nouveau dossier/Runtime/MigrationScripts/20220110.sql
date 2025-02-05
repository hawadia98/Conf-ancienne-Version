IF NOT EXISTS (
    SELECT id FROM uj_jobs WHERE id = 2147483648
)
BEGIN
    INSERT INTO uj_jobs(id, identifier, displayname_l1, userstartdenied, loglevel) VALUES (2147483648, 'PolicySimulationJob', 'Policy simulation job', 1, 6);
END

IF NOT EXISTS (
    SELECT id FROM uj_tasks WHERE id = 2147483648
)
BEGIN
    INSERT INTO uj_tasks(id, identifier, displayname_l1, tasktype, loglevel) VALUES (2147483648, 'PolicySimulationJob', 'Policy simulation job', 1, 6);
END

IF NOT EXISTS (
    SELECT id FROM uj_jobsteps WHERE id = 2147483648
)
BEGIN
    INSERT INTO uj_jobsteps(id, task_id, job_id, launchorder, level) VALUES (2147483648, 2147483648, 2147483648, 0, 0);
END

GO
