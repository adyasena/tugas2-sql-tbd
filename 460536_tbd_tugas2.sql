CREATE DATABASE tugas2;
USE [tugas2]
GO
/****** Object:  Table [dbo].[anggota]    Script Date: 15/04/2022 05:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[anggota](
	[niu] [int] NULL,
	[jabatan] [varchar](50) NOT NULL,
	[tahun] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bso]    Script Date: 15/04/2022 05:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bso](
	[nama_bso] [varchar](50) NOT NULL,
	[tahun] [int] NULL,
	[pengurus_bso] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[nama_bso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[divisi]    Script Date: 15/04/2022 05:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[divisi](
	[nama_divisi] [varchar](50) NOT NULL,
	[tahun] [int] NULL,
	[pengurus_divisi] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[nama_divisi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kmteti]    Script Date: 15/04/2022 05:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kmteti](
	[tahun] [int] NOT NULL,
	[pengurus] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[tahun] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mahasiswa]    Script Date: 15/04/2022 05:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mahasiswa](
	[niu] [int] NOT NULL,
	[nama] [varchar](50) NOT NULL,
	[tanggal_lahir] [date] NULL,
	[alamat] [varchar](100) NULL,
	[program_studi] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[niu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proker]    Script Date: 15/04/2022 05:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proker](
	[nama_proker] [varchar](50) NOT NULL,
	[divisi] [varchar](50) NULL,
	[deskripsi] [varchar](100) NULL,
	[pelaksanann] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[nama_proker] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[anggota]  WITH CHECK ADD FOREIGN KEY([niu])
REFERENCES [dbo].[mahasiswa] ([niu])
GO
ALTER TABLE [dbo].[anggota]  WITH CHECK ADD FOREIGN KEY([tahun])
REFERENCES [dbo].[kmteti] ([tahun])
GO
ALTER TABLE [dbo].[bso]  WITH CHECK ADD FOREIGN KEY([tahun])
REFERENCES [dbo].[kmteti] ([tahun])
GO
ALTER TABLE [dbo].[divisi]  WITH CHECK ADD FOREIGN KEY([tahun])
REFERENCES [dbo].[kmteti] ([tahun])
GO
ALTER TABLE [dbo].[proker]  WITH CHECK ADD FOREIGN KEY([divisi])
REFERENCES [dbo].[divisi] ([nama_divisi])
GO
