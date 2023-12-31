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
	Id VARCHAR(1000) NOT NULL,
	CreatedOn TIMESTAMP NULL,
	CreatedById VARCHAR(1000) NULL,
	ModifiedOn TIMESTAMP NULL,
	ModifiedById VARCHAR(1000) NULL,
	Name varchar(500) NOT NULL,
	Description varchar(250) NOT NULL,
	OwnershipId VARCHAR(1000) NULL,
	PrimaryContactId VARCHAR(1000) NULL,
	ParentId VARCHAR(1000) NULL,
	OwnerId VARCHAR(1000) NULL,
	IndustryId VARCHAR(1000) NULL,
	Code varchar(250) NOT NULL,
	TypeId VARCHAR(1000) NULL,
	Phone varchar(250) NOT NULL,
	AdditionalPhone varchar(250) NOT NULL,
	Fax varchar(250) NOT NULL,
	Web varchar(250) NOT NULL,
	AddressTypeId VARCHAR(1000) NULL,
	Address varchar(3000) NOT NULL,
	CityId VARCHAR(1000) NULL,
	RegionId VARCHAR(1000) NULL,
	Zip varchar(50) NOT NULL,
	CountryId VARCHAR(1000) NULL,
	AccountCategoryId VARCHAR(1000) NULL,
	EmployeesNumberId VARCHAR(1000) NULL,
	AnnualRevenueId VARCHAR(1000) NULL,
	Notes varchar(3000) NOT NULL,
	Logo varchar(3000) NULL,
	AlternativeName varchar(250) NOT NULL,
	ProcessListeners int NOT NULL,
	GPSN varchar(50) NOT NULL,
	GPSE varchar(50) NOT NULL,
	PriceListId VARCHAR(1000) NULL,
	Completeness int NOT NULL,
	AccountLogoId VARCHAR(1000) NULL,
	AUM varchar(250) NOT NULL,
	BnzScopeOfUseId VARCHAR(1000) NULL,
	BnzKpp varchar(50) NOT NULL,
	BnzInn varchar(50) NOT NULL,
	BnzDCCode varchar(50) NOT NULL,
	InfWorkStartDate date NULL,
	InfCalendarId VARCHAR(1000) NULL,
	NavGeoRegionId VARCHAR(1000) NULL,
	NavMDMCode varchar(250)  NOT NULL,
	RecordInactive BOOL NOT NULL,
	NavReferenceRecordId VARCHAR(1000) NULL,
	NavIsDuplicate BOOL NOT NULL,
	NavHeadAccountId VARCHAR(1000) NULL,
	NavKindId VARCHAR(1000) NULL,
	NavFullName varchar(500) NOT NULL,
	NavOgrn varchar(250) NOT NULL,
	NavBank varchar(250) NOT NULL,
	NavBik varchar(250) NOT NULL,
	NavEstimatedCheck varchar(250) NOT NULL,
	NavCorrespondentCheck varchar(250) NOT NULL
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
	Description varchar(500) NOT NULL
);

DROP TABLE IF EXISTS sttgaz.stage_creatio_ConversationScript;
CREATE TABLE sttgaz.stage_creatio_ConversationScript (
	Id VARCHAR NOT NULL,
	CreatedOn TIMESTAMP NULL,
	CreatedById VARCHAR NULL,
	ModifiedOn TIMESTAMP NULL,
	ModifiedById VARCHAR NULL,
	ProcessListeners int NOT NULL,
	Name varchar(250) NOT NULL,
	Notes varchar(500) NOT NULL,
	Description varchar(1000) NOT NULL,
	Code varchar(50) NOT NULL,
	EntityId VARCHAR NULL,
	NavVersion int NOT NULL,
	NavTypeId VARCHAR NULL
);

DROP TABLE IF EXISTS sttgaz.stage_creatio_NavPollStatus;
CREATE TABLE sttgaz.stage_creatio_NavPollStatus (
	Id VARCHAR NOT NULL,
	CreatedOn TIMESTAMP NULL,
	CreatedById VARCHAR NULL,
	ModifiedOn TIMESTAMP NULL,
	ModifiedById VARCHAR NULL,
	Name varchar(250) NOT NULL,
	Description varchar(250) NOT NULL,
	ProcessListeners int NOT NULL
);

DROP TABLE IF EXISTS sttgaz.stage_creatio_NavQuotaType;
CREATE TABLE sttgaz.stage_creatio_NavQuotaType (
	Id VARCHAR NOT NULL,
	CreatedOn TIMESTAMP NULL,
	CreatedById VARCHAR NULL,
	ModifiedOn TIMESTAMP NULL,
	ModifiedById VARCHAR NULL,
	Name varchar(250) NOT NULL,
	Description varchar(250) NOT NULL,
	ProcessListeners int NOT NULL
);

DROP TABLE IF EXISTS sttgaz.stage_creatio_Period;
CREATE TABLE sttgaz.stage_creatio_Period (
	Id VARCHAR NOT NULL,
	CreatedOn TIMESTAMP NULL,
	CreatedById VARCHAR NULL,
	ModifiedOn TIMESTAMP NULL,
	ModifiedById VARCHAR NULL,
	Name varchar(250) NOT NULL,
	Description varchar(250) NOT NULL,
	ProcessListeners int NOT NULL,
	StartDate date NULL,
	DueDate date NULL,
	PeriodTypeId VARCHAR NULL,
	YearId VARCHAR NULL,
	QuarterId VARCHAR NULL,
	ParentId VARCHAR NULL
);


DROP TABLE IF EXISTS sttgaz.stage_creatio_Country;
CREATE TABLE sttgaz.stage_creatio_Country (
	Id VARCHAR NOT NULL,
	CreatedOn TIMESTAMP NULL,
	CreatedById VARCHAR NULL,
	ModifiedOn TIMESTAMP NULL,
	ModifiedById VARCHAR NULL,
	Name varchar(250) NOT NULL,
	Description varchar(250) NOT NULL,
	Image VARCHAR(1500) NULL,
	BillingInfo VARCHAR(500) NOT NULL,
	ProcessListeners int NOT NULL,
	TimeZoneId VARCHAR NULL,
	Code varchar(50) NOT NULL,
	Alpha2Code varchar(50) NOT NULL,
	NavRegionCodeId VARCHAR NULL
);



DROP TABLE IF EXISTS sttgaz.stage_creatio_NavPollDirection;
CREATE TABLE sttgaz.stage_creatio_NavPollDirection (
	Id VARCHAR NOT NULL,
	CreatedOn TIMESTAMP NULL,
	CreatedById VARCHAR NULL,
	ModifiedOn TIMESTAMP NULL,
	ModifiedById VARCHAR NULL,
	Name varchar(250) NOT NULL,
	Description varchar(250) NOT NULL,
	ProcessListeners int NOT NULL
);

DROP TABLE IF EXISTS sttgaz.stage_creatio_AccountType;
CREATE TABLE sttgaz.stage_creatio_AccountType (
	Id VARCHAR NOT NULL,
	CreatedOn TIMESTAMP NULL,
	CreatedById VARCHAR NULL,
	ModifiedOn TIMESTAMP NULL,
	ModifiedById VARCHAR NULL,
	Name varchar(250) NOT NULL,
	Description varchar(250) NOT NULL,
	ProcessListeners int NOT NULL
);
