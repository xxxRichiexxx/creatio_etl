
CREATE OR REPLACE VIEW sttgaz.dm_creatio_metrics AS
WITH 
sq1 AS(
	SELECT DISTINCT
		NavCriterionOne								AS "Критерий 1. % удовлетворенных клиентов  (75%)",
		NavCriterionTwo								AS "Критерий 2. NPS - индекс лояльности клиентов (75%)",
		NavCriterionThree							AS "Критерий 3. Негативные отзывы персонала о марке ГАЗ (0 шт.)",
		NavCriterionFour							AS "Критерий 4. % Кл-в с неверным номером телефона (10%)",
		NavCriterionFive							AS "Критерий 5. % Кл-в, которым не звонили после посещ авто-на (30%)",
		NavCriterionSix,
		TsiName,
		--TsiNotes,
		TsiIsActive,
		TsiDescription,
		--tpt.Name 			AS TsiPollType_NAME,
		--tpt.Description 	AS TsiPollType_DESCRIPTION,
		--cs.Name				AS NavConversationScript_NAME,
		--cs.Description 		AS NavConversationScriptId_DESCRIPTION,
		--cs.Code  			AS NavConversationScriptId_CODE,
		--ncst.Name 			AS NavConversationScriptType_NAME,
		--ncst.Description 	AS NavConversationScriptType_DESCRIPTION,
		--nps.Name 			AS NavPollStatus_NAME,
		--nps.Description 	AS NavPollStatus_DESCRIPTION,
		--nqt.Name			AS NavQuotaType_NAME, 
		--nqt.Description		AS NavQuotaType_DESCRIPTION,
		CASE
			WHEN SPLIT_PART(per.Name, ' ', 1) = 'January'
				THEN SPLIT_PART(per.Name, ' ', 2) || '-01' || '-01'
			WHEN SPLIT_PART(per.Name, ' ', 1) = 'February'
				THEN SPLIT_PART(per.Name, ' ', 2) || '-02' || '-01'
			WHEN SPLIT_PART(per.Name, ' ', 1) = 'March'
				THEN SPLIT_PART(per.Name, ' ', 2) || '-03' || '-01'
			WHEN SPLIT_PART(per.Name, ' ', 1) = 'April'
				THEN SPLIT_PART(per.Name, ' ', 2) || '-04' || '-01'
			WHEN SPLIT_PART(per.Name, ' ', 1) = 'May'
				THEN SPLIT_PART(per.Name, ' ', 2) || '-05' || '-01'
			WHEN SPLIT_PART(per.Name, ' ', 1) = 'June'
				THEN SPLIT_PART(per.Name, ' ', 2) || '-06' || '-01'
			WHEN SPLIT_PART(per.Name, ' ', 1) = 'July'
				THEN SPLIT_PART(per.Name, ' ', 2) || '-07' || '-01'
			WHEN SPLIT_PART(per.Name, ' ', 1) = 'August'
				THEN SPLIT_PART(per.Name, ' ', 2) || '-08' || '-01'
			WHEN SPLIT_PART(per.Name, ' ', 1) = 'September'
				THEN SPLIT_PART(per.Name, ' ', 2) || '-09' || '-01'
			WHEN SPLIT_PART(per.Name, ' ', 1) = 'October'
				THEN SPLIT_PART(per.Name, ' ', 2) || '-10' || '-01'
			WHEN SPLIT_PART(per.Name, ' ', 1) = 'November'
				THEN SPLIT_PART(per.Name, ' ', 2) || '-11' || '-01'
			WHEN SPLIT_PART(per.Name, ' ', 1) = 'December'
				THEN SPLIT_PART(per.Name, ' ', 2) || '-12' || '-01'
		END AS Period_NAME,
		--per.Description 	AS Period_DESCRIPTION,
		--cnt.Name			AS Country_NAME,
		--cnt.Description		AS Country_DESCRIPTION,
		npd.Name 			AS direction_NAME,
		--npd.Description 	AS direction_DESCRIPTION,
		--NavEndDate,
		--NavStartDate,
		NavPurpose,
		--NavQuotaResultNumber,
		--NavQuotaResultPercent,
		--NavLeftForTagret,
		--NavTargetNumber,
		--NavTargetCompletionPercent,
		--NavPickingFilter,
		--NavCallAttemptsNumber,
		--NavQuotaNumber,
		--NavQuotaPercent,
		--NavPeriod,
		NavTotalNps,
		--NavNpsCalculationActive,
		NavNewsletterActive,
		c.NavRegionId		AS Region_ID,
		r2.name 			AS Region_NAME,
		ct.Name 			AS NpsCalculationType_NAME,
		--ct.Description 		AS NpsCalculationType_DESCRIPTION,
		a.Id 				AS Account_ID,
		a.Name 				AS Account_NAME,
		a.ParentId			AS Account_ParentId,
		--a.Description 		AS Account_DESCRIPTION,
		atp.Name			AS AccountType_NAME, 
		--atp.Description 	AS AccountType_DESCRIPTION,
		a.Code 				AS Account_CODE,
		a.Phone 			AS Account_PHONE,
		a.Address 			AS Account_ADDRESS,
		a.CityId 			AS Account_CITY,
		r.Id				AS Account_Region_ID,
		r.name 				AS Account_Region_NAME,
		--r.Description 		AS Account_Region_DESCRIPTION,
		--a.AlternativeName 	AS Account_ALTERNATIVE_NAME,
		--yn.name 			AS NavFinalBonus_NAME
		--yn.Description 		AS NavFinalBonus_DESCRIPTION,
		--cst.name 			AS ConversationScriptType_NAME,
		--cst.Description		AS ConversationScriptType_DESCRIPTION
		ROW_NUMBER() OVER (PARTITION BY per.Name, TsiName, AccountType_NAME, a.Name ORDER BY c.ModifiedOn DESC) AS r1,
		ROW_NUMBER() OVER (PARTITION BY per.Name, TsiName, NpsCalculationType_NAME, Region_ID ORDER BY c.ModifiedOn DESC) AS r2
	FROM sttgaz.stage_creatio_NavNpsCalcutaion 					c 
	LEFT JOIN sttgaz.stage_creatio_TsiPoll 						tp
		ON c.NavPollId = tp.Id
	LEFT JOIN sttgaz.stage_creatio_NavNpsCalculationType 		ct
		ON c.NavCalculationTypeId = ct.Id
	LEFT JOIN sttgaz.stage_creatio_Account 						a 
		ON c.NavAccountId = a.id
	LEFT JOIN sttgaz.stage_creatio_NavGeoRegion 				r 
		ON a.NavGeoRegionId = r.Id
	LEFT JOIN sttgaz.stage_creatio_NavGeoRegion 				r2 
		ON c.NavRegionId = r.Id
	LEFT JOIN sttgaz.stage_creatio_NavYesNo 					yn
		ON c.NavFinalBonusId = yn.Id
	LEFT JOIN sttgaz.stage_creatio_NavConversationScriptType 	cst 
		ON c.NavConversationScriptTypeId = ct.Id
	LEFT JOIN sttgaz.stage_creatio_TsiPollType 					tpt 
		ON tp.TsiTypeId = tpt.id
	LEFT JOIN sttgaz.stage_creatio_ConversationScript 			cs 
		ON tp.NavConversationScriptId = cs.id
	LEFT JOIN sttgaz.stage_creatio_NavConversationScriptType 	ncst  
		ON cs.NavTypeId  = ncst.id
	LEFT JOIN sttgaz.stage_creatio_NavPollStatus 				nps 
		ON tp.NavStatusId =nps.Id
	LEFT JOIN sttgaz.stage_creatio_NavQuotaType 				nqt
		ON tp.NavQuotaTypeId = nqt.Id
	LEFT JOIN sttgaz.stage_creatio_Period 						per
		ON tp.NavDealOrServicePeriodId = per.id
	LEFT JOIN sttgaz.stage_creatio_Country 						cnt 
		ON tp.NavCountryId = c.id
	LEFT JOIN sttgaz.stage_creatio_NavPollDirection 			npd
		ON tp.NavPollDirectionId = npd.id
	LEFT JOIN sttgaz.stage_creatio_AccountType 					atp
		ON a.TypeId  = atp.id
	--WHERE
		-- per.Name ='October 2023'
		-- AND
		-- NpsCalculationType_NAME = 'Регион'
	ORDER BY Account_NAME
),
sq2 AS (
	SELECT *
	FROM sq1
	WHERE r1=1 AND AccountType_NAME IN ('Головная организация', 'Дилерский центр', 'СТО')
	UNION 
	SELECT *
	FROM sq1
	WHERE r2=1 AND NpsCalculationType_NAME = 'Регион'
)
SELECT
	Period_NAME,
	NavPurpose,
	direction_NAME,
	Account_ID,
	Account_NAME,
	Account_CODE,
	AccountType_NAME,
	NpsCalculationType_NAME,
	Account_ParentId,
	Account_Region_ID,
	Region_ID,
	AVG("Критерий 1. % удовлетворенных клиентов  (75%)")							AS "Критерий 1. % удовлетворенных клиентов  (75%)",
	AVG("Критерий 2. NPS - индекс лояльности клиентов (75%)")						AS "Критерий 2. NPS - индекс лояльности клиентов (75%)",
	AVG("Критерий 3. Негативные отзывы персонала о марке ГАЗ (0 шт.)")				AS "Критерий 3. Негативные отзывы персонала о марке ГАЗ (0 шт.)",
	AVG("Критерий 4. % Кл-в с неверным номером телефона (10%)")						AS "Критерий 4. % Кл-в с неверным номером телефона (10%)",
	AVG("Критерий 5. % Кл-в, которым не звонили после посещ авто-на (30%)")			AS "Критерий 5. % Кл-в, которым не звонили после посещ авто-на (30%)"
FROM sq2
GROUP BY
	Period_NAME,
	NavPurpose,
	direction_NAME,
	Account_ID,
	Account_NAME,
	Account_CODE,
	AccountType_NAME,
	NpsCalculationType_NAME,
	Account_ParentId,
	Account_Region_ID,
	Region_ID;
