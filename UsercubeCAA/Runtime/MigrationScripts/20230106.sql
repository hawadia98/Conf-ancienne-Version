DELETE
FROM UP_RoleMappingRuleItems
WHERE Id IN
      (SELECT Id
       FROM
           (SELECT Id,
                   ROW_NUMBER() OVER (PARTITION BY RoleMappingRule_Id,
                                                   Property_Id,
                                                   OPERATOR,
                                                   Value
                                                   ORDER BY Id) AS rowNumber
           FROM UP_RoleMappingRuleItems rmri
           JOIN UD_ConfigurationFileItems cfi ON cfi.Item_Id=rmri.Id
           AND cfi.TableName='up_rolemappingruleitems') t
       WHERE t.rowNumber > 1);
GO