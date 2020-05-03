CREATE TABLE AreaOfOrigin (
    id int  NOT NULL IDENTITY PRIMARY KEY,
    origin varchar(150)  NOT NULL
);

-- Table: BuildingStatus
CREATE TABLE BuildingStatus (
    id int  NOT NULL IDENTITY PRIMARY KEY,
    status varchar(150)  NOT NULL
);

-- Table: Coordinates
CREATE TABLE Coordinates (
    id int  NOT NULL IDENTITY PRIMARY KEY,
    latidude decimal(5,3)  NOT NULL,
    longitude decimal(5,3)  NOT NULL
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

-- Table: FireAlarmSystem
CREATE TABLE FireAlarmSystem (
    id int  NOT NULL IDENTITY PRIMARY KEY,
    ImpactOnEvacuation_id int  NOT NULL,
    Operation_id int  NOT NULL,
    Presence_id int  NOT NULL
);

-- Table: FireUnderControlTime
CREATE TABLE FireUnderControlTime (
    id int  NOT NULL IDENTITY PRIMARY KEY,
    date date  NOT NULL,
    time_of_day time  NOT NULL
);

-- Table: IgnitionSource
CREATE TABLE IgnitionSource (
    id int  NOT NULL IDENTITY PRIMARY KEY,
    source varchar(150)  NOT NULL
);

-- Table: ImpactOnCivillians
CREATE TABLE ImpactOnCivillians (
    id int  NOT NULL IDENTITY PRIMARY KEY,
    civillian_casualties int  NOT NULL,
    count_of_person_rescued int  NOT NULL,
    estimated_dollar_loss int  NOT NULL,
    number_of_presons_displaced int  NOT NULL
);

-- Table: ImpactOnEvacuation
CREATE TABLE ImpactOnEvacuation (
    id int  NOT NULL IDENTITY PRIMARY KEY,
    impact varchar(150)  NOT NULL
);

-- Table: Incident
CREATE TABLE Incident (
    id int  NOT NULL IDENTITY PRIMARY KEY,
    exposures int  NOT NULL,
    incident_number varchar(200)  NOT NULL,
    AreaOfOrigin_id int  NOT NULL,
    BuildingStatus_id int  NOT NULL,
    FireUnderControlTime_id int  NOT NULL,
    ExtentOfFire_id int  NOT NULL,
    FinalIncidentType_id int  NOT NULL,
    FireAlarmSystem_id int  NOT NULL,
    IgnitionSource_id int  NOT NULL,
    InitialCADEventType_id int  NOT NULL,
    Intersection_id int  NOT NULL,
    IncidentStationArea_id int  NOT NULL,
    ImpactOnCivillians_id int  NOT NULL,
    SmokeAlarms_id int  NOT NULL,
    SprinkleSystem_id int  NOT NULL,
    Coordinates_id int  NOT NULL
);

-- Table: IncidentStationArea
CREATE TABLE IncidentStationArea (
    id int  NOT NULL IDENTITY PRIMARY KEY
);

-- Table: InitialCADEventType
CREATE TABLE InitialCADEventType (
    id int  NOT NULL IDENTITY PRIMARY KEY,
    type varchar(150)  NOT NULL
);

-- Table: Intersection
CREATE TABLE Intersection (
    id int  NOT NULL IDENTITY PRIMARY KEY,
    road1_name varchar(150)  NOT NULL,
    road2_name varchar(150)  NOT NULL
);

-- Table: Operation
CREATE TABLE Operation (
    id int  NOT NULL IDENTITY PRIMARY KEY,
    operation varchar(150)  NOT NULL
);

-- Table: Presence
CREATE TABLE Presence (
    id int  NOT NULL IDENTITY PRIMARY KEY,
    presence int  NOT NULL
);

-- Table: SmokeAlarms
CREATE TABLE SmokeAlarms (
    id int  NOT NULL IDENTITY PRIMARY KEY,
    count int  NOT NULL,
    origin varchar(150)  NOT NULL
);

-- Table: SprinkleSystem
CREATE TABLE SprinkleSystem (
    id int  NOT NULL IDENTITY PRIMARY KEY,
    operation varchar(150)  NOT NULL,
    presence varchar(150)  NOT NULL
);

-- foreign keys
-- Reference: FireAlarmSystem_ImpactOnEvacuation (table: FireAlarmSystem)
ALTER TABLE FireAlarmSystem ADD CONSTRAINT FireAlarmSystem_ImpactOnEvacuation
    FOREIGN KEY (ImpactOnEvacuation_id)
    REFERENCES ImpactOnEvacuation (id)  
;

-- Reference: FireAlarmSystem_Operation (table: FireAlarmSystem)
ALTER TABLE FireAlarmSystem ADD CONSTRAINT FireAlarmSystem_Operation
    FOREIGN KEY (Operation_id)
    REFERENCES Operation (id)  
;

-- Reference: FireAlarmSystem_Presence (table: FireAlarmSystem)
ALTER TABLE FireAlarmSystem ADD CONSTRAINT FireAlarmSystem_Presence
    FOREIGN KEY (Presence_id)
    REFERENCES Presence (id)  
;

-- Reference: Incident_AreaOfOrigin (table: Incident)
ALTER TABLE Incident ADD CONSTRAINT Incident_AreaOfOrigin
    FOREIGN KEY (AreaOfOrigin_id)
    REFERENCES AreaOfOrigin (id)  
;

-- Reference: Incident_BuildingStatus (table: Incident)
ALTER TABLE Incident ADD CONSTRAINT Incident_BuildingStatus
    FOREIGN KEY (BuildingStatus_id)
    REFERENCES BuildingStatus (id)  
;

-- Reference: Incident_Coordinates (table: Incident)
ALTER TABLE Incident ADD CONSTRAINT Incident_Coordinates
    FOREIGN KEY (Coordinates_id)
    REFERENCES Coordinates (id)  
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

-- Reference: Incident_FireAlarmSystem (table: Incident)
ALTER TABLE Incident ADD CONSTRAINT Incident_FireAlarmSystem
    FOREIGN KEY (FireAlarmSystem_id)
    REFERENCES FireAlarmSystem (id)  
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

-- Reference: Incident_ImpactOnCivillians (table: Incident)
ALTER TABLE Incident ADD CONSTRAINT Incident_ImpactOnCivillians
    FOREIGN KEY (ImpactOnCivillians_id)
    REFERENCES ImpactOnCivillians (id)  
;

-- Reference: Incident_IncidentStationArea (table: Incident)
ALTER TABLE Incident ADD CONSTRAINT Incident_IncidentStationArea
    FOREIGN KEY (IncidentStationArea_id)
    REFERENCES IncidentStationArea (id)  
;

-- Reference: Incident_InitialCADEventType (table: Incident)
ALTER TABLE Incident ADD CONSTRAINT Incident_InitialCADEventType
    FOREIGN KEY (InitialCADEventType_id)
    REFERENCES InitialCADEventType (id)  
;

-- Reference: Incident_Intersection (table: Incident)
ALTER TABLE Incident ADD CONSTRAINT Incident_Intersection
    FOREIGN KEY (Intersection_id)
    REFERENCES Intersection (id)  
;

-- Reference: Incident_SmokeAlarms (table: Incident)
ALTER TABLE Incident ADD CONSTRAINT Incident_SmokeAlarms
    FOREIGN KEY (SmokeAlarms_id)
    REFERENCES SmokeAlarms (id)  
;

-- Reference: Incident_SprinkleSystem (table: Incident)
ALTER TABLE Incident ADD CONSTRAINT Incident_SprinkleSystem
    FOREIGN KEY (SprinkleSystem_id)
    REFERENCES SprinkleSystem (id)  
;

-- End of file.

