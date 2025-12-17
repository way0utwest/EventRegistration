-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2025-12-17 00:23:38.532

-- tables
-- Table: Event
CREATE TABLE Event (
    EventID int  NOT NULL,
    EventTitle varchar(200)  NOT NULL,
    EventDescription varchar(1000)  NOT NULL,
    StartDate datetime  NOT NULL,
    EndDate datetime  NOT NULL,
    Capacity smallint  NOT NULL,
    RegistrationDeadline datetime  NOT NULL,
    EventStatus int  NOT NULL,
    CONSTRAINT EventPK PRIMARY KEY  (EventID)
);

-- Table: EventRegistration
CREATE TABLE EventRegistration (
    EventRegistrationID int  NOT NULL,
    EventID int  NOT NULL,
    Event_EventID int  NOT NULL,
    UserID int  NOT NULL,
    Verified bit  NOT NULL,
    PaymentAmount numeric(4,4)  NOT NULL,
    Currency int  NOT NULL,
    CONSTRAINT EventRegistrationPK PRIMARY KEY  (EventRegistrationID)
);

-- Table: EventStatus
CREATE TABLE EventStatus (
    EventStatusID int  NOT NULL,
    StatusVal varchar(50)  NOT NULL,
    Active bit  NOT NULL,
    Event_EventID int  NOT NULL,
    CONSTRAINT EventStatusPK PRIMARY KEY  (EventStatusID)
);

-- Table: User
CREATE TABLE "User" (
    UserID int  NOT NULL,
    Displayname varchar(100)  NOT NULL,
    email varchar(300)  NOT NULL,
    firstname varchar(80)  NOT NULL,
    lastname varchar(100)  NOT NULL,
    email_verified bit  NOT NULL,
    EventRegistration_EventRegistrationID int  NOT NULL,
    CONSTRAINT UserPK PRIMARY KEY  (UserID)
);

-- Table: user_auth_provider
CREATE TABLE user_auth_provider (
    user_auth_providerID int  NOT NULL,
    UserID int  NULL,
    provider varchar(50)  NOT NULL,
    provider_user_id varchar(80)  NOT NULL,
    User_UserID int  NOT NULL,
    CONSTRAINT user_auth_provider_pk PRIMARY KEY  (user_auth_providerID)
);

-- foreign keys
-- Reference: EventRegistration_Event (table: EventRegistration)
ALTER TABLE EventRegistration ADD CONSTRAINT EventRegistration_Event
    FOREIGN KEY (Event_EventID)
    REFERENCES Event (EventID);

-- Reference: EventStatus_Event (table: EventStatus)
ALTER TABLE EventStatus ADD CONSTRAINT EventStatus_Event
    FOREIGN KEY (Event_EventID)
    REFERENCES Event (EventID);

-- Reference: User_EventRegistration (table: User)
ALTER TABLE "User" ADD CONSTRAINT User_EventRegistration
    FOREIGN KEY (EventRegistration_EventRegistrationID)
    REFERENCES EventRegistration (EventRegistrationID);

-- Reference: user_auth_provider_User (table: user_auth_provider)
ALTER TABLE user_auth_provider ADD CONSTRAINT user_auth_provider_User
    FOREIGN KEY (User_UserID)
    REFERENCES "User" (UserID);

-- End of file.

