/* 1 if the Workforce module is configured */
SELECT DISTINCT 'HasWorkforce', MAX(IIF(generator = 40000, 1, 0)) FROM ud_scaffoldings
