
CREATE TABLE Cases (
    CaseID serial PRIMARY KEY,
    Description text,
    Date date,
    Status text
);

CREATE TABLE Suspects (
    SuspectID serial PRIMARY KEY,
    FirstName text,
    LastName text,
    DateOfBirth date,
    Photograph bytea, 
    CaseID integer REFERENCES Cases(CaseID)
);

CREATE TABLE Evidence (
    EvidenceID serial PRIMARY KEY,
    Description text,
    ChainOfCustody text,
    CaseID integer REFERENCES Cases(CaseID)
);

CREATE TABLE Officers (
    OfficerID serial PRIMARY KEY,
    FirstName text,
    LastName text,
    BadgeNumber text,
    Rank text,
    ContactInformation text
);

CREATE TABLE CaseOfficers (
    CaseOfficerID serial PRIMARY KEY,
    CaseID integer REFERENCES Cases(CaseID),
    OfficerID integer REFERENCES Officers(OfficerID)
);

CREATE TABLE EvidenceTracking (
    EvidenceTrackingID serial PRIMARY KEY,
    EvidenceID integer REFERENCES Evidence(EvidenceID),
    OfficerID integer REFERENCES Officers(OfficerID),
    DateHandled timestamp
);

CREATE TABLE Witnesses (
    WitnessID serial PRIMARY KEY,
    FirstName text,
    LastName text,
    Statement text,
    ContactInformation text,
    CaseID integer REFERENCES Cases(CaseID)
);
