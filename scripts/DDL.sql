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


DROP TABLE IF EXISTS sttgaz.stage_creatio_Account;
CREATE TABLE sttgaz.stage_creatio_Account (
	Id VARCHAR NOT NULL,
	CreatedOn TIMESTAMP NULL,
	CreatedById VARCHAR NULL,
	ModifiedOn TIMESTAMP NULL,
	ModifiedById VARCHAR NULL,
	Name VARCHAR(500) NOT NULL,
	Description VARCHAR NOT NULL,
	OwnershipId VARCHAR NULL,
	PrimaryContactId VARCHAR NULL,
	ParentId VARCHAR NULL,
	OwnerId VARCHAR NULL,
	IndustryId VARCHAR NULL,
	Code VARCHAR NOT NULL,
	TypeId VARCHAR NULL,
	Phone VARCHAR NOT NULL,
	AdditionalPhone VARCHAR NOT NULL,
	Fax VARCHAR NOT NULL,
	Web VARCHAR(250) NOT NULL,
	AddressTypeId VARCHAR NULL,
	Address VARCHAR(500) NOT NULL,
	CityId VARCHAR NULL,
	RegionId VARCHAR NULL,
	Zip VARCHAR NOT NULL,
	CountryId VARCHAR NULL,
	AccountCategoryId VARCHAR NULL,
	EmployeesNumberId VARCHAR NULL,
	AnnualRevenueId VARCHAR NULL,
	Notes VARCHAR NOT NULL,
	Logo VARCHAR NULL,
	AlternativeName VARCHAR(250) NOT NULL,
	ProcessListeners int NOT NULL,
	GPSN VARCHAR NOT NULL,
	GPSE VARCHAR NOT NULL,
	PriceListId VARCHAR NULL,
	Completeness int NOT NULL,
	AccountLogoId VARCHAR NULL,
	AUM VARCHAR NOT NULL,
	BnzScopeOfUseId VARCHAR NULL,
	BnzKpp VARCHAR NOT NULL,
	BnzInn VARCHAR NOT NULL,
	BnzDCCode VARCHAR NOT NULL,
	InfWorkStartDate date NULL,
	InfCalendarId VARCHAR NULL,
	NavGeoRegionId VARCHAR NULL,
	NavMDMCode VARCHAR NOT NULL,
	RecordInactive BOOL NOT NULL,
	NavReferenceRecordId VARCHAR NULL,
	NavIsDuplicate BOOL NOT NULL
);



DROP TABLE IF EXISTS sttgaz.stage_creatio_NavGeoRegion;
CREATE TABLE sttgaz.stage_creatio_NavGeoRegion (
	Id VARCHAR NOT NULL,
	CreatedOn TIMESTAMP NULL,
	CreatedById VARCHAR NULL,
	ModifiedOn TIMESTAMP NULL,
	ModifiedById VARCHAR NULL,
	Name varchar(250) NOT NULL,
	Description varchar(250) NOT NULL,
	ProcessListeners int NOT NULL,
	NavCountryId VARCHAR NULL
);

DROP TABLE IF EXISTS sttgaz.stage_creatio_NavYesNo;
CREATE TABLE sttgaz.stage_creatio_NavYesNo (
	Id VARCHAR NOT NULL,
	CreatedOn TIMESTAMP NULL,
	CreatedById VARCHAR NULL,
	ModifiedOn TIMESTAMP NULL,
	ModifiedById VARCHAR NULL,
	Name varchar(250) NOT NULL,
	Description varchar(250) NOT NULL,
	ProcessListeners int NOT NULL
);

DROP TABLE IF EXISTS sttgaz.stage_creatio_NavConversationScriptType;
CREATE TABLE sttgaz.stage_creatio_NavConversationScriptType (
	Id VARCHAR NOT NULL,
	CreatedOn TIMESTAMP NULL,
	CreatedById VARCHAR NULL,
	ModifiedOn TIMESTAMP NULL,
	ModifiedById VARCHAR NULL,
	Name varchar(250) NOT NULL,
	Description varchar(250) NOT NULL,
	ProcessListeners int NOT NULL
);

DROP TABLE IF EXISTS sttgaz.stage_creatio_TsiPollType;
CREATE TABLE sttgaz.stage_creatio_TsiPollType (
	Id VARCHAR NOT NULL,
	Name varchar(250) NOT NULL,
	CreatedOn TIMESTAMP NULL,
	CreatedById VARCHAR NULL,
	ModifiedOn TIMESTAMP NULL,
	ModifiedById VARCHAR NULL,
	ProcessListeners int NOT NULL,
	Description varchar(250) NOT NULL
);