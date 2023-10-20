CREATE OR REPLACE VIEW sttgaz.dm_creatio_metrics AS
SELECT
	NavCriterionOne,
	NavCriterionTwo,
	NavCriterionThree,
	NavCriterionFour,
	NavCriterionFive,
	NavCriterionSix,
	TsiName,
	TsiNotes,
	TsiIsActive,
	TsiDescription,
	tpt.Name 			AS TsiPollType_NAME,
	tpt.Description 	AS TsiPollType_DESCRIPTION,
	cs.Name				AS NavConversationScript_NAME,
	cs.Description 		AS NavConversationScriptId_DESCRIPTION,
	cs.Code  			AS NavConversationScriptId_CODE,
	ncst.Name 			AS NavConversationScriptType_NAME,
	ncst.Description 	AS NavConversationScriptType_DESCRIPTION,
	nps.Name 			AS NavPollStatus_NAME,
	nps.Description 	AS NavPollStatus_DESCRIPTION,
	nqt.Name			AS NavQuotaType_NAME, 
	nqt.Description		AS NavQuotaType_DESCRIPTION,
	per.Name			AS Period_NAME,
	per.Description 	AS Period_DESCRIPTION,
	cnt.Name			AS Country_NAME,
	cnt.Description		AS Country_DESCRIPTION,
	npd.Name 			AS direction_NAME,
	npd.Description 	AS direction_DESCRIPTION,
	NavEndDate,
	NavStartDate,
	NavPurpose,
	NavQuotaResultNumber,
	NavQuotaResultPercent,
	NavLeftForTagret,
	NavTargetNumber,
	NavTargetCompletionPercent,
	NavPickingFilter,
	NavCallAttemptsNumber,
	NavQuotaNumber,
	NavQuotaPercent,
	NavPeriod,
	NavTotalNps,
	NavNpsCalculationActive,
	NavNewsletterActive,
	ct.Name 			AS NpsCalculationType_NAME,
	ct.Description 		AS NpsCalculationType_DESCRIPTION,
	a.Name 				AS Account_NAME,
	a.Description 		AS Account_DESCRIPTION,
	atp.Name			AS AccountType_NAME, 
	atp.Description 	AS AccountType_DESCRIPTION,
	a.Code 				AS Account_CODE,
	a.Phone 			AS Account_PHONE,
	a.Address 			AS Account_ADDRESS,
	a.CityId 			AS Account_CITY,
	r.name 				AS Account_Region_NAME,
	r.Description 		AS Account_Region_DESCRIPTION,
	a.AlternativeName 	AS Account_ALTERNATIVE_NAME,
	yn.name 			AS NavFinalBonus_NAME,
	yn.Description 		AS NavFinalBonus_DESCRIPTION,
	cst.name 			AS ConversationScriptType_NAME,
	cst.Description		AS ConversationScriptType_DESCRIPTION
FROM sttgaz.stage_creatio_NavNpsCalcutaion 					c 
LEFT JOIN sttgaz.stage_creatio_TsiPoll 						tp
	ON c.NavPollId = tp.Id
LEFT JOIN sttgaz.stage_creatio_NavNpsCalculationType 		ct
	ON c.NavCalculationTypeId = ct.Id
LEFT JOIN sttgaz.stage_creatio_Account 						a 
	ON c.NavAccountId = a.id
LEFT JOIN sttgaz.stage_creatio_NavGeoRegion 				r 
	ON a.RegionId = r.Id
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
	ON a.TypeId  = atp.id;