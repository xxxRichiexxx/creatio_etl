DROP TABLE IF EXISTS sttgaz.stage_creatio_NavNpsCalcutaion;
CREATE TABLE sttgaz.stage_creatio_NavNpsCalcutaion (
	Id VARCHAR,
	CreatedOn TIMESTAMP,
	CreatedById VARCHAR,
	ModifiedOn TIMESTAMP,
	ModifiedById VARCHAR,
	ProcessListeners VARCHAR,
	NavFinalBonusId VARCHAR,
	NavCriterionFive decimal(18,2),
	NavCriterionFour decimal(18,2),
	NavCriterionThree VARCHAR,
	NavCriterionTwo decimal(18,2),
	NavCriterionOne decimal(18,2),
	NavCalculationTypeId VARCHAR,
	NavAccountId VARCHAR,
	NavRegionId VARCHAR,
	NavPollId VARCHAR,
	NavConversationScriptTypeId VARCHAR,
	NavCriterionSix VARCHAR
);

DROP TABLE IF EXISTS sttgaz.stage_creatio_TsiPoll;
CREATE TABLE sttgaz.stage_creatio_TsiPoll (
	Id VARCHAR,
	CreatedOn TIMESTAMP NULL,
	CreatedById  VARCHAR,
	ModifiedOn TIMESTAMP NULL,
	ModifiedById  VARCHAR,
	ProcessListeners int NOT NULL,
	TsiName VARCHAR(250),
	TsiNotes VARCHAR,
	TsiIsActive BOOL NOT NULL,
	TsiOwnerId VARCHAR,
	TsiDescription VARCHAR(250),
	TsiTypeId  VARCHAR,
	Notes VARCHAR,
	NavEndDate date NULL,
	NavStartDate date NULL,
	NavPurpose VARCHAR(250),
	NavQuotaResultNumber int NOT NULL,
	NavQuotaResultPercent decimal(18,1) NOT NULL,
	NavLeftForTagret int NOT NULL,
	NavTargetNumber int NOT NULL,
	NavTargetCompletionPercent decimal(18,2) NOT NULL,
	NavPickingFilter VARCHAR(250),
	NavCallAttemptsNumber int NOT NULL,
	NavParentPollId  VARCHAR,
	NavQuotaNumber int NOT NULL,
	NavQuotaPercent decimal(18,1) NOT NULL,
	NavPeriod int NOT NULL,
	NavConversationScriptId  VARCHAR,
	NavStatusId  VARCHAR,
	NavQuotaTypeId  VARCHAR,
	RecordInactive BOOL NOT NULL,
	NavTotalNps decimal(18,2) NOT NULL,
	NavDealOrServicePeriodId  VARCHAR,
	NavCountryId  VARCHAR,
	NavNpsCalculationActive BOOL NOT NULL,
	NavNewsletterActive BOOL NOT NULL,
	NavPollDirectionId  VARCHAR
);

DROP TABLE IF EXISTS sttgaz.stage_creatio_NavNpsCalculationType;
CREATE TABLE sttgaz.stage_creatio_NavNpsCalculationType (
	Id VARCHAR,
	CreatedOn TIMESTAMP,
	CreatedById VARCHAR,
	ModifiedOn TIMESTAMP,
	ModifiedById VARCHAR,
	Name VARCHAR,
	Description VARCHAR,
	ProcessListeners int
);
