-------------------------------------
------- T_IDMA_August Tabelle -------
if exists(select * from sys.tables where name = 'T_IDMA_August')
drop table T_IDMA_August;

CREATE Table T_IDMA_August(
    PNR NVARCHAR(20) null,
    Nachname NVARCHAR(100) null,
    Vorname NVARCHAR(100) null,
    Kostenstellennummer FLOAT null,
    Kostenstellenbezeichnung VARCHAR(100) null,
    OE_Nummer INT null,
    OE_Bezeichnung NVARCHAR(100) null
);

BULK INSERT T_IDMA_August
FROM 'T_IDMA_August.csv'
WITH(
DATA_SOURCE = 'nuernberger_container', FORMAT = 'CSV', FIRSTROW=2, DELIMITER=';', ROWTERMINATOR='0x0a'
);

SELECT 
    TOP (1000) *
FROM 
    [dbo].[T_IDMA_August];

-------------------------------
------- PROJECT Tabelle -------

if exists(select * from sys.tables where name = 'PROJECT')
drop table PROJECT;

CREATE TABLE PROJECT(
    id INT not null,
    PNAME NVARCHAR(100) null,
    url NVARCHAR(200) null,
    lead NVARCHAR(50) null,
    description NVARCHAR(700) null,
    pkey NVARCHAR(50) null,
    pcounter INT null,
    assignetype INT null,
    avatar INT null,
    originalkey NVARCHAR(50) null,
    projecttype NVARCHAR(50) null
)

BULK INSERT PROJECT
FROM 'Tabelle PROJECT.csv'
WITH(
    DATA_SOURCE = 'nuernberger_container', FORMAT = 'CSV', FIRSTROW=2, DELIMITER=';', ROWTERMINATOR='0x0a'
);

SELECT 
    TOP (1000) *
FROM 
    [dbo].[PROJECT];


---------------------------------
------- jiraissue Tabelle -------
if exists(select * from sys.tables where name = 'jiraissue')
drop table jiraissue;


CREATE TABLE jiraissue(
    id INT not null
    ,pkey NVARCHAR(50) null
    ,issuenum INT null
    ,project INT null
    ,Reporter NVARCHAR(50) null
    ,assignee NVARCHAR(50) null
    ,creator NVARCHAR(50) null
    ,issuetype INT null
    ,summary NVARCHAR(300) null
    ,description VARCHAR(MAX) null
    ,environment NVARCHAR(50) null
    ,priority FLOAT null
    ,resolution FLOAT null
    ,issuestatus INT null
    ,created DATETIME null
    ,updated DATETIME null
    ,duedate DATETIME null
    ,resulutiondate DATETIME null
    ,votes INT null
    ,watches INT null
    ,timeestimate FLOAT null
    ,timeoriginalestimate FLOAT null
    ,timespent INT null
    ,worklflow_id INT null
    ,security  NVARCHAR(50) null
    ,fixfor  NVARCHAR(50) null
    ,component  NVARCHAR(50) null
    ,archievedby  NVARCHAR(50) null
    ,archiveddate DATETIME null
    ,archived  NVARCHAR(10) null
)

BULK INSERT jiraissue
FROM 'Tabelle jiraissue.csv'
WITH(
DATA_SOURCE = 'nuernberger_container', FORMAT='CSV', FIRSTROW=2, DELIMITER=';', ROWTERMINATOR='0x0a'
);

SELECT 
    TOP (100) *
FROM 
    [dbo].[jiraissue];

----------------------------------------
------- customfieldvalue Tabelle -------
if exists(select * from sys.tables where name = 'customfieldvalue')
drop table customfieldvalue;


CREATE TABLE customfieldvalue(
    id INT not null,
    issue INT null,
    customfield INT null,
    parentkey NVARCHAR(50) null,
    stringvalue NVARCHAR(50) null,
    numbervalue FLOAT null,
    textvalue NVARCHAR(50) null,
    datevalue DATETIME null,
    valuetype NVARCHAR(50) null,
    updated NVARCHAR(50) null,
);

BULK INSERT customfieldvalue
FROM 'Tabelle customfieldvalue.csv'
WITH(
DATA_SOURCE = 'nuernberger_container', FORMAT='CSV', FIRSTROW=2, DELIMITER=';', ROWTERMINATOR='0x0a'
);

SELECT 
    TOP (100) *
FROM 
    [dbo].[customfieldvalue];

---------------------------------------
------- nodeassociation Tabelle -------
if exists(select * from sys.tables where name = 'nodeassociation')
drop table nodeassociation;


CREATE TABLE nodeassociation(
    source_node_id INT not null,
    source_node_entity NVARCHAR(50) null,
    sink_node_id INT null,
    sink_node_entity NVARCHAR(50) null,
    association_type NVARCHAR(50) null,
    sequence NVARCHAR(50) null,
);

BULK INSERT nodeassociation
FROM 'Tabelle nodeassociaton.csv'
WITH(
DATA_SOURCE = 'nuernberger_container', FORMAT='CSV', FIRSTROW=2, DELIMITER=';', ROWTERMINATOR='0x0a'
);

SELECT 
    TOP (100) *
FROM 
    [dbo].[nodeassociation];

---------------------------------------
------- projectcategory Tabelle -------
if exists(select * from sys.tables where name = 'projectcategory')
drop table projectcategory;


CREATE TABLE projectcategory(
    id INT not NULL,
    cname NVARCHAR(50),
    description NVARCHAR(100) null,
);

BULK INSERT projectcategory
FROM 'Tabelle projectcategory.csv'
WITH(
DATA_SOURCE = 'nuernberger_container', FORMAT='CSV', FIRSTROW=2, DELIMITER=';', ROWTERMINATOR='0x0a'
);

SELECT 
    TOP (100) *
FROM 
    [dbo].[projectcategory];


---------------------------------------
------- worklog Tabelle -------
if exists(select * from sys.tables where name = 'worklog')
drop table worklog;


CREATE TABLE worklog(
    id INT not null,
    issueid INT null,
    author_neu NVARCHAR(50) null,
    grouplevel NVARCHAR(50) null,
    rolevel NVARCHAR(50) null,
    worklogbody NVARCHAR(2000) null,
    created DATETIME null,
    updateauthor NVARCHAR(50) null,
    updated DATETIME null,
    starttime DATETIME null,
    timeworked FLOAT null
);

BULK INSERT worklog
FROM 'Tabelle worklog.csv'
WITH(
DATA_SOURCE = 'nuernberger_container', FORMAT='CSV', FIRSTROW=2, DELIMITER=';', ROWTERMINATOR='0x0a'
);

SELECT 
    TOP (100) *
FROM 
    [dbo].[worklog];

---------------------------------------
------- customfield Tabelle -------
if exists(select * from sys.tables where name = 'customfield')
drop table customfield;


CREATE TABLE customfield(
    ID INT not null,
    customerfieldtypekey NVARCHAR(100) null,
    customerfieldsearchkey NVARCHAR(100) null,
    cfname NVARCHAR(50) null,
    description NVARCHAR(2000) null,
    defaultvalue NVARCHAR(50) null,
    fieldtype NVARCHAR(50) null,
    project NVARCHAR(50) null,
    issuetype NVARCHAR(50) null,
    cfkey NVARCHAR(50) null,
    lastvalueupdated DATETIME null,
    issueswithvalue FLOAT null
);

BULK INSERT customfield
FROM 'Top 1000 Tabelle customfield.csv'
WITH(
DATA_SOURCE = 'nuernberger_container', FORMAT='CSV', FIRSTROW=2, DELIMITER=';', ROWTERMINATOR='0x0a'
);

SELECT 
    TOP (100) *
FROM 
    [dbo].[customfield];

---------------------------------------
------- customfieldoption Tabelle -------
if exists(select * from sys.tables where name = 'customfieldoption')
drop table customfieldoption;


CREATE TABLE customfieldoption(
    ID INT not null,
    customfield INT null,
    customfieldconfig INT null,
    parentoptionid INT null,
    sequence INT null,
    customvalue NVARCHAR(100) null,
    optiontype  NVARCHAR(50) null,
    disabled  NVARCHAR(10) null,
);

BULK INSERT customfieldoption
FROM 'TOP 1000 Tabelle Customfieldoption.csv'
WITH(
DATA_SOURCE = 'nuernberger_container', FORMAT='CSV', FIRSTROW=2, DELIMITER=';', ROWTERMINATOR='0x0a'
);

SELECT 
    TOP (100) *
FROM 
    [dbo].[customfieldoption];