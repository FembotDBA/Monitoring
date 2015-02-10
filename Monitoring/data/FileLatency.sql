CREATE TABLE [data].[FileLatency](
	[FileLatencyId] [int] IDENTITY(1,1) NOT NULL,
	[ServerId] [int] NOT NULL,
	[SavedDate] [smalldatetime] NOT NULL,
	[ReadLatency] [bigint] NULL,
	[WriteLatency] [bigint] NULL,
	[Latency] [bigint] NULL,
	[AvgBPerRead] [bigint] NULL,
	[AvgBPerWrite] [bigint] NULL,
	[AvgBPerTransfer] [bigint] NULL,
	[Drive] [nvarchar](2) NULL,
	[DB] [nvarchar](128) NULL,
	[physical_name] [nvarchar](260) NOT NULL
) ON [DefaultFG]
GO;
ALTER TABLE [data].[FileLatency] ADD CONSTRAINT [FK_FileLatency_MonitoredServer] FOREIGN KEY([ServerId])
REFERENCES [dbo].[MonitoredServer] ([ServerId])
GO;

ALTER TABLE [data].[FileLatency] CHECK CONSTRAINT [FK_FileLatency_MonitoredServer]
GO;