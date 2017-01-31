Drop Table Votes;
Drop Table GovernorSigned;
Drop Table CommitteeAction;
Drop Table Committees;
Drop Table CommitteeNames;
Drop Table Authored;
Drop Table People;
Drop Table Counties;
Drop Table Positions;
Drop Table Bills;
Drop Table Session;
Drop Table GeneralAssembly;

CREATE TABLE [Session]
( 
	[Session_ID]         int  NOT NULL ,
	[SessionType]        CHAR(32)  NOT NULL  
)
go

ALTER TABLE [Session]
	ADD CONSTRAINT [XPKSession] PRIMARY KEY  NONCLUSTERED ([Session_ID] ASC)
go

CREATE TABLE [Bills]
( 
	[Bill_ID]            int  NOT NULL ,
	[Session_ID]         int  NOT NULL ,
	[HouseType]          CHAR(32)  NOT NULL ,
	[name]               varchar(128)  NULL 
)
go

ALTER TABLE [Bills]
	ADD CONSTRAINT [XPKBills] PRIMARY KEY  NONCLUSTERED ([Bill_ID] ASC,[Session_ID] ASC)
go

CREATE TABLE [CommitteeNames]
( 
	[HouseType]          CHAR(32)  NOT NULL ,
	[committeeName]      CHAR(50)  NOT NULL 
)
go

ALTER TABLE [CommitteeNames]
	ADD CONSTRAINT [XPKCommitteeNames] PRIMARY KEY  NONCLUSTERED ([HouseType] ASC,[committeeName] ASC)
go

CREATE TABLE [CommitteeAction]
( 
	[actionID]           int  NOT NULL ,
	[HouseType]          CHAR(32)  NOT NULL ,
	[committeeName]      CHAR(50)  NOT NULL ,
	[Bill_ID]            int  NOT NULL ,
	[Session_ID]         int  NOT NULL  
)
go

ALTER TABLE [CommitteeAction]
	ADD CONSTRAINT [XPKCommitteeAction] PRIMARY KEY  NONCLUSTERED ([actionID] ASC,[HouseType] ASC,[committeeName] ASC)
go

CREATE TABLE [Counties]
( 
	[CountyName]         CHAR(32)  NOT NULL 
)
go

ALTER TABLE [Counties]
	ADD CONSTRAINT [XPKCounties] PRIMARY KEY  NONCLUSTERED ([CountyName] ASC)
go

CREATE TABLE [GovernorSigned]
( 
	[signedID]           int  NOT NULL ,
	[Bill_ID]            int  NOT NULL ,
	[Session_ID]         int  NOT NULL ,
	[dateSigned]         datetime  NOT NULL  
)
go

ALTER TABLE [GovernorSigned]
	ADD CONSTRAINT [XPKGovernorSigned] PRIMARY KEY  NONCLUSTERED ([signedID] ASC,[Bill_ID] ASC,[Session_ID] ASC)
go

CREATE TABLE [GeneralAssembly]
( 
	[HouseType]          CHAR(32)  NOT NULL 
)
go

ALTER TABLE [GeneralAssembly]
	ADD CONSTRAINT [XPKGeneralAssembly] PRIMARY KEY  NONCLUSTERED ([HouseType] ASC)
go

CREATE TABLE [People]
( 
	[PID]                int  NOT NULL ,
	[firstName]          char(18)  NOT NULL ,
	[lastName]           char(18)  NOT NULL ,
	[CountyName]         CHAR(32)  NULL ,
	[pName]              CHAR(32)  NOT NULL 
)
go

ALTER TABLE [People]
	ADD CONSTRAINT [XPKPeople] PRIMARY KEY  NONCLUSTERED ([PID] ASC)
go

CREATE TABLE [Committees]
( 
	[CommitteeID]        int  NOT NULL ,
	[HouseType]          CHAR(32)  NOT NULL ,
	[committeeName]      CHAR(50)  NOT NULL ,
	[PID]                int  NOT NULL 
)
go

ALTER TABLE [Committees]
	ADD CONSTRAINT [XPKCommitees] PRIMARY KEY  NONCLUSTERED ([CommitteeID] ASC)
go

CREATE TABLE [Authored]
( 
	[authoredID]         int  NOT NULL ,
	[PID]                int  NOT NULL ,
	[Bill_ID]            int  NOT NULL ,
	[Session_ID]         int  NOT NULL  
)
go

ALTER TABLE [Authored]
	ADD CONSTRAINT [XPKAuthored] PRIMARY KEY  NONCLUSTERED ([authoredID] ASC,[PID] ASC)
go

CREATE TABLE [Positions]
( 
	[pName]              CHAR(32)  NOT NULL 
)
go

ALTER TABLE [Positions]
	ADD CONSTRAINT [XPKPositions] PRIMARY KEY  NONCLUSTERED ([pName] ASC)
go

CREATE TABLE [Votes]
( 
	[voteID]             int  NOT NULL ,
	[Bill_ID]            int  NOT NULL ,
	[Session_ID]         int  NOT NULL ,
	[HouseType]          CHAR(32)  NOT NULL ,
	[Yea]                INT  NOT NULL ,
	[Nay]                INT  NOT NULL ,
	[NotVoting]          INT  NOT NULL ,
	[Excused]            INT  NOT NULL  
)
go

ALTER TABLE [Votes]
	ADD CONSTRAINT [XPKVotes] PRIMARY KEY  NONCLUSTERED ([voteID] ASC,[Bill_ID] ASC,[Session_ID] ASC,[HouseType] ASC)
go


ALTER TABLE [Bills]
	ADD CONSTRAINT [R_42] FOREIGN KEY ([Session_ID]) REFERENCES [Session]([Session_ID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Bills]
	ADD CONSTRAINT [R_96] FOREIGN KEY ([HouseType]) REFERENCES [GeneralAssembly]([HouseType])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [CommitteeNames]
	ADD CONSTRAINT [R_98] FOREIGN KEY ([HouseType]) REFERENCES [GeneralAssembly]([HouseType])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [CommitteeAction]
	ADD CONSTRAINT [R_89] FOREIGN KEY ([Bill_ID],[Session_ID]) REFERENCES [Bills]([Bill_ID],[Session_ID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [CommitteeAction]
	ADD CONSTRAINT [R_99] FOREIGN KEY ([HouseType],[committeeName]) REFERENCES [CommitteeNames]([HouseType],[committeeName])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [GovernorSigned]
	ADD CONSTRAINT [R_97] FOREIGN KEY ([Bill_ID],[Session_ID]) REFERENCES [Bills]([Bill_ID],[Session_ID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [People]
	ADD CONSTRAINT [R_84] FOREIGN KEY ([pName]) REFERENCES [Positions]([pName])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [People]
	ADD CONSTRAINT [R_87] FOREIGN KEY ([CountyName]) REFERENCES [Counties]([CountyName])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Committees]
	ADD CONSTRAINT [R_85] FOREIGN KEY ([PID]) REFERENCES [People]([PID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Committees]
	ADD CONSTRAINT [R_100] FOREIGN KEY ([HouseType],[committeeName]) REFERENCES [CommitteeNames]([HouseType],[committeeName])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Authored]
	ADD CONSTRAINT [R_91] FOREIGN KEY ([PID]) REFERENCES [People]([PID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Authored]
	ADD CONSTRAINT [R_92] FOREIGN KEY ([Bill_ID],[Session_ID]) REFERENCES [Bills]([Bill_ID],[Session_ID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Votes]
	ADD CONSTRAINT [R_94] FOREIGN KEY ([Bill_ID],[Session_ID]) REFERENCES [Bills]([Bill_ID],[Session_ID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Votes]
	ADD CONSTRAINT [R_95] FOREIGN KEY ([HouseType]) REFERENCES [GeneralAssembly]([HouseType])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


CREATE TRIGGER tD_Session ON Session FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Session */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Session  Bills on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0000ea68", PARENT_OWNER="", PARENT_TABLE="Session"
    CHILD_OWNER="", CHILD_TABLE="Bills"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_42", FK_COLUMNS="Session_ID" */
    IF EXISTS (
      SELECT * FROM deleted,Bills
      WHERE
        /*  %JoinFKPK(Bills,deleted," = "," AND") */
        Bills.Session_ID = deleted.Session_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Session because Bills exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Session ON Session FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Session */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insSession_ID int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Session  Bills on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000108eb", PARENT_OWNER="", PARENT_TABLE="Session"
    CHILD_OWNER="", CHILD_TABLE="Bills"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_42", FK_COLUMNS="Session_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Session_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Bills
      WHERE
        /*  %JoinFKPK(Bills,deleted," = "," AND") */
        Bills.Session_ID = deleted.Session_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Session because Bills exists.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Bills ON Bills FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Bills */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Bills  GovernorSigned on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00066b26", PARENT_OWNER="", PARENT_TABLE="Bills"
    CHILD_OWNER="", CHILD_TABLE="GovernorSigned"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_97", FK_COLUMNS="Bill_ID""Session_ID" */
    IF EXISTS (
      SELECT * FROM deleted,GovernorSigned
      WHERE
        /*  %JoinFKPK(GovernorSigned,deleted," = "," AND") */
        GovernorSigned.Bill_ID = deleted.Bill_ID AND
        GovernorSigned.Session_ID = deleted.Session_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Bills because GovernorSigned exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Bills  Votes on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bills"
    CHILD_OWNER="", CHILD_TABLE="Votes"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_94", FK_COLUMNS="Bill_ID""Session_ID" */
    IF EXISTS (
      SELECT * FROM deleted,Votes
      WHERE
        /*  %JoinFKPK(Votes,deleted," = "," AND") */
        Votes.Bill_ID = deleted.Bill_ID AND
        Votes.Session_ID = deleted.Session_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Bills because Votes exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Bills  Authored on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bills"
    CHILD_OWNER="", CHILD_TABLE="Authored"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_92", FK_COLUMNS="Bill_ID""Session_ID" */
    IF EXISTS (
      SELECT * FROM deleted,Authored
      WHERE
        /*  %JoinFKPK(Authored,deleted," = "," AND") */
        Authored.Bill_ID = deleted.Bill_ID AND
        Authored.Session_ID = deleted.Session_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Bills because Authored exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Bills  CommitteeAction on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bills"
    CHILD_OWNER="", CHILD_TABLE="CommitteeAction"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_89", FK_COLUMNS="Bill_ID""Session_ID" */
    IF EXISTS (
      SELECT * FROM deleted,CommitteeAction
      WHERE
        /*  %JoinFKPK(CommitteeAction,deleted," = "," AND") */
        CommitteeAction.Bill_ID = deleted.Bill_ID AND
        CommitteeAction.Session_ID = deleted.Session_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Bills because CommitteeAction exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* GeneralAssembly  Bills on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="GeneralAssembly"
    CHILD_OWNER="", CHILD_TABLE="Bills"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_96", FK_COLUMNS="HouseType" */
    IF EXISTS (SELECT * FROM deleted,GeneralAssembly
      WHERE
        /* %JoinFKPK(deleted,GeneralAssembly," = "," AND") */
        deleted.HouseType = GeneralAssembly.HouseType AND
        NOT EXISTS (
          SELECT * FROM Bills
          WHERE
            /* %JoinFKPK(Bills,GeneralAssembly," = "," AND") */
            Bills.HouseType = GeneralAssembly.HouseType
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Bills because GeneralAssembly exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Session  Bills on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Session"
    CHILD_OWNER="", CHILD_TABLE="Bills"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_42", FK_COLUMNS="Session_ID" */
    IF EXISTS (SELECT * FROM deleted,Session
      WHERE
        /* %JoinFKPK(deleted,Session," = "," AND") */
        deleted.Session_ID = Session.Session_ID AND
        NOT EXISTS (
          SELECT * FROM Bills
          WHERE
            /* %JoinFKPK(Bills,Session," = "," AND") */
            Bills.Session_ID = Session.Session_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Bills because Session exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Bills ON Bills FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Bills */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insBill_ID int, 
           @insSession_ID int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Bills  GovernorSigned on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00074096", PARENT_OWNER="", PARENT_TABLE="Bills"
    CHILD_OWNER="", CHILD_TABLE="GovernorSigned"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_97", FK_COLUMNS="Bill_ID""Session_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Bill_ID) OR
    UPDATE(Session_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,GovernorSigned
      WHERE
        /*  %JoinFKPK(GovernorSigned,deleted," = "," AND") */
        GovernorSigned.Bill_ID = deleted.Bill_ID AND
        GovernorSigned.Session_ID = deleted.Session_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Bills because GovernorSigned exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Bills  Votes on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bills"
    CHILD_OWNER="", CHILD_TABLE="Votes"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_94", FK_COLUMNS="Bill_ID""Session_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Bill_ID) OR
    UPDATE(Session_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Votes
      WHERE
        /*  %JoinFKPK(Votes,deleted," = "," AND") */
        Votes.Bill_ID = deleted.Bill_ID AND
        Votes.Session_ID = deleted.Session_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Bills because Votes exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Bills  Authored on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bills"
    CHILD_OWNER="", CHILD_TABLE="Authored"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_92", FK_COLUMNS="Bill_ID""Session_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Bill_ID) OR
    UPDATE(Session_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Authored
      WHERE
        /*  %JoinFKPK(Authored,deleted," = "," AND") */
        Authored.Bill_ID = deleted.Bill_ID AND
        Authored.Session_ID = deleted.Session_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Bills because Authored exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Bills  CommitteeAction on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bills"
    CHILD_OWNER="", CHILD_TABLE="CommitteeAction"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_89", FK_COLUMNS="Bill_ID""Session_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Bill_ID) OR
    UPDATE(Session_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CommitteeAction
      WHERE
        /*  %JoinFKPK(CommitteeAction,deleted," = "," AND") */
        CommitteeAction.Bill_ID = deleted.Bill_ID AND
        CommitteeAction.Session_ID = deleted.Session_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Bills because CommitteeAction exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* GeneralAssembly  Bills on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="GeneralAssembly"
    CHILD_OWNER="", CHILD_TABLE="Bills"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_96", FK_COLUMNS="HouseType" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(HouseType)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,GeneralAssembly
        WHERE
          /* %JoinFKPK(inserted,GeneralAssembly) */
          inserted.HouseType = GeneralAssembly.HouseType
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Bills because GeneralAssembly does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Session  Bills on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Session"
    CHILD_OWNER="", CHILD_TABLE="Bills"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_42", FK_COLUMNS="Session_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Session_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Session
        WHERE
          /* %JoinFKPK(inserted,Session) */
          inserted.Session_ID = Session.Session_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Bills because Session does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_CommitteeNames ON CommitteeNames FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on CommitteeNames */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* CommitteeNames  Committees on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00039fe8", PARENT_OWNER="", PARENT_TABLE="CommitteeNames"
    CHILD_OWNER="", CHILD_TABLE="Committees"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_100", FK_COLUMNS="HouseType""committeeName" */
    IF EXISTS (
      SELECT * FROM deleted,Committees
      WHERE
        /*  %JoinFKPK(Committees,deleted," = "," AND") */
        Committees.HouseType = deleted.HouseType AND
        Committees.committeeName = deleted.committeeName
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CommitteeNames because Committees exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* CommitteeNames  CommitteeAction on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CommitteeNames"
    CHILD_OWNER="", CHILD_TABLE="CommitteeAction"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_99", FK_COLUMNS="HouseType""committeeName" */
    IF EXISTS (
      SELECT * FROM deleted,CommitteeAction
      WHERE
        /*  %JoinFKPK(CommitteeAction,deleted," = "," AND") */
        CommitteeAction.HouseType = deleted.HouseType AND
        CommitteeAction.committeeName = deleted.committeeName
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CommitteeNames because CommitteeAction exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* GeneralAssembly  CommitteeNames on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="GeneralAssembly"
    CHILD_OWNER="", CHILD_TABLE="CommitteeNames"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_98", FK_COLUMNS="HouseType" */
    IF EXISTS (SELECT * FROM deleted,GeneralAssembly
      WHERE
        /* %JoinFKPK(deleted,GeneralAssembly," = "," AND") */
        deleted.HouseType = GeneralAssembly.HouseType AND
        NOT EXISTS (
          SELECT * FROM CommitteeNames
          WHERE
            /* %JoinFKPK(CommitteeNames,GeneralAssembly," = "," AND") */
            CommitteeNames.HouseType = GeneralAssembly.HouseType
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CommitteeNames because GeneralAssembly exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_CommitteeNames ON CommitteeNames FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on CommitteeNames */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insHouseType CHAR(32), 
           @inscommitteeName CHAR(50),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* CommitteeNames  Committees on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00040805", PARENT_OWNER="", PARENT_TABLE="CommitteeNames"
    CHILD_OWNER="", CHILD_TABLE="Committees"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_100", FK_COLUMNS="HouseType""committeeName" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(HouseType) OR
    UPDATE(committeeName)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Committees
      WHERE
        /*  %JoinFKPK(Committees,deleted," = "," AND") */
        Committees.HouseType = deleted.HouseType AND
        Committees.committeeName = deleted.committeeName
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CommitteeNames because Committees exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* CommitteeNames  CommitteeAction on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CommitteeNames"
    CHILD_OWNER="", CHILD_TABLE="CommitteeAction"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_99", FK_COLUMNS="HouseType""committeeName" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(HouseType) OR
    UPDATE(committeeName)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CommitteeAction
      WHERE
        /*  %JoinFKPK(CommitteeAction,deleted," = "," AND") */
        CommitteeAction.HouseType = deleted.HouseType AND
        CommitteeAction.committeeName = deleted.committeeName
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CommitteeNames because CommitteeAction exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* GeneralAssembly  CommitteeNames on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="GeneralAssembly"
    CHILD_OWNER="", CHILD_TABLE="CommitteeNames"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_98", FK_COLUMNS="HouseType" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(HouseType)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,GeneralAssembly
        WHERE
          /* %JoinFKPK(inserted,GeneralAssembly) */
          inserted.HouseType = GeneralAssembly.HouseType
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CommitteeNames because GeneralAssembly does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_CommitteeAction ON CommitteeAction FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on CommitteeAction */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* CommitteeNames  CommitteeAction on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002f681", PARENT_OWNER="", PARENT_TABLE="CommitteeNames"
    CHILD_OWNER="", CHILD_TABLE="CommitteeAction"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_99", FK_COLUMNS="HouseType""committeeName" */
    IF EXISTS (SELECT * FROM deleted,CommitteeNames
      WHERE
        /* %JoinFKPK(deleted,CommitteeNames," = "," AND") */
        deleted.HouseType = CommitteeNames.HouseType AND
        deleted.committeeName = CommitteeNames.committeeName AND
        NOT EXISTS (
          SELECT * FROM CommitteeAction
          WHERE
            /* %JoinFKPK(CommitteeAction,CommitteeNames," = "," AND") */
            CommitteeAction.HouseType = CommitteeNames.HouseType AND
            CommitteeAction.committeeName = CommitteeNames.committeeName
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CommitteeAction because CommitteeNames exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Bills  CommitteeAction on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bills"
    CHILD_OWNER="", CHILD_TABLE="CommitteeAction"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_89", FK_COLUMNS="Bill_ID""Session_ID" */
    IF EXISTS (SELECT * FROM deleted,Bills
      WHERE
        /* %JoinFKPK(deleted,Bills," = "," AND") */
        deleted.Bill_ID = Bills.Bill_ID AND
        deleted.Session_ID = Bills.Session_ID AND
        NOT EXISTS (
          SELECT * FROM CommitteeAction
          WHERE
            /* %JoinFKPK(CommitteeAction,Bills," = "," AND") */
            CommitteeAction.Bill_ID = Bills.Bill_ID AND
            CommitteeAction.Session_ID = Bills.Session_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CommitteeAction because Bills exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_CommitteeAction ON CommitteeAction FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on CommitteeAction */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insHouseType CHAR(32), 
           @inscommitteeName CHAR(50), 
           @insactionID int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* CommitteeNames  CommitteeAction on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002e5a2", PARENT_OWNER="", PARENT_TABLE="CommitteeNames"
    CHILD_OWNER="", CHILD_TABLE="CommitteeAction"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_99", FK_COLUMNS="HouseType""committeeName" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(HouseType) OR
    UPDATE(committeeName)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CommitteeNames
        WHERE
          /* %JoinFKPK(inserted,CommitteeNames) */
          inserted.HouseType = CommitteeNames.HouseType and
          inserted.committeeName = CommitteeNames.committeeName
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CommitteeAction because CommitteeNames does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Bills  CommitteeAction on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bills"
    CHILD_OWNER="", CHILD_TABLE="CommitteeAction"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_89", FK_COLUMNS="Bill_ID""Session_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Bill_ID) OR
    UPDATE(Session_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Bills
        WHERE
          /* %JoinFKPK(inserted,Bills) */
          inserted.Bill_ID = Bills.Bill_ID and
          inserted.Session_ID = Bills.Session_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CommitteeAction because Bills does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Counties ON Counties FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Counties */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Counties  People on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0000f139", PARENT_OWNER="", PARENT_TABLE="Counties"
    CHILD_OWNER="", CHILD_TABLE="People"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_87", FK_COLUMNS="CountyName" */
    IF EXISTS (
      SELECT * FROM deleted,People
      WHERE
        /*  %JoinFKPK(People,deleted," = "," AND") */
        People.CountyName = deleted.CountyName
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Counties because People exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Counties ON Counties FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Counties */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCountyName CHAR(32),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Counties  People on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000109a4", PARENT_OWNER="", PARENT_TABLE="Counties"
    CHILD_OWNER="", CHILD_TABLE="People"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_87", FK_COLUMNS="CountyName" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CountyName)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,People
      WHERE
        /*  %JoinFKPK(People,deleted," = "," AND") */
        People.CountyName = deleted.CountyName
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Counties because People exists.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_GovernorSigned ON GovernorSigned FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on GovernorSigned */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Bills  GovernorSigned on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000163a3", PARENT_OWNER="", PARENT_TABLE="Bills"
    CHILD_OWNER="", CHILD_TABLE="GovernorSigned"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_97", FK_COLUMNS="Bill_ID""Session_ID" */
    IF EXISTS (SELECT * FROM deleted,Bills
      WHERE
        /* %JoinFKPK(deleted,Bills," = "," AND") */
        deleted.Bill_ID = Bills.Bill_ID AND
        deleted.Session_ID = Bills.Session_ID AND
        NOT EXISTS (
          SELECT * FROM GovernorSigned
          WHERE
            /* %JoinFKPK(GovernorSigned,Bills," = "," AND") */
            GovernorSigned.Bill_ID = Bills.Bill_ID AND
            GovernorSigned.Session_ID = Bills.Session_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last GovernorSigned because Bills exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_GovernorSigned ON GovernorSigned FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on GovernorSigned */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insBill_ID int, 
           @insSession_ID int, 
           @inssignedID int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Bills  GovernorSigned on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000160c2", PARENT_OWNER="", PARENT_TABLE="Bills"
    CHILD_OWNER="", CHILD_TABLE="GovernorSigned"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_97", FK_COLUMNS="Bill_ID""Session_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Bill_ID) OR
    UPDATE(Session_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Bills
        WHERE
          /* %JoinFKPK(inserted,Bills) */
          inserted.Bill_ID = Bills.Bill_ID and
          inserted.Session_ID = Bills.Session_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update GovernorSigned because Bills does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_GeneralAssembly ON GeneralAssembly FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on GeneralAssembly */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* GeneralAssembly  CommitteeNames on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002e326", PARENT_OWNER="", PARENT_TABLE="GeneralAssembly"
    CHILD_OWNER="", CHILD_TABLE="CommitteeNames"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_98", FK_COLUMNS="HouseType" */
    IF EXISTS (
      SELECT * FROM deleted,CommitteeNames
      WHERE
        /*  %JoinFKPK(CommitteeNames,deleted," = "," AND") */
        CommitteeNames.HouseType = deleted.HouseType
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete GeneralAssembly because CommitteeNames exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* GeneralAssembly  Bills on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="GeneralAssembly"
    CHILD_OWNER="", CHILD_TABLE="Bills"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_96", FK_COLUMNS="HouseType" */
    IF EXISTS (
      SELECT * FROM deleted,Bills
      WHERE
        /*  %JoinFKPK(Bills,deleted," = "," AND") */
        Bills.HouseType = deleted.HouseType
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete GeneralAssembly because Bills exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* GeneralAssembly  Votes on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="GeneralAssembly"
    CHILD_OWNER="", CHILD_TABLE="Votes"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_95", FK_COLUMNS="HouseType" */
    IF EXISTS (
      SELECT * FROM deleted,Votes
      WHERE
        /*  %JoinFKPK(Votes,deleted," = "," AND") */
        Votes.HouseType = deleted.HouseType
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete GeneralAssembly because Votes exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_GeneralAssembly ON GeneralAssembly FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on GeneralAssembly */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insHouseType CHAR(32),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* GeneralAssembly  CommitteeNames on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000331b2", PARENT_OWNER="", PARENT_TABLE="GeneralAssembly"
    CHILD_OWNER="", CHILD_TABLE="CommitteeNames"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_98", FK_COLUMNS="HouseType" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(HouseType)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CommitteeNames
      WHERE
        /*  %JoinFKPK(CommitteeNames,deleted," = "," AND") */
        CommitteeNames.HouseType = deleted.HouseType
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update GeneralAssembly because CommitteeNames exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* GeneralAssembly  Bills on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="GeneralAssembly"
    CHILD_OWNER="", CHILD_TABLE="Bills"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_96", FK_COLUMNS="HouseType" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(HouseType)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Bills
      WHERE
        /*  %JoinFKPK(Bills,deleted," = "," AND") */
        Bills.HouseType = deleted.HouseType
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update GeneralAssembly because Bills exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* GeneralAssembly  Votes on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="GeneralAssembly"
    CHILD_OWNER="", CHILD_TABLE="Votes"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_95", FK_COLUMNS="HouseType" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(HouseType)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Votes
      WHERE
        /*  %JoinFKPK(Votes,deleted," = "," AND") */
        Votes.HouseType = deleted.HouseType
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update GeneralAssembly because Votes exists.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_People ON People FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on People */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* People  Authored on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0004078f", PARENT_OWNER="", PARENT_TABLE="People"
    CHILD_OWNER="", CHILD_TABLE="Authored"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_91", FK_COLUMNS="PID" */
    IF EXISTS (
      SELECT * FROM deleted,Authored
      WHERE
        /*  %JoinFKPK(Authored,deleted," = "," AND") */
        Authored.PID = deleted.PID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete People because Authored exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* People  Committees on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="People"
    CHILD_OWNER="", CHILD_TABLE="Committees"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_85", FK_COLUMNS="PID" */
    IF EXISTS (
      SELECT * FROM deleted,Committees
      WHERE
        /*  %JoinFKPK(Committees,deleted," = "," AND") */
        Committees.PID = deleted.PID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete People because Committees exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Counties  People on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Counties"
    CHILD_OWNER="", CHILD_TABLE="People"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_87", FK_COLUMNS="CountyName" */
    IF EXISTS (SELECT * FROM deleted,Counties
      WHERE
        /* %JoinFKPK(deleted,Counties," = "," AND") */
        deleted.CountyName = Counties.CountyName AND
        NOT EXISTS (
          SELECT * FROM People
          WHERE
            /* %JoinFKPK(People,Counties," = "," AND") */
            People.CountyName = Counties.CountyName
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last People because Counties exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Positions  People on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Positions"
    CHILD_OWNER="", CHILD_TABLE="People"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_84", FK_COLUMNS="pName" */
    IF EXISTS (SELECT * FROM deleted,Positions
      WHERE
        /* %JoinFKPK(deleted,Positions," = "," AND") */
        deleted.pName = Positions.pName AND
        NOT EXISTS (
          SELECT * FROM People
          WHERE
            /* %JoinFKPK(People,Positions," = "," AND") */
            People.pName = Positions.pName
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last People because Positions exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_People ON People FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on People */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPID int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* People  Authored on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00049ceb", PARENT_OWNER="", PARENT_TABLE="People"
    CHILD_OWNER="", CHILD_TABLE="Authored"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_91", FK_COLUMNS="PID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Authored
      WHERE
        /*  %JoinFKPK(Authored,deleted," = "," AND") */
        Authored.PID = deleted.PID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update People because Authored exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* People  Committees on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="People"
    CHILD_OWNER="", CHILD_TABLE="Committees"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_85", FK_COLUMNS="PID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Committees
      WHERE
        /*  %JoinFKPK(Committees,deleted," = "," AND") */
        Committees.PID = deleted.PID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update People because Committees exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Counties  People on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Counties"
    CHILD_OWNER="", CHILD_TABLE="People"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_87", FK_COLUMNS="CountyName" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CountyName)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Counties
        WHERE
          /* %JoinFKPK(inserted,Counties) */
          inserted.CountyName = Counties.CountyName
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CountyName IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update People because Counties does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Positions  People on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Positions"
    CHILD_OWNER="", CHILD_TABLE="People"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_84", FK_COLUMNS="pName" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(pName)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Positions
        WHERE
          /* %JoinFKPK(inserted,Positions) */
          inserted.pName = Positions.pName
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.pName IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update People because Positions does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Committees ON Committees FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Committees */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* CommitteeNames  Committees on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00029e09", PARENT_OWNER="", PARENT_TABLE="CommitteeNames"
    CHILD_OWNER="", CHILD_TABLE="Committees"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_100", FK_COLUMNS="HouseType""committeeName" */
    IF EXISTS (SELECT * FROM deleted,CommitteeNames
      WHERE
        /* %JoinFKPK(deleted,CommitteeNames," = "," AND") */
        deleted.HouseType = CommitteeNames.HouseType AND
        deleted.committeeName = CommitteeNames.committeeName AND
        NOT EXISTS (
          SELECT * FROM Committees
          WHERE
            /* %JoinFKPK(Committees,CommitteeNames," = "," AND") */
            Committees.HouseType = CommitteeNames.HouseType AND
            Committees.committeeName = CommitteeNames.committeeName
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Committees because CommitteeNames exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* People  Committees on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="People"
    CHILD_OWNER="", CHILD_TABLE="Committees"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_85", FK_COLUMNS="PID" */
    IF EXISTS (SELECT * FROM deleted,People
      WHERE
        /* %JoinFKPK(deleted,People," = "," AND") */
        deleted.PID = People.PID AND
        NOT EXISTS (
          SELECT * FROM Committees
          WHERE
            /* %JoinFKPK(Committees,People," = "," AND") */
            Committees.PID = People.PID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Committees because People exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Committees ON Committees FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Committees */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCommitteeID int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* CommitteeNames  Committees on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002ab08", PARENT_OWNER="", PARENT_TABLE="CommitteeNames"
    CHILD_OWNER="", CHILD_TABLE="Committees"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_100", FK_COLUMNS="HouseType""committeeName" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(HouseType) OR
    UPDATE(committeeName)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CommitteeNames
        WHERE
          /* %JoinFKPK(inserted,CommitteeNames) */
          inserted.HouseType = CommitteeNames.HouseType and
          inserted.committeeName = CommitteeNames.committeeName
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Committees because CommitteeNames does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* People  Committees on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="People"
    CHILD_OWNER="", CHILD_TABLE="Committees"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_85", FK_COLUMNS="PID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,People
        WHERE
          /* %JoinFKPK(inserted,People) */
          inserted.PID = People.PID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Committees because People does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Authored ON Authored FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Authored */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Bills  Authored on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00025595", PARENT_OWNER="", PARENT_TABLE="Bills"
    CHILD_OWNER="", CHILD_TABLE="Authored"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_92", FK_COLUMNS="Bill_ID""Session_ID" */
    IF EXISTS (SELECT * FROM deleted,Bills
      WHERE
        /* %JoinFKPK(deleted,Bills," = "," AND") */
        deleted.Bill_ID = Bills.Bill_ID AND
        deleted.Session_ID = Bills.Session_ID AND
        NOT EXISTS (
          SELECT * FROM Authored
          WHERE
            /* %JoinFKPK(Authored,Bills," = "," AND") */
            Authored.Bill_ID = Bills.Bill_ID AND
            Authored.Session_ID = Bills.Session_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Authored because Bills exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* People  Authored on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="People"
    CHILD_OWNER="", CHILD_TABLE="Authored"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_91", FK_COLUMNS="PID" */
    IF EXISTS (SELECT * FROM deleted,People
      WHERE
        /* %JoinFKPK(deleted,People," = "," AND") */
        deleted.PID = People.PID AND
        NOT EXISTS (
          SELECT * FROM Authored
          WHERE
            /* %JoinFKPK(Authored,People," = "," AND") */
            Authored.PID = People.PID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Authored because People exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Authored ON Authored FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Authored */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPID int, 
           @insauthoredID int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Bills  Authored on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002900b", PARENT_OWNER="", PARENT_TABLE="Bills"
    CHILD_OWNER="", CHILD_TABLE="Authored"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_92", FK_COLUMNS="Bill_ID""Session_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Bill_ID) OR
    UPDATE(Session_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Bills
        WHERE
          /* %JoinFKPK(inserted,Bills) */
          inserted.Bill_ID = Bills.Bill_ID and
          inserted.Session_ID = Bills.Session_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Authored because Bills does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* People  Authored on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="People"
    CHILD_OWNER="", CHILD_TABLE="Authored"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_91", FK_COLUMNS="PID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,People
        WHERE
          /* %JoinFKPK(inserted,People) */
          inserted.PID = People.PID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Authored because People does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Positions ON Positions FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Positions */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Positions  People on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0000e368", PARENT_OWNER="", PARENT_TABLE="Positions"
    CHILD_OWNER="", CHILD_TABLE="People"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_84", FK_COLUMNS="pName" */
    IF EXISTS (
      SELECT * FROM deleted,People
      WHERE
        /*  %JoinFKPK(People,deleted," = "," AND") */
        People.pName = deleted.pName
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Positions because People exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Positions ON Positions FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Positions */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @inspName CHAR(32),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Positions  People on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0001027c", PARENT_OWNER="", PARENT_TABLE="Positions"
    CHILD_OWNER="", CHILD_TABLE="People"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_84", FK_COLUMNS="pName" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(pName)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,People
      WHERE
        /*  %JoinFKPK(People,deleted," = "," AND") */
        People.pName = deleted.pName
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Positions because People exists.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Votes ON Votes FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Votes */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* GeneralAssembly  Votes on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00026f07", PARENT_OWNER="", PARENT_TABLE="GeneralAssembly"
    CHILD_OWNER="", CHILD_TABLE="Votes"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_95", FK_COLUMNS="HouseType" */
    IF EXISTS (SELECT * FROM deleted,GeneralAssembly
      WHERE
        /* %JoinFKPK(deleted,GeneralAssembly," = "," AND") */
        deleted.HouseType = GeneralAssembly.HouseType AND
        NOT EXISTS (
          SELECT * FROM Votes
          WHERE
            /* %JoinFKPK(Votes,GeneralAssembly," = "," AND") */
            Votes.HouseType = GeneralAssembly.HouseType
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Votes because GeneralAssembly exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Bills  Votes on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bills"
    CHILD_OWNER="", CHILD_TABLE="Votes"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_94", FK_COLUMNS="Bill_ID""Session_ID" */
    IF EXISTS (SELECT * FROM deleted,Bills
      WHERE
        /* %JoinFKPK(deleted,Bills," = "," AND") */
        deleted.Bill_ID = Bills.Bill_ID AND
        deleted.Session_ID = Bills.Session_ID AND
        NOT EXISTS (
          SELECT * FROM Votes
          WHERE
            /* %JoinFKPK(Votes,Bills," = "," AND") */
            Votes.Bill_ID = Bills.Bill_ID AND
            Votes.Session_ID = Bills.Session_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Votes because Bills exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Votes ON Votes FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Votes */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insBill_ID int, 
           @insSession_ID int, 
           @insHouseType CHAR(32), 
           @insvoteID int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* GeneralAssembly  Votes on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002b8a7", PARENT_OWNER="", PARENT_TABLE="GeneralAssembly"
    CHILD_OWNER="", CHILD_TABLE="Votes"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_95", FK_COLUMNS="HouseType" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(HouseType)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,GeneralAssembly
        WHERE
          /* %JoinFKPK(inserted,GeneralAssembly) */
          inserted.HouseType = GeneralAssembly.HouseType
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Votes because GeneralAssembly does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Bills  Votes on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bills"
    CHILD_OWNER="", CHILD_TABLE="Votes"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_94", FK_COLUMNS="Bill_ID""Session_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Bill_ID) OR
    UPDATE(Session_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Bills
        WHERE
          /* %JoinFKPK(inserted,Bills) */
          inserted.Bill_ID = Bills.Bill_ID and
          inserted.Session_ID = Bills.Session_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Votes because Bills does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go



--Insert data into Session
Insert Into Session
Values(1, '2013-2014 Regular Session');

Insert Into Session
Values(2, '2015-2016 Regular Session');



--insert data into Positions
--elected Positions
Insert Into Positions
Values('Governor');

Insert Into Positions
Values('Lieutenant Governor');

Insert Into Positions
Values('Representative');

Insert Into Positions
Values('Senator');

Insert Into Positions
Values('Attorney General');

Insert Into Positions
Values('Secretary of State');

Insert Into Positions
Values('State School Superintendent');

Insert Into Positions
Values('Commissioner of Agriculture');

Insert Into Positions
Values('Commissioner of Insurance');

Insert Into Positions
Values('Commissioner of Labor');

--county's Positions
Insert Into Positions
Values('Mayor');

Insert Into Positions
Values('Chairman');

Insert Into Positions
Values('Interim Chairman');

Insert Into Positions
Values('Interim CEO');

Insert Into Positions
Values('Vice Chairman');

Insert Into Positions
Values('Commissioner');

Insert Into Positions
Values('Sole Commissioner');

Insert Into Positions
Values('Councilor');

Insert Into Positions
Values('Manager');

Insert Into Positions
Values('Clerk');

Insert Into Positions
Values('County Administrator');

Insert Into Positions
Values('Executive Assistant');

Insert Into Positions
Values('Chief Financial Officer');

Insert Into Positions
Values('Finance Personnel Director');



--insert data into Counties
Insert Into Counties
Values('Appling');

Insert Into Counties
Values('Athens-Clarke');

Insert Into Counties
Values('Atkinson');

Insert Into Counties
Values('Augusta-Richmond ');

Insert Into Counties
Values('Bacon');

Insert Into Counties
Values('Baker');

Insert Into Counties
Values('Baldwin');

Insert Into Counties
Values('Banks');

Insert Into Counties
Values('Barrow');

Insert Into Counties
Values('Bartow');

Insert Into Counties
Values('Ben Hill');

Insert Into Counties
Values('Berrien');

Insert Into Counties
Values('Bibb');

Insert Into Counties
Values('Bleckley');

Insert Into Counties
Values('Brantley');

Insert Into Counties
Values('Brooks');

Insert Into Counties
Values('Bryan');

Insert Into Counties
Values('Bulloch');

Insert Into Counties
Values('Burke');

Insert Into Counties
Values('Butts');

Insert Into Counties
Values('Calhoun');

Insert Into Counties
Values('Camden');

Insert Into Counties
Values('Candler');

Insert Into Counties
Values('Carroll');

Insert Into Counties
Values('Catoosa');

Insert Into Counties
Values('Charlton');

Insert Into Counties
Values('Chatham');

Insert Into Counties
Values('Chattooga');

Insert Into Counties
Values('Cherokee');

Insert Into Counties
Values('Clay');

Insert Into Counties
Values('Clayton');

Insert Into Counties
Values('Clinch');

Insert Into Counties
Values('Cobb');

Insert Into Counties
Values('Coffee');

Insert Into Counties
Values('Colquitt');

Insert Into Counties
Values('Columbia');

Insert Into Counties
Values('Columbus-Muscogee');

Insert Into Counties
Values('Cook');

Insert Into Counties
Values('Coweta');

Insert Into Counties
Values('Crawford');

Insert Into Counties
Values('Crisp');

Insert Into Counties
Values('Cusseta-Chattahoochee');

Insert Into Counties
Values('Dade');

Insert Into Counties
Values('Dawson');

Insert Into Counties
Values('Decatur');

Insert Into Counties
Values('Dekalb');

Insert Into Counties
Values('Dodge');

Insert Into Counties
Values('Dooly');

Insert Into Counties
Values('Dougherty');

Insert Into Counties
Values('Douglas');

Insert Into Counties
Values('Early');

Insert Into Counties
Values('Echols');

Insert Into Counties
Values('Effingham');

Insert Into Counties
Values('Elbert');

Insert Into Counties
Values('Emanuel');

Insert Into Counties
Values('Evans');

Insert Into Counties
Values('Fannin');

Insert Into Counties
Values('Fayette');

Insert Into Counties
Values('Floyd');

Insert Into Counties
Values('Forsyth');

Insert Into Counties
Values('Franklin');

Insert Into Counties
Values('Fulton');

Insert Into Counties
Values('Georgetown-Quitman');

Insert Into Counties
Values('Gilmer');

Insert Into Counties
Values('Glascock');

Insert Into Counties
Values('Glynn');

Insert Into Counties
Values('Gordon');

Insert Into Counties
Values('Grady');

Insert Into Counties
Values('Greene');

Insert Into Counties
Values('Gwinnett');

Insert Into Counties
Values('Habersham');

Insert Into Counties
Values('Hall');

Insert Into Counties
Values('Hancock');

Insert Into Counties
Values('Haralson');

Insert Into Counties
Values('Harris');

Insert Into Counties
Values('Hart');

Insert Into Counties
Values('Heard');

Insert Into Counties
Values('Henry');

Insert Into Counties
Values('Houston');

Insert Into Counties
Values('Irwin');

Insert Into Counties
Values('Jackson');

Insert Into Counties
Values('Jasper');

Insert Into Counties
Values('Jeff Davis');

Insert Into Counties
Values('Jefferson');

Insert Into Counties
Values('Jenkins');

Insert Into Counties
Values('Johnson');

Insert Into Counties
Values('Jones');

Insert Into Counties
Values('Lamar');

Insert Into Counties
Values('Lanier');

Insert Into Counties
Values('Laurens');

Insert Into Counties
Values('Lee');

Insert Into Counties
Values('Liberty');

Insert Into Counties
Values('Lincoln');

Insert Into Counties
Values('Long');

Insert Into Counties
Values('Lowndes');

Insert Into Counties
Values('Lumpkin');

Insert Into Counties
Values('Macon');

Insert Into Counties
Values('Marion');

Insert Into Counties
Values('Madison');

Insert Into Counties
Values('McDuffie');

Insert Into Counties
Values('McIntosh');

Insert Into Counties
Values('Meriwether');

Insert Into Counties
Values('Miler');

Insert Into Counties
Values('Mitchell');

Insert Into Counties
Values('Monroe');

Insert Into Counties
Values('Montgomery');

Insert Into Counties
Values('Morgan');

Insert Into Counties
Values('Murray');

Insert Into Counties
Values('Newton');

Insert Into Counties
Values('Oconee');

Insert Into Counties
Values('Oglethorpe');

Insert Into Counties
Values('Paulding');

Insert Into Counties
Values('Peach');

Insert Into Counties
Values('Pickens');

Insert Into Counties
Values('Pierce');

Insert Into Counties
Values('Pike');

Insert Into Counties
Values('Polk');

Insert Into Counties
Values('Pulaski');

Insert Into Counties
Values('Putnam');

Insert Into Counties
Values('Rabun');

Insert Into Counties
Values('Randolph');

Insert Into Counties
Values('Rockdale');

Insert Into Counties
Values('Schley');

Insert Into Counties
Values('Screven');

Insert Into Counties
Values('Seminole');

Insert Into Counties
Values('Spalding');

Insert Into Counties
Values('Stephens');

Insert Into Counties
Values('Stewart');

Insert Into Counties
Values('Sumter');

Insert Into Counties
Values('Talbot');

Insert Into Counties
Values('Taliaferro');

Insert Into Counties
Values('Tattnall');

Insert Into Counties
Values('Taylor');

Insert Into Counties
Values('Telfair');

Insert Into Counties
Values('Terrell');

Insert Into Counties
Values('Thomas');

Insert Into Counties
Values('Tift');

Insert Into Counties
Values('Toombs');

Insert Into Counties
Values('Towns');

Insert Into Counties
Values('Treutlen');

Insert Into Counties
Values('Troup');

Insert Into Counties
Values('Turner');

Insert Into Counties
Values('Twiggs');

Insert Into Counties
Values('Union');

Insert Into Counties
Values('Upson');

Insert Into Counties
Values('Walker');

Insert Into Counties
Values('Walton');

Insert Into Counties
Values('Ware');

Insert Into Counties
Values('Warren');

Insert Into Counties
Values('Washington');

Insert Into Counties
Values('Wayne');

Insert Into Counties
Values('Webster');

Insert Into Counties
Values('Wheeler');

Insert Into Counties
Values('White');

Insert Into Counties
Values('Whitfield');

Insert Into Counties
Values('Wilcox');

Insert Into Counties
Values('Wilkes');

Insert Into Counties
Values('Wilkinson');

Insert Into Counties
Values('Worth');



--Insert data into GeneralAssembly
Insert Into GeneralAssembly
Values('House of Representatives');

Insert Into GeneralAssembly
Values('State Senate');



--Insert data into CommitteeNames
Insert Into CommitteeNames
Values('House of Representatives', 'Agriculture & Consumer Affairs');

Insert Into CommitteeNames
Values('House of Representatives', 'Appropriations');

Insert Into CommitteeNames
Values('House of Representatives', 'Banks & Banking');

Insert Into CommitteeNames
Values('House of Representatives', 'Budget and Fiscal Affairs Oversight');

Insert Into CommitteeNames
Values('House of Representatives', 'Code Revision');

Insert Into CommitteeNames
Values('House of Representatives', 'Defense & Veterans Affairs');

Insert Into CommitteeNames
Values('House of Representatives', 'Economic Development & Tourism');

Insert Into CommitteeNames
Values('House of Representatives', 'Education');

Insert Into CommitteeNames
Values('House of Representatives', 'Energy, Utilities & Telecommunications');

Insert Into CommitteeNames
Values('House of Representatives', 'Ethics');

Insert Into CommitteeNames
Values('House of Representatives', 'Game, Fish, & Parks');

Insert Into CommitteeNames
Values('House of Representatives', 'Governmental Affairs');

Insert Into CommitteeNames
Values('House of Representatives', 'Health & Human Services');

Insert Into CommitteeNames
Values('House of Representatives', 'Higher Education');

Insert Into CommitteeNames
Values('House of Representatives', 'Human Relations & Aging');

Insert Into CommitteeNames
Values('House of Representatives', 'Industry and Labor');

Insert Into CommitteeNames
Values('House of Representatives', 'Information and Audits');

Insert Into CommitteeNames
Values('House of Representatives', 'Insurance');

Insert Into CommitteeNames
Values('House of Representatives', 'Interstate Cooperation');

Insert Into CommitteeNames
Values('House of Representatives', 'Intragovernmental Coordination');

Insert Into CommitteeNames
Values('House of Representatives', 'Judiciary');

Insert Into CommitteeNames
Values('House of Representatives', 'Judiciary Non-Civil');

Insert Into CommitteeNames
Values('House of Representatives', 'Juvenile Justice');

Insert Into CommitteeNames
Values('House of Representatives', 'Legislative & Congressional Reapportionment');

Insert Into CommitteeNames
Values('House of Representatives', 'MARTOC');

Insert Into CommitteeNames
Values('House of Representatives', 'Motor Vehicles');

Insert Into CommitteeNames
Values('House of Representatives', 'Natural Resources & Environment');

Insert Into CommitteeNames
Values('House of Representatives', 'Public Safety and Homeland Security');

Insert Into CommitteeNames
Values('House of Representatives', 'Regulated Industries');

Insert Into CommitteeNames
Values('House of Representatives', 'Retirement');

Insert Into CommitteeNames
Values('House of Representatives', 'Rules');

Insert Into CommitteeNames
Values('House of Representatives', 'Science and Technology');

Insert Into CommitteeNames
Values('House of Representatives', 'Small Business Development');

Insert Into CommitteeNames
Values('House of Representatives', 'Special Rules');

Insert Into CommitteeNames
Values('House of Representatives', 'State Planning & Community Affairs');

Insert Into CommitteeNames
Values('House of Representatives', 'State Properties');

Insert Into CommitteeNames
Values('House of Representatives', 'Transportation');

Insert Into CommitteeNames
Values('House of Representatives', 'Ways & Means');

Insert Into CommitteeNames
Values('State Senate', 'Administrative Affairs');

Insert Into CommitteeNames
Values('State Senate', 'Agriculture and Consumer Affairs');

Insert Into CommitteeNames
Values('State Senate', 'Appropriations');

Insert Into CommitteeNames
Values('State Senate', 'Assignments');

Insert Into CommitteeNames
Values('State Senate', 'Banking and Financial Institutions');

Insert Into CommitteeNames
Values('State Senate', 'Economic Development');

Insert Into CommitteeNames
Values('State Senate', 'Education and Youth');

Insert Into CommitteeNames
Values('State Senate', 'Ethics');

Insert Into CommitteeNames
Values('State Senate', 'Finance');

Insert Into CommitteeNames
Values('State Senate', 'Government Oversight');

Insert Into CommitteeNames
Values('State Senate', 'Health and Human Services');

Insert Into CommitteeNames
Values('State Senate', 'Higher Education');

Insert Into CommitteeNames
Values('State Senate', 'Insurance and Labor');

Insert Into CommitteeNames
Values('State Senate', 'Interstate Cooperation');

Insert Into CommitteeNames
Values('State Senate', 'Judiciary');

Insert Into CommitteeNames
Values('State Senate', 'Judiciary Non-Civil');

Insert Into CommitteeNames
Values('State Senate', 'MARTOC');

Insert Into CommitteeNames
Values('State Senate', 'Natural Resources and the Environment');

Insert Into CommitteeNames
Values('State Senate', 'Public Safety');

Insert Into CommitteeNames
Values('State Senate', 'Reapportionment and Redistricting');

Insert Into CommitteeNames
Values('State Senate', 'Regulated Industries and Utilities');

Insert Into CommitteeNames
Values('State Senate', 'Retirement');

Insert Into CommitteeNames
Values('State Senate', 'Rules');

Insert Into CommitteeNames
Values('State Senate', 'Science and Technology');

Insert Into CommitteeNames
Values('State Senate', 'Special Judiciary');

Insert Into CommitteeNames
Values('State Senate', 'State and Local Governmental Operations');

Insert Into CommitteeNames
Values('State Senate', 'State Institutions and Property');

Insert Into CommitteeNames
Values('State Senate', 'Transportation');

Insert Into CommitteeNames
Values('State Senate', 'Urban Affairs');

Insert Into CommitteeNames
Values('State Senate', 'Veterans, Military and Homeland Security');



--Insert data into Bills
Insert Into Bills
Values(1, 1, 'House of Representatives', 'Georgia Uniform Civil Forfeiture Procedure Act; enact');

Insert Into Bills
Values(2, 1, 'House of Representatives', 'State income tax; corporations subtract title fee paid upon purchase of motor vehicles; allow');

Insert Into Bills
Values(3, 1,'House of Representatives', 'Evidence; professional forestry; Department of Public Health; AIDS; provisions');

Insert Into Bills
Values(4, 1, 'House of Representatives', 'State government; pari-mutuel wagering on horse racing; provide');

Insert Into Bills
Values(5, 1, 'House of Representatives', 'Forest Park; City of; councilmember votes for calling special meeting; change number');

Insert Into Bills
Values(6, 1, 'House of Representatives', 'Piedmont Altamaha Transit Authority Act; enact');

Insert Into Bills
Values(7, 1, 'House of Representatives', 'Penal institutions; use of restraints on pregnant female inmates under certain circumstances; prohibit');

Insert Into Bills
Values(8, 1, 'House of Representatives', 'Controlled substances; adopt and incorporate by reference certain drug-free zones');

Insert Into Bills
Values(9, 1, 'House of Representatives', 'Education; mandatory for children; change age requirements');

Insert Into Bills
Values(10, 1, 'House of Representatives', 'General Assembly; create Citizens'' Redistricting Commission');

Insert Into Bills
Values(11, 1, 'House of Representatives', 'School buses; local school systems establish specific procedures and safety precautions regarding unloading children under eight; require');

Insert Into Bills
Values(12, 1, 'House of Representatives', 'Punishment; sentencing of defendants guilty of crimes involving bias or prejudice; repeal certain provisions');

Insert Into Bills
Values(13, 1, 'House of Representatives', 'Protecting Public School Funds Act; enact');

Insert Into Bills
Values(14, 1, 'House of Representatives', 'Public benefits; no longer require applicant to establish United States citizenship repeatedly');

Insert Into Bills
Values(15, 1, 'House of Representatives', 'Elementary and secondary education; annual reporting of bullying incidents; require');

Insert Into Bills
Values(16, 1, 'House of Representatives', 'Georgia State War Veterans'' Home; require Veterans Service Board to apply for certification to participate in medicare and Medicaid programs');

Insert Into Bills
Values(17, 1, 'House of Representatives', 'County and independent school districts; farm to school program; provide');

Insert Into Bills
Values(18, 1, 'House of Representatives', 'Blind Persons'' Braille Literacy Rights and Education Act; enact');

Insert Into Bills
Values(19, 1, 'House of Representatives', 'Dropout Deterrent Act; enact');

Insert Into Bills
Values(20, 1, 'House of Representatives', 'Income tax credit; certain volunteer firefighters; provide');

Insert Into Bills
Values(21, 1, 'House of Representatives', 'Adoption; postadoption contact agreements; provide');

Insert Into Bills
Values(22, 1, 'House of Representatives', 'Incorporation of municipal corporations; certain requirements and standards; provide');

Insert Into Bills
Values(23, 1, 'House of Representatives', 'Carbon monoxide detectors; public and private schools; require');

Insert Into Bills
Values(24, 1, 'House of Representatives', 'Fully Informed Jury Act of 2013; enact');

Insert Into Bills
Values(25, 1, 'House of Representatives', 'Game and fish; definition of “game fish”; revise');

Insert Into Bills
Values(26, 1, 'State Senate', 'Child''s Health Insurance Information and Records; provide that both parents have equal access');

Insert Into Bills
Values(27, 1, 'State Senate', 'Employment Security; benefits not paid to noncitizen who are not employed legally');

Insert Into Bills
Values(28, 1, 'State Senate', 'Elections and Primaries; provide for nonpartisan elections; district attorney solicitors-general, sheriffs, tax commissioners (PF)');

Insert Into Bills
Values(29, 1, 'State Senate', 'Registered Professional Nurses; provide continuing competency requirements as a requirement for license renewal');

Insert Into Bills
Values(30, 1, 'State Senate', 'Georgia Geospatial Advisory Council; reestablish; membership; duties');

Insert Into Bills
Values(31, 1, 'State Senate', 'Torts; recreational joint-use agreement; specifications; definitions');

Insert Into Bills
Values(32, 1, 'State Senate', 'Nurses; require mandatory reporting');

Insert Into Bills
Values(33, 1, 'State Senate', 'Georgia Alzheimer''s and Related Dementias State Plan Task Force; create');

Insert Into Bills
Values(34, 1, 'State Senate', 'Traffic Offenses; DUI; first time conviction; require ignition interlock device');

Insert Into Bills
Values(35, 1, 'State Senate', 'Georgia Lottery Corporation; require to conduct and publish a biannual audit');

Insert Into Bills
Values(36, 1, 'State Senate', 'Education; scholarships, loans, and grants; revise certain definitions');

Insert Into Bills
Values(37, 1, 'State Senate', '“Stacey Nicole English Act”; aid in the location of missing persons; incapacitated due to medical conditions; establish');

Insert Into Bills
Values(38, 1, 'State Senate', '“Hospital Medicaid Financing Program Act”; enact');

Insert Into Bills
Values(39, 1, 'State Senate', 'Macon, City of; City of Payne City; Bibb County; nonpartisan elections of mayor and commissioners');

Insert Into Bills
Values(40, 1, 'State Senate', 'Bibb County; provide for future elections for coroner');

Insert Into Bills
Values(41, 1, 'State Senate', 'Civil Court of Bibb County; nonpartisan election of the judge');

Insert Into Bills
Values(42, 1, 'State Senate', 'Payne City; abolish');

Insert Into Bills
Values(43, 1, 'State Senate', '“Georgia Self-service Storage Facility Act of 2013” change the due date for monthly rental payments');

Insert Into Bills
Values(44, 1, 'State Senate', 'Federal and State Funded Health Care Financing Program Overview Committee; establish');

Insert Into Bills
Values(45, 1, 'State Senate', 'State Government; federal health care reform legislation; legislative findings');

Insert Into Bills
Values(46, 1, 'State Senate', 'Cosmetologists; modify the requirements for continuing education');

Insert Into Bills
Values(47, 1, 'State Senate', 'Mental Health; authorize licensed professional counselor to perform certain acts; secure certification');

Insert Into Bills
Values(48, 1, 'State Senate', 'Courts; increase penalties that can impose for contempt of superior and state courts');

Insert Into Bills
Values(49, 1, 'State Senate', 'State Sales/Use Tax; monthly report; net receipts from online dealers; products sold in Georgia');

Insert Into Bills
Values(50, 1, 'State Senate', 'Celebrate Freedom Week; establish; posting of historical documents');

Insert Into Bills
Values(51, 2, 'House of Representatives', 'Haleigh''s Hope Act; enact');

Insert Into Bills
Values(52, 2, 'House of Representatives', 'State government; pari-mutuel wagering on horse racing; provisions');

Insert Into Bills
Values(53, 2, 'House of Representatives', 'Education; programs; person solicit transaction with student-athlete; provide sanctions');

Insert Into Bills
Values(54, 2, 'State Senate', '“Georgia Road Safety and Driver''s License Integrity Act”; provide persons who possess lawful alien status are only category of noncitizens (PF)');

Insert Into Bills
Values(55, 2, 'State Senate', '“Controlled Substances Therapeutic Relief Act”; repeal provisions; provide for medical use of marijuana; definitions (PF)');



Insert Into GovernorSigned
Values(1, 5, 1, '2013-05-07');

Insert Into GovernorSigned
Values(2, 21, 1, '2013-05-07');

Insert Into GovernorSigned
Values(3, 25, 1, '2013-05-06');

Insert Into GovernorSigned
Values(4, 26, 1, '2013-05-06');

Insert Into GovernorSigned
Values(5, 30, 1, '2013-05-07');

Insert Into GovernorSigned
Values(6, 33, 1, '2013-05-06');

Insert Into GovernorSigned
Values(7, 37, 1, '2014-04-24');

Insert Into GovernorSigned
Values(8, 38, 1, '2013-02-13');

Insert Into GovernorSigned
Values(9, 38, 1, '2013-02-14');

Insert Into GovernorSigned
Values(10, 38, 1, '2013-04-24');

Insert Into GovernorSigned
Values(11, 43, 1, '2013-05-06');

Insert Into GovernorSigned
Values(12, 44, 1, '2013-05-07');

Insert Into GovernorSigned
Values(13, 47, 1, '2014-04-21');

Insert Into GovernorSigned
Values(14, 48, 1, '2013-05-06');



Insert Into Votes
Values(1, 3, 1, 'House of Representatives', 129, 33, 6, 12);

Insert Into Votes
Values(2, 5, 1, 'House of Representatives', 151, 0, 17, 12);

Insert Into Votes
Values(3, 5, 1, 'State Senate', 47, 0, 3, 6);

Insert Into Votes
Values(4, 21, 1, 'House of Representatives', 157, 3, 8, 12);

Insert Into Votes
Values(5, 21, 1, 'State Senate', 51, 0, 5, 0);

Insert Into Votes
Values(6, 21, 1, 'House of Representatives', 169, 0, 7, 4);

Insert Into Votes
Values(7, 25, 1, 'House of Representatives', 168, 0, 6, 6);

Insert Into Votes
Values(8, 25, 1, 'State Senate', 38, 12, 3, 3);

Insert Into Votes
Values(9, 26, 1, 'State Senate', 49, 3, 0, 4);

Insert Into Votes
Values(10, 26, 1, 'House of Representatives', 164, 0, 8, 8);

Insert Into Votes
Values(11, 29, 1, 'State Senate', 51, 1, 1, 3);

Insert Into Votes
Values(12, 30, 1, 'State Senate', 49, 0, 5, 2);

Insert Into Votes
Values(13, 30, 1, 'House of Representatives', 142, 18, 9, 11);

Insert Into Votes
Values(14, 30, 1, 'State Senate', 51, 0, 2, 3);

Insert Into Votes
Values(15, 31, 1, 'State Senate', 50, 0, 1, 5);

Insert Into Votes
Values(16, 32, 1, 'State Senate', 52, 0, 3, 1);

Insert Into Votes
Values(17, 33, 1, 'State Senate', 51, 0, 3, 2);

Insert Into Votes
Values(18, 33, 1, 'House of Representatives', 158, 3, 7, 12);

Insert Into Votes
Values(19, 37, 1, 'State Senate', 51, 0, 4, 1);

Insert Into Votes
Values(20, 37, 1, 'House of Representatives', 164, 0, 9, 7);

Insert Into Votes
Values(21, 38, 1, 'State Senate', 46, 5, 5, 0);

Insert Into Votes
Values(22, 38, 1, 'State Senate', 17, 36, 3, 0);

Insert Into Votes
Values(23, 38, 1, 'State Senate', 18, 36, 2, 0);

Insert Into Votes
Values(24, 38, 1, 'State Senate', 46, 9, 1, 0);

Insert Into Votes
Values(25, 38, 1, 'House of Representatives', 147, 18, 5, 10);

Insert Into Votes
Values(26, 39, 1, 'State Senate', 34, 15, 6, 1);

Insert Into Votes
Values(27, 39, 1, 'House of Representatives', 111, 62, 4, 3);

Insert Into Votes
Values(28, 40, 1, 'State Senate', 34, 15, 6, 1);

Insert Into Votes
Values(29, 40, 1, 'House of Representatives', 110, 62, 5, 3);

Insert Into Votes
Values(30, 40, 1, 'State Senate', 35, 13, 3, 5);

Insert Into Votes
Values(31, 40, 1, 'House of Representatives', 105, 62, 8, 5);

Insert Into Votes
Values(32, 41, 1, 'State Senate', 34, 15, 6, 1);

Insert Into Votes
Values(33, 42, 1, 'State Senate', 50, 0, 6, 0);

Insert Into Votes
Values(34, 43, 1, 'State Senate', 57, 3, 1, 5);

Insert Into Votes
Values(35, 43, 1, 'House of Representatives', 159, 4, 7, 10);

Insert Into Votes
Values(36, 43, 1, 'State Senate', 47, 3, 4, 2);

Insert Into Votes
Values(37, 44, 1, 'State Senate', 45, 5, 5, 1);

Insert Into Votes
Values(38, 44, 1, 'House of Representatives', 126, 27, 20, 7);

Insert Into Votes
Values(39, 44, 1, 'House of Representatives', 151, 18, 9, 2);

Insert Into Votes
Values(40, 44, 1, 'State Senate', 45, 5, 4, 2);

Insert Into Votes
Values(41, 47, 1, 'State Senate', 51, 2, 0, 3);

Insert Into Votes
Values(42, 47, 1, 'House of Representatives', 119, 38, 13, 10);

Insert Into Votes
Values(43, 47, 1, 'State Senate', 47, 4, 4, 1);

Insert Into Votes
Values(44, 48, 1, 'State Senate', 42, 9, 2, 3);

Insert Into Votes
Values(45, 48, 1, 'House of Representatives', 116, 49, 6, 9);

Insert Into Votes
Values(46, 48, 1, 'State Senate', 45, 4, 5, 2);

Insert Into Votes
Values(47, 50, 1, 'State Senate', 42, 8, 1, 5);



Insert Into CommitteeAction
Values(1, 'House of Representatives', 'Judiciary', 1, 1);

Insert Into CommitteeAction
Values(2, 'House of Representatives', 'Judiciary', 3, 1);

Insert Into CommitteeAction
Values(3, 'State Senate', 'Judiciary', 3, 1);

Insert Into CommitteeAction
Values(4, 'House of Representatives', 'Regulated Industries', 4, 1);

Insert Into CommitteeAction
Values(5, 'House of Representatives', 'Intragovernmental Coordination', 5, 1);

Insert Into CommitteeAction
Values(6, 'State Senate', 'State and Local Governmental Operations', 5, 1);

Insert Into CommitteeAction
Values(7, 'House of Representatives', 'Education', 11, 1);

Insert Into CommitteeAction
Values(8, 'House of Representatives', 'Agriculture & Consumer Affairs', 17, 1);

Insert Into CommitteeAction
Values(9, 'House of Representatives', 'Education', 18, 1);

Insert Into CommitteeAction
Values(10, 'House of Representatives', 'Education', 19, 1);

Insert Into CommitteeAction
Values(11, 'House of Representatives', 'Ways & Means', 20, 1);

Insert Into CommitteeAction
Values(12, 'House of Representatives', 'Juvenile Justice', 21, 1);

Insert Into CommitteeAction
Values(13, 'State Senate', 'Judiciary', 21, 1);

Insert Into CommitteeAction
Values(14, 'House of Representatives', 'Governmental Affairs', 22, 1);

Insert Into CommitteeAction
Values(15, 'House of Representatives', 'Public Safety and Homeland Security', 23, 1);

Insert Into CommitteeAction
Values(16, 'House of Representatives', 'Game, Fish, & Parks', 25, 1);

Insert Into CommitteeAction
Values(17, 'State Senate', 'Natural Resources and the Environment', 25, 1);

Insert Into CommitteeAction
Values(18, 'State Senate', 'Insurance and Labor', 26, 1);

Insert Into CommitteeAction
Values(19, 'House of Representatives', 'Judiciary', 26, 1);

Insert Into CommitteeAction
Values(20, 'State Senate', 'Insurance and Labor', 27, 1);

Insert Into CommitteeAction
Values(21, 'State Senate', 'Health and Human Services', 29, 1);

Insert Into CommitteeAction
Values(22, 'House of Representatives', 'Health & Human Services', 29, 1);

Insert Into CommitteeAction
Values(23, 'State Senate', 'Natural Resources and the Environment', 30, 1);

Insert Into CommitteeAction
Values(24, 'House of Representatives', 'Natural Resources & Environment', 30, 1);

Insert Into CommitteeAction
Values(25, 'State Senate', 'Judiciary', 31, 1);

Insert Into CommitteeAction
Values(26, 'House of Representatives', 'Judiciary', 31, 1);

Insert Into CommitteeAction
Values(27, 'State Senate', 'Health and Human Services', 32, 1);

Insert Into CommitteeAction
Values(28, 'House of Representatives', 'Health & Human Services', 32, 1);

Insert Into CommitteeAction
Values(29, 'State Senate', 'Health and Human Services', 33, 1);

Insert Into CommitteeAction
Values(30, 'House of Representatives', 'Human Relations & Aging', 33, 1);

Insert Into CommitteeAction
Values(31, 'State Senate', 'Public Safety', 34, 1);

Insert Into CommitteeAction
Values(32, 'State Senate', 'Higher Education', 35, 1);

Insert Into CommitteeAction
Values(33, 'State Senate', 'Higher Education', 36, 1);

Insert Into CommitteeAction
Values(34, 'State Senate', 'Public Safety', 37, 1);

Insert Into CommitteeAction
Values(35, 'House of Representatives', 'Public Safety and Homeland Security', 37, 1);

Insert Into CommitteeAction
Values(36, 'State Senate', 'Regulated Industries and Utilities', 38, 1);

Insert Into CommitteeAction
Values(37, 'House of Representatives', 'Governmental Affairs', 38, 1);

Insert Into CommitteeAction
Values(38, 'State Senate', 'State and Local Governmental Operations', 39, 1);

Insert Into CommitteeAction
Values(39, 'House of Representatives', 'Intragovernmental Coordination', 39, 1);

Insert Into CommitteeAction
Values(40, 'State Senate', 'State and Local Governmental Operations', 40, 1);

Insert Into CommitteeAction
Values(41, 'House of Representatives', 'Intragovernmental Coordination', 40, 1);

Insert Into CommitteeAction
Values(42, 'State Senate', 'State and Local Governmental Operations', 41, 1);

Insert Into CommitteeAction
Values(43, 'House of Representatives', 'Intragovernmental Coordination', 41, 1);

Insert Into CommitteeAction
Values(44, 'State Senate', 'State and Local Governmental Operations', 42, 1);

Insert Into CommitteeAction
Values(45, 'House of Representatives', 'Intragovernmental Coordination', 42, 1);

Insert Into CommitteeAction
Values(46, 'State Senate', 'Regulated Industries and Utilities', 43, 1);

Insert Into CommitteeAction
Values(47, 'House of Representatives', 'Judiciary', 43, 1);

Insert Into CommitteeAction
Values(48, 'State Senate', 'Health and Human Services', 44, 1);

Insert Into CommitteeAction
Values(49, 'House of Representatives', 'Human Relations & Aging', 44, 1);

Insert Into CommitteeAction
Values(50, 'State Senate', 'Health and Human Services', 45, 1);

Insert Into CommitteeAction
Values(51, 'State Senate', 'Regulated Industries and Utilities', 46, 1);

Insert Into CommitteeAction
Values(52, 'State Senate', 'Health and Human Services', 47, 1);

Insert Into CommitteeAction
Values(53, 'House of Representatives', 'Health & Human Services', 47, 1);

Insert Into CommitteeAction
Values(54, 'State Senate', 'Judiciary', 48, 1);

Insert Into CommitteeAction
Values(55, 'House of Representatives', 'Judiciary', 48, 1);

Insert Into CommitteeAction
Values(56, 'State Senate', 'Finance', 49, 1);

Insert Into CommitteeAction
Values(57, 'State Senate', 'Education and Youth', 50, 1);

Insert Into CommitteeAction
Values(58, 'House of Representatives', 'Education', 50, 1);



--insert data into People
Insert Into People
Values(1, 'Nathan', 'Deal', NULL, 'Governor');

Insert Into People
Values(2, 'Casey', 'Cagle', NULL, 'Lieutenant Governor');

Insert Into People
Values(3, 'Sam', 'Olens', NULL, 'Attorney General');

Insert Into People
Values(4, 'Brian', 'Kemp', NULL, 'Secretary of State');

Insert Into People
Values(5, 'John', 'Barge', NULL, 'State School Superintendent');

Insert Into People
Values(6, 'Gary', 'Black', NULL, 'Commissioner of Agriculture');

Insert Into People
Values(7, 'Ralph', 'Hudgens', NULL, 'Commissioner of Insurance');

Insert Into People
Values(8, 'Mark', 'Butler', NULL, 'Commissioner of Labor');

Insert Into People
Values(9, 'Stacey', 'Abrams', NULL, 'Representative');

Insert Into People
Values(10, 'Kimberly', 'Alexander', NULL, 'Representative');

Insert Into People
Values(11, 'Stephen', 'Allison', NULL, 'Representative');

Insert Into People
Values(12, 'Tonya', 'Anderson', NULL, 'Representative');

Insert Into People
Values(13, 'Alex', 'Atwood', NULL, 'Representative');

Insert Into People
Values(14, 'Mandi L.', 'Ballinger', NULL, 'Representative');

Insert Into People
Values(15, 'Timothy', 'Barr', NULL, 'Representative');

Insert Into People
Values(16, 'Paul', 'Battles', NULL, 'Representative');

Insert Into People
Values(17, 'Sharon', 'Beasley-Teague', NULL, 'Representative');

Insert Into People
Values(18, 'Simone', 'Bell', NULL, 'Representative');

Insert Into People
Values(19, 'Karen', 'Bennett', NULL, 'Representative');

Insert Into People
Values(20, 'Patty', 'Bentley', NULL, 'Representative');

Insert Into People
Values(21, 'Tommy', 'Benton', NULL, 'Representative');

Insert Into People
Values(22, 'James', 'Beverly', NULL, 'Representative');

Insert Into People
Values(23, 'Ellis', 'Black', NULL, 'Representative');

Insert Into People
Values(24, 'Bruce', 'Broadrick', NULL, 'Representative');

Insert Into People
Values(25, 'Buzz', 'Brockway', NULL, 'Representative');

Insert Into People
Values(26, 'Tyrone', 'Brooks', NULL, 'Representative');

Insert Into People
Values(27, 'Roger', 'Bruce', NULL, 'Representative');

Insert Into People
Values(28, 'Bob', 'Bryant', NULL, 'Representative');

Insert Into People
Values(29, 'Debbie', 'Buckner', NULL, 'Representative');

Insert Into People
Values(30, 'Jon G.', 'Burns', NULL, 'Representative');

Insert Into People
Values(31, 'Michael', 'Caldwell', NULL, 'Representative');

Insert Into People
Values(32, 'Johnnie', 'Caldwell Jr.', NULL, 'Representative');

Insert Into People
Values(33, 'John', 'Carson', NULL, 'Representative');

Insert Into People
Values(34, 'Amy', 'Carter', NULL, 'Representative');

Insert Into People
Values(35, 'David', 'Casas', NULL, 'Representative');

Insert Into People
Values(36, 'Joyce', 'Chandler', NULL, 'Representative');

Insert Into People
Values(37, 'Mickey', 'Channell', NULL, 'Representative');

Insert Into People
Values(38, 'Jeff', 'Chapman', NULL, 'Representative');

Insert Into People
Values(39, 'Mike', 'Cheokas', NULL, 'Representative');

Insert Into People
Values(40, 'Josh', 'Clark', NULL, 'Representative');

Insert Into People
Values(41, 'Valerie', 'Clark', NULL, 'Representative');

Insert Into People
Values(42, 'Brooks', 'Coleman', NULL, 'Representative');

Insert Into People
Values(43, 'Kevin', 'Cooke', NULL, 'Representative');

Insert Into People
Values(44, 'Christian', 'Coomer', NULL, 'Representative');

Insert Into People
Values(45, 'Sharon', 'Cooper', NULL, 'Representative');

Insert Into People
Values(46, 'Dee', 'Dawkins-Haigler', NULL, 'Representative');

Insert Into People
Values(47, 'John', 'Deffenbaugh', NULL, 'Representative');

Insert Into People
Values(48, 'Katie M.', 'Dempsey', NULL, 'Representative');

Insert Into People
Values(49, 'Pam', 'Dickerson', NULL, 'Representative');

Insert Into People
Values(50, 'Robert', 'Dickey', NULL, 'Representative');

Insert Into People
Values(51, 'Tom', 'Dickson', NULL, 'Representative');

Insert Into People
Values(52, 'Matt', 'Dollar', NULL, 'Representative');

Insert Into People
Values(53, 'Demetrius', 'Douglas', NULL, 'Representative');

Insert Into People
Values(54, 'Karla', 'Drenner', NULL, 'Representative');

Insert Into People
Values(55, 'Mike', 'Dudgeon', NULL, 'Representative');

Insert Into People
Values(56, 'Winfred J', 'Dukes', NULL, 'Representative');

Insert Into People
Values(57, 'Emory', 'Dunahoo', NULL, 'Representative');

Insert Into People
Values(58, 'Geoff', 'Duncan', NULL, 'Representative');

Insert Into People
Values(59, 'Delvis', 'Dutton', NULL, 'Representative');

Insert Into People
Values(60, 'Chuck', 'Efstration', NULL, 'Representative');

Insert Into People
Values(61, 'Earl', 'Ehrhart', NULL, 'Representative');

Insert Into People
Values(62, 'Terry', 'England', NULL, 'Representative');

Insert Into People
Values(63, 'Bubber', 'Epps', NULL, 'Representative');

Insert Into People
Values(64, 'Carl Von', 'Epps', NULL, 'Representative');

Insert Into People
Values(65, 'Stacey', 'Evans', NULL, 'Representative');

Insert Into People
Values(66, 'Barry', 'Fleming', NULL, 'Representative');

Insert Into People
Values(67, 'Hugh', 'Floyd', NULL, 'Representative');

Insert Into People
Values(68, 'Virgil', 'Fludd', NULL, 'Representative');

Insert Into People
Values(69, 'Gloria', 'Frazier', NULL, 'Representative');

Insert Into People
Values(70, 'Spencer', 'Frye', NULL, 'Representative');

Insert Into People
Values(71, 'Carol', 'Fullerton', NULL, 'Representative');

Insert Into People
Values(72, 'Pat', 'Gardner', NULL, 'Representative');

Insert Into People
Values(73, 'Dan', 'Gasaway', NULL, 'Representative');

Insert Into People
Values(74, 'Harry', 'Geisinger', NULL, 'Representative');

Insert Into People
Values(75, 'Mike', 'Glanton', NULL, 'Representative');

Insert Into People
Values(76, 'Rich', 'Golick', NULL, 'Representative');

Insert Into People
Values(77, 'J. Craig', 'Gordon', NULL, 'Representative');

Insert Into People
Values(78, 'Micah', 'Gravley', NULL, 'Representative');

Insert Into People
Values(79, 'Gerald E', 'Greene', NULL, 'Representative');

Insert Into People
Values(80, 'Charles', 'Gregory', NULL, 'Representative');

Insert Into People
Values(81, 'Mark', 'Hamilton', NULL, 'Representative');

Insert Into People
Values(82, 'Ben', 'Harbin', NULL, 'Representative');

Insert Into People
Values(83, 'Buddy', 'Harden', NULL, 'Representative');

Insert Into People
Values(84, 'Brett', 'Harrell', NULL, 'Representative');

Insert Into People
Values(85, 'Matt', 'Hatchett', NULL, 'Representative');

Insert Into People
Values(86, 'Lee', 'Hawkins', NULL, 'Representative');

Insert Into People
Values(87, 'Michele', 'Henson', NULL, 'Representative');

Insert Into People
Values(88, 'Dustin', 'Hightower', NULL, 'Representative');

Insert Into People
Values(89, 'Bill', 'Hitchens', NULL, 'Representative');

Insert Into People
Values(90, 'Scott', 'Holcomb', NULL, 'Representative');

Insert Into People
Values(91, 'Susan', 'Holmes', NULL, 'Representative');

Insert Into People
Values(92, 'Doug', 'Holt', NULL, 'Representative');

Insert Into People
Values(93, 'Penny', 'Houston', NULL, 'Representative');

Insert Into People
Values(94, 'Henry “Wayne”', 'Howard', NULL, 'Representative');

Insert Into People
Values(95, 'Carolyn', 'Hugley', NULL, 'Representative');

Insert Into People
Values(96, 'Mack', 'Jackson', NULL, 'Representative');

Insert Into People
Values(97, 'Mike', 'Jacobs', NULL, 'Representative');

Insert Into People
Values(98, 'Rick', 'Jasperse', NULL, 'Representative');

Insert Into People
Values(99, 'Jan', 'Jones', NULL, 'Representative');

Insert Into People
Values(100, 'LaDawn', 'Jones', NULL, 'Representative');

Insert Into People
Values(101, 'Sheila', 'Jones', NULL, 'Representative');

Insert Into People
Values(102, 'Darryl', 'Jordan', NULL, 'Representative');

Insert Into People
Values(103, 'Margaret D.', 'Kaiser', NULL, 'Representative');

Insert Into People
Values(104, 'Trey', 'Kelley', NULL, 'Representative');

Insert Into People
Values(105, 'Dar''shun', 'Kendrick', NULL, 'Representative');

Insert Into People
Values(106, 'E. Culver “Rusty”', 'Kidd', NULL, 'Representative');

Insert Into People
Values(107, 'Tom', 'Kirby', NULL, 'Representative');

Insert Into People
Values(108, 'David', 'Knight', NULL, 'Representative');

Insert Into People
Values(109, 'Edward', 'Lindsey', NULL, 'Representative');

Insert Into People
Values(110, 'Eddie', 'Lumsden', NULL, 'Representative');

Insert Into People
Values(111, 'Ronnie', 'Mabra', NULL, 'Representative');

Insert Into People
Values(112, 'Pedro “Pete”', 'Marin', NULL, 'Representative');

Insert Into People
Values(113, 'Chuck', 'Martin', NULL, 'Representative');

Insert Into People
Values(114, 'Howard', 'Maxwell', NULL, 'Representative');

Insert Into People
Values(115, 'Rahn', 'Mayo', NULL, 'Representative');

Insert Into People
Values(116, 'Tom', 'McCall', NULL, 'Representative');

Insert Into People
Values(117, 'Dewey', 'McClain', NULL, 'Representative');

Insert Into People
Values(118, 'John', 'Meadows', NULL, 'Representative');

Insert Into People
Values(119, 'Billy', 'Mitchell', NULL, 'Representative');

Insert Into People
Values(120, 'Sam', 'Moore', NULL, 'Representative');

Insert Into People
Values(121, 'Alisha Thomas', 'Morgan', NULL, 'Representative');

Insert Into People
Values(122, 'Greg', 'Morris', NULL, 'Representative');

Insert Into People
Values(123, 'Howard', 'Mosby', NULL, 'Representative');

Insert Into People
Values(124, 'Chad', 'Nimmer', NULL, 'Representative');

Insert Into People
Values(125, 'Randy', 'Nix', NULL, 'Representative');

Insert Into People
Values(126, 'Larry', 'O''Neal', NULL, 'Representative');

Insert Into People
Values(127, 'Mary Margaret', 'Oliver', NULL, 'Representative');

Insert Into People
Values(128, 'B.J.', 'Pak', NULL, 'Representative');

Insert Into People
Values(129, 'Butch', 'Parrish', NULL, 'Representative');

Insert Into People
Values(130, 'Don', 'Parsons', NULL, 'Representative');

Insert Into People
Values(131, 'Allen', 'Peake', NULL, 'Representative');

Insert Into People
Values(132, 'John David', 'Pezold', NULL, 'Representative');

Insert Into People
Values(133, 'Alan', 'Powell', NULL, 'Representative');

Insert Into People
Values(134, 'Jay', 'Powell', NULL, 'Representative');

Insert Into People
Values(135, 'Brian', 'Prince', NULL, 'Representative');

Insert Into People
Values(136, 'Jimmy', 'Pruett', NULL, 'Representative');

Insert Into People
Values(137, 'Regina', 'Quick', NULL, 'Representative');

Insert Into People
Values(138, 'Paulette', 'Rakestraw', NULL, 'Representative');

Insert Into People
Values(139, 'David', 'Ralston', NULL, 'Representative');

Insert Into People
Values(140, 'Matt', 'Ramsey', NULL, 'Representative');

Insert Into People
Values(141, 'Nikki T.', 'Randall', NULL, 'Representative');

Insert Into People
Values(142, 'Tom', 'Rice', NULL, 'Representative');

Insert Into People
Values(143, 'Lynne', 'Riley', NULL, 'Representative');

Insert Into People
Values(144, 'Jay', 'Roberts', NULL, 'Representative');

Insert Into People
Values(145, 'Carl', 'Rogers', NULL, 'Representative');

Insert Into People
Values(146, 'Terry', 'Rogers', NULL, 'Representative');

Insert Into People
Values(147, 'Dale', 'Rutledge', NULL, 'Representative');

Insert Into People
Values(148, 'Ed', 'Rynders', NULL, 'Representative');

Insert Into People
Values(149, 'Sandra', 'Scott', NULL, 'Representative');

Insert Into People
Values(150, 'Ed', 'Setzler', NULL, 'Representative');

Insert Into People
Values(151, 'Dexter', 'Sharper', NULL, 'Representative');

Insert Into People
Values(152, 'Jason', 'Shaw', NULL, 'Representative');

Insert Into People
Values(153, 'Barbara', 'Sims', NULL, 'Representative');

Insert Into People
Values(154, 'Chuck', 'Sims', NULL, 'Representative');

Insert Into People
Values(155, 'Earnest', 'Smith', NULL, 'Representative');

Insert Into People
Values(156, 'Lynn', 'Smith', NULL, 'Representative');

Insert Into People
Values(157, 'Michael', 'Smith', NULL, 'Representative');

Insert Into People
Values(158, 'Richard H.', 'Smith', NULL, 'Representative');

Insert Into People
Values(159, 'Calvin', 'Smyre', NULL, 'Representative');

Insert Into People
Values(160, 'Jason', 'Spencer', NULL, 'Representative');

Insert Into People
Values(161, 'Mickey', 'Stephens', NULL, 'Representative');

Insert Into People
Values(162, 'Ron', 'Stephens', NULL, 'Representative');

Insert Into People
Values(163, 'Pam', 'Stephenson', NULL, 'Representative');

Insert Into People
Values(164, 'Valencia', 'Stovall', NULL, 'Representative');

Insert Into People
Values(165, 'David', 'Stover', NULL, 'Representative');

Insert Into People
Values(166, 'Brian', 'Strickland', NULL, 'Representative');

Insert Into People
Values(167, 'Willie', 'Talton', NULL, 'Representative');

Insert Into People
Values(168, 'Jan', 'Tankersley', NULL, 'Representative');

Insert Into People
Values(169, 'Kevin', 'Tanner', NULL, 'Representative');

Insert Into People
Values(170, 'Steve', 'Tarvin', NULL, 'Representative');

Insert Into People
Values(171, 'Darlene K.', 'Taylor', NULL, 'Representative');

Insert Into People
Values(172, 'Tom', 'Taylor', NULL, 'Representative');

Insert Into People
Values(173, 'Sam', 'Teasley', NULL, 'Representative');

Insert Into People
Values(174, '“Able” Mable', 'Thomas', NULL, 'Representative');

Insert Into People
Values(175, 'Scot', 'Turner', NULL, 'Representative');

Insert Into People
Values(176, 'Keisha', 'Waites', NULL, 'Representative');

Insert Into People
Values(177, 'Ben', 'Watson', NULL, 'Representative');

Insert Into People
Values(178, 'Sam', 'Watson', NULL, 'Representative');

Insert Into People
Values(179, 'Andrew J.', 'Welch', NULL, 'Representative');

Insert Into People
Values(180, 'Tom', 'Weldon', NULL, 'Representative');

Insert Into People
Values(181, 'David', 'Wilkerson', NULL, 'Representative');

Insert Into People
Values(182, 'Joe', 'Wilkinson', NULL, 'Representative');

Insert Into People
Values(183, 'Wendell', 'Willard', NULL, 'Representative');

Insert Into People
Values(184, '“Coach”', 'Williams', NULL, 'Representative');

Insert Into People
Values(185, 'Al', 'Williams', NULL, 'Representative');

Insert Into People
Values(186, 'Chuck', 'Williams', NULL, 'Representative');

Insert Into People
Values(187, 'Bruce', 'Williamson', NULL, 'Representative');

Insert Into People
Values(188, 'John P', 'Yates', NULL, 'Representative');

Insert Into People
Values(189, 'John', 'Albers', NULL, 'Senator');

Insert Into People
Values(190, 'Don', 'Balfour', NULL, 'Senator');

Insert Into People
Values(191, 'Brandon', 'Beach', NULL, 'Senator');

Insert Into People
Values(192, 'Charlie', 'Bethel', NULL, 'Senator');

Insert Into People
Values(193, 'Dean', 'Burke', NULL, 'Senator');

Insert Into People
Values(194, 'Gloria S.', 'Butler', NULL, 'Senator');

Insert Into People
Values(195, 'Buddy', 'Carter', NULL, 'Senator');

Insert Into People
Values(196, 'Jason', 'Carter', NULL, 'Senator');

Insert Into People
Values(197, 'Ronnie', 'Chance', NULL, 'Senator');

Insert Into People
Values(198, 'Bill', 'Cowsert', NULL, 'Senator');

Insert Into People
Values(199, 'Mike', 'Crane', NULL, 'Senator');

Insert Into People
Values(200, 'John', 'Crosby', NULL, 'Senator');

Insert Into People
Values(201, 'Gail', 'Davenport', NULL, 'Senator');

Insert Into People
Values(202, 'Hardie', 'Davis', NULL, 'Senator');

Insert Into People
Values(203, 'Mike', 'Dugan', NULL, 'Senator');

Insert Into People
Values(204, 'Vincent', 'Fort', NULL, 'Senator');

Insert Into People
Values(205, 'Frank', 'Ginn', NULL, 'Senator');

Insert Into People
Values(206, 'Tim', 'Golden', NULL, 'Senator');

Insert Into People
Values(207, 'Steve', 'Gooch', NULL, 'Senator');

Insert Into People
Values(208, 'Ed', 'Harbison', NULL, 'Senator');

Insert Into People
Values(209, 'Tyler', 'Harper', NULL, 'Senator');

Insert Into People
Values(210, 'Bill', 'Heath', NULL, 'Senator');

Insert Into People
Values(211, 'Steve', 'Henson', NULL, 'Senator');

Insert Into People
Values(212, 'Hunter', 'Hill', NULL, 'Senator');

Insert Into People
Values(213, 'Jack', 'Hill', NULL, 'Senator');

Insert Into People
Values(214, 'Judson', 'Hill', NULL, 'Senator');

Insert Into People
Values(215, 'Chuck', 'Hufstetler', NULL, 'Senator');

Insert Into People
Values(216, 'Bill', 'Jackson', NULL, 'Senator');

Insert Into People
Values(217, 'Lester G.', 'Jackson', NULL, 'Senator');

Insert Into People
Values(218, 'Donzella', 'James', NULL, 'Senator');

Insert Into People
Values(219, 'Rick', 'Jeffares', NULL, 'Senator');

Insert Into People
Values(220, 'Burt', 'Jones', NULL, 'Senator');

Insert Into People
Values(221, 'Emanuel', 'Jones', NULL, 'Senator');

Insert Into People
Values(222, 'William T.', 'Ligon Jr.', NULL, 'Senator');

Insert Into People
Values(223, 'Barry', 'Loudermilk', NULL, 'Senator');

Insert Into People
Values(224, 'David', 'Lucas', NULL, 'Senator');

Insert Into People
Values(225, 'Joshua', 'McKoon', NULL, 'Senator');

Insert Into People
Values(226, 'Fran', 'Miller', NULL, 'Senator');

Insert Into People
Values(227, 'Butch', 'Miller', NULL, 'Senator');

Insert Into People
Values(228, 'Jeff', 'Mullis', NULL, 'Senator');

Insert Into People
Values(229, 'Jack', 'Murphy', NULL, 'Senator');

Insert Into People
Values(230, 'Nan', 'Orrock', NULL, 'Senator');

Insert Into People
Values(231, 'Ronald B.', 'Ramsey Sr.', NULL, 'Senator');

Insert Into People
Values(232, 'Valencia', 'Seay', NULL, 'Senator');

Insert Into People
Values(233, 'David', 'Shafer', NULL, 'Senator');

Insert Into People
Values(234, 'Freddie Powell', 'Sims', NULL, 'Senator');

Insert Into People
Values(235, 'Cecil', 'Staton', NULL, 'Senator');

Insert Into People
Values(236, 'Jesse', 'Stone', NULL, 'Senator');

Insert Into People
Values(237, 'Horacena', 'Tate', NULL, 'Senator');

Insert Into People
Values(238, 'Bruce', 'Thompson', NULL, 'Senator');

Insert Into People
Values(239, 'Curt', 'Thompson', NULL, 'Senator');

Insert Into People
Values(240, 'Steve', 'Thompson', NULL, 'Senator');

Insert Into People
Values(241, 'Lindsey', 'Tippins', NULL, 'Senator');

Insert Into People
Values(242, 'Ross', 'Tolleson', NULL, 'Senator');

Insert Into People
Values(243, 'Renee S', 'Unterman', NULL, 'Senator');

Insert Into People
Values(244, 'John', 'Wilkinson', NULL, 'Senator');

Insert Into People
Values(245, 'Tommie', 'Williams', NULL, 'Senator');


Insert Into People
Values(246, 'Lewis', 'Parker', 'Appling', 'Chairman');

Insert Into People
Values(247, 'Sarah', 'Boatright', 'Appling', 'Commissioner');

Insert Into People
Values(248, 'Theodore', 'Wilkerson', 'Appling', 'Commissioner');

Insert Into People
Values(249, 'Daryl', 'Edwards', 'Appling', 'Commissioner');

Insert Into People
Values(250, 'Ronald', 'Rentz', 'Appling', 'Commissioner');

Insert Into People
Values(251, 'Charlie', 'Leggett', 'Appling', 'Commissioner');

Insert Into People
Values(252, 'Lee', 'Lewis', 'Appling', 'Commissioner');

Insert Into People
Values(253, 'Nancy', 'Denson', 'Athens-Clarke', 'Mayor');

Insert Into People
Values(254, 'Doug', 'Lowry', 'Athens-Clarke', 'Commissioner');

Insert Into People
Values(255, 'Harry', 'Sims', 'Athens-Clarke', 'Commissioner');

Insert Into People
Values(256, 'George', 'Maxwell', 'Athens-Clarke', 'Commissioner');

Insert Into People
Values(257, 'Allison', 'Wright', 'Athens-Clarke', 'Commissioner');

Insert Into People
Values(258, 'Jared', 'Bailey', 'Athens-Clarke', 'Commissioner');

Insert Into People
Values(259, 'Jerry', 'NeSmith', 'Athens-Clarke', 'Commissioner');

Insert Into People
Values(260, 'Kathy', 'Hoard', 'Athens-Clarke', 'Commissioner');

Insert Into People
Values(261, 'Andy', 'Herod', 'Athens-Clarke', 'Commissioner');

Insert Into People
Values(262, 'Kelly', 'Girtz', 'Athens-Clarke', 'Commissioner');

Insert Into People
Values(263, 'Mike', 'Hamby', 'Athens-Clarke', 'Commissioner');

Insert Into People
Values(264, 'Terry', 'Morris', 'Atkinson', 'Chairman');

Insert Into People
Values(265, 'Jimmy', 'Roberts', 'Atkinson', 'Commissioner');

Insert Into People
Values(266, 'Jayson', 'Joyner', 'Atkinson', 'Commissioner');

Insert Into People
Values(267, 'Charlton', 'Gillis', 'Atkinson', 'Commissioner');

Insert Into People
Values(268, 'Danny', 'Spikes', 'Atkinson', 'Commissioner');

Insert Into People
Values(269, 'Travis', 'Ursrey', 'Atkinson', 'Commissioner');

Insert Into People
Values(270, 'Deke', 'Copenhaver', 'Augusta-Richmond', 'Mayor');

Insert Into People
Values(271, 'William', 'Fennoy', 'Augusta-Richmond', 'Commissioner');

Insert Into People
Values(272, 'Ben', 'Hasan', 'Augusta-Richmond', 'Commissioner');

Insert Into People
Values(273, 'Corey', 'Johnson', 'Augusta-Richmond', 'Commissioner');

Insert Into People
Values(274, 'Louis', 'Harris', 'Augusta-Richmond', 'Commissioner');

Insert Into People
Values(275, 'Mary', 'Davis', 'Augusta-Richmond', 'Commissioner');

Insert Into People
Values(276, 'Wayne', 'Guilfoyle', 'Augusta-Richmond', 'Commissioner');

Insert Into People
Values(277, 'Alvin', 'Mason', 'Augusta-Richmond', 'Commissioner');

Insert Into People
Values(278, 'Marion', 'Williams', 'Augusta-Richmond', 'Commissioner');

Insert Into People
Values(279, 'Bill', 'Lockett', 'Augusta-Richmond', 'Commissioner');

Insert Into People
Values(280, 'Grady', 'Smith', 'Augusta-Richmond', 'Commissioner');

Insert Into People
Values(281, 'Andy', 'Hutto', 'Bacon', 'Chairman');

Insert Into People
Values(282, 'Kenny', 'Murphy', 'Bacon', 'Commissioner');

Insert Into People
Values(283, 'Larry', 'Smith', 'Bacon', 'Commissioner');

Insert Into People
Values(284, 'Hobart', 'Taylor', 'Bacon', 'Commissioner');

Insert Into People
Values(285, 'Lee', 'Hagans', 'Bacon', 'Commissioner');

Insert Into People
Values(286, 'Roy', 'Newberry', 'Bacon', 'Commissioner');

Insert Into People
Values(287, 'Connie', 'Hobbs', 'Baker', 'Chairman');

Insert Into People
Values(288, 'Vann', 'Irvin', 'Baker', 'Vice Chairman');

Insert Into People
Values(289, 'Kevin', 'Coker', 'Baker', 'Commissioner');

Insert Into People
Values(290, 'Tommy', 'Rentz', 'Baker', 'Commissioner');

Insert Into People
Values(291, 'Rachel', 'Rish', 'Baker', 'Commissioner');

Insert Into People
Values(292, 'Dana', 'Meade', 'Baker', 'Commissioner');

Insert Into People
Values(293, 'Sammy', 'Hall', 'Baldwin', 'Chairman');

Insert Into People
Values(294, 'Emily', 'Davis', 'Baldwin', 'Vice Chairman');

Insert Into People
Values(295, 'Tommy', 'French', 'Baldwin', 'Vice Chairman');

Insert Into People
Values(296, 'Henry', 'Craig', 'Baldwin', 'Commissioner');

Insert Into People
Values(297, 'John', 'Westmoreland', 'Baldwin', 'Commissioner');

Insert Into People
Values(298, 'Jimmy', 'Hooper', 'Banks', 'Chairman');

Insert Into People
Values(299, 'Charles', 'Turk', 'Banks', 'Vice Chairman');

Insert Into People
Values(300, 'Danny', 'Maxwell', 'Banks', 'Commissioner');

Insert Into People
Values(301, 'David', 'Duckett', 'Banks', 'Commissioner');

Insert Into People
Values(302, 'Sammy', 'Reece', 'Banks', 'Commissioner');

Insert Into People
Values(303, 'Pat', 'Graham', 'Barrow', 'Chairman');

Insert Into People
Values(304, 'Joe', 'Goodman', 'Barrow', 'Commissioner');

Insert Into People
Values(305, 'Kenny', 'Shook', 'Barrow', 'Commissioner');

Insert Into People
Values(306, 'Steve', 'Worley', 'Barrow', 'Commissioner');

Insert Into People
Values(307, 'Isaiah', 'Berry', 'Barrow', 'Commissioner');

Insert Into People
Values(308, 'Billy', 'Parks', 'Barrow', 'Commissioner');

Insert Into People
Values(309, 'Ben', 'Hendrix', 'Barrow', 'Commissioner');

Insert Into People
Values(310, 'Steve', 'Taylor', 'Bartow', 'Sole Commissioner');

Insert Into People
Values(311, 'Philip', 'Jay III', ' Ben Hill', 'Chairman');

Insert Into People
Values(312, 'O.D.', 'Netter Jr', 'Ben Hill', 'Vice Chairman');

Insert Into People
Values(313, 'Scott', 'Downing', 'Ben Hill', 'Commissioner');

Insert Into People
Values(314, 'Bennie', 'Calloway', 'Ben Hill', 'Commissioner');

Insert Into People
Values(315, 'Daniel', 'Cowan', 'Ben Hill', 'Commissioner');

Insert Into People
Values(316, 'Steve', 'Sumner', 'Berrien', 'Chairman');

Insert Into People
Values(317, 'John', 'Nugent', 'Berrien', 'Commissioner');

Insert Into People
Values(318, 'Robert', 'Griner', 'Berrien', 'Commissioner');

Insert Into People
Values(319, 'Doc', 'Sumner', 'Berrien', 'Commissioner');

Insert Into People
Values(320, 'Jimmy', 'Parker', 'Berrien', 'Commissioner');

Insert Into People
Values(321, 'Robert', 'Reichert', 'Bibb', 'Mayor');

Insert Into People
Values(322, 'Gary', 'Bechtel', 'Bibb', 'Commissioner');

Insert Into People
Values(323, 'Larry', 'Schlesinger', 'Bibb', 'Commissioner');

Insert Into People
Values(324, 'Elaine', 'Lucas', 'Bibb', 'Commissioner');

Insert Into People
Values(325, 'Mallory', 'Jones III', 'Bibb', 'Commissioner');

Insert Into People
Values(326, 'Bert', 'Bivins III', 'Bibb', 'Commissioner');

Insert Into People
Values(327, 'Ed', 'Defore', 'Bibb', 'Commissioner');

Insert Into People
Values(328, 'Scotty', 'Shepherd', 'Bibb', 'Commissioner');

Insert Into People
Values(329, 'Virgil', 'Watkins Jr.', 'Bibb', 'Commissioner');

Insert Into People
Values(330, 'Al', 'Tillman', 'Bibb', 'Commissioner');

Insert Into People
Values(331, 'Robert', 'Brockman', 'Bleckley', 'Sole Commissioner');

Insert Into People
Values(332, 'Charlie', 'Summerlin', 'Brantley', 'Chairman');

Insert Into People
Values(333, 'Chris', 'Harris', 'Brantley', 'Vice Chairman');

Insert Into People
Values(334, 'James', 'Spradley', 'Brantley', 'Commissioner');

Insert Into People
Values(335, 'Michael', 'Edgy', 'Brantley', 'Commissioner');

Insert Into People
Values(336, 'Brian', 'Hendrix', 'Brantley', 'Commissioner');

Insert Into People
Values(337, 'Sanford', 'Jones', 'Brooks', 'Chairman');

 Insert Into People
Values(338, 'Myra', 'Exum', 'Brooks', 'Vice Chairman');

Insert Into People
Values(339, 'Willie', 'Cody', 'Brooks', 'Commissioner');

Insert Into People
Values(340, 'James', 'Maxwell', 'Brooks', 'Commissioner');

Insert Into People
Values(341, 'Joe', 'Wingate', 'Brooks', 'Commissioner');

Insert Into People
Values(342, 'Jimmy', 'Burnsed', 'Bryan', 'Chairman');

Insert Into People
Values(343, 'Noah', 'Covington', 'Bryan', 'Commissioner');

Insert Into People
Values(344, 'Wade', 'Price', 'Bryan', 'Commissioner');

Insert Into People
Values(345, 'Steve', 'Myers', 'Bryan', 'Commissioner');

Insert Into People
Values(346, 'Carter', 'Infinger', 'Bryan', 'Commissioner');

Insert Into People
Values(347, 'Jimmy', 'Henderson', 'Bryan', 'Commissioner');

Insert Into People
Values(348, 'Garrett', 'Nevil', 'Bulloch', 'Chairman');

Insert Into People
Values(349, 'Anthony', 'Simmons', 'Bulloch', 'Vice Chairman');

Insert Into People
Values(350, 'Walter', 'Gibson', 'Bulloch', 'Commissioner');

Insert Into People
Values(351, 'Carolyn', 'Ethridge', 'Bulloch', 'Commissioner');

Insert Into People
Values(352, 'Ray', 'Mosley', 'Bulloch', 'Commissioner');

Insert Into People
Values(353, 'Robert', 'Rushing', 'Bulloch', 'Commissioner');

Insert Into People
Values(354, 'Roy', 'Thompson', 'Bulloch', 'Commissioner');

Insert Into People
Values(355, 'R. Wayne', 'Crockett', 'Burke', 'Chairman');

Insert Into People
Values(356, 'Allen', 'Delaigle', 'Burke', 'Vice Chairman');

Insert Into People
Values(357, 'Lucious', 'Abrams Jr.', 'Burke', 'Commissioner');

Insert Into People
Values(358, 'George', 'Deloach', 'Burke', 'Commissioner');

Insert Into People
Values(359, 'Terri', 'Kelly', 'Burke', 'Commissioner');

Insert Into People
Values(360, 'Roger', 'McDaniel', 'Butts', 'Chairman');

Insert Into People
Values(361, 'Robert', 'Henderson', 'Butts', 'Vice Chairman');

Insert Into People
Values(362, 'Jalaudin', 'Douglas', 'Butts', 'Commissioner');

Insert Into People
Values(363, 'Genous', 'Hodges', 'Butts', 'Commissioner');

Insert Into People
Values(364, 'Mike', 'Patterson', 'Butts', 'Commissioner');

Insert Into People
Values(365, 'Charlie', 'Williams', 'Calhoun', 'Chairman');

Insert Into People
Values(366, 'Normadean', 'Schramm', 'Calhoun', 'Vice Chairman');

Insert Into People
Values(367, 'Richard', 'West', 'Calhoun', 'Commissioner');

Insert Into People
Values(368, 'Earl', 'Scott', 'Calhoun', 'Commissioner');

Insert Into People
Values(369, 'Brenda', 'Weathersby', 'Calhoun', 'Commissioner');

Insert Into People
Values(370, 'Jimmy', 'Starling', 'Camden', 'Chairman');

Insert Into People
Values(371, 'Chuck', 'Clark', 'Camden', 'Vice Chairman');

Insert Into People
Values(372, 'Willis', 'Keene Jr.', 'Camden', 'Commissioner');

Insert Into People
Values(373, 'Tony', 'Sheppard', 'Camden', 'Commissioner');

Insert Into People
Values(374, 'Gary', 'Blount', 'Camden', 'Commissioner');

Insert Into People
Values(375, 'Glyn', 'Thrift', 'Candler', 'Chairman');

Insert Into People
Values(376, 'David', 'Jones', 'Candler', 'Commissioner');

Insert Into People
Values(377, 'Henry', 'Meridy', 'Candler', 'Commissioner');

Insert Into People
Values(378, 'David', 'Robinson', 'Candler', 'Commissioner');

Insert Into People
Values(379, 'Donny', 'Wells', 'Candler', 'Commissioner');

Insert Into People
Values(380, 'Marty', 'Smith', 'Carroll', 'Chairman');

Insert Into People
Values(381, 'Trent', 'North', 'Carroll', 'Commissioner');

Insert Into People
Values(382, 'Vicki', 'Anderson', 'Carroll', 'Commissioner');

Insert Into People
Values(383, 'Tommy', 'Lee', 'Carroll', 'Commissioner');

Insert Into People
Values(384, 'John', 'Wilson', 'Carroll', 'Commissioner');

Insert Into People
Values(385, 'Kevin', 'Jackson', 'Carroll', 'Commissioner');

Insert Into People
Values(386, 'George', 'Chambers', 'Carroll', 'Commissioner');

Insert Into People
Values(387, 'Keith', 'Green', 'Catoosa', 'Chairman');

Insert Into People
Values(388, 'Jeff', 'Long', 'Catoosa', 'Commissioner');

Insert Into People
Values(389, 'Bobby', 'Winters', 'Catoosa', 'Commissioner');

Insert Into People
Values(390, 'Jim', 'Cutler', 'Catoosa', 'Commissioner');

Insert Into People
Values(391, 'Dewayne', 'Hill', 'Catoosa', 'Commissioner');

Insert Into People
Values(392, 'Wade', 'Johnson', 'Charlton', 'Chairman');

Insert Into People
Values(393, 'Alphya', 'Benefield', 'Charlton', 'Vice Chairman');

Insert Into People
Values(394, 'James', 'Everett', 'Charlton', 'Commissioner');

Insert Into People
Values(395, 'Jesse', 'Crews', 'Charlton', 'Commissioner');

Insert Into People
Values(396, 'John', 'Meyer', 'Charlton', 'Commissioner');

Insert Into People
Values(397, 'Albert', 'Scott', 'Chatham', 'Chairman');

Insert Into People
Values(398, 'Helen', 'Stone', 'Chatham', 'Commissioner');

Insert Into People
Values(399, 'James', 'Holmes', 'Chatham', 'Commissioner');

Insert Into People
Values(400, 'Tony', 'Center', 'Chatham', 'Commissioner');

Insert Into People
Values(401, 'Patrick', 'Farrell', 'Chatham', 'Commissioner');

Insert Into People
Values(402, 'Yusuf', 'Shabazz', 'Chatham', 'Commissioner');

Insert Into People
Values(403, 'Lori', 'Brady', 'Chatham', 'Commissioner');

Insert Into People
Values(404, 'Dean', 'Kicklighter', 'Chatham', 'Commissioner');

Insert Into People
Values(405, 'Priscilla', 'Thomas', 'Chatham', 'Commissioner');

Insert Into People
Values(406, 'Jason', 'Winters', 'Chattooga', 'Sole Commissioner');

Insert Into People
Values(407, 'L.B', 'Ahrens', 'Cherokee', 'Chairman');

Insert Into People
Values(408, 'Harry', 'Johnston', 'Cherokee', 'Commissioner');

Insert Into People
Values(409, 'Ray', 'Gunnin', 'Cherokee', 'Commissioner');

Insert Into People
Values(410, 'Brian', 'Poole', 'Cherokee', 'Commissioner');

Insert Into People
Values(411, 'Jason', 'Nelms', 'Cherokee', 'Commissioner');

Insert Into People
Values(412, 'David', 'Shivers', 'Clay', 'Chairman');

Insert Into People
Values(413, 'Lee', 'Hubbard', 'Clay', 'Commissioner');

Insert Into People
Values(414, 'James', 'Snyder', 'Clay', 'Commissioner');

Insert Into People
Values(415, 'James', 'Davenport', 'Clay', 'Commissioner');

Insert Into People
Values(416, 'Ernest', 'Jenkins', 'Clay', 'Commissioner');

Insert Into People
Values(417, 'Jeffrey', 'Turner', 'Clayton', 'Chairman');

Insert Into People
Values(418, 'Shana', 'Rooks', 'Clayton', 'Vice Chairman');

Insert Into People
Values(419, 'Sonna', 'Singleton', 'Clayton', 'Commissioner');

Insert Into People
Values(420, 'Gail', 'Hambrick', 'Clayton', 'Commissioner');

Insert Into People
Values(421, 'Michael', 'Edmondson', 'Clayton', 'Commissioner');

Insert Into People
Values(422, 'Debra', 'Thomas', 'Clinch', 'Chairman');

Insert Into People
Values(423, 'Chad', 'Brown', 'Clinch', 'Vice Chairman');

Insert Into People
Values(424, 'Nan', 'Mikell', 'Clinch', 'Commissioner');

Insert Into People
Values(425, 'Henry', 'Moylan', 'Clinch', 'Commissioner');

Insert Into People
Values(426, 'Roger', 'Metts', 'Clinch', 'Commissioner');

Insert Into People
Values(427, 'Tim', 'Lee', 'Cobb', 'Chairman');

Insert Into People
Values(428, 'Helen', 'Goreham', 'Cobb', 'Commissioner');

Insert Into People
Values(429, 'Lisa', 'Cupid', 'Cobb', 'Commissioner');

Insert Into People
Values(430, 'Bob', 'Ott', 'Cobb', 'Commissioner');

Insert Into People
Values(431, 'JoAnn', 'Birrell', 'Cobb', 'Commissioner');

Insert Into People
Values(432, 'Frank', 'Jackson', 'Coffee', 'Chairman');

Insert Into People
Values(433, 'Jimmy', 'Kitchens', 'Coffee', 'Vice Chairman');

Insert Into People
Values(434, 'Tom', 'Rice', 'Coffee', 'Commissioner');

Insert Into People
Values(435, 'Johnny', 'Jowers', 'Coffee', 'Commissioner');

Insert Into People
Values(436, 'Charles', 'Deen', 'Coffee', 'Commissioner');

Insert Into People
Values(437, 'John', 'Alderman', 'Colquitt', 'Chairman');

Insert Into People
Values(438, 'Johnny', 'Hardin', 'Colquitt', 'Commissioner');

Insert Into People
Values(439, 'Ray', 'Saunders', 'Colquitt', 'Commissioner');

Insert Into People
Values(440, 'Donna', 'Herndon', 'Colquitt', 'Commissioner');

Insert Into People
Values(441, 'Terry', 'Clark', 'Colquitt', 'Commissioner');

Insert Into People
Values(442, 'James', 'Giddens', 'Colquitt', 'Commissioner');

Insert Into People
Values(443, 'Luke', 'String', 'Colquitt', 'Commissioner');

Insert Into People
Values(444, 'Ron', 'Cross', 'Columbia', 'Chairman');

Insert Into People
Values(445, 'Ron', 'Thigpen', 'Columbia', 'Vice Chairman');

Insert Into People
Values(446, 'Trey', 'Allen', 'Columbia', 'Commissioner');

Insert Into People
Values(447, 'William', 'Morris', 'Columbia', 'Commissioner');

Insert Into People
Values(448, 'Teresa', 'Tomlinson', 'Columbus-Muscogee', 'Mayor');

Insert Into People
Values(449, 'Jerry', 'Barnes', 'Columbus-Muscogee', 'Councilor');

Insert Into People
Values(450, 'Glenn', 'Davis', 'Columbus-Muscogee', 'Councilor');

Insert Into People
Values(451, 'Bruce', 'Huff', 'Columbus-Muscogee', 'Councilor');

Insert Into People
Values(452, 'Evelyn', 'Pugh', 'Columbus-Muscogee', 'Councilor');

Insert Into People
Values(453, 'Mike', 'Baker', 'Columbus-Muscogee', 'Councilor');

Insert Into People
Values(454, 'Gary', 'Allen', 'Columbus-Muscogee', 'Councilor');

Insert Into People
Values(455, 'Evelyn', 'Woodson', 'Columbus-Muscogee', 'Councilor');

Insert Into People
Values(456, 'C.E.', 'McDaniel', 'Columbus-Muscogee', 'Councilor');

Insert Into People
Values(457, 'Judy', 'Thomas', 'Columbus-Muscogee', 'Councilor');

Insert Into People
Values(458, 'Berry', 'Henderson', 'Columbus-Muscogee', 'Councilor');

Insert Into People
Values(459, 'Michael', 'Dinnerman', 'Cook', 'Chairman');

Insert Into People
Values(460, 'Jeff', 'Lane', 'Cook', 'Vice Chairman');

Insert Into People
Values(461, 'Debra', 'Robinson', 'Cook', 'Commissioner');

Insert Into People
Values(462, 'Randy', 'Lane', 'Cook', 'Commissioner');

Insert Into People
Values(463, 'Ronnie', 'Sumner', 'Cook', 'Commissioner');

Insert Into People
Values(464, 'Bob', 'Blackburn', 'Coweta', 'Chairman');

Insert Into People
Values(465, 'Paul', 'Poole', 'Coweta', 'Commissioner');

Insert Into People
Values(466, 'Tim', 'Lassetter', 'Coweta', 'Commissioner');

Insert Into People
Values(467, 'Rodney', 'Brooks', 'Coweta', 'Commissioner');

Insert Into People
Values(468, 'Al', 'Smith', 'Coweta', 'Commissioner');

Insert Into People
Values(469, 'Dean', 'Fripp', 'Crawford', 'Chairman');

Insert Into People
Values(470, 'Paul', 'Chapman', 'Crawford', 'Vice Chairman');

Insert Into People
Values(471, 'Frank', 'Hollis', 'Crawford', 'Commissioner');

Insert Into People
Values(472, 'Bobby', 'Blasingame', 'Crawford', 'Commissioner');

Insert Into People
Values(473, 'John', 'Thomas', 'Crawford', 'Commissioner');

Insert Into People
Values(474, 'Authur', 'James', 'Crisp', 'Chairman');

Insert Into People
Values(475, 'Clark', 'Henderson', 'Crisp', 'Vice Chairman');

Insert Into People
Values(476, 'Wallace', 'Mathis', 'Crisp', 'Commissioner');

Insert Into People
Values(477, 'Sam', 'Farrow Jr.', 'Crisp', 'Commissioner');

Insert Into People
Values(478, 'Larry', 'Felton', 'Crisp', 'Commissioner');

Insert Into People
Values(479, 'Emmett', 'Moore Jr.', 'Cusseta-Chattahoochee', 'Chairman');

Insert Into People
Values(480, 'Gerald', 'Douglas', 'Cusseta-Chattahoochee', 'Vice Chairman');

Insert Into People
Values(481, 'Donald', 'Moore', 'Cusseta-Chattahoochee', 'Commissioner');

Insert Into People
Values(482, 'Walter', 'Rosso', 'Cusseta-Chattahoochee', 'Commissioner');

Insert Into People
Values(483, 'James', 'Lawrence', 'Cusseta-Chattahoochee', 'Commissioner');

Insert Into People
Values(484, 'Ted', 'Rumley', 'Dade', 'Chairman');

Insert Into People
Values(485, 'Mitchell', 'Smith', 'Dade', 'Commissioner');

Insert Into People
Values(486, 'Scottie', 'Pittman', 'Dade', 'Commissioner');

Insert Into People
Values(487, 'Richard', 'Breeden', 'Dade', 'Commissioner');

Insert Into People
Values(488, 'Allan', 'Bradford', 'Dade', 'Commissioner');

Insert Into People
Values(489, 'Mike', 'Berg', 'Dawson', 'Chairman');

Insert Into People
Values(490, 'Gary', 'Pichon', 'Dawson', 'Commissioner');

Insert Into People
Values(491, 'James', 'Swafford', 'Dawson', 'Commissioner');

Insert Into People
Values(492, 'Jimmy', 'Hamby', 'Dawson', 'Commissioner');

Insert Into People
Values(493, 'Julie', 'Nix', 'Dawson', 'Commissioner');

Insert Into People
Values(494, 'Frank', 'Loeffler', 'Decatur', 'Chairman');

Insert Into People
Values(495, 'Dennis', 'Brinson', 'Decatur', 'Vice Chairman');

Insert Into People
Values(496, 'Oliver', 'Sellers', 'Decatur', 'Commissioner');

Insert Into People
Values(497, 'Russell', 'Smith', 'Decatur', 'Commissioner');

Insert Into People
Values(498, 'Jan', 'Godwin', 'Decatur', 'Commissioner');

Insert Into People
Values(499, 'David', 'Mosely', 'Decatur', 'Commissioner');

Insert Into People
Values(500, 'Lee', 'May', 'DeKalb', 'Interim CEO');

Insert Into People
Values(501, 'Jeff', 'Rader', 'DeKalb', 'Commissioner');

Insert Into People
Values(502, 'Larry', 'Johnson', 'DeKalb', 'Commissioner');

Insert Into People
Values(503, 'Sharon', 'Sutton', 'DeKalb', 'Commissioner');

Insert Into People
Values(504, 'Kathie', 'Gannon', 'DeKalb', 'Commissioner');

Insert Into People
Values(505, 'Stan', 'Watson', 'DeKalb', 'Commissioner');

Insert Into People
Values(506, 'Dan', 'McCranie', 'Dodge', 'Chairman');

Insert Into People
Values(507, 'William', 'Howell Jr.', 'Dodge', 'Commissioner');

Insert Into People
Values(508, 'Terry', 'Niblett', 'Dodge', 'Commissioner');

Insert Into People
Values(509, 'Brian', 'Watkins', 'Dodge', 'Commissioner');

Insert Into People
Values(510, 'Karen', 'Cheek', 'Dodge', 'Commissioner');

Insert Into People
Values(511, 'Terrell', 'Hudson', 'Dooly', 'Chairman');

Insert Into People
Values(512, 'Charles', 'Anderson', 'Dooly', 'Vice Chairman');

Insert Into People
Values(513, 'Eugene', 'Cason', 'Dooly', 'Commissioner');

Insert Into People
Values(514, 'Harry', 'Ward', 'Dooly', 'Commissioner');

Insert Into People
Values(515, 'David', 'Barron', 'Dooly', 'Commissioner');

Insert Into People
Values(516, 'Jeff', 'Sinyard', 'Dougherty', 'Chairman');

Insert Into People
Values(517, 'Lamar', 'Hudgins', 'Dougherty', 'Commissioner');

Insert Into People
Values(518, 'John', 'Hayes', 'Dougherty', 'Commissioner');

Insert Into People
Values(519, 'Clinton', 'Johnson', 'Dougherty', 'Commissioner');

Insert Into People
Values(520, 'Ewell', 'Lyle', 'Dougherty', 'Commissioner');

Insert Into People
Values(521, 'Harry', 'James', 'Dougherty', 'Commissioner');

Insert Into People
Values(522, 'Jack', 'Stone', 'Dougherty', 'Commissioner');

Insert Into People
Values(523, 'Tom', 'Worthan', 'Douglas', 'Chairman');

Insert Into People
Values(524, 'Henry', 'Mitchell III', 'Douglas', 'Commissioner');

Insert Into People
Values(525, 'Kelly', 'Robinson', 'Douglas', 'Commissioner');

Insert Into People
Values(526, 'Mike', 'Mulcare', 'Douglas', 'Commissioner');

Insert Into People
Values(527, 'Ann', 'Guider', 'Douglas', 'Commissioner');

Insert Into People
Values(528, 'June', 'Merritt', 'Early', 'Chairman');

Insert Into People
Values(529, 'Taylor', 'Bridges', 'Early', 'Commissioner');

Insert Into People
Values(530, 'Joseph', 'Glass', 'Early', 'Commissioner');

Insert Into People
Values(531, 'Jeffery', 'Haynes', 'Early', 'Commissioner');

Insert Into People
Values(532, 'F.C.', 'Wiggins', 'Early', 'Commissioner');

Insert Into People
Values(533, 'Robert', 'Davis', 'Echols', 'Chairman');

Insert Into People
Values(534, 'Jim', 'Carter', 'Echols', 'Vice Chairman');

Insert Into People
Values(535, 'Bobby', 'Walker', 'Echols', 'Commissioner');

Insert Into People
Values(536, 'Wendall', 'Kessler', 'Effingham', 'Chairman');

Insert Into People
Values(537, 'Forrest', 'Floyd', 'Effingham', 'Commissioner');

Insert Into People
Values(538, 'Vera', 'Jones', 'Effingham', 'Commissioner');

Insert Into People
Values(539, 'Reggie', 'Loper', 'Effingham', 'Commissioner');

Insert Into People
Values(540, 'Phil', 'Kieffer', 'Effingham', 'Commissioner');

Insert Into People
Values(541, 'Steve', 'Mason', 'Effingham', 'Commissioner');

Insert Into People
Values(542, 'Tommy', 'Lyon', 'Elbert', 'Chairman');

Insert Into People
Values(543, 'Harold', 'Reynolds', 'Elbert', 'Commissioner');

Insert Into People
Values(544, 'Kenneth', 'Ashworth', 'Elbert', 'Commissioner');

Insert Into People
Values(545, 'Horace', 'Harper', 'Elbert', 'Commissioner');

Insert Into People
Values(546, 'Frank', 'Evans', 'Elbert', 'Commissioner');

Insert Into People
Values(547, 'Freddie', 'Jones', 'Elbert', 'Commissioner');

Insert Into People
Values(548, 'Keith', 'Thompson', 'Emanuel', 'Chairman');

Insert Into People
Values(549, 'James', 'Canady', 'Emanuel', 'Commissioner');

Insert Into People
Values(550, 'Desse', 'Davis', 'Emanuel', 'Commissioner');

Insert Into People
Values(551, 'Hugh', 'Foskey', 'Emanuel', 'Commissioner');

Insert Into People
Values(552, 'Rusty', 'Lane', 'Emanuel', 'Commissioner');

Insert Into People
Values(553, 'Neil', 'Hammack', 'Evans', 'Chairman');

Insert Into People
Values(554, 'Irene', 'Burney', 'Evans', 'Commissioner');

Insert Into People
Values(555, 'Jack', 'Pinckard', 'Evans', 'Commissioner');

Insert Into People
Values(556, 'Del', 'Beasley', 'Evans', 'Commissioner');

Insert Into People
Values(557, 'Jill', 'Griffin', 'Evans', 'Commissioner');

Insert Into People
Values(558, 'Shela', 'Holland', 'Evans', 'Commissioner');

Insert Into People
Values(559, 'Bill', 'Simonds', 'Fannin', 'Chairman');

Insert Into People
Values(560, 'Earl', 'Johnson', 'Fannin', 'Commissioner');

Insert Into People
Values(561, 'Larry', 'Sosebee', 'Fannin', 'Commissioner');

Insert Into People
Values(562, 'Steve', 'Brown', 'Fayette', 'Chairman');

Insert Into People
Values(563, 'Charles', 'Oddo', 'Fayette', 'Vice Chairman');

Insert Into People
Values(564, 'David', 'Barlow', 'Fayette', 'Commissioner');

Insert Into People
Values(565, 'Randy', 'Ognio', 'Fayette', 'Commissioner');

Insert Into People
Values(566, 'Allen', 'McCarty', 'Fayette', 'Commissioner');

Insert Into People
Values(567, 'Irwin', 'Baqwell', 'Floyd', 'Chairman');

Insert Into People
Values(568, 'Larry', 'Maxey', 'Floyd', 'Vice Chairman');

Insert Into People
Values(569, 'Garry', 'Fricks', 'Floyd', 'Commissioner');

Insert Into People
Values(570, 'John', 'Mayers', 'Floyd', 'Commissioner');

Insert Into People
Values(571, 'Rhonda', 'Wallace', 'Floyd', 'Commissioner');

Insert Into People
Values(572, 'R.J.', 'Amos', 'Forsyth', 'Chairman');

Insert Into People
Values(573, 'Cindy', 'Mills', 'Forsyth', 'Vice Chairman');

Insert Into People
Values(574, 'Brian', 'Tam', 'Forsyth', 'Commissioner');

Insert Into People
Values(575, 'Todd', 'Levent', 'Forsyth', 'Commissioner');

Insert Into People
Values(576, 'Jim', 'Boff', 'Forsyth', 'Commissioner');

Insert Into People
Values(577, 'Thomas', 'Bridges', 'Franklin', 'Chairman');

Insert Into People
Values(578, 'Robert', 'Franklin', 'Franklin', 'Commissioner');

Insert Into People
Values(579, 'Clint', 'Harper', 'Franklin', 'Commissioner');

Insert Into People
Values(580, 'Jeffrey', 'Jacques', 'Franklin', 'Commissioner');

Insert Into People
Values(581, 'David', 'Strickland', 'Franklin', 'Commissioner');

Insert Into People
Values(582, 'John', 'Eaves', 'Fulton', 'Chairman');

Insert Into People
Values(583, 'Robb', 'Pitts', 'Fulton', 'Commissioner');

Insert Into People
Values(584, 'Liz', 'Hausmann', 'Fulton', 'Commissioner');

Insert Into People
Values(585, 'Tom', 'Lowe', 'Fulton', 'Commissioner');

Insert Into People
Values(586, 'Emma', 'Darnell', 'Fulton', 'Commissioner');

Insert Into People
Values(587, 'Joan', 'Garner', 'Fulton', 'Commissioner');

Insert Into People
Values(588, 'William', 'Edwards', 'Fulton', 'Commissioner');

Insert Into People
Values(589, 'Richard', 'Morris', 'Georgetown-Quitman', 'Chairman');

Insert Into People
Values(590, 'Danny', 'Blackmon', 'Georgetown-Quitman', 'Commissioner');

Insert Into People
Values(591, 'Carvel', 'Lewis', 'Georgetown-Quitman', 'Commissioner');

Insert Into People
Values(592, 'David', 'Kinsey', 'Georgetown-Quitman', 'Commissioner');

Insert Into People
Values(593, 'Willie', 'Bussey Jr.', 'Georgetown-Quitman', 'Commissioner');

Insert Into People
Values(594, 'J. C.', 'Sanford', 'Gilmer', 'Chairman');

Insert Into People
Values(595, 'Dallas', 'Miller', 'Gilmer', 'Commissioner');

Insert Into People
Values(596, 'Danny', 'Hall', 'Gilmer', 'Commissioner');

Insert Into People
Values(597, 'Audrey', 'Chalker', 'Glascock', 'Chairman');

Insert Into People
Values(598, 'Barbra', 'Hadden', 'Glascock', 'Vice Chairman');

Insert Into People
Values(599, 'Lori', 'Boyen', 'Glascock', 'Commissioner');

Insert Into People
Values(600, 'Michael', 'Browning', 'Glynn', 'Chairman');

Insert Into People
Values(601, 'Dale', 'Provenzano', 'Glynn', 'Commissioner');

Insert Into People
Values(602, 'Richard', 'Strickland', 'Glynn', 'Commissioner');

Insert Into People
Values(603, 'Mary', 'Hunt', 'Glynn', 'Commissioner');

Insert Into People
Values(604, 'Allen', 'Booker', 'Glynn', 'Commissioner');

Insert Into People
Values(605, 'Clyde', 'Taylor', 'Glynn', 'Commissioner');

Insert Into People
Values(606, 'Bob', 'Coleman', 'Glynn', 'Commissioner');

Insert Into People
Values(607, 'Becky', 'Hood', 'Gordon', 'Chairman');

Insert Into People
Values(608, 'Chad', 'Steward', 'Gordon', 'Vice Chairman');

Insert Into People
Values(609, 'Kevin', 'Cunningham', 'Gordon', 'Commissioner');

Insert Into People
Values(610, 'Jeff', 'Gazaway', 'Gordon', 'Commissioner');

Insert Into People
Values(611, 'Norris', 'Sexton', 'Gordon', 'Commissioner');

Insert Into People
Values(612, 'T.D.', 'David', 'Grady', 'Chairman');

Insert Into People
Values(613, 'LaFaye', 'Copeland', 'Grady', 'Vice Chairman');

Insert Into People
Values(614, 'Elwyn', 'Childs', 'Grady', 'Commissioner');

Insert Into People
Values(615, 'Billy', 'Poitevin', 'Grady', 'Commissioner');

Insert Into People
Values(616, 'Charlie', 'Norton', 'Grady', 'Commissioner');

Insert Into People
Values(617, 'Ed', 'Bullard', 'Greene', 'Chairman');

Insert Into People
Values(618, 'Marion', 'Rhodes', 'Greene', 'Commissioner');

Insert Into People
Values(619, 'Bob', 'Welsh', 'Greene', 'Commissioner');

Insert Into People
Values(620, 'Gerald', 'Torbert', 'Greene', 'Commissioner');

Insert Into People
Values(621, 'Jimmy', 'Britt', 'Greene', 'Commissioner');

Insert Into People
Values(622, 'Charlotte', 'Nash', 'Gwinnett', 'Chairman');

Insert Into People
Values(623, 'Jace', 'Brooks', 'Gwinnett', 'Commissioner');

Insert Into People
Values(624, 'Tommy', 'Hunter', 'Gwinnett', 'Commissioner');

Insert Into People
Values(625, 'John', 'Heard', 'Gwinnett', 'Commissioner');

Insert Into People
Values(626, 'Lynette', 'Howard', 'Gwinnett', 'Commissioner');

Insert Into People
Values(627, 'Chad', 'Henderson', 'Habersham', 'Chairman');

Insert Into People
Values(628, 'Sonny', 'James', 'Habersham', 'Commissioner');

Insert Into People
Values(629, 'Andrea', 'Harper', 'Habersham', 'Commissioner');

Insert Into People
Values(630, 'Natalie', 'Crawford', 'Habersham', 'Commissioner');

Insert Into People
Values(631, 'Ed', 'Nichols', 'Habersham', 'Commissioner');

Insert Into People
Values(632, 'Richard', 'Mecum', 'Hall', 'Chairman');

Insert Into People
Values(633, 'Craig', 'Lutz', 'Hall', 'Commissioner');

Insert Into People
Values(634, 'Billy', 'Powell', 'Hall', 'Commissioner');

Insert Into People
Values(635, 'Scott', 'Gibbs', 'Hall', 'Commissioner');

Insert Into People
Values(636, 'Jeff', 'Stowe', 'Hall', 'Commissioner');

Insert Into People
Values(637, 'Helen', 'Hudson', 'Hancock', 'Chairman');

Insert Into People
Values(638, 'Gloria', 'Cooper', 'Hancock', 'Commissioner');

Insert Into People
Values(639, 'Steve', 'Hill', 'Hancock', 'Commissioner');

Insert Into People
Values(640, 'Jesse', 'Bolden', 'Hancock', 'Commissioner');

Insert Into People
Values(641, 'Teresa', 'Kell', 'Hancock', 'Commissioner');

Insert Into People
Values(642, 'Allen', 'Poole', 'Haralson', 'Chairman');

Insert Into People
Values(643, 'Kenneth', 'Smith', 'Haralson', 'Commissioner');

Insert Into People
Values(644, 'Jamie', 'Bennett', 'Haralson', 'Commissioner');

Insert Into People
Values(645, 'John', 'Dobbs', 'Haralson', 'Commissioner');

Insert Into People
Values(646, 'Sammy', 'Robinson', 'Haralson', 'Commissioner');

Insert Into People
Values(647, 'Harry', 'Lange', 'Harris', 'Chairman');

Insert Into People
Values(648, 'Charles', 'Wyatt', 'Harris', 'Commissioner');

Insert Into People
Values(649, 'Jim', 'Woods', 'Harris', 'Commissioner');

Insert Into People
Values(650, 'Becky', 'Langston', 'Harris', 'Commissioner');

Insert Into People
Values(651, 'Joey', 'Loudermilk', 'Harris', 'Commissioner');

Insert Into People
Values(652, 'Joey', 'Dorsey', 'Hart', 'Chairman');

Insert Into People
Values(653, 'R. C.', 'Oglesby', 'Hart', 'Commissioner');

Insert Into People
Values(654, 'Frankie', 'Teasley', 'Hart', 'Commissioner');

Insert Into People
Values(655, 'Jimmy', 'Carey', 'Hart', 'Commissioner');

Insert Into People
Values(656, 'Bill', 'Myers', 'Hart', 'Commissioner');

Insert Into People
Values(657, 'Lee', 'Boone', 'Heard', 'Chairman');

Insert Into People
Values(658, 'Larry', 'Hooks', 'Heard', 'Commissioner');

Insert Into People
Values(659, 'Jacob', 'Cammon', 'Heard', 'Commissioner');

Insert Into People
Values(660, 'Gwen', 'Caldwell', 'Heard', 'Commissioner');

Insert Into People
Values(661, 'Frank', 'Crook', 'Heard', 'Commissioner');

Insert Into People
Values(662, 'Sandi', 'Allen', 'Heard', 'Commissioner');

Insert Into People
Values(663, 'Tommy', 'Smith', 'Henry', 'Chairman');

Insert Into People
Values(664, 'Bo', 'Moss', 'Henry', 'Commissioner');

Insert Into People
Values(665, 'Brian', 'Preston', 'Henry', 'Commissioner');

Insert Into People
Values(666, 'Gary', 'Barham', 'Henry', 'Commissioner');

Insert Into People
Values(667, 'Reid', 'Bowman Sr.', 'Henry', 'Commissioner');

Insert Into People
Values(668, 'Bruce', 'Holmes', 'Henry', 'Commissioner');

Insert Into People
Values(669, 'Tommy', 'Stalnaker', 'Houston', 'Chairman');

Insert Into People
Values(670, 'H. Jay', 'Walker III', 'Houston', 'Commissioner');

Insert Into People
Values(671, 'Gail', 'Robinson', 'Houston', 'Commissioner');

Insert Into People
Values(672, 'Larry', 'Thomson', 'Houston', 'Commissioner');

Insert Into People
Values(673, 'Tom', 'McMichael', 'Houston', 'Commissioner');

Insert Into People
Values(674, 'Joey', 'Whitley', 'Irwin', 'Chairman');

Insert Into People
Values(675, 'Aldene', 'Tyson', 'Irwin', 'Vice Chairman');

Insert Into People
Values(676, 'Larry', 'Harper', 'Irwin', 'Commissioner');

Insert Into People
Values(677, 'Tony', 'Hutto', 'Irwin', 'Commissioner');

Insert Into People
Values(678, 'Billy', 'Zorn', 'Irwin', 'Commissioner');

Insert Into People
Values(679, 'Tom', 'Crow', 'Jackson', 'Chairman');

Insert Into People
Values(680, 'Jim', 'Hix', 'Jackson', 'Commissioner');

Insert Into People
Values(681, 'Chas', 'Hardy', 'Jackson', 'Commissioner');

Insert Into People
Values(682, 'Bruce', 'Yates', 'Jackson', 'Commissioner');

Insert Into People
Values(683, 'Dwain', 'Smith', 'Jackson', 'Commissioner');

Insert Into People
Values(684, 'Gene', 'Trammell', 'Jasper', 'Chairman');

Insert Into People
Values(685, 'Carl', 'Pennamon', 'Jasper', 'Commissioner');

Insert Into People
Values(686, 'Bruce', 'Henry', 'Jasper', 'Commissioner');

Insert Into People
Values(687, 'Craig', 'Salmon', 'Jasper', 'Commissioner');

Insert Into People
Values(688, 'Doug', 'Luke', 'Jasper', 'Commissioner');

Insert Into People
Values(689, 'Ray', 'Wooten', 'Jeff Davis', 'Chairman');

Insert Into People
Values(690, 'Wayne', 'Hall', 'Jeff Davis', 'Vice Chairman');

Insert Into People
Values(691, 'Wanda', 'Marchant', 'Jeff Davis', 'Commissioner');

Insert Into People
Values(692, 'Hirosha', 'Thomas', 'Jeff Davis', 'Commissioner');

Insert Into People
Values(693, 'Steve', 'Toler', 'Jeff Davis', 'Commissioner');

Insert Into People
Values(694, 'Mitchell', 'McGraw', 'Jefferson', 'Chairman');

Insert Into People
Values(695, 'Gonice', 'Davis', 'Jefferson', 'Commissioner');

Insert Into People
Values(696, 'Johnny', 'Davis', 'Jefferson', 'Commissioner');

Insert Into People
Values(697, 'Charles', 'Davis', 'Jefferson', 'Commissioner');

Insert Into People
Values(698, 'H. G. Thomas', 'New', 'Jefferson', 'Commissioner');

Insert Into People
Values(699, 'James', 'Henry', 'Jenkins', 'Chairman');

Insert Into People
Values(700, 'Hiller', 'Spann', 'Jenkins', 'Vice Chairman');

Insert Into People
Values(701, 'Pam', 'Dwight', 'Jenkins', 'Commissioner');

Insert Into People
Values(702, 'Cynthia', 'McNeely', 'Jenkins', 'Commissioner');

Insert Into People
Values(703, 'Jason', 'Oglesby', 'Jenkins', 'Commissioner');

Insert Into People
Values(704, 'James', 'McAfees', 'Johnson', 'Chairman');

Insert Into People
Values(705, 'Jack', 'Foskey', 'Johnson', 'Vice Chairman');

Insert Into People
Values(706, 'Larry', 'Pope', 'Johnson', 'Commissioner');

Insert Into People
Values(707, 'Jerronney', 'Darrisaw', 'Johnson', 'Commissioner');

Insert Into People
Values(708, 'Felice', 'Pullen', 'Johnson', 'Commissioner');

Insert Into People
Values(709, 'Preston', 'Hawkins', 'Jones', 'Chairman');

Insert Into People
Values(710, 'Tommy', 'Robinson', 'Jones', 'Vice Chairman');

Insert Into People
Values(711, 'Larry', 'Childs', 'Jones', 'Commissioner');

Insert Into People
Values(712, 'Jonathan', 'Pitts', 'Jones', 'Commissioner');

Insert Into People
Values(713, 'Daylon', 'Martin', 'Jones', 'Commissioner');

Insert Into People
Values(714, 'Jay', 'Matthews', 'Lamar', 'Chairman');

Insert Into People
Values(715, 'Charles', 'Glass', 'Lamar', 'Vice Chairman');

Insert Into People
Values(716, 'Bennie', 'Horton', 'Lamar', 'Commissioner');

Insert Into People
Values(717, 'Van', 'Baker', 'Lamar', 'Commissioner');

Insert Into People
Values(718, 'Nancy', 'Thrash', 'Lamar', 'Commissioner');

Insert Into People
Values(719, 'Alex', 'Lee', 'Lanier', 'Chairman');

Insert Into People
Values(720, 'Paul', 'Brockington', 'Lanier', 'Commissioner');

Insert Into People
Values(721, 'Harold', 'Simpson', 'Lanier', 'Commissioner');

Insert Into People
Values(722, 'Scot', 'Green', 'Lanier', 'Commissioner');

Insert Into People
Values(723, 'Dennis', 'Fender', 'Lanier', 'Commissioner');

Insert Into People
Values(724, 'Tommy', 'Daniel', 'Laurens', 'Chairman');

Insert Into People
Values(725, 'Roscoe', 'Brower', 'Laurens', 'Commissioner');

Insert Into People
Values(726, 'Jon', 'Martin', 'Laurens', 'Commissioner');

Insert Into People
Values(727, 'Buddy', 'Adams', 'Laurens', 'Commissioner');

Insert Into People
Values(728, 'Emory', 'Lake', 'Laurens', 'Commissioner');

Insert Into People
Values(729, 'Rick', 'Muggridge', 'Lee', 'Chairman');

Insert Into People
Values(730, 'Dennis', 'Roland', 'Lee', 'Vice Chairman');

Insert Into People
Values(731, 'Edward', 'Duffy', 'Lee', 'Commissioner');

Insert Into People
Values(732, 'Gregory', 'Frich', 'Lee', 'Commissioner');

Insert Into People
Values(733, 'Luke', 'Singletary', 'Lee', 'Commissioner');

Insert Into People
Values(734, 'Donald', 'Lovette', 'Liberty', 'Chairman');

Insert Into People
Values(735, 'Patrick', 'Bowen', 'Liberty', 'Commissioner');

Insert Into People
Values(736, 'Justin', 'Frasier', 'Liberty', 'Commissioner');

Insert Into People
Values(737, 'Gary', 'Gilliard', 'Liberty', 'Commissioner');

Insert Into People
Values(738, 'Marion', 'Stevens', 'Liberty', 'Commissioner');

Insert Into People
Values(739, 'Connie', 'Thrift', 'Liberty', 'Commissioner');

Insert Into People
Values(740, 'Eddie', 'Walden', 'Liberty', 'Commissioner');

Insert Into People
Values(741, 'H. Wade', 'Johnson', 'Lincoln', 'Chairman');

Insert Into People
Values(742, 'Richard', 'Brown', 'Lincoln', 'Commissioner');

Insert Into People
Values(743, 'Cooper', 'Cliatt', 'Lincoln', 'Commissioner');

Insert Into People
Values(744, 'Robert', 'Glaze', 'Lincoln', 'Commissioner');

Insert Into People
Values(745, 'Billy', 'Goldman', 'Lincoln', 'Commissioner');

Insert Into People
Values(746, 'Robert', 'Long', 'Long', 'Chairman');

Insert Into People
Values(747, 'Gerald', 'Blocker', 'Long', 'Commissioner');

Insert Into People
Values(748, 'Earl', 'Gordon', 'Long', 'Commissioner');

Insert Into People
Values(749, 'Willie', 'Thompson', 'Long', 'Commissioner');

Insert Into People
Values(750, 'Bill', 'Slaughter', 'Lowndes', 'Chairman');

Insert Into People
Values(751, 'Joyce', 'Evans', 'Lowndes', 'Commissioner');

Insert Into People
Values(752, 'Eric', 'Griner', 'Lowndes', 'Commissioner');

Insert Into People
Values(753, 'Demarcus', 'Marshall', 'Lowndes', 'Commissioner');

Insert Into People
Values(754, 'Crawford', 'Powell', 'Lowndes', 'Commissioner');

Insert Into People
Values(755, 'Richard', 'Raines', 'Lowndes', 'Commissioner');

Insert Into People
Values(756, 'Chris', 'Dockery', 'Lumpkin', 'Chairman');

Insert Into People
Values(757, 'Clarence', 'Grindle', 'Lumpkin', 'Commissioner');

Insert Into People
Values(758, 'Steve', 'Shaw', 'Lumpkin', 'Commissioner');

Insert Into People
Values(759, 'Doug', 'Sherrill', 'Lumpkin', 'Commissioner');

Insert Into People
Values(760, 'Clarence', 'Stowers', 'Lumpkin', 'Commissioner');

Insert Into People
Values(761, 'Ambrose', 'Felton', 'Macon', 'Chairman');

Insert Into People
Values(762, 'Mickey', 'George', 'Macon', 'Commissioner');

Insert Into People
Values(763, 'Ben', 'Haugabook', 'Macon', 'Commissioner');

Insert Into People
Values(764, 'Bob', 'Melvin', 'Macon', 'Commissioner');

Insert Into People
Values(765, 'Gordon', 'Sutton', 'Macon', 'Commissioner');

Insert Into People
Values(766, 'Anthony', 'Dove', 'Madison', 'Chairman');

Insert Into People
Values(767, 'Dewitt', 'Bond', 'Madison', 'Commissioner');

Insert Into People
Values(768, 'Jim', 'Escoe', 'Madison', 'Commissioner');

Insert Into People
Values(769, 'John', 'Pethel', 'Madison', 'Commissioner');

Insert Into People
Values(770, 'Stanley', 'Thomas', 'Madison', 'Commissioner');

Insert Into People
Values(771, 'Michael', 'Youngblood', 'Madison', 'Commissioner');

Insert Into People
Values(772, 'George', 'Neal', 'Marion', 'Chairman');

Insert Into People
Values(773, 'Lawrence', 'Ogan', 'Marion', 'Vice Chairman');

Insert Into People
Values(774, 'Cecil', 'McMickle', 'Marion', 'Commissioner');

Insert Into People
Values(775, 'Norman', 'Royal', 'Marion', 'Commissioner');

Insert Into People
Values(776, 'Steven', 'Young', 'Marion', 'Commissioner');

Insert Into People
Values(777, 'Charles', 'Newton', 'McDuffie', 'Chairman');

Insert Into People
Values(778, 'Frederick', 'Favors', 'McDuffie', 'Commissioner');

Insert Into People
Values(779, 'William', 'Jopling', 'McDuffie', 'Commissioner');

Insert Into People
Values(780, 'Paul', 'McCorkle', 'McDuffie', 'Commissioner');

Insert Into People
Values(781, 'Sammie', 'Wilson', 'McDuffie', 'Commissioner');

Insert Into People
Values(782, 'Kelly', 'Spratt', 'McIntosh', 'Chairman');

Insert Into People
Values(783, 'David', 'Stevens', 'McIntosh', 'Vice Chairman');

Insert Into People
Values(784, 'Charles', 'Jordan', 'McIntosh', 'Commissioner');

Insert Into People
Values(785, 'Bill', 'Watson', 'McIntosh', 'Commissioner');

Insert Into People
Values(786, 'Joel', 'Williams', 'McIntosh', 'Commissioner');

Insert Into People
Values(787, 'Nancy', 'Jones', 'Meriwether', 'Chairman');

Insert Into People
Values(788, 'Emmitt', 'Clark', 'Meriwether', 'Commissioner');

Insert Into People
Values(789, 'Beth', 'Neely', 'Meriwether', 'Commissioner');

Insert Into People
Values(790, 'Vincent', 'Threadgill', 'Meriwether', 'Commissioner');

Insert Into People
Values(791, 'J. Larry', 'Whitlock Sr.', 'Meriwether', 'Commissioner');

Insert Into People
Values(792, 'Kreg', 'Freeman', 'Miller', 'Chairman');

Insert Into People
Values(793, 'Jerry', 'Bush', 'Miller', 'Commissioner');

Insert Into People
Values(794, 'G.C.', 'Jinks', 'Miller', 'Commissioner');

Insert Into People
Values(795, 'Frankie', 'Phillips', 'Miller', 'Commissioner');

Insert Into People
Values(796, 'Allen', 'Worsley', 'Miller', 'Commissioner');

Insert Into People
Values(797, 'Benjamin', 'Hayward', 'Mitchell', 'Chairman');

Insert Into People
Values(798, 'Reggie', 'Bostick', 'Mitchell', 'Commissioner');

Insert Into People
Values(799, 'Julius', 'Hatcher', 'Mitchell', 'Commissioner');

Insert Into People
Values(800, 'B. Keith', 'Jones', 'Mitchell', 'Commissioner');

Insert Into People
Values(801, 'David', 'Sullivan', 'Mitchell', 'Commissioner');

Insert Into People
Values(802, 'Michael', 'Bilderback', 'Monroe', 'Chairman');

Insert Into People
Values(803, 'Larry', 'Evans', 'Monroe', 'Commissioner');

Insert Into People
Values(804, 'James', 'Ham', 'Monroe', 'Commissioner');

Insert Into People
Values(805, 'Patsy', 'Miller', 'Monroe', 'Commissioner');

Insert Into People
Values(806, 'Joe', 'Proctor', 'Monroe', 'Commissioner');

Insert Into People
Values(807, 'Vernon', 'Sumner', 'Montgomery', 'Chairman');

Insert Into People
Values(808, 'Frank', 'Brantley', 'Montgomery', 'Vice Chairman');

Insert Into People
Values(809, 'John', 'Carpenter', 'Montgomery', 'Commissioner');

Insert Into People
Values(810, 'Clarence', 'Thomas', 'Montgomery', 'Commissioner');

Insert Into People
Values(811, 'Tim', 'Williamson', 'Montgomery', 'Commissioner');

Insert Into People
Values(812, 'Andrew', 'Ainslie', 'Morgan', 'Chairman');

Insert Into People
Values(813, 'Ronald', 'Milton', 'Morgan', 'Vice Chairman');

Insert Into People
Values(814, 'Philip', 'Clack', 'Morgan', 'Commissioner');

Insert Into People
Values(815, 'Donald', 'Harris', 'Morgan', 'Commissioner');

Insert Into People
Values(816, 'Ellen', 'Warren', 'Morgan', 'Commissioner');

Insert Into People
Values(817, 'Brittany', 'Pittman', 'Murray', 'Sole Commissioner');

Insert Into People
Values(818, 'Keith', 'Ellis', 'Newton', 'Chairman');

Insert Into People
Values(819, 'John', 'Douglas', 'Newton', 'Commissioner');

Insert Into People
Values(820, 'J.C.', 'Henderson', 'Newton', 'Commissioner');

Insert Into People
Values(821, 'Levie', 'Maddox', 'Newton', 'Commissioner');

Insert Into People
Values(822, 'Nancy', 'Schulz', 'Newton', 'Commissioner');

Insert Into People
Values(823, 'Lanier', 'Sims', 'Newton', 'Commissioner');

Insert Into People
Values(824, 'G. Melvin', 'Davis', 'Oconee', 'Chairman');

Insert Into People
Values(825, 'John', 'Daniell', 'Oconee', 'Commissioner');

Insert Into People
Values(826, 'Margaret', 'Hale', 'Oconee', 'Commissioner');

Insert Into People
Values(827, 'Jim', 'Luke', 'Oconee', 'Commissioner');

Insert Into People
Values(828, 'Mark', 'Saxon', 'Oconee', 'Commissioner');

Insert Into People
Values(829, 'Billy', 'Pittard', 'Oglethorpe', 'Chairman');

Insert Into People
Values(830, 'David', 'Clark', 'Oglethorpe', 'Commissioner');

Insert Into People
Values(831, 'George', 'Gabriel', 'Oglethorpe', 'Commissioner');

Insert Into People
Values(832, 'John', 'Meyer', 'Oglethorpe', 'Commissioner');

Insert Into People
Values(833, 'Phil', 'Sanders', 'Oglethorpe', 'Commissioner');

Insert Into People
Values(834, 'Andy', 'Saxon', 'Oglethorpe', 'Commissioner');

Insert Into People
Values(835, 'David', 'Austin', 'Paulding', 'Chairman');

Insert Into People
Values(836, 'David', 'Barnett', 'Paulding', 'Commissioner');

Insert Into People
Values(837, 'Dave', 'Carmichael', 'Paulding', 'Commissioner');

Insert Into People
Values(838, 'Tommie', 'Graham', 'Paulding', 'Commissioner');

Insert Into People
Values(839, 'Todd', 'Pownall', 'Paulding', 'Commissioner');

Insert Into People
Values(840, 'Melvin', 'Walker', 'Peach', 'Chairman');

Insert Into People
Values(841, 'Martin', 'Moseley', 'Peach', 'Vice Chairman');

Insert Into People
Values(842, 'Betty', 'Hill', 'Peach', 'Commissioner');

Insert Into People
Values(843, 'Roy', 'Lewis', 'Peach', 'Commissioner');

Insert Into People
Values(844, 'Walter', 'Smith', 'Peach', 'Commissioner');

Insert Into People
Values(845, 'Robert', 'Jones', 'Pickens', 'Chairman');

Insert Into People
Values(846, 'Jerry', 'Barnes', 'Pickens', 'Commissioner');

Insert Into People
Values(847, 'Becky', 'Denney', 'Pickens', 'Commissioner');

Insert Into People
Values(848, 'Mitchell', 'Bowen', 'Pierce', 'Chairman');

Insert Into People
Values(849, 'Carl', 'Boyette', 'Pierce', 'Commissioner');

Insert Into People
Values(850, 'W.K.', 'Cselle', 'Pierce', 'Commissioner');

Insert Into People
Values(851, 'Randy', 'Dixon', 'Pierce', 'Commissioner');

Insert Into People
Values(852, 'Harold', 'Rozier', 'Pierce', 'Commissioner');

Insert Into People
Values(853, 'J. Briar', 'Johnson', 'Pike', 'Chairman');

Insert Into People
Values(854, 'Carol', 'Bass', 'Pike', 'Commissioner');

Insert Into People
Values(855, 'Tamra', 'Jarrett', 'Pike', 'Commissioner');

Insert Into People
Values(856, 'James', 'Jenkins', 'Pike', 'Commissioner');

Insert Into People
Values(857, 'Tommy', 'Powers', 'Pike', 'Commissioner');

Insert Into People
Values(858, 'Marshelle', 'Thaxton', 'Polk', 'Chairman');

Insert Into People
Values(859, 'Stefanie', 'Burford', 'Polk', 'Vice Chairman');

Insert Into People
Values(860, 'Raymond', 'Barber', 'Polk', 'Commissioner');

Insert Into People
Values(861, 'Phillip', 'Bentley', 'Polk', 'Commissioner');

Insert Into People
Values(862, 'Billy', 'Croker', 'Polk', 'Commissioner');

Insert Into People
Values(863, 'Jason', 'Ward', 'Polk', 'Commissioner');

Insert Into People
Values(864, 'Butch', 'Hall', 'Pulaski', 'Sole Commissioner');

Insert Into People
Values(865, 'Stephen', 'Hersey', 'Putnam', 'Chairman');

Insert Into People
Values(866, 'Alan', 'Foster', 'Putnam', 'Commissioner');

Insert Into People
Values(867, 'Janie', 'Reid', 'Putnam', 'Commissioner');

Insert Into People
Values(868, 'Frederick', 'Ward', 'Putnam', 'Commissioner');

Insert Into People
Values(869, 'Billy', 'Webster', 'Putnam', 'Commissioner');

Insert Into People
Values(870, 'Greg', 'James', 'Rabun', 'Chairman');

Insert Into People
Values(871, 'Stephen', 'Arbitter', 'Rabun', 'Commissioner');

Insert Into People
Values(872, 'Kay', 'Darnell', 'Rabun', 'Commissioner');

Insert Into People
Values(873, 'Jimmy', 'Loudermilk', 'Rabun', 'Commissioner');

Insert Into People
Values(874, 'Will', 'Nichols', 'Rabun', 'Commissioner');

Insert Into People
Values(875, 'Jimmy', 'Bradley', 'Randolph', 'Chairman');

Insert Into People
Values(876, 'Steve', 'Jackson', 'Randolph', 'Commissioner');

Insert Into People
Values(877, 'Eugene', 'Palmer', 'Randolph', 'Commissioner');

Insert Into People
Values(878, 'Lamar', 'White', 'Randolph', 'Commissioner');

Insert Into People
Values(879, 'Wesley', 'Williams', 'Randolph', 'Commissioner');

Insert Into People
Values(880, 'Richard', 'Oden', 'Rockdale', 'Chairman');

Insert Into People
Values(881, 'Oz', 'Nesbitt', 'Rockdale', 'Commissioner');

Insert Into People
Values(882, 'JaNice', 'Ness', 'Rockdale', 'Commissioner');

Insert Into People
Values(883, 'Greg', 'Barineau', 'Schley', 'Chairman');

Insert Into People
Values(884, 'Douglas', 'Jamieson', 'Schley', 'Commissioner');

Insert Into People
Values(885, 'Sandra', 'Royal', 'Schley', 'Commissioner');

Insert Into People
Values(886, 'Angeli', 'Smith', 'Schley', 'Commissioner');

Insert Into People
Values(887, 'Ken', 'Wilson', 'Schley', 'Commissioner');

Insert Into People
Values(888, 'Will', 'Boyd', 'Screven', 'Chairman');

Insert Into People
Values(889, 'R. Gregg', 'Ellison', 'Screven', 'Vice Chairman');

Insert Into People
Values(890, 'Gary', 'Crews', 'Screven', 'Commissioner');

Insert Into People
Values(891, 'Dennis', 'Lawton', 'Screven', 'Commissioner');

Insert Into People
Values(892, 'Stan', 'Sheppard', 'Screven', 'Commissioner');

Insert Into People
Values(893, 'Roland', 'Stubbs', 'Screven', 'Commissioner');

Insert Into People
Values(894, 'J.C.', 'Warren', 'Screven', 'Commissioner');

Insert Into People
Values(895, 'Charles', 'Orrick', 'Seminole', 'Chairman');

Insert Into People
Values(896, 'Brenda', 'Peterson', 'Seminole', 'Vice Chairman');

Insert Into People
Values(897, 'Darius', 'Culverson', 'Seminole', 'Commissioner');

Insert Into People
Values(898, 'William', 'Lane', 'Seminole', 'Commissioner');

Insert Into People
Values(899, 'Samuel', 'Gardner', 'Spalding', 'Chairman');

Insert Into People
Values(900, 'Raymond', 'Ray', 'Spalding', 'Vice Chairman');

Insert Into People
Values(901, 'Gwen', 'Flowers-Taylor', 'Spalding', 'Commissioner');

Insert Into People
Values(902, 'Rita', 'Johnson', 'Spalding', 'Commissioner');

Insert Into People
Values(903, 'Bart', 'Miller', 'Spalding', 'Commissioner');

Insert Into People
Values(904, 'Dean', 'Scarborough', 'Stephens', 'Chairman');

Insert Into People
Values(905, 'Dennis', 'Bell', 'Stephens', 'Vice Chairman');

Insert Into People
Values(906, 'Michelle', 'Grafton', 'Stephens', 'Commissioner');

Insert Into People
Values(907, 'Stanley', 'London', 'Stephens', 'Commissioner');

Insert Into People
Values(908, 'Deborah', 'Whitlock', 'Stephens', 'Commissioner');

Insert Into People
Values(909, 'Joe', 'Williams', 'Stewart', 'Chairman');

Insert Into People
Values(910, 'Jimmy', 'Lee', 'Stewart', 'Vice Chairman');

Insert Into People
Values(911, 'Ernest', 'Brown', 'Stewart', 'Commissioner');

Insert Into People
Values(912, 'Arcola', 'Scott', 'Stewart', 'Commissioner');

Insert Into People
Values(913, 'Joseph', 'Williams', 'Stewart', 'Commissioner');

Insert Into People
Values(914, 'Randy', 'Howard', 'Sumter', 'Chairman');

Insert Into People
Values(915, 'Clay', 'Jones', 'Sumter', 'Commissioner');

Insert Into People
Values(916, 'Thomas', 'Jordan', 'Sumter', 'Commissioner');

Insert Into People
Values(917, 'George', 'Torbert', 'Sumter', 'Commissioner');

Insert Into People
Values(918, 'Mark', 'Waddell', 'Sumter', 'Commissioner');

Insert Into People
Values(919, 'R. Freeman', 'Montgomery', 'Talbot', 'Chairman');

Insert Into People
Values(920, 'Franklin', 'Holmes', 'Talbot', 'Vice Chairman');

Insert Into People
Values(921, 'Ken', 'Chapman', 'Talbot', 'Commissioner');

Insert Into People
Values(922, 'Robert', 'Lanier', 'Talbot', 'Commissioner');

Insert Into People
Values(923, 'Sher''Londa', 'Walker', 'Talbot', 'Commissioner');

Insert Into People
Values(924, 'Charles', 'Ware', 'Taliaferro', 'Chairman');

Insert Into People
Values(925, 'Jane', 'Hubert', 'Taliaferro', 'Commissioner');

Insert Into People
Values(926, 'Evelyn', 'Kendrick', 'Taliaferro', 'Commissioner');

Insert Into People
Values(927, 'J. Daniel', 'Shuman', 'Tattnall', 'Interim Chairman');

Insert Into People
Values(928, 'Herbert', 'Burkhalter', 'Tattnall', 'Commissioner');

Insert Into People
Values(929, 'Mourice', 'Collins', 'Tattnall', 'Commissioner');

Insert Into People
Values(930, 'Edward', 'Kennedy', 'Tattnall', 'Commissioner');

Insert Into People
Values(931, 'G.W.', 'Thompson', 'Tattnall', 'Commissioner');

Insert Into People
Values(932, 'Clinton', 'Perry', 'Taylor', 'Chairman');

Insert Into People
Values(933, 'Cicero', 'Latimore', 'Taylor', 'Commissioner');

Insert Into People
Values(934, 'Randall', 'Nelson', 'Taylor', 'Commissioner');

Insert Into People
Values(935, 'Russell', 'Pounds', 'Taylor', 'Commissioner');

Insert Into People
Values(936, 'Jerry', 'Weldon', 'Taylor', 'Commissioner');

Insert Into People
Values(937, 'Sheryl', 'Clark', 'Telfair', 'Chairman');

Insert Into People
Values(938, 'Mark', 'Smith', 'Telfair', 'Vice Chairman');

Insert Into People
Values(939, 'Arthur', 'Moore', 'Telfair', 'Commissioner');

Insert Into People
Values(940, 'Pat', 'Ray', 'Telfair', 'Commissioner');

Insert Into People
Values(941, 'Lawrence', 'Spires', 'Telfair', 'Commissioner');

Insert Into People
Values(942, 'Wilbur', 'Gamble', 'Terrell', 'Chairman');

Insert Into People
Values(943, 'Larry', 'Faust', 'Terrell', 'Commissioner');

Insert Into People
Values(944, 'Lucius', 'Holloway', 'Terrell', 'Commissioner');

Insert Into People
Values(945, 'Ernest', 'Johnson', 'Terrell', 'Commissioner');

Insert Into People
Values(946, 'Brad', 'Stafford', 'Terrell', 'Commissioner');

Insert Into People
Values(947, 'Moses', 'Gross', 'Thomas', 'Chairman');

Insert Into People
Values(948, 'Ken', 'Hickey', 'Thomas', 'Vice Chairman');

Insert Into People
Values(949, 'Hershel', 'Ansley', 'Thomas', 'Commissioner');

Insert Into People
Values(950, 'Merrill', 'Baker', 'Thomas', 'Commissioner');

Insert Into People
Values(951, 'Phillip', 'Brown', 'Thomas', 'Commissioner');

Insert Into People
Values(952, 'Wiley', 'Grady', 'Thomas', 'Commissioner');

Insert Into People
Values(953, 'J. Elaine', 'Mays', 'Thomas', 'Commissioner');

Insert Into People
Values(954, 'Mark', 'NeSmith', 'Thomas', 'Commissioner');

Insert Into People
Values(955, 'Grady', 'Thompson', 'Tift', 'Chairman');

Insert Into People
Values(956, 'Donnie', 'Hester', 'Tift', 'Commissioner');

Insert Into People
Values(957, 'Melissa', 'Hughes', 'Tift', 'Commissioner');

Insert Into People
Values(958, 'Michael', 'Jones', 'Tift', 'Commissioner');

Insert Into People
Values(959, 'Sherry', 'Miley', 'Tift', 'Commissioner');

Insert Into People
Values(960, 'Buck', 'Rigdon', 'Tift', 'Commissioner');

Insert Into People
Values(961, 'Robert', 'Setters', 'Tift', 'Commissioner');

Insert Into People
Values(962, 'Blake', 'Tillery', 'Toombs', 'Chairman');

Insert Into People
Values(963, 'Wendell', 'Dixon', 'Toombs', 'Commissioner');

Insert Into People
Values(964, 'Jeff', 'McCormick', 'Toombs', 'Commissioner');

Insert Into People
Values(965, 'Dennis', 'Nobles', 'Toombs', 'Commissioner');

Insert Into People
Values(966, 'Roy', 'Williams', 'Toombs', 'Commissioner');

Insert Into People
Values(967, 'Bill', 'Kendall', 'Towns', 'Sole Commissioner');

Insert Into People
Values(968, 'Alvin', 'Wheeler', 'Treutlen', 'Chairman');

Insert Into People
Values(969, 'Kimberly', 'Edge', 'Treutlen', 'Vice Chairman');

Insert Into People
Values(970, 'Hugh', 'Brantley', 'Treutlen', 'Commissioner');

Insert Into People
Values(971, 'Mary', 'Carvin', 'Treutlen', 'Commissioner');

Insert Into People
Values(972, 'Cashaunda', 'Smith', 'Treutlen', 'Commissioner');

Insert Into People
Values(973, 'Richard', 'Wolfe', 'Troup', 'Chairman');

Insert Into People
Values(974, 'Robert', 'Davis', 'Troup', 'Commissioner');

Insert Into People
Values(975, 'Richard', 'English', 'Troup', 'Commissioner');

Insert Into People
Values(976, 'Claude', 'Foster', 'Troup', 'Commissioner');

Insert Into People
Values(977, 'Julian', 'Jones', 'Troup', 'Commissioner');

Insert Into People
Values(978, 'Sam', 'McCard', 'Turner', 'Chairman');

Insert Into People
Values(979, 'Joe', 'Burgess', 'Turner', 'Commissioner');

Insert Into People
Values(980, 'Brad', 'Calhoun', 'Turner', 'Commissioner');

Insert Into People
Values(981, 'Daryl', 'Hall', 'Turner', 'Commissioner');

Insert Into People
Values(982, 'Gregory', 'Hudgins', 'Turner', 'Commissioner');

Insert Into People
Values(983, 'Kenneth', 'Fowler', 'Twiggs', 'Chairman');

Insert Into People
Values(984, 'Donald', 'Watson', 'Twiggs', 'Vice Chairman');

Insert Into People
Values(985, 'William', 'Bond', 'Twiggs', 'Commissioner');

Insert Into People
Values(986, 'Tommie', 'Bryant', 'Twiggs', 'Commissioner');

Insert Into People
Values(987, 'Donald', 'Floyd', 'Twiggs', 'Commissioner');

Insert Into People
Values(988, 'Lamar', 'Paris', 'Union', 'Sole Commissioner');

Insert Into People
Values(989, 'Bebe', 'Heiskell', 'Walker', 'Sole Commissioner');

Insert Into People
Values(990, 'Kevin', 'Little', 'Walton', 'Chairman');

Insert Into People
Values(991, 'Jeremy', 'Adams', 'Walton', 'Commissioner');

Insert Into People
Values(992, 'Clinton', 'Ayers', 'Walton', 'Commissioner');

Insert Into People
Values(993, 'Mark', 'Banks', 'Walton', 'Commissioner');

Insert Into People
Values(994, 'Kirklyn', 'Dixon', 'Walton', 'Commissioner');

Insert Into People
Values(995, 'Lamar', 'Palmer', 'Walton', 'Commissioner');

Insert Into People
Values(996, 'Timmy', 'Shelnutt', 'Walton', 'Commissioner');

Insert Into People
Values(997, 'James', 'Brown', 'Ware', 'Chairman');

Insert Into People
Values(998, 'Victor', 'Aldridge', 'Ware', 'Commissioner');

Insert Into People
Values(999, 'Gene', 'Dixon', 'Ware', 'Commissioner');

Insert Into People
Values(1000, 'Carlos', 'Nelson', 'Ware', 'Commissioner');

Insert Into People
Values(1001, 'Danny', 'Turner', 'Ware', 'Commissioner');

Insert Into People
Values(1002, 'John', 'Graham', 'Warren', 'Chairman');

Insert Into People
Values(1003, 'Richard', 'Burley', 'Warren', 'Commissioner');

Insert Into People
Values(1004, 'Rita', 'Johnson', 'Warren', 'Commissioner');

Insert Into People
Values(1005, 'Horace', 'Daniel', 'Washington', 'Chairman');

Insert Into People
Values(1006, 'Edward', 'Burten', 'Washington', 'Commissioner');

Insert Into People
Values(1007, 'Melton', 'Jones', 'Washington', 'Commissioner');

Insert Into People
Values(1008, 'Larry', 'Mathis', 'Washington', 'Commissioner');

Insert Into People
Values(1009, 'Frank', 'Simmons', 'Washington', 'Commissioner');

Insert Into People
Values(1010, 'John', 'Shaver', 'Wayne', 'Chairman');

Insert Into People
Values(1011, 'Franklin', 'Smith', 'Wayne', 'Vice Chairman');

Insert Into People
Values(1012, 'James', 'Cockfield', 'Wayne', 'Commissioner');

Insert Into People
Values(1013, 'James', 'Thomas', 'Wayne', 'Commissioner');

Insert Into People
Values(1014, 'Jerry', 'Wright', 'Wayne', 'Commissioner');

Insert Into People
Values(1015, 'Jason', 'Tinsley', 'Wayne', 'Commissioner');

Insert Into People
Values(1016, 'George', 'Moore', 'Webster', 'Chairman');

Insert Into People
Values(1017, 'Melvin', 'Crimes', 'Webster', 'Commissioner');

Insert Into People
Values(1018, 'Jack', 'Holbrook', 'Webster', 'Commissioner');

Insert Into People
Values(1019, 'Jonah', 'McCluster', 'Webster', 'Commissioner');

Insert Into People
Values(1020, 'David', 'Scott', 'Webster', 'Commissioner');

Insert Into People
Values(1021, 'Keith', 'McNeal', 'Wheeler', 'Chairman');

Insert Into People
Values(1022, 'James', 'Cartwright', 'Wheeler', 'Commissioner');

Insert Into People
Values(1023, 'Rochelle', 'Culver', 'Wheeler', 'Commissioner');

Insert Into People
Values(1024, 'Travis', 'Turner', 'White', 'Chairman');

Insert Into People
Values(1025, 'Craig', 'Bryant', 'White', 'Commissioner');

Insert Into People
Values(1026, 'Terry', 'Goodger', 'White', 'Commissioner');

Insert Into People
Values(1027, 'Lyn', 'Holcomb', 'White', 'Commissioner');

Insert Into People
Values(1028, 'Edwin', 'Nix', 'White', 'Commissioner');

Insert Into People
Values(1029, 'W. Michael', 'Babb', 'Whitfield', 'Chairman');

Insert Into People
Values(1030, 'Harold', 'Brooker', 'Whitfield', 'Commissioner');

Insert Into People
Values(1031, 'Lynn', 'Laughter', 'Whitfield', 'Commissioner');

Insert Into People
Values(1032, 'Gordon', 'Morehouse', 'Whitfield', 'Commissioner');

Insert Into People
Values(1033, 'Robby', 'Staten', 'Whitfield', 'Commissioner');

Insert Into People
Values(1034, 'Marvin', 'Keene', 'Wilcox', 'Chairman');

Insert Into People
Values(1035, 'David', 'Brown', 'Wilcox', 'Commissioner');

Insert Into People
Values(1036, 'Arthur', 'Greene', 'Wilcox', 'Commissioner');

Insert Into People
Values(1037, 'Jowan', 'Johnson', 'Wilcox', 'Commissioner');

Insert Into People
Values(1038, 'Tracy', 'Tyndal', 'Wilcox', 'Commissioner');

Insert Into People
Values(1039, 'Samuel', 'Moore', 'Wilkes', 'Chairman');

Insert Into People
Values(1040, 'Edward', 'Geddings', 'Wilkes', 'Commissioner');

Insert Into People
Values(1041, 'Divenski', 'Lee', 'Wilkes', 'Commissioner');

Insert Into People
Values(1042, 'Kerry', 'McAvoy', 'Wilkes', 'Commissioner');

Insert Into People
Values(1043, 'Clifford', 'Slaton', 'Wilkes', 'Commissioner');

Insert Into People
Values(1044, 'Dennis', 'Holder', 'Wilkinson', 'Chairman');

Insert Into People
Values(1045, 'Clifton', 'Brooks', 'Wilkinson', 'Commissioner');

Insert Into People
Values(1046, 'James', 'Hagins', 'Wilkinson', 'Commissioner');

Insert Into People
Values(1047, 'James', 'Howell', 'Wilkinson', 'Commissioner');

Insert Into People
Values(1048, 'John', 'Williams', 'Wilkinson', 'Commissioner');

Insert Into People
Values(1049, 'Mike', 'Cosby', 'Worth', 'Chairman');

Insert Into People
Values(1050, 'Bettye', 'Bozeman', 'Worth', 'Commissioner');

Insert Into People
Values(1051, 'Joe', 'Gaines', 'Worth', 'Commissioner');

Insert Into People
Values(1052, 'Ken', 'Hall', 'Worth', 'Commissioner');

Insert Into People
Values(1053, 'Billy', 'McDonald', 'Worth', 'Commissioner');



Insert Into Authored
Values(1, 183, 1, 1);

Insert Into Authored
Values(2, 130, 1, 1);

Insert Into Authored
Values(3, 9, 1, 1);

Insert Into Authored
Values(4, 167, 1, 1);

Insert Into Authored
Values(5, 61, 1, 1);

Insert Into Authored
Values(6, 74, 1, 1);

Insert Into Authored
Values(7, 33, 2, 1);

Insert Into Authored
Values(8, 183, 3, 1);

Insert Into Authored
Values(9, 225, 3, 1);

Insert Into Authored
Values(10, 74, 4, 1);

Insert Into Authored
Values(11, 116, 4, 1);

Insert Into Authored
Values(12, 109, 4, 1);

Insert Into Authored
Values(13, 143, 4, 1);

Insert Into Authored
Values(14, 162, 4, 1);

Insert Into Authored
Values(15, 172, 4, 1);

Insert Into Authored
Values(16, 176, 5, 1);

Insert Into Authored
Values(17, 102, 5, 1);

Insert Into Authored
Values(18, 149, 5, 1);

Insert Into Authored
Values(19, 75, 5, 1);

Insert Into Authored
Values(20, 164, 5, 1);

Insert Into Authored
Values(21, 176, 6, 1);

Insert Into Authored
Values(22, 149, 6, 1);

Insert Into Authored
Values(23, 164, 6, 1);

Insert Into Authored
Values(24, 176, 7, 1);

Insert Into Authored
Values(25, 176, 8, 1);

Insert Into Authored
Values(26, 176, 9, 1);

Insert Into Authored
Values(27, 176, 10, 1);

Insert Into Authored
Values(28, 176, 11, 1);

Insert Into Authored
Values(29, 176, 12, 1);

Insert Into Authored
Values(30, 176, 13, 1);

Insert Into Authored
Values(31, 29, 14, 1);

Insert Into Authored
Values(32, 9, 14, 1);

Insert Into Authored
Values(33, 68, 14, 1);

Insert Into Authored
Values(34, 95, 14, 1);

Insert Into Authored
Values(35, 176, 15, 1);

Insert Into Authored
Values(36, 176, 16, 1);

Insert Into Authored
Values(37, 176, 17, 1);

Insert Into Authored
Values(38, 176, 18, 1);

Insert Into Authored
Values(39, 149, 18, 1);

Insert Into Authored
Values(40, 176, 19, 1);

Insert Into Authored
Values(41, 67, 19, 1);

Insert Into Authored
Values(42, 9, 19, 1);

Insert Into Authored
Values(43, 95, 19, 1);

Insert Into Authored
Values(44, 119, 19, 1);

Insert Into Authored
Values(45, 19, 19, 1);

Insert Into Authored
Values(46, 149, 20, 1);

Insert Into Authored
Values(47, 127, 21, 1);

Insert Into Authored
Values(48, 225, 21, 1);

Insert Into Authored
Values(49, 127, 22, 1);

Insert Into Authored
Values(50, 87, 22, 1);

Insert Into Authored
Values(51, 123, 22, 1);

Insert Into Authored
Values(52, 105, 22, 1);

Insert Into Authored
Values(53, 101, 23, 1);

Insert Into Authored
Values(54, 149, 23, 1);

Insert Into Authored
Values(55, 174, 23, 1);

Insert Into Authored
Values(56, 87, 23, 1);

Insert Into Authored
Values(57, 151, 23, 1);

Insert Into Authored
Values(58, 164, 23, 1);

Insert Into Authored
Values(59, 80, 24, 1);

Insert Into Authored
Values(60, 177, 25, 1);

Insert Into Authored
Values(61, 30, 25, 1);

Insert Into Authored
Values(62, 162, 25, 1);

Insert Into Authored
Values(63, 28, 25, 1);

Insert Into Authored
Values(64, 59, 25, 1);

Insert Into Authored
Values(65, 160, 25, 1);

Insert Into Authored
Values(66, 195, 25, 1);

Insert Into Authored
Values(67, 222, 26, 1);

Insert Into Authored
Values(68, 225, 26, 1);

Insert Into Authored
Values(69, 233, 26, 1);

Insert Into Authored
Values(70, 198, 26, 1);

Insert Into Authored
Values(71, 189, 26, 1);

Insert Into Authored
Values(72, 13, 26, 1);

Insert Into Authored
Values(73, 189, 27, 1);

Insert Into Authored
Values(74, 227, 27, 1);

Insert Into Authored
Values(75, 225, 27, 1);

Insert Into Authored
Values(76, 207, 27, 1);

Insert Into Authored
Values(77, 212, 27, 1);

Insert Into Authored
Values(78, 199, 27, 1);

Insert Into Authored
Values(79, 195, 28, 1);

Insert Into Authored
Values(80, 195, 29, 1);

Insert Into Authored
Values(81, 195, 30, 1);

Insert Into Authored
Values(82, 225, 31, 1);

Insert Into Authored
Values(83, 195, 32, 1);

Insert Into Authored
Values(84, 243, 33, 1);

Insert Into Authored
Values(85, 244, 33, 1);

Insert Into Authored
Values(86, 200, 33, 1);

Insert Into Authored
Values(87, 213, 33, 1);

Insert Into Authored
Values(88, 230, 33, 1);

Insert Into Authored
Values(89, 218, 34, 1);

Insert Into Authored
Values(90, 218, 35, 1);

Insert Into Authored
Values(91, 218, 36, 1);

Insert Into Authored
Values(92, 201, 37, 1);

Insert Into Authored
Values(93, 204, 37, 1);

Insert Into Authored
Values(94, 221, 37, 1);

Insert Into Authored
Values(95, 218, 37, 1);

Insert Into Authored
Values(96, 237, 37, 1);

Insert Into Authored
Values(97, 194, 37, 1);

Insert Into Authored
Values(98, 171, 37, 1);

Insert Into Authored
Values(99, 192, 38, 1);

Insert Into Authored
Values(100, 219, 38, 1);

Insert Into Authored
Values(101, 216, 38, 1);

Insert Into Authored
Values(102, 85, 38, 1);

Insert Into Authored
Values(103, 235, 39, 1);

Insert Into Authored
Values(104, 220, 39, 1);

Insert Into Authored
Values(105, 131, 39, 1);

Insert Into Authored
Values(106, 235, 40, 1);

Insert Into Authored
Values(107, 220, 40, 1);

Insert Into Authored
Values(108, 131, 40, 1);

Insert Into Authored
Values(109, 235, 41, 1);

Insert Into Authored
Values(110, 220, 41, 1);

Insert Into Authored
Values(111, 235, 42, 1);

Insert Into Authored
Values(112, 236, 43, 1);

Insert Into Authored
Values(113, 109, 43, 1);

Insert Into Authored
Values(114, 214, 44, 1);

Insert Into Authored
Values(115, 233, 44, 1);

Insert Into Authored
Values(116, 243, 44, 1);

Insert Into Authored
Values(117, 227, 44, 1);

Insert Into Authored
Values(118, 207, 44, 1);

Insert Into Authored
Values(119, 212, 44, 1);

Insert Into Authored
Values(120, 107, 44, 1);

Insert Into Authored
Values(121, 214, 45, 1);

Insert Into Authored
Values(122, 207, 45, 1);

Insert Into Authored
Values(123, 223, 45, 1);

Insert Into Authored
Values(124, 195, 45, 1);

Insert Into Authored
Values(125, 243, 45, 1);

Insert Into Authored
Values(126, 235, 45, 1);

Insert Into Authored
Values(127, 194, 46, 1);

Insert Into Authored
Values(128, 243, 47, 1);

Insert Into Authored
Values(129, 93, 47, 1);

Insert Into Authored
Values(130, 236, 48, 1);

Insert Into Authored
Values(131, 225, 48, 1);

Insert Into Authored
Values(132, 200, 48, 1);

Insert Into Authored
Values(133, 216, 48, 1);

Insert Into Authored
Values(134, 222, 48, 1);

Insert Into Authored
Values(135, 231, 48, 1);

Insert Into Authored
Values(136, 97, 48, 1);

Insert Into Authored
Values(137, 211, 49, 1);

Insert Into Authored
Values(138, 237, 49, 1);

Insert Into Authored
Values(139, 194, 49, 1);

Insert Into Authored
Values(140, 201, 49, 1);

Insert Into Authored
Values(141, 222, 50, 1);

Insert Into Authored
Values(142, 233, 50, 1);

Insert Into Authored
Values(143, 189, 50, 1);

Insert Into Authored
Values(144, 223, 50, 1);

Insert Into Authored
Values(145, 227, 50, 1);

Insert Into Authored
Values(146, 207, 50, 1);

Insert Into Authored
Values(147, 61, 50, 1);

Insert Into Authored
Values(148, 131, 51, 2);

Insert Into Authored
Values(149, 74, 52, 2);

Insert Into Authored
Values(150, 66, 53, 2);

Insert Into Authored
Values(151, 225, 54, 2);

Insert Into Authored
Values(152, 239, 55, 2);



--Insert data into Committees
Insert Into Committees
Values(1, 'House of Representatives', 'Agriculture & Consumer Affairs', 20);

Insert Into Committees
Values(2, 'House of Representatives', 'Agriculture & Consumer Affairs', 23);

Insert Into Committees
Values(3, 'House of Representatives', 'Agriculture & Consumer Affairs', 30);

Insert Into Committees
Values(4, 'House of Representatives', 'Agriculture & Consumer Affairs', 34);

Insert Into Committees
Values(5, 'House of Representatives', 'Agriculture & Consumer Affairs', 50);

Insert Into Committees
Values(6, 'House of Representatives', 'Agriculture & Consumer Affairs', 56);

Insert Into Committees
Values(7, 'House of Representatives', 'Agriculture & Consumer Affairs', 62);

Insert Into Committees
Values(8, 'House of Representatives', 'Agriculture & Consumer Affairs', 63);

Insert Into Committees
Values(9, 'House of Representatives', 'Agriculture & Consumer Affairs', 64);

Insert Into Committees
Values(10, 'House of Representatives', 'Agriculture & Consumer Affairs', 83);

Insert Into Committees
Values(11, 'House of Representatives', 'Agriculture & Consumer Affairs', 91);

Insert Into Committees
Values(12, 'House of Representatives', 'Agriculture & Consumer Affairs', 98);

Insert Into Committees
Values(13, 'House of Representatives', 'Agriculture & Consumer Affairs', 103);

Insert Into Committees
Values(14, 'House of Representatives', 'Agriculture & Consumer Affairs', 107);

Insert Into Committees
Values(15, 'House of Representatives', 'Agriculture & Consumer Affairs', 116);

Insert Into Committees
Values(16, 'House of Representatives', 'Agriculture & Consumer Affairs', 137);

Insert Into Committees
Values(17, 'House of Representatives', 'Agriculture & Consumer Affairs', 144);

Insert Into Committees
Values(18, 'House of Representatives', 'Agriculture & Consumer Affairs', 147);

Insert Into Committees
Values(19, 'House of Representatives', 'Agriculture & Consumer Affairs', 168);

Insert Into Committees
Values(20, 'House of Representatives', 'Agriculture & Consumer Affairs', 171);

Insert Into Committees
Values(21, 'House of Representatives', 'Agriculture & Consumer Affairs', 178);

Insert Into Committees
Values(22, 'House of Representatives', 'Appropriations',9);

Insert Into Committees
Values(23, 'House of Representatives', 'Appropriations',11);

Insert Into Committees
Values(24, 'House of Representatives', 'Appropriations',13);

Insert Into Committees
Values(25, 'House of Representatives', 'Appropriations',16);

Insert Into Committees
Values(26, 'House of Representatives', 'Appropriations',23);

Insert Into Committees
Values(27, 'House of Representatives', 'Appropriations',25);

Insert Into Committees
Values(28, 'House of Representatives', 'Appropriations',28);

Insert Into Committees
Values(29, 'House of Representatives', 'Appropriations',30);

Insert Into Committees
Values(30, 'House of Representatives', 'Appropriations',34);

Insert Into Committees
Values(31, 'House of Representatives', 'Appropriations',35);

Insert Into Committees
Values(32, 'House of Representatives', 'Appropriations',37);

Insert Into Committees
Values(33, 'House of Representatives', 'Appropriations',39);

Insert Into Committees
Values(34, 'House of Representatives', 'Appropriations',40);

Insert Into Committees
Values(35, 'House of Representatives', 'Appropriations',41);

Insert Into Committees
Values(36, 'House of Representatives', 'Appropriations',42);

Insert Into Committees
Values(37, 'House of Representatives', 'Appropriations',48);

Insert Into Committees
Values(38, 'House of Representatives', 'Appropriations',50);

Insert Into Committees
Values(39, 'House of Representatives', 'Appropriations',51);

Insert Into Committees
Values(40, 'House of Representatives', 'Appropriations',52);

Insert Into Committees
Values(41, 'House of Representatives', 'Appropriations',61);

Insert Into Committees
Values(42, 'House of Representatives', 'Appropriations',62);

Insert Into Committees
Values(43, 'House of Representatives', 'Appropriations',63);

Insert Into Committees
Values(44, 'House of Representatives', 'Appropriations',64);

Insert Into Committees
Values(45, 'House of Representatives', 'Appropriations',65);

Insert Into Committees
Values(46, 'House of Representatives', 'Appropriations',72);

Insert Into Committees
Values(47, 'House of Representatives', 'Appropriations',75);

Insert Into Committees
Values(48, 'House of Representatives', 'Appropriations',76);

Insert Into Committees
Values(49, 'House of Representatives', 'Appropriations',79);

Insert Into Committees
Values(50, 'House of Representatives', 'Appropriations',81);

Insert Into Committees
Values(51, 'House of Representatives', 'Appropriations',82);

Insert Into Committees
Values(52, 'House of Representatives', 'Appropriations',83);

Insert Into Committees
Values(53, 'House of Representatives', 'Appropriations',85);

Insert Into Committees
Values(54, 'House of Representatives', 'Appropriations',86);

Insert Into Committees
Values(55, 'House of Representatives', 'Appropriations',87);

Insert Into Committees
Values(56, 'House of Representatives', 'Appropriations',88);

Insert Into Committees
Values(57, 'House of Representatives', 'Appropriations',89);

Insert Into Committees
Values(58, 'House of Representatives', 'Appropriations',93);

Insert Into Committees
Values(59, 'House of Representatives', 'Appropriations',94);

Insert Into Committees
Values(60, 'House of Representatives', 'Appropriations',95);

Insert Into Committees
Values(61, 'House of Representatives', 'Appropriations',98);

Insert Into Committees
Values(62, 'House of Representatives', 'Appropriations',99);

Insert Into Committees
Values(63, 'House of Representatives', 'Appropriations',101);

Insert Into Committees
Values(64, 'House of Representatives', 'Appropriations',103);

Insert Into Committees
Values(65, 'House of Representatives', 'Appropriations',109);

Insert Into Committees
Values(66, 'House of Representatives', 'Appropriations',113);

Insert Into Committees
Values(67, 'House of Representatives', 'Appropriations',114);

Insert Into Committees
Values(68, 'House of Representatives', 'Appropriations',115);

Insert Into Committees
Values(69, 'House of Representatives', 'Appropriations',121);

Insert Into Committees
Values(70, 'House of Representatives', 'Appropriations',122);

Insert Into Committees
Values(71, 'House of Representatives', 'Appropriations',124);

Insert Into Committees
Values(72, 'House of Representatives', 'Appropriations',125);

Insert Into Committees
Values(73, 'House of Representatives', 'Appropriations',127);

Insert Into Committees
Values(74, 'House of Representatives', 'Appropriations',129);

Insert Into Committees
Values(75, 'House of Representatives', 'Appropriations',130);

Insert Into Committees
Values(76, 'House of Representatives', 'Appropriations',131);

Insert Into Committees
Values(77, 'House of Representatives', 'Appropriations',133);

Insert Into Committees
Values(78, 'House of Representatives', 'Appropriations',134);

Insert Into Committees
Values(79, 'House of Representatives', 'Appropriations',136);

Insert Into Committees
Values(80, 'House of Representatives', 'Appropriations',140);

Insert Into Committees
Values(81, 'House of Representatives', 'Appropriations',142);

Insert Into Committees
Values(82, 'House of Representatives', 'Appropriations',144);

Insert Into Committees
Values(83, 'House of Representatives', 'Appropriations',145);

Insert Into Committees
Values(84, 'House of Representatives', 'Appropriations',146);

Insert Into Committees
Values(85, 'House of Representatives', 'Appropriations',148);

Insert Into Committees
Values(86, 'House of Representatives', 'Appropriations',150);

Insert Into Committees
Values(87, 'House of Representatives', 'Appropriations',153);

Insert Into Committees
Values(88, 'House of Representatives', 'Appropriations',156);

Insert Into Committees
Values(89, 'House of Representatives', 'Appropriations',158);

Insert Into Committees
Values(90, 'House of Representatives', 'Appropriations',159);

Insert Into Committees
Values(91, 'House of Representatives', 'Appropriations',162);

Insert Into Committees
Values(92, 'House of Representatives', 'Appropriations',168);

Insert Into Committees
Values(93, 'House of Representatives', 'Appropriations',171);

Insert Into Committees
Values(94, 'House of Representatives', 'Appropriations',172);

Insert Into Committees
Values(95, 'House of Representatives', 'Appropriations',177);

Insert Into Committees
Values(96, 'House of Representatives', 'Appropriations',179);

Insert Into Committees
Values(97, 'House of Representatives', 'Appropriations',180);

Insert Into Committees
Values(98, 'House of Representatives', 'Appropriations',183);

Insert Into Committees
Values(99, 'House of Representatives', 'Appropriations',185);

Insert Into Committees
Values(100, 'House of Representatives', 'Appropriations',186);

Insert Into Committees
Values(101, 'House of Representatives', 'Appropriations',188);

Insert Into Committees
Values(102, 'House of Representatives', 'Banks & Banking', 32);

Insert Into Committees
Values(103, 'House of Representatives', 'Banks & Banking', 44);

Insert Into Committees
Values(104, 'House of Representatives', 'Banks & Banking', 46);

Insert Into Committees
Values(105, 'House of Representatives', 'Banks & Banking', 50);

Insert Into Committees
Values(106, 'House of Representatives', 'Banks & Banking', 53);

Insert Into Committees
Values(107, 'House of Representatives', 'Banks & Banking', 57);

Insert Into Committees
Values(108, 'House of Representatives', 'Banks & Banking', 58);

Insert Into Committees
Values(109, 'House of Representatives', 'Banks & Banking', 59);

Insert Into Committees
Values(110, 'House of Representatives', 'Banks & Banking', 61);

Insert Into Committees
Values(111, 'House of Representatives', 'Banks & Banking', 68);

Insert Into Committees
Values(112, 'House of Representatives', 'Banks & Banking', 69);

Insert Into Committees
Values(113, 'House of Representatives', 'Banks & Banking', 83);

Insert Into Committees
Values(114, 'House of Representatives', 'Banks & Banking', 93);

Insert Into Committees
Values(115, 'House of Representatives', 'Banks & Banking', 102);

Insert Into Committees
Values(116, 'House of Representatives', 'Banks & Banking', 104);

Insert Into Committees
Values(117, 'House of Representatives', 'Banks & Banking', 108);

Insert Into Committees
Values(118, 'House of Representatives', 'Banks & Banking', 112);

Insert Into Committees
Values(119, 'House of Representatives', 'Banks & Banking', 122);

Insert Into Committees
Values(120, 'House of Representatives', 'Banks & Banking', 125);

Insert Into Committees
Values(121, 'House of Representatives', 'Banks & Banking', 129);

Insert Into Committees
Values(122, 'House of Representatives', 'Banks & Banking', 155);

Insert Into Committees
Values(123, 'House of Representatives', 'Banks & Banking', 166);

Insert Into Committees
Values(124, 'House of Representatives', 'Banks & Banking', 167);

Insert Into Committees
Values(125, 'House of Representatives', 'Banks & Banking', 173);

Insert Into Committees
Values(126, 'House of Representatives', 'Banks & Banking', 180);

Insert Into Committees
Values(127, 'House of Representatives', 'Banks & Banking', 187);

Insert Into Committees
Values(128, 'House of Representatives', 'Budget and Fiscal Affairs Oversight', 14);

Insert Into Committees
Values(129, 'House of Representatives', 'Budget and Fiscal Affairs Oversight', 31);

Insert Into Committees
Values(130, 'House of Representatives', 'Budget and Fiscal Affairs Oversight', 39);

Insert Into Committees
Values(131, 'House of Representatives', 'Budget and Fiscal Affairs Oversight', 69);

Insert Into Committees
Values(132, 'House of Representatives', 'Budget and Fiscal Affairs Oversight', 70);

Insert Into Committees
Values(133, 'House of Representatives', 'Budget and Fiscal Affairs Oversight', 73);

Insert Into Committees
Values(134, 'House of Representatives', 'Budget and Fiscal Affairs Oversight', 84);

Insert Into Committees
Values(135, 'House of Representatives', 'Budget and Fiscal Affairs Oversight', 93);

Insert Into Committees
Values(136, 'House of Representatives', 'Budget and Fiscal Affairs Oversight', 97);

Insert Into Committees
Values(137, 'House of Representatives', 'Budget and Fiscal Affairs Oversight', 100);

Insert Into Committees
Values(138, 'House of Representatives', 'Budget and Fiscal Affairs Oversight', 102);

Insert Into Committees
Values(139, 'House of Representatives', 'Budget and Fiscal Affairs Oversight', 110);

Insert Into Committees
Values(140, 'House of Representatives', 'Budget and Fiscal Affairs Oversight', 113);

Insert Into Committees
Values(141, 'House of Representatives', 'Budget and Fiscal Affairs Oversight', 170);

Insert Into Committees
Values(142, 'House of Representatives', 'Budget and Fiscal Affairs Oversight', 181);

Insert Into Committees
Values(143, 'House of Representatives', 'Budget and Fiscal Affairs Oversight', 184);

Insert Into Committees
Values(144, 'House of Representatives', 'Code Revision', 10);

Insert Into Committees
Values(145, 'House of Representatives', 'Code Revision', 15);

Insert Into Committees
Values(146, 'House of Representatives', 'Code Revision', 19);

Insert Into Committees
Values(147, 'House of Representatives', 'Code Revision', 31);

Insert Into Committees
Values(148, 'House of Representatives', 'Code Revision', 35);

Insert Into Committees
Values(149, 'House of Representatives', 'Code Revision', 78);

Insert Into Committees
Values(150, 'House of Representatives', 'Code Revision', 104);

Insert Into Committees
Values(151, 'House of Representatives', 'Code Revision', 111);

Insert Into Committees
Values(152, 'House of Representatives', 'Code Revision', 122);

Insert Into Committees
Values(153, 'House of Representatives', 'Code Revision', 128);

Insert Into Committees
Values(154, 'House of Representatives', 'Code Revision', 157);

Insert Into Committees
Values(155, 'House of Representatives', 'Code Revision', 163);

Insert Into Committees
Values(156, 'House of Representatives', 'Code Revision', 164);

Insert Into Committees
Values(157, 'House of Representatives', 'Code Revision', 179);

Insert Into Committees
Values(158, 'House of Representatives', 'Code Revision', 180);

Insert Into Committees
Values(159, 'House of Representatives', 'Defense & Veterans Affairs', 12);

Insert Into Committees
Values(160, 'House of Representatives', 'Defense & Veterans Affairs', 23);

Insert Into Committees
Values(161, 'House of Representatives', 'Defense & Veterans Affairs', 47);

Insert Into Committees
Values(162, 'House of Representatives', 'Defense & Veterans Affairs', 60);

Insert Into Committees
Values(163, 'House of Representatives', 'Defense & Veterans Affairs', 75);

Insert Into Committees
Values(164, 'House of Representatives', 'Defense & Veterans Affairs', 89);

Insert Into Committees
Values(165, 'House of Representatives', 'Defense & Veterans Affairs', 90);

Insert Into Committees
Values(166, 'House of Representatives', 'Defense & Veterans Affairs', 132);

Insert Into Committees
Values(167, 'House of Representatives', 'Defense & Veterans Affairs', 135);

Insert Into Committees
Values(168, 'House of Representatives', 'Defense & Veterans Affairs', 146);

Insert Into Committees
Values(169, 'House of Representatives', 'Defense & Veterans Affairs', 155);

Insert Into Committees
Values(170, 'House of Representatives', 'Defense & Veterans Affairs', 170);

Insert Into Committees
Values(171, 'House of Representatives', 'Defense & Veterans Affairs', 188);

Insert Into Committees
Values(172, 'House of Representatives', 'Economic Development & Tourism', 16);

Insert Into Committees
Values(173, 'House of Representatives', 'Economic Development & Tourism', 19);

Insert Into Committees
Values(174, 'House of Representatives', 'Economic Development & Tourism', 25);

Insert Into Committees
Values(175, 'House of Representatives', 'Economic Development & Tourism', 26);

Insert Into Committees
Values(176, 'House of Representatives', 'Economic Development & Tourism', 28);

Insert Into Committees
Values(177, 'House of Representatives', 'Economic Development & Tourism', 30);

Insert Into Committees
Values(178, 'House of Representatives', 'Economic Development & Tourism', 38);

Insert Into Committees
Values(179, 'House of Representatives', 'Economic Development & Tourism', 48);

Insert Into Committees
Values(180, 'House of Representatives', 'Economic Development & Tourism', 51);

Insert Into Committees
Values(181, 'House of Representatives', 'Economic Development & Tourism', 56);

Insert Into Committees
Values(182, 'House of Representatives', 'Economic Development & Tourism', 67);

Insert Into Committees
Values(183, 'House of Representatives', 'Economic Development & Tourism', 77);

Insert Into Committees
Values(184, 'House of Representatives', 'Economic Development & Tourism', 78);

Insert Into Committees
Values(185, 'House of Representatives', 'Economic Development & Tourism', 79);

Insert Into Committees
Values(186, 'House of Representatives', 'Economic Development & Tourism', 85);

Insert Into Committees
Values(187, 'House of Representatives', 'Economic Development & Tourism', 87);

Insert Into Committees
Values(188, 'House of Representatives', 'Economic Development & Tourism', 91);

Insert Into Committees
Values(189, 'House of Representatives', 'Economic Development & Tourism', 93);

Insert Into Committees
Values(190, 'House of Representatives', 'Economic Development & Tourism', 112);

Insert Into Committees
Values(191, 'House of Representatives', 'Economic Development & Tourism', 125);

Insert Into Committees
Values(192, 'House of Representatives', 'Economic Development & Tourism', 129);

Insert Into Committees
Values(193, 'House of Representatives', 'Economic Development & Tourism', 136);

Insert Into Committees
Values(194, 'House of Representatives', 'Economic Development & Tourism', 138);

Insert Into Committees
Values(195, 'House of Representatives', 'Economic Development & Tourism', 146);

Insert Into Committees
Values(196, 'House of Representatives', 'Economic Development & Tourism', 152);

Insert Into Committees
Values(197, 'House of Representatives', 'Economic Development & Tourism', 153);

Insert Into Committees
Values(198, 'House of Representatives', 'Economic Development & Tourism', 162);

Insert Into Committees
Values(199, 'House of Representatives', 'Economic Development & Tourism', 172);

Insert Into Committees
Values(200, 'House of Representatives', 'Economic Development & Tourism', 174);

Insert Into Committees
Values(201, 'House of Representatives', 'Economic Development & Tourism', 182);

Insert Into Committees
Values(202, 'House of Representatives', 'Economic Development & Tourism', 185);

Insert Into Committees
Values(203, 'House of Representatives', 'Education', 21);

Insert Into Committees
Values(204, 'House of Representatives', 'Education', 34);

Insert Into Committees
Values(205, 'House of Representatives', 'Education', 35);

Insert Into Committees
Values(206, 'House of Representatives', 'Education', 36);

Insert Into Committees
Values(207, 'House of Representatives', 'Education', 41);

Insert Into Committees
Values(208, 'House of Representatives', 'Education', 42);

Insert Into Committees
Values(209, 'House of Representatives', 'Education', 49);

Insert Into Committees
Values(210, 'House of Representatives', 'Education', 51);

Insert Into Committees
Values(211, 'House of Representatives', 'Education', 55);

Insert Into Committees
Values(212, 'House of Representatives', 'Education', 62);

Insert Into Committees
Values(213, 'House of Representatives', 'Education', 67);

Insert Into Committees
Values(214, 'House of Representatives', 'Education', 75);

Insert Into Committees
Values(215, 'House of Representatives', 'Education', 94);

Insert Into Committees
Values(216, 'House of Representatives', 'Education', 99);

Insert Into Committees
Values(217, 'House of Representatives', 'Education', 103);

Insert Into Committees
Values(218, 'House of Representatives', 'Education', 109);

Insert Into Committees
Values(219, 'House of Representatives', 'Education', 114);

Insert Into Committees
Values(220, 'House of Representatives', 'Education', 115);

Insert Into Committees
Values(221, 'House of Representatives', 'Education', 121);

Insert Into Committees
Values(222, 'House of Representatives', 'Education', 125);

Insert Into Committees
Values(223, 'House of Representatives', 'Education', 132);

Insert Into Committees
Values(224, 'House of Representatives', 'Education', 150);

Insert Into Committees
Values(225, 'House of Representatives', 'Education', 167);

Insert Into Committees
Values(226, 'House of Representatives', 'Education', 169);

Insert Into Committees
Values(227, 'House of Representatives', 'Education', 173);

Insert Into Committees
Values(228, 'House of Representatives', 'Energy, Utilities & Telecommunications', 11);

Insert Into Committees
Values(229, 'House of Representatives', 'Energy, Utilities & Telecommunications', 33);

Insert Into Committees
Values(230, 'House of Representatives', 'Energy, Utilities & Telecommunications', 48);

Insert Into Committees
Values(231, 'House of Representatives', 'Energy, Utilities & Telecommunications', 50);

Insert Into Committees
Values(232, 'House of Representatives', 'Energy, Utilities & Telecommunications', 54);

Insert Into Committees
Values(233, 'House of Representatives', 'Energy, Utilities & Telecommunications', 55);

Insert Into Committees
Values(234, 'House of Representatives', 'Energy, Utilities & Telecommunications', 69);

Insert Into Committees
Values(235, 'House of Representatives', 'Energy, Utilities & Telecommunications', 71);

Insert Into Committees
Values(236, 'House of Representatives', 'Energy, Utilities & Telecommunications', 74);

Insert Into Committees
Values(237, 'House of Representatives', 'Energy, Utilities & Telecommunications', 81);

Insert Into Committees
Values(238, 'House of Representatives', 'Energy, Utilities & Telecommunications', 82);

Insert Into Committees
Values(239, 'House of Representatives', 'Energy, Utilities & Telecommunications', 85);

Insert Into Committees
Values(240, 'House of Representatives', 'Energy, Utilities & Telecommunications', 91);

Insert Into Committees
Values(241, 'House of Representatives', 'Energy, Utilities & Telecommunications', 92);

Insert Into Committees
Values(242, 'House of Representatives', 'Energy, Utilities & Telecommunications', 113);

Insert Into Committees
Values(243, 'House of Representatives', 'Energy, Utilities & Telecommunications', 130);

Insert Into Committees
Values(244, 'House of Representatives', 'Energy, Utilities & Telecommunications', 155);

Insert Into Committees
Values(245, 'House of Representatives', 'Energy, Utilities & Telecommunications', 173);

Insert Into Committees
Values(246, 'House of Representatives', 'Energy, Utilities & Telecommunications', 184);

Insert Into Committees
Values(247, 'House of Representatives', 'Ethics', 9);

Insert Into Committees
Values(248, 'House of Representatives', 'Ethics', 29);

Insert Into Committees
Values(249, 'House of Representatives', 'Ethics', 68);

Insert Into Committees
Values(250, 'House of Representatives', 'Ethics', 85);

Insert Into Committees
Values(251, 'House of Representatives', 'Ethics', 95);

Insert Into Committees
Values(252, 'House of Representatives', 'Ethics', 99);

Insert Into Committees
Values(253, 'House of Representatives', 'Ethics', 126);

Insert Into Committees
Values(254, 'House of Representatives', 'Ethics', 140);

Insert Into Committees
Values(255, 'House of Representatives', 'Ethics', 173);

Insert Into Committees
Values(256, 'House of Representatives', 'Ethics', 182);

Insert Into Committees
Values(257, 'House of Representatives', 'Ethics', 183);

Insert Into Committees
Values(258, 'House of Representatives', 'Game, Fish, & Parks', 11);

Insert Into Committees
Values(259, 'House of Representatives', 'Game, Fish, & Parks', 17);

Insert Into Committees
Values(260, 'House of Representatives', 'Game, Fish, & Parks', 27);

Insert Into Committees
Values(261, 'House of Representatives', 'Game, Fish, & Parks', 30);

Insert Into Committees
Values(262, 'House of Representatives', 'Game, Fish, & Parks', 49);

Insert Into Committees
Values(263, 'House of Representatives', 'Game, Fish, & Parks', 57);

Insert Into Committees
Values(264, 'House of Representatives', 'Game, Fish, & Parks', 61);

Insert Into Committees
Values(265, 'House of Representatives', 'Game, Fish, & Parks', 108);

Insert Into Committees
Values(266, 'House of Representatives', 'Game, Fish, & Parks', 116);

Insert Into Committees
Values(267, 'House of Representatives', 'Game, Fish, & Parks', 118);

Insert Into Committees
Values(268, 'House of Representatives', 'Game, Fish, & Parks', 136);

Insert Into Committees
Values(269, 'House of Representatives', 'Game, Fish, & Parks', 144);

Insert Into Committees
Values(270, 'House of Representatives', 'Game, Fish, & Parks', 152);

Insert Into Committees
Values(271, 'House of Representatives', 'Game, Fish, & Parks', 160);

Insert Into Committees
Values(272, 'House of Representatives', 'Game, Fish, & Parks', 185);

Insert Into Committees
Values(273, 'House of Representatives', 'Governmental Affairs', 25);

Insert Into Committees
Values(274, 'House of Representatives', 'Governmental Affairs', 26);

Insert Into Committees
Values(275, 'House of Representatives', 'Governmental Affairs', 34);

Insert Into Committees
Values(276, 'House of Representatives', 'Governmental Affairs', 66);

Insert Into Committees
Values(277, 'House of Representatives', 'Governmental Affairs', 67);

Insert Into Committees
Values(278, 'House of Representatives', 'Governmental Affairs', 81);

Insert Into Committees
Values(279, 'House of Representatives', 'Governmental Affairs', 88);

Insert Into Committees
Values(280, 'House of Representatives', 'Governmental Affairs', 106);

Insert Into Committees
Values(281, 'House of Representatives', 'Governmental Affairs', 118);

Insert Into Committees
Values(282, 'House of Representatives', 'Governmental Affairs', 121);

Insert Into Committees
Values(283, 'House of Representatives', 'Governmental Affairs', 123);

Insert Into Committees
Values(284, 'House of Representatives', 'Governmental Affairs', 126);

Insert Into Committees
Values(285, 'House of Representatives', 'Governmental Affairs', 127);

Insert Into Committees
Values(286, 'House of Representatives', 'Governmental Affairs', 133);

Insert Into Committees
Values(287, 'House of Representatives', 'Governmental Affairs', 134);

Insert Into Committees
Values(288, 'House of Representatives', 'Governmental Affairs', 171);

Insert Into Committees
Values(289, 'House of Representatives', 'Governmental Affairs', 187);

Insert Into Committees
Values(290, 'House of Representatives', 'Health & Human Services', 15);

Insert Into Committees
Values(291, 'House of Representatives', 'Health & Human Services', 22);

Insert Into Committees
Values(292, 'House of Representatives', 'Health & Human Services', 24);

Insert Into Committees
Values(293, 'House of Representatives', 'Health & Human Services', 37);

Insert Into Committees
Values(294, 'House of Representatives', 'Health & Human Services', 39);

Insert Into Committees
Values(295, 'House of Representatives', 'Health & Human Services', 40);

Insert Into Committees
Values(296, 'House of Representatives', 'Health & Human Services', 41);

Insert Into Committees
Values(297, 'House of Representatives', 'Health & Human Services', 45);

Insert Into Committees
Values(298, 'House of Representatives', 'Health & Human Services', 48);

Insert Into Committees
Values(299, 'House of Representatives', 'Health & Human Services', 54);

Insert Into Committees
Values(300, 'House of Representatives', 'Health & Human Services', 71);

Insert Into Committees
Values(301, 'House of Representatives', 'Health & Human Services', 77);

Insert Into Committees
Values(302, 'House of Representatives', 'Health & Human Services', 83);

Insert Into Committees
Values(303, 'House of Representatives', 'Health & Human Services', 85);

Insert Into Committees
Values(304, 'House of Representatives', 'Health & Human Services', 86);

Insert Into Committees
Values(305, 'House of Representatives', 'Health & Human Services', 87);

Insert Into Committees
Values(306, 'House of Representatives', 'Health & Human Services', 92);

Insert Into Committees
Values(307, 'House of Representatives', 'Health & Human Services', 94);

Insert Into Committees
Values(308, 'House of Representatives', 'Health & Human Services', 98);

Insert Into Committees
Values(309, 'House of Representatives', 'Health & Human Services', 101);

Insert Into Committees
Values(310, 'House of Representatives', 'Health & Human Services', 103);

Insert Into Committees
Values(311, 'House of Representatives', 'Health & Human Services', 106);

Insert Into Committees
Values(312, 'House of Representatives', 'Health & Human Services', 119);

Insert Into Committees
Values(313, 'House of Representatives', 'Health & Human Services', 121);

Insert Into Committees
Values(314, 'House of Representatives', 'Health & Human Services', 123);

Insert Into Committees
Values(315, 'House of Representatives', 'Health & Human Services', 128);

Insert Into Committees
Values(316, 'House of Representatives', 'Health & Human Services', 130);

Insert Into Committees
Values(317, 'House of Representatives', 'Health & Human Services', 131);

Insert Into Committees
Values(318, 'House of Representatives', 'Health & Human Services', 136);

Insert Into Committees
Values(319, 'House of Representatives', 'Health & Human Services', 141);

Insert Into Committees
Values(320, 'House of Representatives', 'Health & Human Services', 145);

Insert Into Committees
Values(321, 'House of Representatives', 'Health & Human Services', 148);

Insert Into Committees
Values(322, 'House of Representatives', 'Health & Human Services', 151);

Insert Into Committees
Values(323, 'House of Representatives', 'Health & Human Services', 153);

Insert Into Committees
Values(324, 'House of Representatives', 'Health & Human Services', 161);

Insert Into Committees
Values(325, 'House of Representatives', 'Health & Human Services', 163);

Insert Into Committees
Values(326, 'House of Representatives', 'Health & Human Services', 177);

Insert Into Committees
Values(327, 'House of Representatives', 'Health & Human Services', 182);

Insert Into Committees
Values(328, 'House of Representatives', 'Higher Education', 34);

Insert Into Committees
Values(329, 'House of Representatives', 'Higher Education', 35);

Insert Into Committees
Values(330, 'House of Representatives', 'Higher Education', 48);

Insert Into Committees
Values(331, 'House of Representatives', 'Higher Education', 61);

Insert Into Committees
Values(332, 'House of Representatives', 'Higher Education', 71);

Insert Into Committees
Values(333, 'House of Representatives', 'Higher Education', 72);

Insert Into Committees
Values(334, 'House of Representatives', 'Higher Education', 90);

Insert Into Committees
Values(335, 'House of Representatives', 'Higher Education', 104);

Insert Into Committees
Values(336, 'House of Representatives', 'Higher Education', 108);

Insert Into Committees
Values(337, 'House of Representatives', 'Higher Education', 111);

Insert Into Committees
Values(338, 'House of Representatives', 'Higher Education', 140);

Insert Into Committees
Values(339, 'House of Representatives', 'Higher Education', 145);

Insert Into Committees
Values(340, 'House of Representatives', 'Higher Education', 154);

Insert Into Committees
Values(341, 'House of Representatives', 'Higher Education', 159);

Insert Into Committees
Values(342, 'House of Representatives', 'Higher Education', 177);

Insert Into Committees
Values(343, 'House of Representatives', 'Higher Education', 186);

Insert Into Committees
Values(344, 'House of Representatives', 'Human Relations & Aging', 17);

Insert Into Committees
Values(345, 'House of Representatives', 'Human Relations & Aging', 18);

Insert Into Committees
Values(346, 'House of Representatives', 'Human Relations & Aging', 21);

Insert Into Committees
Values(347, 'House of Representatives', 'Human Relations & Aging', 27);

Insert Into Committees
Values(348, 'House of Representatives', 'Human Relations & Aging', 37);

Insert Into Committees
Values(349, 'House of Representatives', 'Human Relations & Aging', 41);

Insert Into Committees
Values(350, 'House of Representatives', 'Human Relations & Aging', 46);

Insert Into Committees
Values(351, 'House of Representatives', 'Human Relations & Aging', 70);

Insert Into Committees
Values(352, 'House of Representatives', 'Human Relations & Aging', 73);

Insert Into Committees
Values(353, 'House of Representatives', 'Human Relations & Aging', 80);

Insert Into Committees
Values(354, 'House of Representatives', 'Human Relations & Aging', 107);

Insert Into Committees
Values(355, 'House of Representatives', 'Human Relations & Aging', 146);

Insert Into Committees
Values(356, 'House of Representatives', 'Human Relations & Aging', 149);

Insert Into Committees
Values(357, 'House of Representatives', 'Human Relations & Aging', 160);

Insert Into Committees
Values(358, 'House of Representatives', 'Industry and Labor', 24);

Insert Into Committees
Values(359, 'House of Representatives', 'Industry and Labor', 28);

Insert Into Committees
Values(360, 'House of Representatives', 'Industry and Labor', 46);

Insert Into Committees
Values(361, 'House of Representatives', 'Industry and Labor', 62);

Insert Into Committees
Values(362, 'House of Representatives', 'Industry and Labor', 66);

Insert Into Committees
Values(363, 'House of Representatives', 'Industry and Labor', 67);

Insert Into Committees
Values(364, 'House of Representatives', 'Industry and Labor', 81);

Insert Into Committees
Values(365, 'House of Representatives', 'Industry and Labor', 107);

Insert Into Committees
Values(366, 'House of Representatives', 'Industry and Labor', 109);

Insert Into Committees
Values(367, 'House of Representatives', 'Industry and Labor', 112);

Insert Into Committees
Values(368, 'House of Representatives', 'Industry and Labor', 117);

Insert Into Committees
Values(369, 'House of Representatives', 'Industry and Labor', 118);

Insert Into Committees
Values(370, 'House of Representatives', 'Industry and Labor', 124);

Insert Into Committees
Values(371, 'House of Representatives', 'Industry and Labor', 136);

Insert Into Committees
Values(372, 'House of Representatives', 'Information and Audits', 14);

Insert Into Committees
Values(373, 'House of Representatives', 'Information and Audits', 39);

Insert Into Committees
Values(374, 'House of Representatives', 'Information and Audits', 57);

Insert Into Committees
Values(375, 'House of Representatives', 'Information and Audits', 141);

Insert Into Committees
Values(376, 'House of Representatives', 'Information and Audits', 151);

Insert Into Committees
Values(377, 'House of Representatives', 'Information and Audits', 186);

Insert Into Committees
Values(378, 'House of Representatives', 'Insurance', 13);

Insert Into Committees
Values(379, 'House of Representatives', 'Insurance', 25);

Insert Into Committees
Values(380, 'House of Representatives', 'Insurance', 33);

Insert Into Committees
Values(381, 'House of Representatives', 'Insurance', 39);

Insert Into Committees
Values(382, 'House of Representatives', 'Insurance', 52);

Insert Into Committees
Values(383, 'House of Representatives', 'Insurance', 60);

Insert Into Committees
Values(384, 'House of Representatives', 'Insurance', 63);

Insert Into Committees
Values(385, 'House of Representatives', 'Insurance', 64);

Insert Into Committees
Values(386, 'House of Representatives', 'Insurance', 73);

Insert Into Committees
Values(387, 'House of Representatives', 'Insurance', 76);

Insert Into Committees
Values(388, 'House of Representatives', 'Insurance', 82);

Insert Into Committees
Values(389, 'House of Representatives', 'Insurance', 86);

Insert Into Committees
Values(390, 'House of Representatives', 'Insurance', 92);

Insert Into Committees
Values(391, 'House of Representatives', 'Insurance', 95);

Insert Into Committees
Values(392, 'House of Representatives', 'Insurance', 97);

Insert Into Committees
Values(393, 'House of Representatives', 'Insurance', 110);

Insert Into Committees
Values(394, 'House of Representatives', 'Insurance', 114);

Insert Into Committees
Values(395, 'House of Representatives', 'Insurance', 115);

Insert Into Committees
Values(396, 'House of Representatives', 'Insurance', 118);

Insert Into Committees
Values(397, 'House of Representatives', 'Insurance', 145);

Insert Into Committees
Values(398, 'House of Representatives', 'Insurance', 152);

Insert Into Committees
Values(399, 'House of Representatives', 'Insurance', 158);

Insert Into Committees
Values(400, 'House of Representatives', 'Insurance', 161);

Insert Into Committees
Values(401, 'House of Representatives', 'Insurance', 171);

Insert Into Committees
Values(402, 'House of Representatives', 'Insurance', 173);

Insert Into Committees
Values(403, 'House of Representatives', 'Insurance', 182);

Insert Into Committees
Values(404, 'House of Representatives', 'Insurance', 187);

Insert Into Committees
Values(405, 'House of Representatives', 'Interstate Cooperation', 38);

Insert Into Committees
Values(406, 'House of Representatives', 'Interstate Cooperation', 43);

Insert Into Committees
Values(407, 'House of Representatives', 'Interstate Cooperation', 52);

Insert Into Committees
Values(408, 'House of Representatives', 'Interstate Cooperation', 58);

Insert Into Committees
Values(409, 'House of Representatives', 'Interstate Cooperation', 65);

Insert Into Committees
Values(410, 'House of Representatives', 'Interstate Cooperation', 66);

Insert Into Committees
Values(411, 'House of Representatives', 'Interstate Cooperation', 80);

Insert Into Committees
Values(412, 'House of Representatives', 'Interstate Cooperation', 92);

Insert Into Committees
Values(413, 'House of Representatives', 'Interstate Cooperation', 105);

Insert Into Committees
Values(414, 'House of Representatives', 'Interstate Cooperation', 117);

Insert Into Committees
Values(415, 'House of Representatives', 'Interstate Cooperation', 120);

Insert Into Committees
Values(416, 'House of Representatives', 'Interstate Cooperation', 164);

Insert Into Committees
Values(417, 'House of Representatives', 'Interstate Cooperation', 176);

Insert Into Committees
Values(418, 'House of Representatives', 'Intragovernmental Coordination', 10);

Insert Into Committees
Values(419, 'House of Representatives', 'Intragovernmental Coordination', 12);

Insert Into Committees
Values(420, 'House of Representatives', 'Intragovernmental Coordination', 18);

Insert Into Committees
Values(421, 'House of Representatives', 'Intragovernmental Coordination', 20);

Insert Into Committees
Values(422, 'House of Representatives', 'Intragovernmental Coordination', 24);

Insert Into Committees
Values(423, 'House of Representatives', 'Intragovernmental Coordination', 33);

Insert Into Committees
Values(424, 'House of Representatives', 'Intragovernmental Coordination', 42);

Insert Into Committees
Values(425, 'House of Representatives', 'Intragovernmental Coordination', 53);

Insert Into Committees
Values(426, 'House of Representatives', 'Intragovernmental Coordination', 148);

Insert Into Committees
Values(427, 'House of Representatives', 'Intragovernmental Coordination', 154);

Insert Into Committees
Values(428, 'House of Representatives', 'Intragovernmental Coordination', 163);

Insert Into Committees
Values(429, 'House of Representatives', 'Intragovernmental Coordination', 166);

Insert Into Committees
Values(430, 'House of Representatives', 'Intragovernmental Coordination', 168);

Insert Into Committees
Values(431, 'House of Representatives', 'Intragovernmental Coordination', 169);

Insert Into Committees
Values(432, 'House of Representatives', 'Judiciary', 11);

Insert Into Committees
Values(433, 'House of Representatives', 'Judiciary', 27);

Insert Into Committees
Values(434, 'House of Representatives', 'Judiciary', 32);

Insert Into Committees
Values(435, 'House of Representatives', 'Judiciary', 65);

Insert Into Committees
Values(436, 'House of Representatives', 'Judiciary', 66);

Insert Into Committees
Values(437, 'House of Representatives', 'Judiciary', 76);

Insert Into Committees
Values(438, 'House of Representatives', 'Judiciary', 97);

Insert Into Committees
Values(439, 'House of Representatives', 'Judiciary', 100);

Insert Into Committees
Values(440, 'House of Representatives', 'Judiciary', 104);

Insert Into Committees
Values(441, 'House of Representatives', 'Judiciary', 109);

Insert Into Committees
Values(442, 'House of Representatives', 'Judiciary', 111);

Insert Into Committees
Values(443, 'House of Representatives', 'Judiciary', 126);

Insert Into Committees
Values(444, 'House of Representatives', 'Judiciary', 127);

Insert Into Committees
Values(445, 'House of Representatives', 'Judiciary', 134);

Insert Into Committees
Values(446, 'House of Representatives', 'Judiciary', 147);

Insert Into Committees
Values(447, 'House of Representatives', 'Judiciary', 163);

Insert Into Committees
Values(448, 'House of Representatives', 'Judiciary', 179);

Insert Into Committees
Values(449, 'House of Representatives', 'Judiciary', 180);

Insert Into Committees
Values(450, 'House of Representatives', 'Judiciary', 182);

Insert Into Committees
Values(451, 'House of Representatives', 'Judiciary', 183);

Insert Into Committees
Values(452, 'House of Representatives', 'Judiciary Non-Civil', 9);

Insert Into Committees
Values(453, 'House of Representatives', 'Judiciary Non-Civil', 13);

Insert Into Committees
Values(454, 'House of Representatives', 'Judiciary Non-Civil', 14);

Insert Into Committees
Values(455, 'House of Representatives', 'Judiciary Non-Civil', 44);

Insert Into Committees
Values(456, 'House of Representatives', 'Judiciary Non-Civil', 45);

Insert Into Committees
Values(457, 'House of Representatives', 'Judiciary Non-Civil', 49);

Insert Into Committees
Values(458, 'House of Representatives', 'Judiciary Non-Civil', 76);

Insert Into Committees
Values(459, 'House of Representatives', 'Judiciary Non-Civil', 78);

Insert Into Committees
Values(460, 'House of Representatives', 'Judiciary Non-Civil', 88);

Insert Into Committees
Values(461, 'House of Representatives', 'Judiciary Non-Civil', 105);

Insert Into Committees
Values(462, 'House of Representatives', 'Judiciary Non-Civil', 128);

Insert Into Committees
Values(463, 'House of Representatives', 'Judiciary Non-Civil', 140);

Insert Into Committees
Values(464, 'House of Representatives', 'Judiciary Non-Civil', 141);

Insert Into Committees
Values(465, 'House of Representatives', 'Judiciary Non-Civil', 150);

Insert Into Committees
Values(466, 'House of Representatives', 'Judiciary Non-Civil', 166);

Insert Into Committees
Values(467, 'House of Representatives', 'Judiciary Non-Civil', 183);

Insert Into Committees
Values(468, 'House of Representatives', 'Juvenile Justice', 11);

Insert Into Committees
Values(469, 'House of Representatives', 'Juvenile Justice', 13);

Insert Into Committees
Values(470, 'House of Representatives', 'Juvenile Justice', 18);

Insert Into Committees
Values(471, 'House of Representatives', 'Juvenile Justice', 36);

Insert Into Committees
Values(472, 'House of Representatives', 'Juvenile Justice', 44);

Insert Into Committees
Values(473, 'House of Representatives', 'Juvenile Justice', 49);

Insert Into Committees
Values(474, 'House of Representatives', 'Juvenile Justice', 59);

Insert Into Committees
Values(475, 'House of Representatives', 'Juvenile Justice', 60);

Insert Into Committees
Values(476, 'House of Representatives', 'Juvenile Justice', 65);

Insert Into Committees
Values(477, 'House of Representatives', 'Juvenile Justice', 90);

Insert Into Committees
Values(478, 'House of Representatives', 'Juvenile Justice', 94);

Insert Into Committees
Values(479, 'House of Representatives', 'Juvenile Justice', 97);

Insert Into Committees
Values(480, 'House of Representatives', 'Juvenile Justice', 101);

Insert Into Committees
Values(481, 'House of Representatives', 'Juvenile Justice', 105);

Insert Into Committees
Values(482, 'House of Representatives', 'Juvenile Justice', 121);

Insert Into Committees
Values(483, 'House of Representatives', 'Juvenile Justice', 127);

Insert Into Committees
Values(484, 'House of Representatives', 'Juvenile Justice', 137);

Insert Into Committees
Values(485, 'House of Representatives', 'Juvenile Justice', 138);

Insert Into Committees
Values(486, 'House of Representatives', 'Juvenile Justice', 151);

Insert Into Committees
Values(487, 'House of Representatives', 'Juvenile Justice', 155);

Insert Into Committees
Values(488, 'House of Representatives', 'Juvenile Justice', 160);

Insert Into Committees
Values(489, 'House of Representatives', 'Juvenile Justice', 167);

Insert Into Committees
Values(490, 'House of Representatives', 'Juvenile Justice', 176);

Insert Into Committees
Values(491, 'House of Representatives', 'Juvenile Justice', 178);

Insert Into Committees
Values(492, 'House of Representatives', 'Juvenile Justice', 179);

Insert Into Committees
Values(493, 'House of Representatives', 'Juvenile Justice', 180);

Insert Into Committees
Values(494, 'House of Representatives', 'Juvenile Justice', 181);

Insert Into Committees
Values(495, 'House of Representatives', 'Legislative & Congressional Reapportionment', 10);

Insert Into Committees
Values(496, 'House of Representatives', 'Legislative & Congressional Reapportionment', 17);

Insert Into Committees
Values(497, 'House of Representatives', 'Legislative & Congressional Reapportionment', 23);

Insert Into Committees
Values(498, 'House of Representatives', 'Legislative & Congressional Reapportionment', 43);

Insert Into Committees
Values(499, 'House of Representatives', 'Legislative & Congressional Reapportionment', 49);

Insert Into Committees
Values(500, 'House of Representatives', 'Legislative & Congressional Reapportionment', 51);

Insert Into Committees
Values(501, 'House of Representatives', 'Legislative & Congressional Reapportionment', 52);

Insert Into Committees
Values(502, 'House of Representatives', 'Legislative & Congressional Reapportionment', 61);

Insert Into Committees
Values(503, 'House of Representatives', 'Legislative & Congressional Reapportionment', 91);

Insert Into Committees
Values(504, 'House of Representatives', 'Legislative & Congressional Reapportionment', 96);

Insert Into Committees
Values(505, 'House of Representatives', 'Legislative & Congressional Reapportionment', 99);

Insert Into Committees
Values(506, 'House of Representatives', 'Legislative & Congressional Reapportionment', 115);

Insert Into Committees
Values(507, 'House of Representatives', 'Legislative & Congressional Reapportionment', 125);

Insert Into Committees
Values(508, 'House of Representatives', 'Legislative & Congressional Reapportionment', 148);

Insert Into Committees
Values(509, 'House of Representatives', 'Legislative & Congressional Reapportionment', 149);

Insert Into Committees
Values(510, 'House of Representatives', 'Legislative & Congressional Reapportionment', 150);

Insert Into Committees
Values(511, 'House of Representatives', 'Legislative & Congressional Reapportionment', 156);

Insert Into Committees
Values(512, 'House of Representatives', 'Legislative & Congressional Reapportionment', 158);

Insert Into Committees
Values(513, 'House of Representatives', 'Legislative & Congressional Reapportionment', 161);

Insert Into Committees
Values(514, 'House of Representatives', 'Legislative & Congressional Reapportionment', 167);

Insert Into Committees
Values(515, 'House of Representatives', 'Legislative & Congressional Reapportionment', 174);

Insert Into Committees
Values(516, 'House of Representatives', 'Legislative & Congressional Reapportionment', 188);

Insert Into Committees
Values(517, 'House of Representatives', 'MARTOC', 37);

Insert Into Committees
Values(518, 'House of Representatives', 'MARTOC', 74);

Insert Into Committees
Values(519, 'House of Representatives', 'MARTOC', 97);

Insert Into Committees
Values(520, 'House of Representatives', 'MARTOC', 119);

Insert Into Committees
Values(521, 'House of Representatives', 'MARTOC', 136);

Insert Into Committees
Values(522, 'House of Representatives', 'MARTOC', 143);

Insert Into Committees
Values(523, 'House of Representatives', 'MARTOC', 172);

Insert Into Committees
Values(524, 'House of Representatives', 'Motor Vehicles', 15);

Insert Into Committees
Values(525, 'House of Representatives', 'Motor Vehicles', 16);

Insert Into Committees
Values(526, 'House of Representatives', 'Motor Vehicles', 32);

Insert Into Committees
Values(527, 'House of Representatives', 'Motor Vehicles', 53);

Insert Into Committees
Values(528, 'House of Representatives', 'Motor Vehicles', 59);

Insert Into Committees
Values(529, 'House of Representatives', 'Motor Vehicles', 63);

Insert Into Committees
Values(530, 'House of Representatives', 'Motor Vehicles', 94);

Insert Into Committees
Values(531, 'House of Representatives', 'Motor Vehicles', 102);

Insert Into Committees
Values(532, 'House of Representatives', 'Motor Vehicles', 133);

Insert Into Committees
Values(533, 'House of Representatives', 'Motor Vehicles', 142);

Insert Into Committees
Values(534, 'House of Representatives', 'Motor Vehicles', 165);

Insert Into Committees
Values(535, 'House of Representatives', 'Motor Vehicles', 188);

Insert Into Committees
Values(536, 'House of Representatives', 'Natural Resources & Environment', 29);

Insert Into Committees
Values(537, 'House of Representatives', 'Natural Resources & Environment', 40);

Insert Into Committees
Values(538, 'House of Representatives', 'Natural Resources & Environment', 42);

Insert Into Committees
Values(539, 'House of Representatives', 'Natural Resources & Environment', 54);

Insert Into Committees
Values(540, 'House of Representatives', 'Natural Resources & Environment', 59);

Insert Into Committees
Values(541, 'House of Representatives', 'Natural Resources & Environment', 62);

Insert Into Committees
Values(542, 'House of Representatives', 'Natural Resources & Environment', 63);

Insert Into Committees
Values(543, 'House of Representatives', 'Natural Resources & Environment', 71);

Insert Into Committees
Values(544, 'House of Representatives', 'Natural Resources & Environment', 72);

Insert Into Committees
Values(545, 'House of Representatives', 'Natural Resources & Environment', 73);

Insert Into Committees
Values(546, 'House of Representatives', 'Natural Resources & Environment', 74);

Insert Into Committees
Values(547, 'House of Representatives', 'Natural Resources & Environment', 83);

Insert Into Committees
Values(548, 'House of Representatives', 'Natural Resources & Environment', 116);

Insert Into Committees
Values(549, 'House of Representatives', 'Natural Resources & Environment', 122);

Insert Into Committees
Values(550, 'House of Representatives', 'Natural Resources & Environment', 124);

Insert Into Committees
Values(551, 'House of Representatives', 'Natural Resources & Environment', 125);

Insert Into Committees
Values(552, 'House of Representatives', 'Natural Resources & Environment', 143);

Insert Into Committees
Values(553, 'House of Representatives', 'Natural Resources & Environment', 156);

Insert Into Committees
Values(554, 'House of Representatives', 'Natural Resources & Environment', 158);

Insert Into Committees
Values(555, 'House of Representatives', 'Natural Resources & Environment', 168);

Insert Into Committees
Values(556, 'House of Representatives', 'Natural Resources & Environment', 169);

Insert Into Committees
Values(557, 'House of Representatives', 'Natural Resources & Environment', 174);

Insert Into Committees
Values(558, 'House of Representatives', 'Natural Resources & Environment', 182);

Insert Into Committees
Values(559, 'House of Representatives', 'Natural Resources & Environment', 186);

Insert Into Committees
Values(560, 'House of Representatives', 'Public Safety and Homeland Security', 13);

Insert Into Committees
Values(561, 'House of Representatives', 'Public Safety and Homeland Security', 43);

Insert Into Committees
Values(562, 'House of Representatives', 'Public Safety and Homeland Security', 69);

Insert Into Committees
Values(563, 'House of Representatives', 'Public Safety and Homeland Security', 75);

Insert Into Committees
Values(564, 'House of Representatives', 'Public Safety and Homeland Security', 79);

Insert Into Committees
Values(565, 'House of Representatives', 'Public Safety and Homeland Security', 88);

Insert Into Committees
Values(566, 'House of Representatives', 'Public Safety and Homeland Security', 89);

Insert Into Committees
Values(567, 'House of Representatives', 'Public Safety and Homeland Security', 90);

Insert Into Committees
Values(568, 'House of Representatives', 'Public Safety and Homeland Security', 96);

Insert Into Committees
Values(569, 'House of Representatives', 'Public Safety and Homeland Security', 110);

Insert Into Committees
Values(570, 'House of Representatives', 'Public Safety and Homeland Security', 133);

Insert Into Committees
Values(571, 'House of Representatives', 'Public Safety and Homeland Security', 167);

Insert Into Committees
Values(572, 'House of Representatives', 'Public Safety and Homeland Security', 171);

Insert Into Committees
Values(573, 'House of Representatives', 'Public Safety and Homeland Security', 176);

Insert Into Committees
Values(574, 'House of Representatives', 'Regulated Industries', 19);

Insert Into Committees
Values(575, 'House of Representatives', 'Regulated Industries', 36);

Insert Into Committees
Values(576, 'House of Representatives', 'Regulated Industries', 43);

Insert Into Committees
Values(577, 'House of Representatives', 'Regulated Industries', 45);

Insert Into Committees
Values(578, 'House of Representatives', 'Regulated Industries', 47);

Insert Into Committees
Values(579, 'House of Representatives', 'Regulated Industries', 51);

Insert Into Committees
Values(580, 'House of Representatives', 'Regulated Industries', 64);

Insert Into Committees
Values(581, 'House of Representatives', 'Regulated Industries', 68);

Insert Into Committees
Values(582, 'House of Representatives', 'Regulated Industries', 76);

Insert Into Committees
Values(583, 'House of Representatives', 'Regulated Industries', 84);

Insert Into Committees
Values(584, 'House of Representatives', 'Regulated Industries', 113);

Insert Into Committees
Values(585, 'House of Representatives', 'Regulated Industries', 114);

Insert Into Committees
Values(586, 'House of Representatives', 'Regulated Industries', 119);

Insert Into Committees
Values(587, 'House of Representatives', 'Regulated Industries', 133);

Insert Into Committees
Values(588, 'House of Representatives', 'Regulated Industries', 140);

Insert Into Committees
Values(589, 'House of Representatives', 'Regulated Industries', 147);

Insert Into Committees
Values(590, 'House of Representatives', 'Regulated Industries', 161);

Insert Into Committees
Values(591, 'House of Representatives', 'Regulated Industries', 172);

Insert Into Committees
Values(592, 'House of Representatives', 'Regulated Industries', 179);

Insert Into Committees
Values(593, 'House of Representatives', 'Retirement', 16);

Insert Into Committees
Values(594, 'House of Representatives', 'Retirement', 20);

Insert Into Committees
Values(595, 'House of Representatives', 'Retirement', 21);

Insert Into Committees
Values(596, 'House of Representatives', 'Retirement', 22);

Insert Into Committees
Values(597, 'House of Representatives', 'Retirement', 26);

Insert Into Committees
Values(598, 'House of Representatives', 'Retirement', 29);

Insert Into Committees
Values(599, 'House of Representatives', 'Retirement', 42);

Insert Into Committees
Values(600, 'House of Representatives', 'Retirement', 44);

Insert Into Committees
Values(601, 'House of Representatives', 'Retirement', 77);

Insert Into Committees
Values(602, 'House of Representatives', 'Retirement', 79);

Insert Into Committees
Values(603, 'House of Representatives', 'Retirement', 86);

Insert Into Committees
Values(604, 'House of Representatives', 'Retirement', 114);

Insert Into Committees
Values(605, 'House of Representatives', 'Retirement', 118);

Insert Into Committees
Values(606, 'House of Representatives', 'Retirement', 143);

Insert Into Committees
Values(607, 'House of Representatives', 'Retirement', 180);

Insert Into Committees
Values(608, 'House of Representatives', 'Retirement', 181);

Insert Into Committees
Values(609, 'House of Representatives', 'Retirement', 184);

Insert Into Committees
Values(610, 'House of Representatives', 'Rules', 9);

Insert Into Committees
Values(611, 'House of Representatives', 'Rules', 21);

Insert Into Committees
Values(612, 'House of Representatives', 'Rules', 35);

Insert Into Committees
Values(613, 'House of Representatives', 'Rules', 37);

Insert Into Committees
Values(614, 'House of Representatives', 'Rules', 45);

Insert Into Committees
Values(615, 'House of Representatives', 'Rules', 48);

Insert Into Committees
Values(616, 'House of Representatives', 'Rules', 54);

Insert Into Committees
Values(617, 'House of Representatives', 'Rules', 61);

Insert Into Committees
Values(618, 'House of Representatives', 'Rules', 65);

Insert Into Committees
Values(619, 'House of Representatives', 'Rules', 76);

Insert Into Committees
Values(620, 'House of Representatives', 'Rules', 79);

Insert Into Committees
Values(621, 'House of Representatives', 'Rules', 81);

Insert Into Committees
Values(622, 'House of Representatives', 'Rules', 95);

Insert Into Committees
Values(623, 'House of Representatives', 'Rules', 96);

Insert Into Committees
Values(624, 'House of Representatives', 'Rules', 99);

Insert Into Committees
Values(625, 'House of Representatives', 'Rules', 109);

Insert Into Committees
Values(626, 'House of Representatives', 'Rules', 118);

Insert Into Committees
Values(627, 'House of Representatives', 'Rules', 122);

Insert Into Committees
Values(628, 'House of Representatives', 'Rules', 126);

Insert Into Committees
Values(629, 'House of Representatives', 'Rules', 129);

Insert Into Committees
Values(630, 'House of Representatives', 'Rules', 131);

Insert Into Committees
Values(631, 'House of Representatives', 'Rules', 133);

Insert Into Committees
Values(632, 'House of Representatives', 'Rules', 134);

Insert Into Committees
Values(633, 'House of Representatives', 'Rules', 140);

Insert Into Committees
Values(634, 'House of Representatives', 'Rules', 142);

Insert Into Committees
Values(635, 'House of Representatives', 'Rules', 144);

Insert Into Committees
Values(636, 'House of Representatives', 'Rules', 150);

Insert Into Committees
Values(637, 'House of Representatives', 'Rules', 153);

Insert Into Committees
Values(638, 'House of Representatives', 'Rules', 156);

Insert Into Committees
Values(639, 'House of Representatives', 'Rules', 158);

Insert Into Committees
Values(640, 'House of Representatives', 'Rules', 159);

Insert Into Committees
Values(641, 'House of Representatives', 'Rules', 162);

Insert Into Committees
Values(642, 'House of Representatives', 'Rules', 180);

Insert Into Committees
Values(643, 'House of Representatives', 'Rules', 183);

Insert Into Committees
Values(644, 'House of Representatives', 'Rules', 185);

Insert Into Committees
Values(645, 'House of Representatives', 'Science and Technology', 16);

Insert Into Committees
Values(646, 'House of Representatives', 'Science and Technology', 55);

Insert Into Committees
Values(647, 'House of Representatives', 'Science and Technology', 58);

Insert Into Committees
Values(648, 'House of Representatives', 'Science and Technology', 70);

Insert Into Committees
Values(649, 'House of Representatives', 'Science and Technology', 106);

Insert Into Committees
Values(650, 'House of Representatives', 'Science and Technology', 113);

Insert Into Committees
Values(651, 'House of Representatives', 'Science and Technology', 127);

Insert Into Committees
Values(652, 'House of Representatives', 'Science and Technology', 138);

Insert Into Committees
Values(653, 'House of Representatives', 'Science and Technology', 149);

Insert Into Committees
Values(654, 'House of Representatives', 'Science and Technology', 150);

Insert Into Committees
Values(655, 'House of Representatives', 'Science and Technology', 153);

Insert Into Committees
Values(656, 'House of Representatives', 'Science and Technology', 157);

Insert Into Committees
Values(657, 'House of Representatives', 'Science and Technology', 165);

Insert Into Committees
Values(658, 'House of Representatives', 'Science and Technology', 175);

Insert Into Committees
Values(659, 'House of Representatives', 'Science and Technology', 177);

Insert Into Committees
Values(660, 'House of Representatives', 'Small Business Development', 22);

Insert Into Committees
Values(661, 'House of Representatives', 'Small Business Development', 27);

Insert Into Committees
Values(662, 'House of Representatives', 'Small Business Development', 34);

Insert Into Committees
Values(663, 'House of Representatives', 'Small Business Development', 40);

Insert Into Committees
Values(664, 'House of Representatives', 'Small Business Development', 54);

Insert Into Committees
Values(665, 'House of Representatives', 'Small Business Development', 55);

Insert Into Committees
Values(666, 'House of Representatives', 'Small Business Development', 68);

Insert Into Committees
Values(667, 'House of Representatives', 'Small Business Development', 83);

Insert Into Committees
Values(668, 'House of Representatives', 'Small Business Development', 87);

Insert Into Committees
Values(669, 'House of Representatives', 'Small Business Development', 96);

Insert Into Committees
Values(670, 'House of Representatives', 'Small Business Development', 105);

Insert Into Committees
Values(671, 'House of Representatives', 'Small Business Development', 107);

Insert Into Committees
Values(672, 'House of Representatives', 'Small Business Development', 108);

Insert Into Committees
Values(673, 'House of Representatives', 'Small Business Development', 131);

Insert Into Committees
Values(674, 'House of Representatives', 'Small Business Development', 132);

Insert Into Committees
Values(675, 'House of Representatives', 'Small Business Development', 133);

Insert Into Committees
Values(676, 'House of Representatives', 'Small Business Development', 138);

Insert Into Committees
Values(677, 'House of Representatives', 'Small Business Development', 152);

Insert Into Committees
Values(678, 'House of Representatives', 'Small Business Development', 164);

Insert Into Committees
Values(679, 'House of Representatives', 'Small Business Development', 165);

Insert Into Committees
Values(680, 'House of Representatives', 'Small Business Development', 170);

Insert Into Committees
Values(681, 'House of Representatives', 'Special Rules', 12);

Insert Into Committees
Values(682, 'House of Representatives', 'Special Rules', 22);

Insert Into Committees
Values(683, 'House of Representatives', 'Special Rules', 56);

Insert Into Committees
Values(684, 'House of Representatives', 'Special Rules', 77);

Insert Into Committees
Values(685, 'House of Representatives', 'Special Rules', 80);

Insert Into Committees
Values(686, 'House of Representatives', 'Special Rules', 88);

Insert Into Committees
Values(687, 'House of Representatives', 'Special Rules', 91);

Insert Into Committees
Values(688, 'House of Representatives', 'Special Rules', 92);

Insert Into Committees
Values(689, 'House of Representatives', 'Special Rules', 120);

Insert Into Committees
Values(690, 'House of Representatives', 'Special Rules', 135);

Insert Into Committees
Values(691, 'House of Representatives', 'Special Rules', 138);

Insert Into Committees
Values(692, 'House of Representatives', 'Special Rules', 149);

Insert Into Committees
Values(693, 'House of Representatives', 'Special Rules', 157);

Insert Into Committees
Values(694, 'House of Representatives', 'Special Rules', 160);

Insert Into Committees
Values(695, 'House of Representatives', 'Special Rules', 167);

Insert Into Committees
Values(696, 'House of Representatives', 'Special Rules', 175);

Insert Into Committees
Values(697, 'House of Representatives', 'Special Rules', 176);

Insert Into Committees
Values(698, 'House of Representatives', 'State Planning & Community Affairs', 18);

Insert Into Committees
Values(699, 'House of Representatives', 'State Planning & Community Affairs', 31);

Insert Into Committees
Values(700, 'House of Representatives', 'State Planning & Community Affairs', 38);

Insert Into Committees
Values(701, 'House of Representatives', 'State Planning & Community Affairs', 43);

Insert Into Committees
Values(702, 'House of Representatives', 'State Planning & Community Affairs', 49);

Insert Into Committees
Values(703, 'House of Representatives', 'State Planning & Community Affairs', 56);

Insert Into Committees
Values(704, 'House of Representatives', 'State Planning & Community Affairs', 96);

Insert Into Committees
Values(705, 'House of Representatives', 'State Planning & Community Affairs', 117);

Insert Into Committees
Values(706, 'House of Representatives', 'State Planning & Community Affairs', 120);

Insert Into Committees
Values(707, 'House of Representatives', 'State Planning & Community Affairs', 136);

Insert Into Committees
Values(708, 'House of Representatives', 'State Planning & Community Affairs', 137);

Insert Into Committees
Values(709, 'House of Representatives', 'State Planning & Community Affairs', 146);

Insert Into Committees
Values(710, 'House of Representatives', 'State Planning & Community Affairs', 154);

Insert Into Committees
Values(711, 'House of Representatives', 'State Planning & Community Affairs', 175);

Insert Into Committees
Values(712, 'House of Representatives', 'State Planning & Community Affairs', 184);

Insert Into Committees
Values(713, 'House of Representatives', 'State Properties', 29);

Insert Into Committees
Values(714, 'House of Representatives', 'State Properties', 30);

Insert Into Committees
Values(715, 'House of Representatives', 'State Properties', 39);

Insert Into Committees
Values(716, 'House of Representatives', 'State Properties', 57);

Insert Into Committees
Values(717, 'House of Representatives', 'State Properties', 61);

Insert Into Committees
Values(718, 'House of Representatives', 'State Properties', 79);

Insert Into Committees
Values(719, 'House of Representatives', 'State Properties', 100);

Insert Into Committees
Values(720, 'House of Representatives', 'State Properties', 106);

Insert Into Committees
Values(721, 'House of Representatives', 'State Properties', 153);

Insert Into Committees
Values(722, 'House of Representatives', 'Transportation', 14);

Insert Into Committees
Values(723, 'House of Representatives', 'Transportation', 21);

Insert Into Committees
Values(724, 'House of Representatives', 'Transportation', 28);

Insert Into Committees
Values(725, 'House of Representatives', 'Transportation', 30);

Insert Into Committees
Values(726, 'House of Representatives', 'Transportation', 37);

Insert Into Committees
Values(727, 'House of Representatives', 'Transportation', 41);

Insert Into Committees
Values(728, 'House of Representatives', 'Transportation', 47);

Insert Into Committees
Values(729, 'House of Representatives', 'Transportation', 52);

Insert Into Committees
Values(730, 'House of Representatives', 'Transportation', 63);

Insert Into Committees
Values(731, 'House of Representatives', 'Transportation', 72);

Insert Into Committees
Values(732, 'House of Representatives', 'Transportation', 74);

Insert Into Committees
Values(733, 'House of Representatives', 'Transportation', 81);

Insert Into Committees
Values(734, 'House of Representatives', 'Transportation', 84);

Insert Into Committees
Values(735, 'House of Representatives', 'Transportation', 92);

Insert Into Committees
Values(736, 'House of Representatives', 'Transportation', 97);

Insert Into Committees
Values(737, 'House of Representatives', 'Transportation', 101);

Insert Into Committees
Values(738, 'House of Representatives', 'Transportation', 102);

Insert Into Committees
Values(739, 'House of Representatives', 'Transportation', 116);

Insert Into Committees
Values(740, 'House of Representatives', 'Transportation', 124);

Insert Into Committees
Values(741, 'House of Representatives', 'Transportation', 135);

Insert Into Committees
Values(742, 'House of Representatives', 'Transportation', 144);

Insert Into Committees
Values(743, 'House of Representatives', 'Transportation', 148);

Insert Into Committees
Values(744, 'House of Representatives', 'Transportation', 150);

Insert Into Committees
Values(745, 'House of Representatives', 'Transportation', 153);

Insert Into Committees
Values(746, 'House of Representatives', 'Transportation', 176);

Insert Into Committees
Values(747, 'House of Representatives', 'Transportation', 178);

Insert Into Committees
Values(748, 'House of Representatives', 'Transportation', 185);

Insert Into Committees
Values(749, 'House of Representatives', 'Ways & Means', 9);

Insert Into Committees
Values(750, 'House of Representatives', 'Ways & Means', 16);

Insert Into Committees
Values(751, 'House of Representatives', 'Ways & Means', 17);

Insert Into Committees
Values(752, 'House of Representatives', 'Ways & Means', 23);

Insert Into Committees
Values(753, 'House of Representatives', 'Ways & Means', 28);

Insert Into Committees
Values(754, 'House of Representatives', 'Ways & Means', 33);

Insert Into Committees
Values(755, 'House of Representatives', 'Ways & Means', 34);

Insert Into Committees
Values(756, 'House of Representatives', 'Ways & Means', 37);

Insert Into Committees
Values(757, 'House of Representatives', 'Ways & Means', 62);

Insert Into Committees
Values(758, 'House of Representatives', 'Ways & Means', 68);

Insert Into Committees
Values(759, 'House of Representatives', 'Ways & Means', 82);

Insert Into Committees
Values(760, 'House of Representatives', 'Ways & Means', 84);

Insert Into Committees
Values(761, 'House of Representatives', 'Ways & Means', 93);

Insert Into Committees
Values(762, 'House of Representatives', 'Ways & Means', 108);

Insert Into Committees
Values(763, 'House of Representatives', 'Ways & Means', 113);

Insert Into Committees
Values(764, 'House of Representatives', 'Ways & Means', 123);

Insert Into Committees
Values(765, 'House of Representatives', 'Ways & Means', 126);

Insert Into Committees
Values(766, 'House of Representatives', 'Ways & Means', 128);

Insert Into Committees
Values(767, 'House of Representatives', 'Ways & Means', 130);

Insert Into Committees
Values(768, 'House of Representatives', 'Ways & Means', 131);

Insert Into Committees
Values(769, 'House of Representatives', 'Ways & Means', 134);

Insert Into Committees
Values(770, 'House of Representatives', 'Ways & Means', 140);

Insert Into Committees
Values(771, 'House of Representatives', 'Ways & Means', 142);

Insert Into Committees
Values(772, 'House of Representatives', 'Ways & Means', 143);

Insert Into Committees
Values(773, 'House of Representatives', 'Ways & Means', 154);

Insert Into Committees
Values(774, 'House of Representatives', 'Ways & Means', 161);

Insert Into Committees
Values(775, 'House of Representatives', 'Ways & Means', 162);

Insert Into Committees
Values(776, 'House of Representatives', 'Ways & Means', 167);

Insert Into Committees
Values(777, 'House of Representatives', 'Ways & Means', 183);

Insert Into Committees
Values(778, 'House of Representatives', 'Ways & Means', 187);

Insert Into Committees
Values(779, 'State Senate', 'Administrative Affairs', 197);

Insert Into Committees
Values(780, 'State Senate', 'Administrative Affairs', 206);

Insert Into Committees
Values(781, 'State Senate', 'Administrative Affairs', 211);

Insert Into Committees
Values(782, 'State Senate', 'Administrative Affairs', 216);

Insert Into Committees
Values(783, 'State Senate', 'Administrative Affairs', 233);

Insert Into Committees
Values(784, 'State Senate', 'Administrative Affairs', 243);

Insert Into Committees
Values(785, 'State Senate', 'Agriculture and Consumer Affairs', 193);

Insert Into Committees
Values(786, 'State Senate', 'Agriculture and Consumer Affairs', 205);

Insert Into Committees
Values(787, 'State Senate', 'Agriculture and Consumer Affairs', 209);

Insert Into Committees
Values(788, 'State Senate', 'Agriculture and Consumer Affairs', 210);

Insert Into Committees
Values(789, 'State Senate', 'Agriculture and Consumer Affairs', 217);

Insert Into Committees
Values(790, 'State Senate', 'Agriculture and Consumer Affairs', 230);

Insert Into Committees
Values(791, 'State Senate', 'Agriculture and Consumer Affairs', 244);

Insert Into Committees
Values(792, 'State Senate', 'Agriculture and Consumer Affairs', 245);

Insert Into Committees
Values(793, 'State Senate', 'Appropriations', 190);

Insert Into Committees
Values(794, 'State Senate', 'Appropriations', 195);

Insert Into Committees
Values(795, 'State Senate', 'Appropriations', 197);

Insert Into Committees
Values(796, 'State Senate', 'Appropriations', 198);

Insert Into Committees
Values(797, 'State Senate', 'Appropriations', 200);

Insert Into Committees
Values(798, 'State Senate', 'Appropriations', 201);

Insert Into Committees
Values(799, 'State Senate', 'Appropriations', 204);

Insert Into Committees
Values(800, 'State Senate', 'Appropriations', 206);

Insert Into Committees
Values(801, 'State Senate', 'Appropriations', 207);

Insert Into Committees
Values(802, 'State Senate', 'Appropriations', 210);

Insert Into Committees
Values(803, 'State Senate', 'Appropriations', 213);

Insert Into Committees
Values(804, 'State Senate', 'Appropriations', 214);

Insert Into Committees
Values(805, 'State Senate', 'Appropriations', 216);

Insert Into Committees
Values(806, 'State Senate', 'Appropriations', 227);

Insert Into Committees
Values(807, 'State Senate', 'Appropriations', 228);

Insert Into Committees
Values(808, 'State Senate', 'Appropriations', 229);

Insert Into Committees
Values(809, 'State Senate', 'Appropriations', 232);

Insert Into Committees
Values(810, 'State Senate', 'Appropriations', 233);

Insert Into Committees
Values(811, 'State Senate', 'Appropriations', 234);

Insert Into Committees
Values(812, 'State Senate', 'Appropriations', 237);

Insert Into Committees
Values(813, 'State Senate', 'Appropriations', 239);

Insert Into Committees
Values(814, 'State Senate', 'Appropriations', 240);

Insert Into Committees
Values(815, 'State Senate', 'Appropriations', 241);

Insert Into Committees
Values(816, 'State Senate', 'Appropriations', 242);

Insert Into Committees
Values(817, 'State Senate', 'Appropriations', 243);

Insert Into Committees
Values(818, 'State Senate', 'Appropriations', 244);

Insert Into Committees
Values(819, 'State Senate', 'Appropriations', 245);

Insert Into Committees
Values(820, 'State Senate', 'Assignments', 197);

Insert Into Committees
Values(821, 'State Senate', 'Assignments', 227);

Insert Into Committees
Values(822, 'State Senate', 'Assignments', 233);

Insert Into Committees
Values(823, 'State Senate', 'Assignments', 242);

Insert Into Committees
Values(824, 'State Senate', 'Assignments', 243);

Insert Into Committees
Values(825, 'State Senate', 'Banking and Financial Institutions', 190);

Insert Into Committees
Values(826, 'State Senate', 'Banking and Financial Institutions', 200);

Insert Into Committees
Values(827, 'State Senate', 'Banking and Financial Institutions', 208);

Insert Into Committees
Values(828, 'State Senate', 'Banking and Financial Institutions', 221);

Insert Into Committees
Values(829, 'State Senate', 'Banking and Financial Institutions', 227);

Insert Into Committees
Values(830, 'State Senate', 'Banking and Financial Institutions', 228);

Insert Into Committees
Values(831, 'State Senate', 'Banking and Financial Institutions', 233);

Insert Into Committees
Values(832, 'State Senate', 'Banking and Financial Institutions', 236);

Insert Into Committees
Values(833, 'State Senate', 'Banking and Financial Institutions', 240);

Insert Into Committees
Values(834, 'State Senate', 'Economic Development', 189);

Insert Into Committees
Values(835, 'State Senate', 'Economic Development', 191);

Insert Into Committees
Values(836, 'State Senate', 'Economic Development', 197);

Insert Into Committees
Values(837, 'State Senate', 'Economic Development', 202);

Insert Into Committees
Values(838, 'State Senate', 'Economic Development', 203);

Insert Into Committees
Values(839, 'State Senate', 'Economic Development', 205);

Insert Into Committees
Values(840, 'State Senate', 'Economic Development', 207);

Insert Into Committees
Values(841, 'State Senate', 'Economic Development', 217);

Insert Into Committees
Values(842, 'State Senate', 'Economic Development', 218);

Insert Into Committees
Values(843, 'State Senate', 'Economic Development', 219);

Insert Into Committees
Values(844, 'State Senate', 'Economic Development', 224);

Insert Into Committees
Values(845, 'State Senate', 'Economic Development', 228);

Insert Into Committees
Values(846, 'State Senate', 'Economic Development', 238);

Insert Into Committees
Values(847, 'State Senate', 'Education and Youth', 193);

Insert Into Committees
Values(848, 'State Senate', 'Education and Youth', 204);

Insert Into Committees
Values(849, 'State Senate', 'Education and Youth', 215);

Insert Into Committees
Values(850, 'State Senate', 'Education and Youth', 218);

Insert Into Committees
Values(851, 'State Senate', 'Education and Youth', 226);

Insert Into Committees
Values(852, 'State Senate', 'Education and Youth', 227);

Insert Into Committees
Values(853, 'State Senate', 'Education and Youth', 234);

Insert Into Committees
Values(854, 'State Senate', 'Education and Youth', 236);

Insert Into Committees
Values(855, 'State Senate', 'Education and Youth', 237);

Insert Into Committees
Values(856, 'State Senate', 'Education and Youth', 241);

Insert Into Committees
Values(857, 'State Senate', 'Education and Youth', 244);

Insert Into Committees
Values(858, 'State Senate', 'Ethics', 194);

Insert Into Committees
Values(859, 'State Senate', 'Ethics', 200);

Insert Into Committees
Values(860, 'State Senate', 'Ethics', 202);

Insert Into Committees
Values(861, 'State Senate', 'Ethics', 216);

Insert Into Committees
Values(862, 'State Senate', 'Ethics', 219);

Insert Into Committees
Values(863, 'State Senate', 'Ethics', 222);

Insert Into Committees
Values(864, 'State Senate', 'Ethics', 225);

Insert Into Committees
Values(865, 'State Senate', 'Ethics', 227);

Insert Into Committees
Values(866, 'State Senate', 'Ethics', 236);

Insert Into Committees
Values(867, 'State Senate', 'Ethics', 239);

Insert Into Committees
Values(868, 'State Senate', 'Finance', 189);

Insert Into Committees
Values(869, 'State Senate', 'Finance', 190);

Insert Into Committees
Values(870, 'State Senate', 'Finance', 197);

Insert Into Committees
Values(871, 'State Senate', 'Finance', 202);

Insert Into Committees
Values(872, 'State Senate', 'Finance', 206);

Insert Into Committees
Values(873, 'State Senate', 'Finance', 210);

Insert Into Committees
Values(874, 'State Senate', 'Finance', 212);

Insert Into Committees
Values(875, 'State Senate', 'Finance', 213);

Insert Into Committees
Values(876, 'State Senate', 'Finance', 214);

Insert Into Committees
Values(877, 'State Senate', 'Finance', 233);

Insert Into Committees
Values(878, 'State Senate', 'Finance', 240);

Insert Into Committees
Values(879, 'State Senate', 'Finance', 243);

Insert Into Committees
Values(880, 'State Senate', 'Government Oversight', 191);

Insert Into Committees
Values(881, 'State Senate', 'Government Oversight', 192);

Insert Into Committees
Values(882, 'State Senate', 'Government Oversight', 203);

Insert Into Committees
Values(883, 'State Senate', 'Government Oversight', 210);

Insert Into Committees
Values(884, 'State Senate', 'Government Oversight', 211);

Insert Into Committees
Values(885, 'State Senate', 'Government Oversight', 230);

Insert Into Committees
Values(886, 'State Senate', 'Government Oversight', 232);

Insert Into Committees
Values(887, 'State Senate', 'Government Oversight', 244);

Insert Into Committees
Values(888, 'State Senate', 'Health and Human Services', 190);

Insert Into Committees
Values(889, 'State Senate', 'Health and Human Services', 193);

Insert Into Committees
Values(890, 'State Senate', 'Health and Human Services', 194);

Insert Into Committees
Values(891, 'State Senate', 'Health and Human Services', 195);

Insert Into Committees
Values(892, 'State Senate', 'Health and Human Services', 211);

Insert Into Committees
Values(893, 'State Senate', 'Health and Human Services', 214);

Insert Into Committees
Values(894, 'State Senate', 'Health and Human Services', 215);

Insert Into Committees
Values(895, 'State Senate', 'Health and Human Services', 217);

Insert Into Committees
Values(896, 'State Senate', 'Health and Human Services', 222);

Insert Into Committees
Values(897, 'State Senate', 'Health and Human Services', 226);

Insert Into Committees
Values(898, 'State Senate', 'Health and Human Services', 230);

Insert Into Committees
Values(899, 'State Senate', 'Health and Human Services', 233);

Insert Into Committees
Values(900, 'State Senate', 'Health and Human Services', 243);

Insert Into Committees
Values(901, 'State Senate', 'Higher Education', 195);

Insert Into Committees
Values(902, 'State Senate', 'Higher Education', 198);

Insert Into Committees
Values(903, 'State Senate', 'Higher Education', 202);

Insert Into Committees
Values(904, 'State Senate', 'Higher Education', 206);

Insert Into Committees
Values(905, 'State Senate', 'Higher Education', 217);

Insert Into Committees
Values(906, 'State Senate', 'Higher Education', 220);

Insert Into Committees
Values(907, 'State Senate', 'Higher Education', 225);

Insert Into Committees
Values(908, 'State Senate', 'Higher Education', 230);

Insert Into Committees
Values(909, 'State Senate', 'Insurance and Labor', 192);

Insert Into Committees
Values(910, 'State Senate', 'Insurance and Labor', 206);

Insert Into Committees
Values(911, 'State Senate', 'Insurance and Labor', 208);

Insert Into Committees
Values(912, 'State Senate', 'Insurance and Labor', 214);

Insert Into Committees
Values(913, 'State Senate', 'Insurance and Labor', 220);

Insert Into Committees
Values(914, 'State Senate', 'Insurance and Labor', 225);

Insert Into Committees
Values(915, 'State Senate', 'Insurance and Labor', 231);

Insert Into Committees
Values(916, 'State Senate', 'Insurance and Labor', 233);

Insert Into Committees
Values(917, 'State Senate', 'Insurance and Labor', 243);

Insert Into Committees
Values(918, 'State Senate', 'Interstate Cooperation', 202);

Insert Into Committees
Values(919, 'State Senate', 'Interstate Cooperation', 204);

Insert Into Committees
Values(920, 'State Senate', 'Interstate Cooperation', 208);

Insert Into Committees
Values(921, 'State Senate', 'Interstate Cooperation', 221);

Insert Into Committees
Values(922, 'State Senate', 'Interstate Cooperation', 234);

Insert Into Committees
Values(923, 'State Senate', 'Judiciary', 192);

Insert Into Committees
Values(924, 'State Senate', 'Judiciary', 196);

Insert Into Committees
Values(925, 'State Senate', 'Judiciary', 198);

Insert Into Committees
Values(926, 'State Senate', 'Judiciary', 200);

Insert Into Committees
Values(927, 'State Senate', 'Judiciary', 204);

Insert Into Committees
Values(928, 'State Senate', 'Judiciary', 214);

Insert Into Committees
Values(929, 'State Senate', 'Judiciary', 222);

Insert Into Committees
Values(930, 'State Senate', 'Judiciary', 225);

Insert Into Committees
Values(931, 'State Senate', 'Judiciary', 236);

Insert Into Committees
Values(932, 'State Senate', 'Judiciary', 241);

Insert Into Committees
Values(933, 'State Senate', 'Judiciary Non-Civil', 192);

Insert Into Committees
Values(934, 'State Senate', 'Judiciary Non-Civil', 200);

Insert Into Committees
Values(935, 'State Senate', 'Judiciary Non-Civil', 204);

Insert Into Committees
Values(936, 'State Senate', 'Judiciary Non-Civil', 212);

Insert Into Committees
Values(937, 'State Senate', 'Judiciary Non-Civil', 222);

Insert Into Committees
Values(938, 'State Senate', 'Judiciary Non-Civil', 225);

Insert Into Committees
Values(939, 'State Senate', 'Judiciary Non-Civil', 231);

Insert Into Committees
Values(940, 'State Senate', 'Judiciary Non-Civil', 236);

Insert Into Committees
Values(941, 'State Senate', 'Judiciary Non-Civil', 239);

Insert Into Committees
Values(942, 'State Senate', 'MARTOC', 194);

Insert Into Committees
Values(943, 'State Senate', 'MARTOC', 204);

Insert Into Committees
Values(944, 'State Senate', 'MARTOC', 207);

Insert Into Committees
Values(945, 'State Senate', 'MARTOC', 212);

Insert Into Committees
Values(946, 'State Senate', 'MARTOC', 222);

Insert Into Committees
Values(947, 'State Senate', 'MARTOC', 226);

Insert Into Committees
Values(948, 'State Senate', 'MARTOC', 227);

Insert Into Committees
Values(949, 'State Senate', 'Natural Resources and the Environment', 198);

Insert Into Committees
Values(950, 'State Senate', 'Natural Resources and the Environment', 205);

Insert Into Committees
Values(951, 'State Senate', 'Natural Resources and the Environment', 207);

Insert Into Committees
Values(952, 'State Senate', 'Natural Resources and the Environment', 209);

Insert Into Committees
Values(953, 'State Senate', 'Natural Resources and the Environment', 211);

Insert Into Committees
Values(954, 'State Senate', 'Natural Resources and the Environment', 213);

Insert Into Committees
Values(955, 'State Senate', 'Natural Resources and the Environment', 219);

Insert Into Committees
Values(956, 'State Senate', 'Natural Resources and the Environment', 234);

Insert Into Committees
Values(957, 'State Senate', 'Natural Resources and the Environment', 239);

Insert Into Committees
Values(958, 'State Senate', 'Natural Resources and the Environment', 242);

Insert Into Committees
Values(959, 'State Senate', 'Natural Resources and the Environment', 245);

Insert Into Committees
Values(960, 'State Senate', 'Public Safety', 189);

Insert Into Committees
Values(961, 'State Senate', 'Public Safety', 194);

Insert Into Committees
Values(962, 'State Senate', 'Public Safety', 195);

Insert Into Committees
Values(963, 'State Senate', 'Public Safety', 209);

Insert Into Committees
Values(964, 'State Senate', 'Public Safety', 216);

Insert Into Committees
Values(965, 'State Senate', 'Public Safety', 229);

Insert Into Committees
Values(966, 'State Senate', 'Public Safety', 232);

Insert Into Committees
Values(967, 'State Senate', 'Reapportionment and Redistricting', 190);

Insert Into Committees
Values(968, 'State Senate', 'Reapportionment and Redistricting', 192);

Insert Into Committees
Values(969, 'State Senate', 'Reapportionment and Redistricting', 197);

Insert Into Committees
Values(970, 'State Senate', 'Reapportionment and Redistricting', 204);

Insert Into Committees
Values(971, 'State Senate', 'Reapportionment and Redistricting', 208);

Insert Into Committees
Values(972, 'State Senate', 'Reapportionment and Redistricting', 211);

Insert Into Committees
Values(973, 'State Senate', 'Reapportionment and Redistricting', 212);

Insert Into Committees
Values(974, 'State Senate', 'Reapportionment and Redistricting', 216);

Insert Into Committees
Values(975, 'State Senate', 'Reapportionment and Redistricting', 233);

Insert Into Committees
Values(976, 'State Senate', 'Reapportionment and Redistricting', 237);

Insert Into Committees
Values(977, 'State Senate', 'Reapportionment and Redistricting', 245);

Insert Into Committees
Values(978, 'State Senate', 'Regulated Industries and Utilities', 197);

Insert Into Committees
Values(979, 'State Senate', 'Regulated Industries and Utilities', 205);

Insert Into Committees
Values(980, 'State Senate', 'Regulated Industries and Utilities', 208);

Insert Into Committees
Values(981, 'State Senate', 'Regulated Industries and Utilities', 211);

Insert Into Committees
Values(982, 'State Senate', 'Regulated Industries and Utilities', 213);

Insert Into Committees
Values(983, 'State Senate', 'Regulated Industries and Utilities', 214);

Insert Into Committees
Values(984, 'State Senate', 'Regulated Industries and Utilities', 219);

Insert Into Committees
Values(985, 'State Senate', 'Regulated Industries and Utilities', 220);

Insert Into Committees
Values(986, 'State Senate', 'Regulated Industries and Utilities', 224);

Insert Into Committees
Values(987, 'State Senate', 'Regulated Industries and Utilities', 225);

Insert Into Committees
Values(988, 'State Senate', 'Regulated Industries and Utilities', 229);

Insert Into Committees
Values(989, 'State Senate', 'Regulated Industries and Utilities', 233);

Insert Into Committees
Values(990, 'State Senate', 'Regulated Industries and Utilities', 243);

Insert Into Committees
Values(991, 'State Senate', 'Retirement', 193);

Insert Into Committees
Values(992, 'State Senate', 'Retirement', 199);

Insert Into Committees
Values(993, 'State Senate', 'Retirement', 209);

Insert Into Committees
Values(994, 'State Senate', 'Retirement', 212);

Insert Into Committees
Values(995, 'State Senate', 'Retirement', 221);

Insert Into Committees
Values(996, 'State Senate', 'Retirement', 224);

Insert Into Committees
Values(997, 'State Senate', 'Retirement', 226);

Insert Into Committees
Values(998, 'State Senate', 'Retirement', 234);

Insert Into Committees
Values(999, 'State Senate', 'Rules', 194);

Insert Into Committees
Values(1000, 'State Senate', 'Rules', 197);

Insert Into Committees
Values(1001, 'State Senate', 'Rules', 207);

Insert Into Committees
Values(1002, 'State Senate', 'Rules', 211);

Insert Into Committees
Values(1003, 'State Senate', 'Rules', 213);

Insert Into Committees
Values(1004, 'State Senate', 'Rules', 214);

Insert Into Committees
Values(1005, 'State Senate', 'Rules', 216);

Insert Into Committees
Values(1006, 'State Senate', 'Rules', 226);

Insert Into Committees
Values(1007, 'State Senate', 'Rules', 227);

Insert Into Committees
Values(1008, 'State Senate', 'Rules', 228);

Insert Into Committees
Values(1009, 'State Senate', 'Rules', 229);

Insert Into Committees
Values(1010, 'State Senate', 'Rules', 233);

Insert Into Committees
Values(1011, 'State Senate', 'Rules', 237);

Insert Into Committees
Values(1012, 'State Senate', 'Rules', 242);

Insert Into Committees
Values(1013, 'State Senate', 'Rules', 243);

Insert Into Committees
Values(1014, 'State Senate', 'Science and Technology', 191);

Insert Into Committees
Values(1015, 'State Senate', 'Science and Technology', 196);

Insert Into Committees
Values(1016, 'State Senate', 'Science and Technology', 215);

Insert Into Committees
Values(1017, 'State Senate', 'Science and Technology', 232);

Insert Into Committees
Values(1018, 'State Senate', 'Science and Technology', 238);

Insert Into Committees
Values(1019, 'State Senate', 'Special Judiciary', 196);

Insert Into Committees
Values(1020, 'State Senate', 'Special Judiciary', 199);

Insert Into Committees
Values(1021, 'State Senate', 'Special Judiciary', 201);

Insert Into Committees
Values(1022, 'State Senate', 'Special Judiciary', 218);

Insert Into Committees
Values(1023, 'State Senate', 'Special Judiciary', 221);

Insert Into Committees
Values(1024, 'State Senate', 'Special Judiciary', 231);

Insert Into Committees
Values(1025, 'State Senate', 'Special Judiciary', 239);

Insert Into Committees
Values(1026, 'State Senate', 'State and Local Governmental Operations', 194);

Insert Into Committees
Values(1027, 'State Senate', 'State and Local Governmental Operations', 199);

Insert Into Committees
Values(1028, 'State Senate', 'State and Local Governmental Operations', 212);

Insert Into Committees
Values(1029, 'State Senate', 'State and Local Governmental Operations', 215);

Insert Into Committees
Values(1030, 'State Senate', 'State and Local Governmental Operations', 218);

Insert Into Committees
Values(1031, 'State Senate', 'State and Local Governmental Operations', 222);

Insert Into Committees
Values(1032, 'State Senate', 'State and Local Governmental Operations', 237);

Insert Into Committees
Values(1033, 'State Senate', 'State Institutions and Property', 189);

Insert Into Committees
Values(1034, 'State Senate', 'State Institutions and Property', 199)

Insert Into Committees
Values(1035, 'State Senate', 'State Institutions and Property', 201);

Insert Into Committees
Values(1036, 'State Senate', 'State Institutions and Property', 216);

Insert Into Committees
Values(1037, 'State Senate', 'State Institutions and Property', 220);

Insert Into Committees
Values(1038, 'State Senate', 'State Institutions and Property', 224);

Insert Into Committees
Values(1039, 'State Senate', 'State Institutions and Property', 238);

Insert Into Committees
Values(1040, 'State Senate', 'Transportation', 191);

Insert Into Committees
Values(1041, 'State Senate', 'Transportation', 196);

Insert Into Committees
Values(1042, 'State Senate', 'Transportation', 197);

Insert Into Committees
Values(1043, 'State Senate', 'Transportation', 203);

Insert Into Committees
Values(1044, 'State Senate', 'Transportation', 205);

Insert Into Committees
Values(1045, 'State Senate', 'Transportation', 207);

Insert Into Committees
Values(1046, 'State Senate', 'Transportation', 216);

Insert Into Committees
Values(1047, 'State Senate', 'Transportation', 227);

Insert Into Committees
Values(1048, 'State Senate', 'Transportation', 232);

Insert Into Committees
Values(1049, 'State Senate', 'Transportation', 240);

Insert Into Committees
Values(1050, 'State Senate', 'Transportation', 241);

Insert Into Committees
Values(1051, 'State Senate', 'Transportation', 242);

Insert Into Committees
Values(1052, 'State Senate', 'Transportation', 245);

Insert Into Committees
Values(1053, 'State Senate', 'Urban Affairs', 194);

Insert Into Committees
Values(1054, 'State Senate', 'Urban Affairs', 196);

Insert Into Committees
Values(1055, 'State Senate', 'Urban Affairs', 201);

Insert Into Committees
Values(1056, 'State Senate', 'Urban Affairs', 204);

Insert Into Committees
Values(1057, 'State Senate', 'Urban Affairs', 211);

Insert Into Committees
Values(1058, 'State Senate', 'Urban Affairs', 217);

Insert Into Committees
Values(1059, 'State Senate', 'Urban Affairs', 224);

Insert Into Committees
Values(1060, 'State Senate', 'Urban Affairs', 230);

Insert Into Committees
Values(1061, 'State Senate', 'Urban Affairs', 231);

Insert Into Committees
Values(1062, 'State Senate', 'Urban Affairs', 237);

Insert Into Committees
Values(1063, 'State Senate', 'Veterans, Military and Homeland Security', 201);

Insert Into Committees
Values(1064, 'State Senate', 'Veterans, Military and Homeland Security', 203);

Insert Into Committees
Values(1065, 'State Senate', 'Veterans, Military and Homeland Security', 208);

Insert Into Committees
Values(1066, 'State Senate', 'Veterans, Military and Homeland Security', 212);

Insert Into Committees
Values(1067, 'State Senate', 'Veterans, Military and Homeland Security', 221);

Insert Into Committees
Values(1068, 'State Senate', 'Veterans, Military and Homeland Security', 238);