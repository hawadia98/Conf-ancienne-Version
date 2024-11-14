UPDATE UP_RiskRules
SET "order" = riskRuleWithNewOrder.NewOrder
FROM (
         select id, ROW_NUMBER() OVER(PARTITION BY risk_id ORDER BY risk_id) as NewOrder
         from UP_RiskRules
     ) riskRuleWithNewOrder
WHERE
        UP_RiskRules.id = riskRuleWithNewOrder.id
