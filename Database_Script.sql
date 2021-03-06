USE [DB_A370D2_aegisdb]
GO
/****** Object:  Table [dbo].[tbl_user_location]    Script Date: 03/20/2018 12:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user_location](
	[loc_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
	[latitude] [nvarchar](max) NULL,
	[longitude] [nvarchar](max) NULL,
	[active_flag] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_tbl_user_location] PRIMARY KEY CLUSTERED 
(
	[loc_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_user]    Script Date: 03/20/2018 12:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[role_id] [bigint] NULL,
	[aadhar_id] [bigint] NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[gender] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[mobile_no] [numeric](10, 0) NULL,
	[area] [nvarchar](50) NULL,
	[city_id] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[password] [nvarchar](255) NULL,
	[otp] [bigint] NULL,
	[profile_photo] [nvarchar](max) NULL,
	[status] [int] NULL,
	[active_flag] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_role_type]    Script Date: 03/20/2018 12:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_role_type](
	[role_id] [bigint] IDENTITY(1,1) NOT NULL,
	[role_type] [nvarchar](30) NULL,
	[active_flag] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_Master_Role_Type] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_notification]    Script Date: 03/20/2018 12:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_notification](
	[notification_id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[description] [nvarchar](max) NULL,
	[city] [nvarchar](30) NULL,
	[active_flag] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_notification] PRIMARY KEY CLUSTERED 
(
	[notification_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_news_feed]    Script Date: 03/20/2018 12:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_news_feed](
	[news_id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[description] [text] NULL,
	[active_flag] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_tbl_news_feed] PRIMARY KEY CLUSTERED 
(
	[news_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_forgot_password]    Script Date: 03/20/2018 12:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_forgot_password](
	[forgot_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
	[email] [nvarchar](30) NULL,
	[token] [nvarchar](max) NULL,
	[expire_date] [datetime] NULL,
	[active_flag] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_forgot_password] PRIMARY KEY CLUSTERED 
(
	[forgot_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_feedback]    Script Date: 03/20/2018 12:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_feedback](
	[feedback_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
	[name] [nvarchar](30) NULL,
	[email] [nvarchar](30) NULL,
	[subject] [nvarchar](30) NULL,
	[message] [text] NULL,
	[active_flag] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_feedback] PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_faq]    Script Date: 03/20/2018 12:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_faq](
	[faq_id] [int] IDENTITY(1,1) NOT NULL,
	[question] [nvarchar](max) NULL,
	[answer] [nvarchar](max) NULL,
	[active_flag] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_faq] PRIMARY KEY CLUSTERED 
(
	[faq_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_emergency_contact]    Script Date: 03/20/2018 12:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_emergency_contact](
	[e_id] [bigint] IDENTITY(1,1) NOT NULL,
	[station_name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[contact_no] [numeric](10, 0) NULL,
	[address] [nvarchar](max) NULL,
	[area] [nvarchar](50) NULL,
	[city_id] [nvarchar](50) NULL,
	[zipcode] [numeric](6, 0) NULL,
	[map] [nvarchar](max) NULL,
	[active_flag] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_emergency_contact] PRIMARY KEY CLUSTERED 
(
	[e_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_contact_us]    Script Date: 03/20/2018 12:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_contact_us](
	[c_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[contact_no] [numeric](10, 0) NULL,
	[active_flag] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_contact_us] PRIMARY KEY CLUSTERED 
(
	[c_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_city]    Script Date: 03/20/2018 12:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_city](
	[city_id] [bigint] IDENTITY(1,1) NOT NULL,
	[city] [nvarchar](50) NULL,
	[state] [nvarchar](50) NULL,
	[country] [nvarchar](50) NULL,
	[active_flag] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_city] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_area]    Script Date: 03/20/2018 12:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_area](
	[area_id] [bigint] IDENTITY(1,1) NOT NULL,
	[city_id] [bigint] NULL,
	[area] [nvarchar](50) NULL,
	[active_flag] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_tbl_area] PRIMARY KEY CLUSTERED 
(
	[area_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_anouncement]    Script Date: 03/20/2018 12:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_anouncement](
	[a_id] [bigint] IDENTITY(1,1) NOT NULL,
	[context] [nvarchar](max) NULL,
	[audio] [nvarchar](max) NULL,
	[status] [int] NULL,
	[active_flag] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_tbl_anouncement] PRIMARY KEY CLUSTERED 
(
	[a_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_alert_type]    Script Date: 03/20/2018 12:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_alert_type](
	[type_id] [bigint] IDENTITY(1,1) NOT NULL,
	[type_name] [nvarchar](50) NULL,
	[active_flag] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_alert_type] PRIMARY KEY CLUSTERED 
(
	[type_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_alert]    Script Date: 03/20/2018 12:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_alert](
	[alert_id] [bigint] NULL,
	[type_id] [bigint] NULL,
	[user_id] [bigint] NULL,
	[mobile_no] [numeric](10, 0) NULL,
	[subject] [nvarchar](30) NULL,
	[message] [text] NULL,
	[location] [nvarchar](max) NULL,
	[snaps] [nvarchar](max) NULL,
	[response] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[active_flag] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_user_location]    Script Date: 03/20/2018 12:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_user_location]
	-- Add the parameters for the stored procedure here
	@user_id bigint = null,
	@latitude nvarchar(MAX),
	@longitude nvarchar(MAX),
	@active_flag int = null,
	@created_date datetime = null,
	@updated_date datetime = null,
	@Mode nvarchar(50)

AS
BEGIN
	if	@mode='Select' 
	Begin
		Select * from tbl_user_location
	End
	else if @mode='SelectByUserId'
	Begin
		select * from tbl_user_location where user_id=@user_id
	End
	else if @mode='Insert'
	Begin
		if not exists (select *  from tbl_user_location where user_id = @user_id)
		Begin
			insert into tbl_user_location(user_id,latitude,longitude,active_flag,created_date,updated_date)values(@user_id,@latitude,@longitude,@active_flag,@created_date,@updated_date)
		End
		else
		Begin
			update tbl_user_location set latitude = @latitude, longitude = @longitude where user_id = @user_id
		End
	End
	else if @mode='Delete'
	Begin
		delete from tbl_user_location where user_id = @user_id
	End
		else if @mode='Update'
	Begin
		update tbl_user_location set user_id = @user_id, latitude = @latitude, longitude = @longitude, active_flag = @active_flag,updated_date = @updated_date where user_id = @user_id
	End

END
GO
/****** Object:  StoredProcedure [dbo].[sp_user]    Script Date: 03/20/2018 12:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_user]
	-- Add the parameters for the stored procedure here
	@user_id bigint = null,
	@role_id bigint = null,
	@aadhar_id bigint = null,
	@first_name nvarchar(50) = null,
	@last_name nvarchar(50) = null,
	@gender nvarchar(50) = null,
	@email nvarchar(50) = null,
	@mobile_no numeric(10,0) = null,
	@area nvarchar(50) = null,
	@city_id nvarchar(50) = null,
	@address nvarchar(50) = null,
	@password nvarchar(255) = null,
	@otp bigint = null,
	@status int = null,
	@active_flag int = null,
	@created_date datetime = null,
	@updated_date datetime = null,
	@Mode nvarchar(50)

AS
BEGIN
	if	@mode='Select' 
	Begin
		Select * from tbl_user
	End
	else if @mode='SelectById'
	Begin
		select * from tbl_user where user_id=@user_id
	End
	else if @mode='SelectByMobileNo'
	Begin
		select * from tbl_user where mobile_no=@mobile_no
	End
	else if @mode='LoginAdmin'
	Begin
		select email, password from tbl_user where email=@email and password = @password and status = 1 and active_flag = @active_flag 
	End

	else if @mode='Insert'
	Begin
		if not exists(select *  from tbl_user where mobile_no=@mobile_no or email=@email)
		Begin
			insert into tbl_user(role_id,aadhar_id,first_name,last_name,gender,email,mobile_no,area,city_id,address,password,status,active_flag,created_date,updated_date)values(@role_id,@aadhar_id,@first_name,@last_name,@gender,@email,@mobile_no,@area,@city_id,@address,@password,@status,@active_flag,@created_date,@updated_date)
		End
	End
	else if @mode='InsertAdmin'
	Begin
		if not exists(select *  from tbl_user where mobile_no=@mobile_no or email=@email)
		Begin
			insert into tbl_user(role_id,aadhar_id,first_name,last_name,gender,email,mobile_no,area,city_id,address,password,otp,status,active_flag,created_date,updated_date)values(@role_id,@aadhar_id,@first_name,@last_name,@gender,@email,@mobile_no,@area,@city_id,@address,@password,@otp,@status,@active_flag,@created_date,@updated_date)
		End
	End
	else if @mode='InsertOtp'
	Begin
		if exists(select *  from tbl_user where mobile_no=@mobile_no)
		Begin
			update tbl_user set otp = @otp where mobile_no=@mobile_no
		End
	End
	else if @mode='VerifyOtpMobile'
	Begin
		if exists(select *  from tbl_user where mobile_no=@mobile_no and otp=@otp)
		Begin
			update tbl_user set active_flag = 1 where mobile_no=@mobile_no
			select * from tbl_user where mobile_no = @mobile_no
		End
	End
	else if @mode='VerifyOtpEmail'
	Begin
		if exists(select *  from tbl_user where email=@email and otp = @otp)
		Begin
			update tbl_user set active_flag = 1 where email = @email
		End
	End
	else if @mode='Delete'
	Begin
		delete from tbl_user where (email = @email) OR (mobile_no = @mobile_no)
	End
		else if @mode='Update'
	Begin
		update tbl_user set aadhar_id= @aadhar_id,first_name=@first_name,last_name = @last_name, gender = @gender, email = @email, mobile_no = @mobile_no, area = @area, city_id = @city_id,address = @address,password = @password, status = @status,active_flag = @active_flag,created_date = @created_date,updated_date = @updated_date where user_id = @user_id
	End

END
GO
/****** Object:  StoredProcedure [dbo].[sp_role_type]    Script Date: 03/20/2018 12:43:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_role_type]
	-- Add the parameters for the stored procedure here
	@role_id bigint = null,
	@role_type nvarchar(30) = null,
	@active_flag int = null,
	@created_date datetime = null,
	@updated_date datetime = null,
	@mode nvarchar(50)

AS
BEGIN
	if	@mode='Select' 
	Begin
		Select * from tbl_role_type
	End
	else if @mode='SelectById'
	Begin
		select * from tbl_role_type where role_id=@role_id
	End
	else if @mode='Insert'
	Begin
		insert into tbl_role_type(role_id,role_type,active_flag,created_date,updated_date)
		values(@role_id,@role_type,@active_flag,@created_date,@updated_date)
	End
	else if @mode='Delete'
	Begin
		delete from tbl_role_type where (role_id = @role_id)
	End
		else if @mode='Update'
	Begin
		update tbl_role_type set role_type = @role_type, updated_date = @updated_date 
		where role_id = @role_id
	End

END
GO
/****** Object:  StoredProcedure [dbo].[sp_notification]    Script Date: 03/20/2018 12:43:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_notification]
	-- Add the parameters for the stored procedure here
	@notification_id bigint = null,
	@title nvarchar(50) = null,
	@description nvarchar(MAX) = null,
	@city nvarchar(30) = null,
	@active_flag int = null,
	@created_date datetime = null,
	@updated_date datetime = null,
	@mode nvarchar(50)

AS
BEGIN
	if	@mode='Select' 
	Begin
		Select * from tbl_notification
	End
	else if @mode='SelectById'
	Begin
		select * from tbl_notification where notification_id=@notification_id
	End
	else if @mode='Insert'
	Begin
		insert into tbl_notification(title,description,city,active_flag,created_date)
		values(@title,@description,@city,@active_flag,@created_date)
	End
	else if @mode='Delete'
	Begin
		delete from tbl_notification where (notification_id = @notification_id)
	End
		else if @mode='Update'
	Begin
		update tbl_notification set title = @title, description = @description, city = @city, updated_date = @updated_date 
		where notification_id = @notification_id
	End

END
GO
/****** Object:  StoredProcedure [dbo].[sp_news_feed]    Script Date: 03/20/2018 12:43:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_news_feed]
	-- Add the parameters for the stored procedure here
	@news_id bigint = null,
	@title nvarchar(50) = null,
	@description text = null,
	@active_flag int = null,
	@created_date datetime = null,
	@updated_date datetime = null,
	@mode nvarchar(50)

AS
BEGIN
	if	@mode='Select' 
	Begin
		Select * from tbl_news_feed
	End
	else if @mode='SelectById'
	Begin
		select * from tbl_news_feed where news_id=@news_id
	End
	else if @mode='SelectTitleDesc'
	Begin
		select title,description from tbl_news_feed
	End
	else if @mode='Insert'
	Begin
		insert into tbl_news_feed(title,description,active_flag,created_date)
		values(@title,@description,@active_flag,@created_date)
	End
	else if @mode='Delete'
	Begin
		delete from tbl_news_feed where (news_id = @news_id)
	End
		else if @mode='Update'
	Begin
		update tbl_news_feed set title = @title, description = @description, updated_date = @updated_date 
		where news_id = @news_id
	End

END
GO
/****** Object:  StoredProcedure [dbo].[sp_mobile]    Script Date: 03/20/2018 12:43:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_mobile]
	-- Add the parameters for the stored procedure here
	@mobile_no numeric(10,0) = null,
	@mode nvarchar(50)

AS
BEGIN
	if	@mode='Select' 
	Begin
		Select * from tbl_user where mobile_no = @mobile_no
	End
END
GO
/****** Object:  StoredProcedure [dbo].[sp_forgot_password]    Script Date: 03/20/2018 12:43:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_forgot_password]
	-- Add the parameters for the stored procedure here
	@forgot_id bigint = null,
	@user_id bigint = null,
	@email nvarchar(30) = null,
	@token nvarchar(MAX) = null,
	@expire_date datetime = null,
	@active_flag int = null,
	@created_date datetime = null,
	@updated_date datetime = null,
	@mode nvarchar(50)

AS
BEGIN
	if	@mode='Select' 
	Begin
		Select * from tbl_forgot_password
	End
	else if @mode='SelectById'
	Begin
		select * from tbl_forgot_password where forgot_id=@forgot_id
	End
	else if @mode='Insert'
	Begin
		insert into tbl_forgot_password(forgot_id,user_id,email,token,expire_date,active_flag,created_date,updated_date)
		values(@forgot_id,@user_id,@email,@token,@expire_date,@active_flag,@created_date,@updated_date)
	End
	else if @mode='Delete'
	Begin
		delete from tbl_forgot_password where (forgot_id = @forgot_id)
	End
		else if @mode='Update'
	Begin
		update tbl_forgot_password set email = @email, token = @token, expire_date = @expire_date, updated_date = @updated_date 
		where forgot_id = @forgot_id
	End

END
GO
/****** Object:  StoredProcedure [dbo].[sp_feedback]    Script Date: 03/20/2018 12:43:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_feedback]
	-- Add the parameters for the stored procedure here
	@feedback_id bigint = null,
	@user_id bigint = null,
	@name nvarchar(30) = null,
	@email nvarchar(30) = null,
	@subject nvarchar(30) = null,
	@message text = null,
	@active_flag int = null,
	@created_date datetime = null,
	@updated_date datetime = null,
	@mode nvarchar(50)

AS
BEGIN
	if	@mode='Select' 
	Begin
		Select * from tbl_feedback
	End
	else if @mode='SelectById'
	Begin
		select * from tbl_feedback where feedback_id = @feedback_id
	End
	else if @mode='Insert'
	Begin
		insert into tbl_feedback(feedback_id,user_id,name,email,subject,message,active_flag,created_date,updated_date)
		values(@feedback_id,@user_id,@name,@email,@subject,@message,@active_flag,@created_date,@updated_date)
	End
	else if @mode='Delete'
	Begin
		delete from tbl_feedback where (feedback_id = @feedback_id)
	End
		else if @mode='Update'
	Begin
		update tbl_feedback set name = @name, email = @email, subject = @subject, message = @message, updated_date = @updated_date 
		where feedback_id = @feedback_id
	End

END
GO
/****** Object:  StoredProcedure [dbo].[sp_faq]    Script Date: 03/20/2018 12:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_faq]
	-- Add the parameters for the stored procedure here
	@faq_id bigint = null,
	@question nvarchar(MAX) = null,
	@answer nvarchar(MAX) = null,
	@active_flag int = null,
	@created_date datetime = null,
	@updated_date datetime = null,
	@mode nvarchar(50)

AS
BEGIN
	if	@mode='Select' 
	Begin
		Select * from tbl_faq
	End
	else if @mode='SelectQueAns'
	Begin
		select question,answer from tbl_faq
	End
	else if @mode='SelectById'
	Begin
		select * from tbl_faq where faq_id=@faq_id
	End
	else if @mode='Insert'
	Begin
		insert into tbl_faq(question,answer,active_flag,created_date)
		values(@question,@answer,@active_flag,@created_date)
	End
	else if @mode='Delete'
	Begin
		delete from tbl_faq where (faq_id = @faq_id)
	End
		else if @mode='Update'
	Begin
		update tbl_faq set answer = @answer, updated_date = @updated_date 
		where faq_id = @faq_id
	End

END
GO
/****** Object:  StoredProcedure [dbo].[sp_emergency_contact]    Script Date: 03/20/2018 12:43:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_emergency_contact]
	-- Add the parameters for the stored procedure here
	@e_id bigint = null,
	@station_name nvarchar(50) = null,
	@email nvarchar(50) = null,
	@contact_no numeric(10,0) = null,
	@address nvarchar(MAX) = null,
	@area nvarchar(50) = null,
	@city_id nvarchar(50) = null,
	@zipcode numeric(6,0) = null,
	@map nvarchar(MAX) = null,
	@active_flag int = null,
	@created_date datetime = null,
	@updated_date datetime = null,
	@mode nvarchar(50)

AS
BEGIN
	if	@mode='Select' 
	Begin
		Select * from tbl_emergency_contact
	End
	else if @mode='SelectDetails'
	Begin
		select station_name,contact_no,area from tbl_emergency_contact
	End

	
	else if @mode='SelectById'
	Begin
		select * from tbl_emergency_contact where e_id=@e_id
	End
	else if @mode='Insert'
	Begin
		insert into tbl_emergency_contact(station_name,email,contact_no,area,city_id,zipcode,map,active_flag,created_date,updated_date)
		values(@station_name,@email,@contact_no,@area,@city_id,@zipcode,@map,@active_flag,@created_date,@updated_date)
	End
	else if @mode='Delete'
	Begin
		delete from tbl_emergency_contact where (e_id = @e_id)
	End
		else if @mode='Update'
	Begin
		update tbl_emergency_contact set station_name = @station_name, email = @email, contact_no = @contact_no, address = @address, area = @area, city_id = @city_id, zipcode = @zipcode, map = @map, updated_date = @updated_date 
		where e_id = @e_id
	End

END
GO
/****** Object:  StoredProcedure [dbo].[sp_contact_us]    Script Date: 03/20/2018 12:43:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_contact_us]
	-- Add the parameters for the stored procedure here
	@c_id bigint = null,
	@name nvarchar(50) = null,
	@email nvarchar(50) = null,
	@contact_no numeric(10,0) = null,
	@active_flag int = null,
	@created_date datetime = null,
	@updated_date datetime = null,
	@mode nvarchar(50)

AS
BEGIN
	if	@mode='Select' 
	Begin
		Select * from tbl_contact_us
	End
	else if @mode='SelectById'
	Begin
		select * from tbl_contact_us where c_id=@c_id
	End
	else if @mode='Insert'
	Begin
		insert into tbl_contact_us(c_id,name,email,contact_no,active_flag,created_date,updated_date)
		values(@c_id,@name,@email,@contact_no,@active_flag,@created_date,@updated_date)
	End
	else if @mode='Delete'
	Begin
		delete from tbl_contact_us where (c_id = @c_id)
	End
		else if @mode='Update'
	Begin
		update tbl_contact_us set name = @name, email = @email, contact_no = @contact_no, updated_date = @updated_date 
		where c_id = @c_id
	End

END
GO
/****** Object:  StoredProcedure [dbo].[sp_city]    Script Date: 03/20/2018 12:43:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_city]
	-- Add the parameters for the stored procedure here
	@city_id bigint = null,
	@city nvarchar(50) = null,
	@state nvarchar(50) = null,
	@country nvarchar(50) = null,
	@active_flag int = null,
	@created_date datetime = null,
	@updated_date datetime = null,
	@mode nvarchar(50)

AS
BEGIN
	if	@mode='Select' 
	Begin
		Select * from tbl_city
	End
	else if @mode='SelectById'
	Begin
		select * from tbl_city where city_id=@city_id
	End
	else if @mode='Insert'
	Begin
		if not exists(select *  from tbl_city where city = @city)
		Begin
			insert into tbl_city(city,state,country,active_flag,created_date,updated_date)values(@city,@state,@country,@active_flag,@created_date,@updated_date)
		End	
	End
	else if @mode='Delete'
	Begin
		delete from tbl_city where (city_id = @city_id)
	End
		else if @mode='Update'
	Begin
		update tbl_city set city = @city, state = @state, country = @country, updated_date = @updated_date 
		where city_id = @city_id
	End

END
GO
/****** Object:  StoredProcedure [dbo].[sp_area]    Script Date: 03/20/2018 12:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_area]
	-- Add the parameters for the stored procedure here
	@area_id bigint = null,
	@city_id bigint = null,
	@area nvarchar(50) = null,
	@active_flag int = null,
	@created_date datetime = null,
	@updated_date datetime = null,
	@mode nvarchar(50)

AS
BEGIN
	if	@mode='Select' 
	Begin
		Select * from tbl_area
	End
	else if @mode='SelectById'
	Begin
		select * from tbl_area where area_id=@area_id
	End
	else if @mode='SelectByCityId'
	Begin
		select * from tbl_area where city_id=@city_id
	End
	else if @mode='Insert'
	Begin
		if not exists(select *  from tbl_area where area = @area)
		Begin
			insert into tbl_area(area_id,city_id,area,active_flag,created_date,updated_date)
			values(@area_id,@city_id,@area,@active_flag,@created_date,@updated_date)
		End
	End
	else if @mode='Delete'
	Begin
		delete from tbl_area where (area_id = @area_id)
	End
		else if @mode='Update'
	Begin
		update tbl_area set area = @area, updated_date = @updated_date 
		where area_id = @area_id
	End

END
GO
/****** Object:  StoredProcedure [dbo].[sp_anouncement]    Script Date: 03/20/2018 12:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_anouncement]
	-- Add the parameters for the stored procedure here
	@a_id bigint = null,
	@context nvarchar(MAX) = null,
	@audio nvarchar(MAX) = null,
	@status int = null,
	@active_flag int = null,
	@created_date datetime = null,
	@updated_date datetime = null,
	@mode nvarchar(50)

AS
BEGIN
	if	@mode='Select' 
	Begin
		Select * from tbl_anouncement
	End
	else if @mode='SelectById'
	Begin
		select * from tbl_anouncement where a_id=@a_id
	End
	else if @mode='Insert'
	Begin
		insert into tbl_anouncement(a_id,context,audio,status,active_flag,created_date,updated_date)
		values(@a_id,@context,@status,@audio,@active_flag,@created_date,@updated_date)
	End
	else if @mode='Delete'
	Begin
		delete from tbl_anouncement where (a_id = @a_id)
	End
		else if @mode='Update'
	Begin
		update tbl_anouncement set context = @context, audio = @audio, status = @status, updated_date = @updated_date 
		where a_id = @a_id
	End

END
GO
/****** Object:  StoredProcedure [dbo].[sp_alert_type]    Script Date: 03/20/2018 12:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_alert_type]
	-- Add the parameters for the stored procedure here
	@type_id bigint = null,
	@type_name nvarchar(50) = null,
	@active_flag int = null,
	@created_date datetime = null,
	@updated_date datetime = null,
	@mode nvarchar(50)

AS
BEGIN
	if	@mode='Select' 
	Begin
		Select * from tbl_alert_type
	End
	else if @mode='SelectById'
	Begin
		select * from tbl_alert_type where type_id=@type_id
	End
	else if @mode='Insert'
	Begin
		insert into tbl_alert_type(type_id,type_name,active_flag,created_date,updated_date)
		values(@type_id,@type_name,@active_flag,@created_date,@updated_date)
	End
	else if @mode='Delete'
	Begin
		delete from tbl_alert_type where (type_id = @type_id)
	End
		else if @mode='Update'
	Begin
		update tbl_alert_type set type_name = @type_name, updated_date = @updated_date 
		where type_id = @type_id
	End

END
GO
/****** Object:  StoredProcedure [dbo].[sp_alert]    Script Date: 03/20/2018 12:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_alert]
	-- Add the parameters for the stored procedure here
	@alert_id bigint = null,
	@user_id bigint = null,
	@type_id bigint = null,
	@mobile_no numeric(10,0) = null,
	@subject nvarchar(30) = null,
	@message text = null,
	@location nvarchar(MAX) = null,
	@snaps nvarchar(MAX) = null,
	@response nvarchar(50) = null,
	@status nvarchar(50) = null,
	@active_flag int = null,
	@created_date datetime = null,
	@updated_date datetime = null,
	@mode nvarchar(50)

AS
BEGIN
	if	@mode='Select'
	Begin
		Select * from tbl_alert
	End
	else if @mode='SelectById'
	Begin
		select * from tbl_alert where alert_id=@alert_id
	End
	else if @mode='Insert'
	Begin
		insert into tbl_alert(user_id,type_id,mobile_no,subject,message,location,snaps,active_flag,created_date,updated_date)
		values(@user_id,@type_id,@mobile_no,@subject,@message,@location,@snaps,@active_flag,@created_date,@updated_date)
	End
	else if @mode='Delete'
	Begin
		delete from tbl_alert where (alert_id = @alert_id)
	End
		else if @mode='Update'
	Begin
		update tbl_alert set response = @response, status = @status, updated_date = @updated_date 
		where alert_id = @alert_id
	End

END
GO
