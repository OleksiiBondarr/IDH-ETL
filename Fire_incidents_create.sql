-- Table: AlarmSystems
CREATE TABLE AlarmSystems (
    id int IDENTITY NOT NULL,
    fire_alarm_system_presence nvarchar(255),
    fire_alarm_system_IOE nvarchar(255),
    fire_alarm_system_operation nvarchar(255),
    smoke_alarm_count int  NOT NULL,
    smoke_alarm_origin nvarchar(255) ,
    smoke_alarm_IOE nvarchar(255) ,
    sprinkle_system_presence nvarchar(255),
    sprinkle_system_operation nvarchar(255) ,
    CONSTRAINT AlarmSystems_pk PRIMARY KEY (id)
);

-- Table: AreaOfOrigin
CREATE TABLE AreaOfOrigin (
    id int  NOT NULL IDENTITY PRIMARY KEY,
    origin varchar(150)  NOT NULL
);

-- Table: BuildingStatus
CREATE TABLE BuildingStatus (
    id int  NOT NULL IDENTITY PRIMARY KEY,
    status varchar(150)  NOT NULL
);

-- Table: Location
CREATE TABLE LocationT (
    id int IDENTITY NOT NULL,
    intersection_name nvarchar(255)  NOT NULL,
    latidude decimal(10,5)  NOT NULL,
    longitude decimal(10,5)  NOT NULL,
    station_area int  NOT NULL,
    CONSTRAINT Location_pk PRIMARY KEY (id)
);

-- Table: ExtentOfFire
CREATE TABLE ExtentOfFire (
    id int  NOT NULL IDENTITY PRIMARY KEY,
    extent varchar(150)  NOT NULL
);

-- Table: FinalIncidentType
CREATE TABLE FinalIncidentType (
    id int  NOT NULL IDENTITY PRIMARY KEY,
    type int  NOT NULL
);

-- Table: FireUnderControlTime
CREATE TABLE FireUnderControlTime (
    id int IDENTITY  NOT NULL,
    date_f date  NOT NULL,
    day_of_week int  NOT NULL,
    year_f int  NOT NULL,
    month_f int  NOT NULL,
    time_of_day time  NOT NULL,
	prev_data nvarchar(255) NOT NULL,
    CONSTRAINT FireUnderControlTime_pk PRIMARY KEY (id)
);

-- Table: IgnitionSource
CREATE TABLE IgnitionSource (
    id int  NOT NULL,
    source nvarchar(50)  NOT NULL,
    CONSTRAINT IgnitionSource_pk PRIMARY KEY (id)
);

-- Table: InitialCADEventType
CREATE TABLE InitialCADEventType (
    id int IDENTITY NOT NULL,
    type nvarchar(255)  NOT NULL,
    CONSTRAINT InitialCADEventType_pk PRIMARY KEY (id)
);

-- Table: Incident
CREATE TABLE Incident (
    id int IDENTITY NOT NULL,
    exposures int,
    incident_number nvarchar(20)  NOT NULL,
    civillian_casualties int  NOT NULL,
    count_of_person_rescued int  NOT NULL,
    estimated_dollar_loss int  NOT NULL,
    number_of_persons_displaced int,
    AlarmSystems_id int  NOT NULL,
    Location_id int  NOT NULL,
    FireUnderControlTime_id int  NOT NULL,
    BuildingStatus_id int  NOT NULL,
    Area_of_origin_id int  NOT NULL,
    ExtentOfFire_id int  NOT NULL,
    FinalIncidentType_id int  NOT NULL,
    IgnitionSource_id int  NOT NULL,
    InitialCADEventType_id int  NOT NULL,
    CONSTRAINT Incident_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: Incident_AlarmSystems (table: Incident)
ALTER TABLE Incident ADD CONSTRAINT Incident_AlarmSystems
    FOREIGN KEY (AlarmSystems_id)
    REFERENCES AlarmSystems (id)  
;

-- Reference: Incident_Area_of_origin (table: Incident)
ALTER TABLE Incident ADD CONSTRAINT Incident_Area_of_origin
    FOREIGN KEY (Area_of_origin_id)
    REFERENCES AreaOfOrigin (id)  
;

-- Reference: Incident_BuildingStatus (table: Incident)
ALTER TABLE Incident ADD CONSTRAINT Incident_BuildingStatus
    FOREIGN KEY (BuildingStatus_id)
    REFERENCES BuildingStatus (id)  
;

-- Reference: Incident_ExtentOfFire (table: Incident)
ALTER TABLE Incident ADD CONSTRAINT Incident_ExtentOfFire
    FOREIGN KEY (ExtentOfFire_id)
    REFERENCES ExtentOfFire (id)  
;

-- Reference: Incident_FinalIncidentType (table: Incident)
ALTER TABLE Incident ADD CONSTRAINT Incident_FinalIncidentType
    FOREIGN KEY (FinalIncidentType_id)
    REFERENCES FinalIncidentType (id)  
;

-- Reference: Incident_FireUnderControlTime (table: Incident)
ALTER TABLE Incident ADD CONSTRAINT Incident_FireUnderControlTime
    FOREIGN KEY (FireUnderControlTime_id)
    REFERENCES FireUnderControlTime (id)  
;

-- Reference: Incident_IgnitionSource (table: Incident)
ALTER TABLE Incident ADD CONSTRAINT Incident_IgnitionSource
    FOREIGN KEY (IgnitionSource_id)
    REFERENCES IgnitionSource (id)  
;

-- Reference: Incident_InitialCADEventType (table: Incident)
ALTER TABLE Incident ADD CONSTRAINT Incident_InitialCADEventType
    FOREIGN KEY (InitialCADEventType_id)
    REFERENCES InitialCADEventType (id)  
;

-- Reference: Incident_Location (table: Incident)
ALTER TABLE Incident ADD CONSTRAINT Incident_Location
    FOREIGN KEY (Location_id)
    REFERENCES LocationT (id)  
;
