CREATE TABLE [dbo].[MonitoredServer] (
    [ServerId]   INT            IDENTITY (1, 1) NOT NULL,
    [ServerName] NVARCHAR (128) NULL,
    [ConnString] NVARCHAR (250) NULL
	CONSTRAINT [PK_MonitoredServer] PRIMARY KEY CLUSTERED (	[ServerId] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Server Identity Field', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'MonitoredServer', @level2type = N'COLUMN', @level2name = N'ServerId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of server', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'MonitoredServer', @level2type = N'COLUMN', @level2name = N'ServerName';

