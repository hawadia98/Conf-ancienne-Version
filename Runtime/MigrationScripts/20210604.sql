/* 5.2 */
/* FIX #36448 - fix provisioning review filter computing */
declare @CreationAwaitingVerification TINYINT = 1,
        @CorrelationAwaitingVerification TINYINT = 2,
        @UpdateAwaitingVerification TINYINT = 4,
        @DeleteAwaitingVerification TINYINT = 8,
        @FoundOrHistoryWithoutResource TINYINT = 16,
        @Error TINYINT = 32;

UPDATE "up_assignedresourcetypes"
  SET "provisioningreviewfilter"=
    CASE
			-- assigned resource type is found or history
            WHEN ("workflowstate"=1 OR "workflowstate"=3) THEN
				CASE 
					-- without resource
					WHEN "resource_id" IS NULL THEN @FoundOrHistoryWithoutResource
					-- is awaiting correlation review
					WHEN "SourceMatchedConfidenceLevel" <> 0 AND "SourceMatchedConfidenceLevel" < 100 AND "isdenied"=0 THEN @CorrelationAwaitingVerification
                    ELSE 0
				END
			-- assigned resource type or its properties are blocked and awaiting verification
            WHEN "consolidatedworkflowblockedstate"=1 THEN
		        CASE
				-- blocked itself
				WHEN "provisioningstate"=5 THEN
					CASE 
						WHEN "isdenied"=1 THEN @DeleteAwaitingVerification
						WHEN "resource_id" IS NULL THEN @CreationAwaitingVerification
						ELSE @CorrelationAwaitingVerification 
					END
				-- one or more properties are blocked
				ELSE @UpdateAwaitingVerification
		        END
	        ELSE 0
        END
	    | CASE WHEN "consolidatedprovisioningstate"&32=32 THEN @Error ELSE 0 END
from up_assignedresourcetypes
WHERE "validto"=CONVERT(datetime2(2),'9999-12-31 23:59:59.99')
