CREATE TABLE [dbo].[MonitoredTask](
	[MonitoredTaskId] [int] IDENTITY(1,1) NOT NULL,
	[MonitoredTaskName] [varchar](50) NOT NULL,
	[MontioredTaskDesc] [varchar](255) NULL,
	[MonitoredSQL] [varchar](max) NULL,
	[SQLSource] [nvarchar](500) NULL,
	[DataTable] [nvarchar](126) NULL
) ON [DefaultFG] TEXTIMAGE_ON [DefaultFG]

