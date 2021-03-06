-- Script Date: 8/21/2016 3:52 AM  - ErikEJ.SqlCeScripting version 3.5.2.58
CREATE TABLE [Roles] (
  [RoleID] int IDENTITY (8,1) NOT NULL
, [RoleName] nvarchar(255) NULL
);
GO
CREATE TABLE [Users] (
  [UserID] int IDENTITY (20,1) NOT NULL
, [UserName] nvarchar(60) NULL
, [UserPassword] nvarchar(255) NULL
, [NiceName] nvarchar(50) NULL
, [Email] nvarchar(100) NULL
, [Url] nvarchar(100) NULL
, [Registered] datetime NULL
, [ActivationKey] nvarchar(128) NULL
, [UserStatus] bit NULL
, [RoleID] int NULL
);
GO
CREATE TABLE [UserMeta] (
  [UserMetaID] bigint IDENTITY (46,1) NOT NULL
, [UserID] int NULL
, [UMetaKey] nvarchar(255) NULL
, [UMetaValue] ntext NULL
);
GO
CREATE TABLE [Posts] (
  [PostID] bigint IDENTITY (138,1) NOT NULL
, [UserID] int NULL
, [Created] datetime NULL
, [Content] ntext NULL
, [Title] nvarchar(255) NULL
, [Excerpt] ntext NULL
, [Status] nvarchar(20) NULL
, [Name] nvarchar(200) NULL
, [Modified] datetime NULL
, [Parent] bigint DEFAULT 0 NOT NULL
, [GUID] nvarchar(255) NULL
, [Order] int DEFAULT 0 NULL
, [Type] nvarchar(20) DEFAULT 'post' NOT NULL
, [CommentStatus] nvarchar(20) DEFAULT 'open' NOT NULL
, [CommentCount] int DEFAULT 0 NOT NULL
);
GO
CREATE TABLE [PostMeta] (
  [PostMetaID] bigint IDENTITY (691,1) NOT NULL
, [PostID] bigint NULL
, [PMetaKey] nvarchar(255) NULL
, [PMetaValue] ntext NULL
);
GO
CREATE TABLE [Options] (
  [OptionID] bigint IDENTITY (23,1) NOT NULL
, [OptionName] nvarchar(64) NULL
, [OptionValue] ntext NULL
, [Autoload] nvarchar(20) DEFAULT 'yes' NULL
);
GO
CREATE TABLE [Comments] (
  [CommentID] bigint IDENTITY (6,1) NOT NULL
, [PostID] bigint NULL
, [AuthorName] nvarchar(100) NULL
, [AuthorEmail] nvarchar(100) NULL
, [AuthorUrl] nvarchar(200) NULL
, [AuthorIP] nvarchar(100) NULL
, [DateCreated] datetime NULL
, [CommentContent] ntext NULL
, [Approved] nvarchar(20) DEFAULT 1 NOT NULL
, [Agent] nvarchar(255) NULL
, [CommentType] nvarchar(20) NULL
, [CommentParent] bigint DEFAULT 0 NOT NULL
, [UserID] int NULL
);
GO
CREATE TABLE [CommentMeta] (
  [CommentMetaID] bigint IDENTITY (4,1) NOT NULL
, [CommentID] bigint NULL
, [CMetaKey] nvarchar(255) NULL
, [CMetaValue] ntext NULL
);
GO
CREATE TABLE [Category] (
  [CategoryID] bigint IDENTITY (85,1) NOT NULL
, [CategoryName] nvarchar(200) NULL
, [Slug] nvarchar(200) NULL
, [CategoryType] nvarchar(32) NULL
, [Description] ntext NULL
, [CategoryParent] bigint DEFAULT 0 NOT NULL
, [Count] bigint DEFAULT 0 NOT NULL
);
GO
CREATE TABLE [CategoryRelationships] (
  [CategoryID] bigint NOT NULL
, [PostID] bigint NOT NULL
);
GO
SET IDENTITY_INSERT [Roles] ON;
GO
INSERT INTO [Roles] ([RoleID],[RoleName]) VALUES (
1,N'Administrator');
GO
INSERT INTO [Roles] ([RoleID],[RoleName]) VALUES (
2,N'Editor');
GO
INSERT INTO [Roles] ([RoleID],[RoleName]) VALUES (
3,N'Author');
GO
SET IDENTITY_INSERT [Roles] OFF;
GO
SET IDENTITY_INSERT [Users] ON;
GO
INSERT INTO [Users] ([UserID],[UserName],[UserPassword],[NiceName],[Email],[Url],[Registered],[ActivationKey],[UserStatus],[RoleID]) VALUES (
1,N'admin',N'AEDSNN7MlYYPm4XdAMePruARDIjYw0hG8rVJu4tSHGI7xfPB0oy5CVAOU2Gw2FXMng==',N'Admin',N'namlongqn@gmail.com',NULL,NULL,N'x7MzKTTX+E3HsTQ0jgKtug==',1,1);
GO
INSERT INTO [Users] ([UserID],[UserName],[UserPassword],[NiceName],[Email],[Url],[Registered],[ActivationKey],[UserStatus],[RoleID]) VALUES (
15,N'NamLong',N'AFufoowzKt99v/6JOHFvheVKMh1g9OKaKLDPnD6mILxXOsO7cS+IdUhs4/5h/tTCCg==',NULL,N'namlongqn@gmail.com',N'',{ts '2016-08-12 18:54:58.340'},N'GkPl2lUhEjXcsASSqTHYgA==',1,1);
GO
SET IDENTITY_INSERT [Users] OFF;
GO
SET IDENTITY_INSERT [UserMeta] ON;
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
2,1,N'nickname',N'Năm Long');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
3,1,N'firstname',N'Lương');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
4,1,N'lastname',N'Thanh Nhuận');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
5,1,N'description',N'nothing share for you!');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
6,NULL,N'nickname',N'');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
7,NULL,N'firstname',N'');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
8,NULL,N'lastname',N'');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
9,NULL,N'description',N'');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
10,15,N'nickname',N'');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
11,15,N'firstname',N'Năm');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
12,15,N'lastname',N'Long');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
13,15,N'description',N'');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
14,NULL,N'nickname',N'');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
15,NULL,N'firstname',N'Thanh');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
16,NULL,N'lastname',N'Nhuận');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
17,NULL,N'description',N'');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
18,NULL,N'nickname',N'Thanh Nhuận');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
19,NULL,N'firstname',N'Thanh');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
20,NULL,N'lastname',N'Nhuận');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
21,NULL,N'description',N'');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
22,NULL,N'nickname',N'');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
23,NULL,N'firstname',N'Thanh');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
24,NULL,N'lastname',N'Nhuận');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
25,NULL,N'description',N'');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
26,NULL,N'nickname',N'');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
27,NULL,N'firstname',N'Năm');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
28,NULL,N'lastname',N'Long');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
29,NULL,N'description',N'');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
30,NULL,N'nickname',N'');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
31,NULL,N'firstname',N'Thanh');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
32,NULL,N'lastname',N'Nhuận');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
33,NULL,N'description',N'');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
34,NULL,N'nickname',N'');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
35,NULL,N'firstname',N'Thanh');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
36,NULL,N'lastname',N'Nhuận');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
37,NULL,N'description',N'');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
38,NULL,N'nickname',N'');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
39,NULL,N'firstname',N'Thanh');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
40,NULL,N'lastname',N'Nhuận');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
41,NULL,N'description',N'');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
42,NULL,N'nickname',N'');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
43,NULL,N'firstname',N'Thanh');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
44,NULL,N'lastname',N'Nhuận');
GO
INSERT INTO [UserMeta] ([UserMetaID],[UserID],[UMetaKey],[UMetaValue]) VALUES (
45,NULL,N'description',N'');
GO
SET IDENTITY_INSERT [UserMeta] OFF;
GO
SET IDENTITY_INSERT [Posts] ON;
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
10,NULL,{ts '2016-07-29 18:21:32.513'},N'Add Category Tin tức to menu  Primary Menu',N'Tin tức',N'Updated',NULL,N'tin-tuc',{ts '2016-07-29 18:21:32.640'},0,NULL,300,N'nav_menu_item',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
11,NULL,{ts '2016-07-29 18:21:32.513'},N'Add Category Điện thoại to menu  Primary Menu',N'Điện thoại',N'Updated',NULL,N'dien-thoai',{ts '2016-07-29 18:21:34.350'},10,NULL,0,N'nav_menu_item',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
12,NULL,{ts '2016-07-29 18:21:32.513'},N'Add Category Laptop to menu  Primary Menu',N'Laptop',N'Updated',NULL,N'laptop',{ts '2016-07-29 18:21:34.770'},10,NULL,0,N'nav_menu_item',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
13,NULL,{ts '2016-07-29 18:21:32.513'},N'Add Category PC to menu  Primary Menu',N'PC',N'Updated',NULL,N'pc',{ts '2016-07-29 18:21:35.310'},10,NULL,0,N'nav_menu_item',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
14,NULL,{ts '2016-07-29 18:21:32.513'},N'Add Category Máy tính bảng to menu  Primary Menu',N'Máy tính bảng',N'Updated',NULL,N'may-tinh-bang',{ts '2016-07-29 18:21:35.800'},10,NULL,0,N'nav_menu_item',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
15,NULL,{ts '2016-07-29 18:22:00.077'},N'Add Category Tản mạn to menu  Primary Menu',N'Tản mạn',N'Updated',NULL,N'tan-man',{ts '2016-07-29 18:22:00.093'},0,NULL,400,N'nav_menu_item',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
16,NULL,{ts '2016-07-29 18:22:00.077'},N'Add Category Ý tưởng to menu  Primary Menu',N'Ý tưởng',N'Updated',NULL,N'y-tuong',{ts '2016-07-29 18:22:00.480'},15,NULL,0,N'nav_menu_item',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
17,NULL,{ts '2016-07-29 18:22:00.077'},N'Add Category Sản phẩm to menu  Primary Menu',N'Sản phẩm',N'Updated',NULL,N'san-pham',{ts '2016-07-29 18:22:00.867'},15,NULL,0,N'nav_menu_item',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
18,NULL,{ts '2016-07-29 18:22:13.300'},N'Add Category Internet to menu  Primary Menu',N'Internet',N'Updated',NULL,N'internet',{ts '2016-07-29 18:22:13.320'},0,NULL,500,N'nav_menu_item',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
23,NULL,{ts '2016-07-29 18:22:39.250'},N'Add custom link to menu  ',N'Trang chủ',N'Updated',NULL,N'trang-chu',{ts '2016-07-29 18:22:39.250'},0,NULL,100,N'nav_menu_item',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
24,NULL,{ts '2016-07-29 18:31:48.850'},N'Image upload',N'1-autumn-colours',NULL,N'inherit',N'248e8b6f-ad13-44f9-adb6-6d3eea5cb3551-autumn-colours',{ts '2016-07-29 18:31:48.850'},0,N'248e8b6f-ad13-44f9-adb6-6d3eea5cb3551-autumn-colours.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
25,NULL,{ts '2016-07-29 18:31:49.963'},N'Image upload',N'2-macro-worx',NULL,N'inherit',N'f4197023-2a2a-4ba9-b544-5734381fd0342-macro-worx',{ts '2016-07-29 18:31:49.963'},0,N'f4197023-2a2a-4ba9-b544-5734381fd0342-macro-worx.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
26,NULL,{ts '2016-07-29 18:31:50.507'},N'Image upload',N'3-macro-worx-2',NULL,N'inherit',N'35146e0a-d49f-4aac-b3bb-c4bf54bb82e83-macro-worx-2',{ts '2016-07-29 18:31:50.507'},0,N'35146e0a-d49f-4aac-b3bb-c4bf54bb82e83-macro-worx-2.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
27,NULL,{ts '2016-07-29 18:31:51.067'},N'Image upload',N'4-macro-worx-3',NULL,N'inherit',N'b145f78a-d414-4c3e-bdb6-5b95b01a25f94-macro-worx-3',{ts '2016-07-29 18:31:51.067'},0,N'b145f78a-d414-4c3e-bdb6-5b95b01a25f94-macro-worx-3.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
28,NULL,{ts '2016-07-29 18:31:51.363'},N'Image upload',N'5-macro-worx-4',NULL,N'inherit',N'7846b18a-5571-4256-a0de-562462d54f6e5-macro-worx-4',{ts '2016-07-29 18:31:51.363'},0,N'7846b18a-5571-4256-a0de-562462d54f6e5-macro-worx-4.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
29,NULL,{ts '2016-07-29 18:31:51.740'},N'Image upload',N'6-macro-worx-5',NULL,N'inherit',N'254d1e90-6583-45f9-9335-4435c0ce06ee6-macro-worx-5',{ts '2016-07-29 18:31:51.740'},0,N'254d1e90-6583-45f9-9335-4435c0ce06ee6-macro-worx-5.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
30,NULL,{ts '2016-07-29 18:31:52.037'},N'Image upload',N'7-macro-worx-6',NULL,N'inherit',N'9aa75c66-7f12-46a2-838d-64dcddd138be7-macro-worx-6',{ts '2016-07-29 18:31:52.037'},0,N'9aa75c66-7f12-46a2-838d-64dcddd138be7-macro-worx-6.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
31,NULL,{ts '2016-07-29 18:31:52.353'},N'Image upload',N'8-luboanev',NULL,N'inherit',N'cb8b31cb-a4e9-425d-abc4-7c27ea4cb5cb8-luboanev',{ts '2016-07-29 18:31:52.353'},0,N'cb8b31cb-a4e9-425d-abc4-7c27ea4cb5cb8-luboanev.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
32,NULL,{ts '2016-07-29 18:31:52.743'},N'Image upload',N'9-ramdiboy',NULL,N'inherit',N'8c64e738-a229-4302-adae-0fefc30f956c9-ramdiboy',{ts '2016-07-29 18:31:52.743'},0,N'8c64e738-a229-4302-adae-0fefc30f956c9-ramdiboy.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
33,NULL,{ts '2016-07-29 18:31:53.067'},N'Image upload',N'10-dandelions',NULL,N'inherit',N'91faad0c-bfe9-492a-93ff-94df2355e3b910-dandelions',{ts '2016-07-29 18:31:53.067'},0,N'91faad0c-bfe9-492a-93ff-94df2355e3b910-dandelions.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
34,NULL,{ts '2016-07-29 18:31:53.440'},N'Image upload',N'11-macro-bee',NULL,N'inherit',N'f13d5a9d-e334-4f20-ad26-84ceabacce9911-macro-bee',{ts '2016-07-29 18:31:53.440'},0,N'f13d5a9d-e334-4f20-ad26-84ceabacce9911-macro-bee.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
35,NULL,{ts '2016-07-29 18:31:53.833'},N'Image upload',N'12-violet-bell',NULL,N'inherit',N'd4c6df31-7cd0-42db-8f06-fb756ed4dbc312-violet-bell',{ts '2016-07-29 18:31:53.833'},0,N'd4c6df31-7cd0-42db-8f06-fb756ed4dbc312-violet-bell.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
36,NULL,{ts '2016-07-29 18:31:54.230'},N'Image upload',N'13-campanula',NULL,N'inherit',N'6190a8e1-a12e-497c-aa23-61f546491e5e13-campanula',{ts '2016-07-29 18:31:54.230'},0,N'6190a8e1-a12e-497c-aa23-61f546491e5e13-campanula.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
37,NULL,{ts '2016-07-29 18:31:54.583'},N'Image upload',N'14-do-you-remember',NULL,N'inherit',N'8584b4d8-8ed2-4c70-982e-3ea1555c808714-do-you-remember',{ts '2016-07-29 18:31:54.583'},0,N'8584b4d8-8ed2-4c70-982e-3ea1555c808714-do-you-remember.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
38,NULL,{ts '2016-07-29 18:31:55.027'},N'Image upload',N'15-its-my-life',NULL,N'inherit',N'd3e8f5f3-671f-478b-92ce-4163c7a48e8015-its-my-life',{ts '2016-07-29 18:31:55.027'},0,N'd3e8f5f3-671f-478b-92ce-4163c7a48e8015-its-my-life.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
39,NULL,{ts '2016-07-29 18:31:55.707'},N'Image upload',N'16-macro-fly',NULL,N'inherit',N'c986b5ba-ff60-4a8a-a498-f13383059f8f16-macro-fly',{ts '2016-07-29 18:31:55.707'},0,N'c986b5ba-ff60-4a8a-a498-f13383059f8f16-macro-fly.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
40,NULL,{ts '2016-07-29 18:31:56.980'},N'Image upload',N'17-terrarium',NULL,N'inherit',N'0485b579-9ee1-42d1-8e8b-e0e9464ff4b717-terrarium',{ts '2016-07-29 18:31:56.980'},0,N'0485b579-9ee1-42d1-8e8b-e0e9464ff4b717-terrarium.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
41,NULL,{ts '2016-07-29 18:31:58.137'},N'Image upload',N'18-macro-photography',NULL,N'inherit',N'd16d2f77-d5ad-4b74-a71c-e1aada7100d918-macro-photography',{ts '2016-07-29 18:31:58.137'},0,N'd16d2f77-d5ad-4b74-a71c-e1aada7100d918-macro-photography.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
42,NULL,{ts '2016-07-29 18:31:58.943'},N'Image upload',N'19-macro-photography-2',NULL,N'inherit',N'7eb25d90-8d1a-4591-89c8-919d78802a6919-macro-photography-2',{ts '2016-07-29 18:31:58.943'},0,N'7eb25d90-8d1a-4591-89c8-919d78802a6919-macro-photography-2.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
43,NULL,{ts '2016-07-29 18:31:59.867'},N'Image upload',N'20-macro-photography-3',NULL,N'inherit',N'fff996ed-dac2-4690-a2ed-d43386debc5820-macro-photography-3',{ts '2016-07-29 18:31:59.867'},0,N'fff996ed-dac2-4690-a2ed-d43386debc5820-macro-photography-3.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
44,NULL,{ts '2016-07-29 18:32:00.450'},N'Image upload',N'21-macro-photography-4',NULL,N'inherit',N'8f17d89e-1dda-4b1e-8ab0-260a09e6bf5d21-macro-photography-4',{ts '2016-07-29 18:32:00.450'},0,N'8f17d89e-1dda-4b1e-8ab0-260a09e6bf5d21-macro-photography-4.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
45,NULL,{ts '2016-07-29 18:32:00.857'},N'Image upload',N'22-insectuality',NULL,N'inherit',N'94343a70-b712-423a-b5d6-6063a8f506df22-insectuality',{ts '2016-07-29 18:32:00.857'},0,N'94343a70-b712-423a-b5d6-6063a8f506df22-insectuality.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
46,NULL,{ts '2016-07-29 18:32:01.283'},N'Image upload',N'23-insectuality-2',NULL,N'inherit',N'e04ea4c1-015e-4b5d-9f81-5a57d23e344123-insectuality-2',{ts '2016-07-29 18:32:01.283'},0,N'e04ea4c1-015e-4b5d-9f81-5a57d23e344123-insectuality-2.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
47,NULL,{ts '2016-07-29 18:32:01.800'},N'Image upload',N'24-insectuality-3',NULL,N'inherit',N'1a3851d6-632e-478f-91d7-e6e3c1c5ee7124-insectuality-3',{ts '2016-07-29 18:32:01.800'},0,N'1a3851d6-632e-478f-91d7-e6e3c1c5ee7124-insectuality-3.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
48,NULL,{ts '2016-07-29 18:32:02.283'},N'Image upload',N'25-insectuality-4',NULL,N'inherit',N'2187e9d0-93b5-4935-9bcd-4759d2b5f34625-insectuality-4',{ts '2016-07-29 18:32:02.283'},0,N'2187e9d0-93b5-4935-9bcd-4759d2b5f34625-insectuality-4.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
49,NULL,{ts '2016-07-29 18:32:02.743'},N'Image upload',N'26-insectuality-5',NULL,N'inherit',N'2d311430-0b7e-448a-bf0d-662b78808eb126-insectuality-5',{ts '2016-07-29 18:32:02.743'},0,N'2d311430-0b7e-448a-bf0d-662b78808eb126-insectuality-5.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
50,NULL,{ts '2016-07-29 18:32:03.273'},N'Image upload',N'27-insectuality-6',NULL,N'inherit',N'b7168143-ccbd-4872-8426-eb0874b640c527-insectuality-6',{ts '2016-07-29 18:32:03.273'},0,N'b7168143-ccbd-4872-8426-eb0874b640c527-insectuality-6.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
51,NULL,{ts '2016-07-29 18:32:03.640'},N'Image upload',N'28-insectuality-7',NULL,N'inherit',N'4b538f2c-203c-417c-b14a-4fa27fc65b0028-insectuality-7',{ts '2016-07-29 18:32:03.640'},0,N'4b538f2c-203c-417c-b14a-4fa27fc65b0028-insectuality-7.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
52,NULL,{ts '2016-07-29 18:32:03.947'},N'Image upload',N'29-insectuality-8',NULL,N'inherit',N'4dc3a12c-d964-4d8a-b7f9-2103d66a519329-insectuality-8',{ts '2016-07-29 18:32:03.947'},0,N'4dc3a12c-d964-4d8a-b7f9-2103d66a519329-insectuality-8.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
53,NULL,{ts '2016-07-29 18:32:04.247'},N'Image upload',N'30-insectuality-9',NULL,N'inherit',N'2a530271-6ba2-448a-a537-0a6a268b974530-insectuality-9',{ts '2016-07-29 18:32:04.247'},0,N'2a530271-6ba2-448a-a537-0a6a268b974530-insectuality-9.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
54,NULL,{ts '2016-07-29 18:32:04.593'},N'Image upload',N'31-insectuality-10',NULL,N'inherit',N'4dde5042-3ab9-402b-95c7-e41abfdf538b31-insectuality-10',{ts '2016-07-29 18:32:04.593'},0,N'4dde5042-3ab9-402b-95c7-e41abfdf538b31-insectuality-10.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
55,NULL,{ts '2016-07-29 18:32:04.923'},N'Image upload',N'32-macro',NULL,N'inherit',N'a7084cd1-f87e-42a1-8155-f860eb2cecad32-macro',{ts '2016-07-29 18:32:04.923'},0,N'a7084cd1-f87e-42a1-8155-f860eb2cecad32-macro.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
56,NULL,{ts '2016-07-29 18:32:05.340'},N'Image upload',N'33-araaa',NULL,N'inherit',N'ae64f009-06cb-485d-ac74-f8b14b747a5033-araaa',{ts '2016-07-29 18:32:05.340'},0,N'ae64f009-06cb-485d-ac74-f8b14b747a5033-araaa.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
57,NULL,{ts '2016-07-29 18:32:05.680'},N'Image upload',N'34-macro-series-pt-xvi',NULL,N'inherit',N'ab1014ad-4065-43d2-a3ab-d8e29d899ce234-macro-series-pt-xvi',{ts '2016-07-29 18:32:05.680'},0,N'ab1014ad-4065-43d2-a3ab-d8e29d899ce234-macro-series-pt-xvi.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
58,NULL,{ts '2016-07-29 18:32:06.037'},N'Image upload',N'35-quick-macro',NULL,N'inherit',N'ae494c1f-cf4b-4c9e-aa43-dfcfbb25cba535-quick-macro',{ts '2016-07-29 18:32:06.037'},0,N'ae494c1f-cf4b-4c9e-aa43-dfcfbb25cba535-quick-macro.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
59,NULL,{ts '2016-07-29 18:32:06.313'},N'Image upload',N'36-macro-moss-2',NULL,N'inherit',N'14bc18c3-9fd0-4266-a9fe-e94d02884e3336-macro-moss-2',{ts '2016-07-29 18:32:06.313'},0,N'14bc18c3-9fd0-4266-a9fe-e94d02884e3336-macro-moss-2.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
60,NULL,{ts '2016-07-29 18:32:06.640'},N'Image upload',N'37-macro',NULL,N'inherit',N'e29a0190-a12e-455b-91ab-e76609f80f9337-macro',{ts '2016-07-29 18:32:06.640'},0,N'e29a0190-a12e-455b-91ab-e76609f80f9337-macro.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
61,NULL,{ts '2016-07-29 18:32:06.923'},N'Image upload',N'38-silk-universe',NULL,N'inherit',N'a087fe4a-bd61-43b6-a51d-6bf5e01c5fea38-silk-universe',{ts '2016-07-29 18:32:06.923'},0,N'a087fe4a-bd61-43b6-a51d-6bf5e01c5fea38-silk-universe.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
62,NULL,{ts '2016-07-29 18:32:07.210'},N'Image upload',N'39-strange-land',NULL,N'inherit',N'677eb476-64ea-4c3f-985f-d0594f7047d639-strange-land',{ts '2016-07-29 18:32:07.210'},0,N'677eb476-64ea-4c3f-985f-d0594f7047d639-strange-land.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
63,NULL,{ts '2016-07-29 18:32:07.440'},N'Image upload',N'40-sweet-candy-land',NULL,N'inherit',N'8a3d34df-8867-406a-9b31-750a10b804a440-sweet-candy-land',{ts '2016-07-29 18:32:07.440'},0,N'8a3d34df-8867-406a-9b31-750a10b804a440-sweet-candy-land.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
64,1,{ts '2016-07-29 18:48:41.147'},N'<p>Trước đ&oacute;, v&agrave;o chiều 29-7 một số m&agrave;n h&igrave;nh hiển thị th&ocirc;ng tin chuyến bay tại khu vực l&agrave;m thủ tục chuyến bay của T&acirc;n Sơn Nhất v&agrave; Nội B&agrave;i đ&atilde; bị ch&egrave;n h&igrave;nh ảnh v&agrave; nội dung c&acirc;u chữ x&uacute;c phạm Việt Nam v&agrave; Philippines, xuy&ecirc;n tạc c&aacute;c nội dung về biển Đ&ocirc;ng.</p>

<p>Ngay sau khi xuất hiện hiện tượng tr&ecirc;n c&aacute;c cảng h&agrave;ng kh&ocirc;ng đ&atilde; b&aacute;o cơ quan c&ocirc;ng an v&agrave;o cuộc v&agrave; c&oacute; biện ph&aacute;p ngăn chặn.</p>

<p>Theo đại diện một h&atilde;ng h&agrave;ng kh&ocirc;ng, do hệ thống mạng nội bộ của s&acirc;n bay bị đ&oacute;ng bớt để ngăn chặn việc ch&egrave;n nội dung xuy&ecirc;n tạc n&oacute;i tr&ecirc;n n&ecirc;n nhiều quầy l&agrave;m thủ tục chuyến bay chuyển sang l&agrave;m thủ tục bay bằng tay thay v&igrave; tr&ecirc;n m&aacute;y t&iacute;nh. V&igrave; vậy, nguy cơ chậm chuyến bay c&oacute; khả năng xảy ra.</p>

<p>&Ocirc;ng Nguyễn Nhật cho biết hiện nay cơ quan chức năng đang điều tra, l&agrave;m r&otilde; nguy&ecirc;n nh&acirc;n của sự việc tr&ecirc;n.</p>

<p>Đại di&ecirc;̣n hãng hàng kh&ocirc;ng Vietnam Airlines cũng xác nh&acirc;̣n website của đơn vị này bị hack tuy nhi&ecirc;n chưa xác định được thời gian m&acirc;́t quy&ecirc;̀n ki&ecirc;̉m soát là bao l&acirc;u. &ldquo;Chúng t&ocirc;i đang họp đ&ecirc;̉ kh&ocirc;i phục lại, hi&ecirc;̣n chưa phát hi&ecirc;̣n cơ sở dữ li&ecirc;̣u có bị lọt ra ngoài hay kh&ocirc;ng&rdquo;, vị này nói.</p>

<p>M&ocirc;̣t ngu&ocirc;̀n tin cho hay có 411.000 dữ li&ecirc;̣u của hành khách đi máy bay đã bị hacker thu th&acirc;̣p.</p>

<p>Một facebooker c&oacute; nick Nghi&ecirc;m Danh H&agrave;o quay được cảnh những ti&ecirc;́ng hú man rợ phát ra từ h&ecirc;̣ th&ocirc;́ng loa tại sảnh n&ocirc;̣i địa s&acirc;n bay N&ocirc;̣i Bài. Trang facebook n&agrave;y cho hay: &ldquo;...&nbsp;<em>Hệ thống loa v&agrave; m&agrave;n h&igrave;nh quảng c&aacute;o của s&acirc;n bay bị chiếm s&oacute;ng (...) Sau khoảng v&agrave;i ph&uacute;t th&igrave; nh&acirc;n vi&ecirc;n kĩ thuật đ&atilde; tắt. Một số kh&aacute;ch quốc tế ngao ng&aacute;n lắc đầu. C&ograve;n đa số d&acirc;n VN m&igrave;nh th&igrave; chưa hiểu g&igrave;, chỉ cho&aacute;ng với tiếng cười như nh&agrave; ma</em>&rdquo;.</p>

<p><strong><em>Ch&uacute;ng t&ocirc;i sẽ tiếp tục cập nhật th&ocirc;ng tin về sự cố n&agrave;y.</em></strong></p>
',N'​Màn hình sân bay bị chèn nội dung xuyên tạc về biển Đông',N'Trao đổi với Tuổi Trẻ, thứ trưởng Bộ GTVT Nguyễn Nhật cho biết cơ quan chức năng đã ngăn chặn việc màn hình hiển thị các thông tin ở khu vực làm thủ tục bay của Cảng hàng không quốc tế Tân Sơn Nhất và Nội Bài.
',N'publish',N'man-hinh-san-bay-bi-chen-noi-dung-xuyen-tac-ve-bien-dong',{ts '2016-07-29 18:48:41.147'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
65,1,{ts '2016-07-29 18:49:35.133'},N'<p>HERE &ndash; nh&agrave; ph&aacute;t triển ứng dụng bản đồ HERE Maps &ndash; vừa th&ocirc;ng b&aacute;o phần mềm n&agrave;y sẽ được đổi t&ecirc;n th&agrave;nh HERE WeGo. Ngo&agrave;i ra, ứng dụng cũng sẽ được bổ sung th&ecirc;m một số t&iacute;nh năng mới.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/here1-1469703752737/heremapsdoitenthanhherewegovacapnhatthemtinhnangmoithuvi.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Để bắt đầu, bạn kh&ocirc;ng cần phải bấm v&agrave;o n&uacute;t &quot;find a route&quot; tr&ecirc;n c&ugrave;ng m&agrave;n h&igrave;nh nữa, thay v&agrave;o đ&oacute; bạn sẽ được ch&agrave;o đ&oacute;n bằng th&ocirc;ng điệp &quot;Đi đ&acirc;u?&quot; tr&ecirc;n Search Box. Bạn chỉ cần nhập v&agrave;o địa điểm muốn đến v&agrave; lựa chọn phương thức vận tải m&agrave; bạn muốn trong danh s&aacute;ch.</p>

<p>Một điểm mới của HERE WeGo l&agrave; n&oacute; li&ecirc;n kết với dịch vụ chia sẻ xe Car2Go (Uber v&agrave; Lyft vẫn chưa được hỗ trợ). Khi t&igrave;m kiếm một con đường với HERE WeGo, Car2Go sẽ l&agrave; một trong số c&aacute;c phương thức di chuyển m&agrave; bạn c&oacute; thể lựa chọn b&ecirc;n cạnh xe đạp, đi bộ hoặc c&aacute;c phương tiện giao th&ocirc;ng c&ocirc;ng cộng. Ứng dụng sẽ hiển thị nơi c&oacute; sẵn xe Car2Go gần nhất với vị tr&iacute; của bạn, c&ugrave;ng với chi tiết về số tiền phải chi trả, lượng nhi&ecirc;n liệu ti&ecirc;u thụ cho chuyến đi. Ngo&agrave;i ra, HERE WeGo cũng cho ph&eacute;p khởi động ứng dụng Car2Go chỉ bằng một n&uacute;t bấm duy nhất.</p>

<p>Hơn nữa, HERE WeGo cũng cung cấp th&ocirc;ng tin về taxi cho tuyến đường ở một số th&agrave;nh phố, bao gồm số tiền (gần đ&uacute;ng), thời gian chờ đợi v&agrave; một n&uacute;t gọi để kết nối với h&atilde;ng taxi. Th&ocirc;ng tin về c&aacute;c th&agrave;nh phố v&agrave; h&atilde;ng taxi sẽ được bổ sung tiếp tục trong những th&aacute;ng tới.</p>
&nbsp;

<p>HERE WeGo</p>

<p>C&aacute;c tuyến đường d&agrave;nh cho xe đạp cũng được hiển thị chi tiết hơn cho ph&eacute;p người d&ugrave;ng đ&aacute;nh gi&aacute; dễ d&agrave;ng qu&atilde;ng đường m&igrave;nh c&oacute; thể di chuyển. M&agrave;u nền của ứng dụng cũng được thiết kế lại nhẹ nh&agrave;ng để cải thiện khả năng đọc, cho ph&eacute;p người d&ugrave;ng tận dụng tốt hơn c&aacute;c th&ocirc;ng tin mở rộng tr&ecirc;n m&agrave;n h&igrave;nh.</p>

<p>HERE WeGo cung cấp bản đồ chi tiết v&agrave; hướng dẫn giao th&ocirc;ng cho hơn 1.300 th&agrave;nh phố tr&ecirc;n thế giới. Ngo&agrave;i ra, ứng dụng cũng c&oacute; t&iacute;nh năng hướng dẫn turn-by-turn bằng giọng n&oacute;i tr&ecirc;n m&agrave;n h&igrave;nh với c&aacute;c th&ocirc;ng tin về giới hạn tốc độ của tuyến đường v&agrave; c&aacute;c địa điểm sắp đến.</p>

<p>Ứng dụng n&agrave;y cũng hoạt động offline với bản đồ c&oacute; sẵn cho 150 quốc gia. Th&ocirc;ng tin giao th&ocirc;ng trực tiếp c&oacute; sẵn cho 52 quốc gia với c&aacute;c điểm n&oacute;ng giao th&ocirc;ng v&agrave; c&aacute;c sự cố li&ecirc;n tục được cập nhật.<a href="http://genk.vn/here.htm" target="_blank">HERE</a>&nbsp;WeGo cũng cung cấp thời gian khởi h&agrave;nh của c&aacute;c phương tiện giao th&ocirc;ng c&ocirc;ng cộng để người d&ugrave;ng sắp xếp thời gian để di chuyển, tr&aacute;nh việc trễ c&aacute;c chuyến xe.</p>
',N'HERE Maps đổi tên thành HERE WeGo và cập nhật thêm tính năng mới thú vị',N'Nhà phát triển bản đồ HERE vừa đổi tên ứng dụng của mình thành HERE WeGo và cập nhật thêm nhiều tính năng mới cho người dùng.
',N'publish',N'here-maps-doi-ten-thanh-here-wego-va-cap-nhat-them-tinh-nang-moi-thu-vi',{ts '2016-07-29 18:49:00.000'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
66,1,{ts '2016-07-29 18:50:52.587'},N'<p>Trong thời đại tr&igrave;nh độ khoa học kỹ thuật ph&aacute;t triển như hiện nay, những thiết bị mỏng hơn, nhẹ hơn m&agrave; lại ng&agrave;y c&agrave;ng hiện đại v&agrave; tiện dụng li&ecirc;n tiếp được ra đời, v&ocirc; h&igrave;nh chung đ&atilde; tạo n&ecirc;n một ti&ecirc;u chuẩn cho to&agrave;n bộ xu hướng c&ocirc;ng nghệ. D&ugrave; sao, h&atilde;y c&ugrave;ng nh&igrave;n về qu&aacute; khứ v&agrave; ho&agrave;i niệm về những thiết kế nhỏ b&eacute; m&agrave; lại đ&oacute;ng vai tr&ograve; đặc biệt quan trọng tr&ecirc;n mọi phi&ecirc;n bản của mọi thiết bị. Một trong những minh chứng ti&ecirc;u biểu nhất đ&oacute; l&agrave; cổng giao thức kết nối.</p>

<p>Cổng kết nối ư? Tại sao tr&ecirc;n một chiếc m&aacute;y t&iacute;nh thời ấy lại c&oacute; nhiều loại cổng như vậy? V&igrave; n&oacute; to bằng v&agrave;i quyển danh bạ gộp lại? Kh&ocirc;ng, khi ấy những chiếc laptop vẫn c&oacute; số lượng cổng gần bằng như thế m&agrave;. Vậy tại sao? V&igrave; l&ograve;ng ho&agrave;i cổ những ph&aacute;t minh hồi trước lấn &aacute;t l&yacute; tr&iacute; khi thiết kế? Chẳng ai biết cả, nhưng dưới đ&acirc;y l&agrave; một v&agrave;i v&iacute; dụ th&uacute; vị trong lịch sử ph&aacute;t triển h&agrave;ng thập kỷ đ&atilde; qua:</p>

<hr />
<p><strong>Cổng điều khiển chơi game</strong></p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/frontportsright-1466734730133/hoainiemlai8conggiaotiepdadivaotamtri8xbencanhack35mm.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Chắc chắn rất nhiều người trong số ch&uacute;ng ta nhớ về một thời say m&ecirc; PlayStation hay GameCube, v&agrave; cả những lần v&ocirc; t&igrave;nh&hellip; vấp v&agrave;o d&acirc;y cắm tay cầm nữa. Với cấu tạo chắc chắn v&agrave; h&agrave;i h&ograve;a, sản phẩm n&agrave;y gi&uacute;p bạn kết nối hai bộ phận của m&aacute;y chơi game với nhau (d&ugrave; sao th&igrave; cũng dần bị thay thế bởi c&ocirc;ng nghệ kh&ocirc;ng d&acirc;y). D&ugrave; sao th&igrave; trải nghiệm tr&agrave;n về mỗi khi chạm tay v&agrave;o chiếc tay cầm c&oacute; d&acirc;y vẫn nhiều khi được nhiều người ưa th&iacute;ch hơn l&agrave; sự tiện lợi của kết nối kh&ocirc;ng d&acirc;y.</p>

<hr />
<p><strong>Cổng song song</strong></p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/atari-800xl-and-130xe-rear-2-1466734752527/hoainiemlai8conggiaotiepdadivaotamtri8xbencanhack35mm.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>M&aacute;y quay đĩa, m&aacute;y in, ổ đĩa nhớ&hellip; Tất cả những thứ đ&oacute; từng gắn liền với giao thức kết nối song song. Đ&acirc;y l&agrave; một trong những loại h&igrave;nh c&oacute; mặt sớm v&agrave; phổ biến nhất. Thậm ch&iacute; một thiết bị c&oacute; thể cho ph&eacute;p nhiều cổng để kết nối với nhiều thiết bị kh&aacute;c c&ugrave;ng l&uacute;c. D&ugrave; vậy, đối với m&aacute;y t&iacute;nh, hầu như ch&uacute;ng rất &iacute;t khi đ&oacute;ng vai tr&ograve; quan trọng n&agrave;o cả.</p>

<hr />
<p><strong>Khe gắn thẻ (hay gọi l&agrave; băng)</strong></p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/snes03-1466734779504/hoainiemlai8conggiaotiepdadivaotamtri8xbencanhack35mm.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Ng&agrave;nh c&ocirc;ng nghiệp chơi game l&agrave; nh&acirc;n tố ch&iacute;nh th&uacute;c đẩy mạnh mẽ sự ph&aacute;t triển của giao thức n&agrave;y. Tuy nhi&ecirc;n xu hướng hiện nay đ&atilde; chuyển sang h&igrave;nh thức tải th&ocirc;ng tin, dữ liệu tr&ograve; chơi tr&ecirc;n hệ thống về chứ kh&ocirc;ng trọng dụng khe gắn đĩa game nữa. D&ugrave; sao th&igrave; kh&ocirc;ng ai c&oacute; thể từ chối sự hấp dẫn của n&oacute; trong qu&aacute; khứ, gắn liền với biết bao kỷ niệm tuổi thơ.</p>

<hr />
<p><strong>Cổng SCSI</strong></p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/scsi-and-twisted-pair-ethernet-port-on-a-sun-sbus-card-1466734804135/hoainiemlai8conggiaotiepdadivaotamtri8xbencanhack35mm.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>K&iacute;ch cỡ của n&oacute; cũng như tốc độ cải tiến đ&atilde; khiến cho người sử dụng từng một phen ấn tượng khi chứng kiến. Viết tắt cho Small Computer System Interface, loại cổng n&agrave;y đ&atilde; trở n&ecirc;n phổ biến trong thời kỳ ho&agrave;ng kim của băng đĩa, nhưng cuối c&ugrave;ng vẫn chịu chung kết cục bị thay thế bởi những thế hệ t&acirc;n tiến hơn về mọi mặt.</p>

<hr />
<p><strong>Cổng PS/2</strong></p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/ps-2-ports-1466734825937/hoainiemlai8conggiaotiepdadivaotamtri8xbencanhack35mm.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Loại h&igrave;nh kết nối cho chuột v&agrave; b&agrave;n ph&iacute;m n&agrave;y vẫn c&ograve;n l&agrave; một điều mới mẻ, cho tới năm 1987 khi IBM thực hiện chiến dịch phổ biến v&agrave; quảng b&aacute; h&igrave;nh ảnh cũng như chức năng của ch&uacute;ng. Hiện nay, một số thiết bị đặc biệt vẫn chứa những cổng kết nối PS/2 v&igrave; ch&uacute;ng c&oacute; thể được sử dụng thay cho cổng USB v&igrave; mục đ&iacute;ch an ninh.</p>

<hr />
<p><strong>C&aacute;p song song</strong></p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/centronics-1466734847353/hoainiemlai8conggiaotiepdadivaotamtri8xbencanhack35mm.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Được biết đến với một c&aacute;ch gọi kh&aacute;c - dải d&acirc;y Micro, loại c&aacute;p n&agrave;y được d&ugrave;ng cho m&aacute;y in kim khi kết nối với m&aacute;y t&iacute;nh. Nghe c&oacute; vẻ kh&oacute; tin nhưng cảm gi&aacute;c được từ từ cắm đầu c&aacute;p &ldquo;to bự&rdquo; n&agrave;y v&agrave;o cổng m&aacute;y t&iacute;nh, vặn ốc cố định khiến nhiều người cảm thấy kh&aacute; th&iacute;ch th&uacute;, một phần c&oacute; lẽ do sự lạ lẫm của n&oacute;.</p>

<hr />
<p><strong>Cổng nối tiếp (Serial Port)</strong></p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/serial-port-1466734881519/hoainiemlai8conggiaotiepdadivaotamtri8xbencanhack35mm.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Với thiết kế hợp l&yacute; v&agrave; gọn g&agrave;ng, kh&aacute;c biệt hẳn so với cổng VGA phổ biến hiện nay, cổng nối tiếp vẫn được &aacute;p dụng tr&ecirc;n những hệ thống thanh to&aacute;n thẻ v&agrave; một v&agrave;i thiết bị l&acirc;u đời kh&aacute;c. Đ&acirc;y quả thực l&agrave; một vật thay thế ho&agrave;n hảo cho những &ldquo;đ&agrave;n anh&rdquo; kh&ocirc;ng mấy khi&ecirc;m tốn về mặt k&iacute;ch thước, tuy nhi&ecirc;n lại bị thế hệ USB nhỏ gọn v&agrave; tiện dụng hơn cả qua mặt.</p>

<hr />
<p><strong>Khe cắm headphone</strong></p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/headphone-jack-3-5mm-1466734903453/hoainiemlai8conggiaotiepdadivaotamtri8xbencanhack35mm.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Th&agrave;nh vi&ecirc;n cuối c&ugrave;ng trong &ldquo;gia đ&igrave;nh&rdquo; cổng của ng&agrave;y h&ocirc;m nay l&agrave; một thiết kế, d&ugrave; đ&atilde; c&oacute; tuổi đời kh&aacute; l&acirc;u, nhưng vẫn tồn tại v&agrave; hiện diện cho tới tận h&ocirc;m nay như một biểu tượng kh&ocirc;ng thể bị ph&aacute; hủy. Đ&uacute;ng vậy, hầu như chưa c&oacute; phương thức thay thế n&agrave;o được đưa ra, ngoại trừ việc Apple đang gấp r&uacute;t ho&agrave;n thiện c&ocirc;ng nghệ &ldquo;gh&eacute;p đ&ocirc;i&rdquo; bao gồm một đầu tiếp hợp v&agrave; một cặp tai nghe kh&ocirc;ng d&acirc;y, đồng thời cho rằng c&ocirc;ng nghệ n&agrave;y sẽ tỏ ra hiệu quả hơn nhiều lần so với kết nối c&oacute; d&acirc;y truyền thống cắm qua khe jack.</p>

<p>Chưa biết thực hư v&agrave; t&iacute;nh năng vượt trội của n&oacute; ra sao, nhưng ch&uacute;ng ta c&oacute; thể chắc chắn một điều rằng, mọi c&ocirc;ng nghệ rồi cũng sẽ đến ng&agrave;y t&agrave;n của n&oacute;.</p>
',N'Hoài niệm lại 8 cổng giao tiếp đã đi vào tâm trí 8X, bên cạnh jack 3,5mm',N'Các thế hệ 7x, 8x và một phần 9x trở về trước chắc hẳn sẽ không khỏi "bồi hồi xao xuyến" khi nhìn lại những gương mặt thân quen của quá khứ tuổi thơ.
',N'publish',N'hoai-niem-lai-8-cong-giao-tiep-da-di-vao-tam-tri-8x-ben-canh-jack-35mm',{ts '2016-07-29 18:50:52.587'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
67,1,{ts '2016-07-29 18:51:26.647'},N'<p>Cộng đồng t&iacute;n đồ c&ocirc;ng nghệ của thập ni&ecirc;n năm 1920 thực sự bị cuốn theo tr&agrave;o lưu &ldquo;điện h&oacute;a&rdquo; mọi thứ. Họ muốn b&aacute;t trộn chạy bằng điện, m&aacute;y rửa b&aacute;t tự động, v&agrave; thậm ch&iacute; cả chăm s&oacute;c t&oacute;c &aacute;p dụng những tiện nghi đến từ d&ograve;ng điện trong cuộc sống. Ng&agrave;y nay, &yacute; tưởng đ&oacute; kh&ocirc;ng c&ograve;n trở n&ecirc;n xa lạ với bất kỳ ai trong ch&uacute;ng ta, thế nhưng đối với x&atilde; hội những năm 1920, viễn cảnh tr&ecirc;n thật sự chỉ c&oacute; trong tr&iacute; tưởng tượng.</p>

<p>B&igrave;a tạp ch&iacute; Practical Electrics ấn bản th&aacute;ng 8 năm 1923 c&oacute; đ&iacute;nh k&egrave;m h&igrave;nh ảnh vẽ minh họa một người thợ cắt t&oacute;c của tương lai đang sử dụng c&acirc;y k&eacute;o điện tự động của m&igrave;nh. Thời bấy giờ, &yacute; tưởng tương tự như vậy vẫn phần n&agrave;o bị coi l&agrave; viển v&ocirc;ng, thiếu thực tế. Tuy nhi&ecirc;n, điều n&agrave;y cũng &iacute;t nhiều g&oacute;p phần cho thấy được tư tưởng tiến bộ của một bộ phận những người đ&atilde; sớm nghĩ đến một ng&agrave;y c&aacute;c thiết bị điện sẽ trở n&ecirc;n phổ biến đối với dịch vụ tr&ecirc;n.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/ut8gfg17o4ai8t6ciiod-1466240573984/du-doan-kho-tin-trong-qua-khu-ve-tuong-lai-phat-trien-cua-cong-nghe-thiet-bi-dien.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Hơn nữa, d&ograve;ng chữ<em>&nbsp;&quot;Why not?&quot; (Tại sao kh&ocirc;ng?)</em>&nbsp;c&ograve;n được in nổi bật tr&ecirc;n b&igrave;a b&aacute;o, thể hiện k&egrave;m với h&igrave;nh ảnh 2 người đ&agrave;n &ocirc;ng với m&aacute;i t&oacute;c dựng ngược tượng trưng cho t&aacute;c động đặc trưng của d&ograve;ng điện.</p>

<p>Đ&oacute;i với người d&acirc;n Mỹ, năm 1920 đ&aacute;nh dấu thời điểm của bước biến chuyển to lớn nhờ v&agrave;o sự xuất hiện của d&ograve;ng điện cũng như lĩnh vực s&aacute;ng chế thiết bị đi k&egrave;m sau đ&oacute;. Gần như 70% gia đ&igrave;nh v&agrave; căn hộ trong nước đ&atilde; c&oacute; điện để sử dụng, t&iacute;nh tới cuối thập ni&ecirc;n 1920.</p>

<p>Kh&ocirc;ng quan trọng đ&oacute; l&agrave; c&ocirc;ng nghệ radio mới lạ, độc đ&aacute;o hay chiếc k&eacute;o cắt tỉa đơn giản của người thợ cắt t&oacute;c, lối sống thường nhật của mọi người d&acirc;n tr&ecirc;n đất Mỹ cũng đ&atilde; trải qua những t&aacute;c động v&agrave; &yacute; nghĩa to lớn kể từ khi điện được ph&aacute;t minh. V&agrave; mặc d&ugrave; tốc độ cập nhật v&agrave; ph&aacute;t triển c&ocirc;ng nghệ thời đại hiện nay cũng v&ocirc; c&ugrave;ng nhanh ch&oacute;ng, ch&uacute;ng ta cũng kh&ocirc;ng c&oacute; g&igrave; phải xấu hổ khi hồi tưởng lại thời kỳ b&ugrave;ng nổ tương tự trong qu&aacute; khứ, v&agrave;o thập ni&ecirc;n 1920.</p>

<p>Đối với bạn, smartphone mới thực sự l&agrave; ph&aacute;t kiến đột ph&aacute; nhất trong lịch sử ph&aacute;t triển c&ocirc;ng nghệ của thế giới từ trước tới nay? Tin t&ocirc;i đi, điều đ&oacute; vẫn chưa ăn nhằm g&igrave; so với to&agrave;n bộ những bước biến chuyển c&aacute;ch mạng đến từ việc ph&aacute;t minh ra d&ograve;ng điện trong qu&aacute; khứ đ&acirc;u!</p>
',N'Dự đoán khó tin trong quá khứ về tương lai phát triển của công nghệ thiết bị điện',N'Những tưởng ngày trước, người ta còn đang bận trầm trồ thán phục khi chứng kiến những bước đi đầu tiên của công cuộc sáng tạo thiết bị chạy bằng điện.
',N'publish',N'du-doan-kho-tin-trong-qua-khu-ve-tuong-lai-phat-trien-cua-cong-nghe-thiet-bi-dien',{ts '2016-07-29 18:51:26.647'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
68,1,{ts '2016-07-29 18:52:14.973'},N'<p>Buổi s&aacute;ng ng&agrave;y m&ugrave;ng 6 th&aacute;ng 12 năm 1917, một luồng s&oacute;ng xung k&iacute;ch cực mạnh x&eacute; toang th&agrave;nh phố cảng Halifax, Nova Scotia.</p>

<p>Sự kiện kinh ho&agrave;ng n&agrave;y n&agrave;y đ&atilde; san bằng to&agrave;n bộ khu vực l&acirc;n cận Richmond, l&agrave;m h&agrave;ng ngh&igrave;n người thiệt mạng. Đi theo n&oacute; l&agrave; một cơn s&oacute;ng thần khổng lồ c&agrave;n qu&eacute;t to&agrave;n bộ v&ugrave;ng bờ biển tan hoang.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/halifax-explosion-aftermath-loc-2-1469713707101/vunolonnhatlichsutruockhibomnguyenturadoidaxayranhuthenao.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Nguồn gốc của vụ nổ l&agrave; một chiếc t&agrave;u chở đạn dược của Ph&aacute;p, con t&agrave;u gần như biến mất ho&agrave;n to&agrave;n, trừ chiếc mỏ neo v&agrave; đại b&aacute;c gắn tr&ecirc;n t&agrave;u, được t&igrave;m thấy c&aacute;ch xa nơi con t&agrave;u nổ nhiều c&acirc;y số.</p>

<p>Sức mạnh của vụ nổ n&agrave;y tương đương với 2700 tấn thuốc nổ TNT, được cho l&agrave; vụ nổ g&acirc;y ra bởi con người lớn nhất thời bấy giờ. Kỉ lục ấy đứng vững gần ba thập kỷ, cho tới khi nước Mỹ n&eacute;m quả bom nguy&ecirc;n tử đầu ti&ecirc;n.</p>

<p>Những h&igrave;nh ảnh dưới đ&acirc;y kể lại c&acirc;u chuyện của vụ nổ kinh ho&agrave;ng ấy.</p>

<p>&nbsp;</p>
<img alt="
Tháng 23 năm 1917, Thế Chiến I đã kéo dài được 3 năm. Cảng Halifax tại bờ Đông Canada lúc ấy là một cảng quan trọng trung chuyển lính và nhu yếu phẩm cho mặt trận Châu Âu.
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/by-december-1917-wwi-had-been-raging-for-three-years-halifax-located-on-canadas-east-coast-served-as-an-important-port-for-shipping-troops-and-supplies-to-europe-1469713945515/vunolonnhatlichsutruockhibomnguyenturadoidaxayranhuthenao.jpg" style="margin:0px" />
<p>Th&aacute;ng 23 năm 1917, Thế Chiến I đ&atilde; k&eacute;o d&agrave;i được 3 năm. Cảng Halifax tại bờ Đ&ocirc;ng Canada l&uacute;c ấy l&agrave; một cảng quan trọng trung chuyển l&iacute;nh v&agrave; nhu yếu phẩm cho mặt trận Ch&acirc;u &Acirc;u.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
<img alt="
Ngày 6 tháng 12, một chiếc tàu Na Uy mang tên SS Imo đã rời Halifax, hướng tới New York, xuất phát từ Hà Lan với những hàng hóa viện trợ cho mặt trận tại Bỉ.
" src="http://genknews.genkcdn.vn/k:2016/on-december-6-a-norwegian-cargo-ship-the-ss-imo-was-departing-halifax-on-its-way-to-new-york-the-ship-was-en-route-from-the-netherlands-to-ferry-supplies-back-to-a-war-ravaged-belgium-1469714551276/vunolonnhatlichsutruockhibomnguyenturadoidaxayranhuthenao.jpg" style="margin:0px" />
<p>Ng&agrave;y 6 th&aacute;ng 12, một chiếc t&agrave;u Na Uy mang t&ecirc;n SS Imo đ&atilde; rời Halifax, hướng tới New York, xuất ph&aacute;t từ H&agrave; Lan với những h&agrave;ng h&oacute;a viện trợ cho mặt trận tại Bỉ.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
<img alt="
Cùng lúc ấy, con tàu SS Mont Blanc đang trên đường trở về đất mẹ Pháp, mang theo rất nhiều vật liệu nổ: 2.367 tấn acid picric, 62 tấn nitrocellulose, 250 tấn TNT và 246 tấn dầu benzen.
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/at-the-same-time-the-ss-mont-blanc-was-bound-to-return-to-france-carrying-a-host-of-highly-explosive-materials-2367-tons-of-picric-acid-62-tons-of-guncotton-250-tons-of-tnt-and-246-tons-of-benzol-1469714798934/vunolonnhatlichsutruockhibomnguyenturadoidaxayranhuthenao.jpg" style="margin:0px" />
<p>C&ugrave;ng l&uacute;c ấy, con t&agrave;u SS Mont Blanc đang tr&ecirc;n đường trở về đất mẹ Ph&aacute;p, mang theo rất nhiều vật liệu nổ: 2.367 tấn acid picric, 62 tấn nitrocellulose, 250 tấn TNT v&agrave; 246 tấn dầu benzen.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
<img alt="
Để rời cảng, 2 con tàu phải đi qua một kênh nhỏ. Chiếc tàu Imo đã chậm lịch, đi ngược chiều kênh và từ chối nhường đường cho chiếc Mont Blance, và 2 tàu va chạm với nhau.
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/to-exit-the-bedford-basin-where-the-ships-were-docked-they-had-to-pass-through-a-slim-channel-the-imo-behind-schedule-and-on-the-wrong-side-of-the-channel-refused-to-give-way-and-crashed-into-the-mont-blanc-1469715534225/vunolonnhatlichsutruockhibomnguyenturadoidaxayranhuthenao.jpg" style="margin:0px" />
<p>Để rời cảng, 2 con t&agrave;u phải đi qua một k&ecirc;nh nhỏ. Chiếc t&agrave;u Imo đ&atilde; chậm lịch, đi ngược chiều k&ecirc;nh v&agrave; từ chối nhường đường cho chiếc Mont Blance, v&agrave; 2 t&agrave;u va chạm với nhau.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
<img alt="
Dù chỉ va chạm ở tốc độ chậm, nhưng từng đó lực tác động cũng khiến những thùng dầu benzen tràn ra ngoài, tia lửa từ vụ va chạm đã làm cho nhiên liệu benzen phát nổ, kéo theo toàn bộ các chất gây nổ khác có trên tàu, ước đoán sức nổ lên tới tương đương 2.989 tấn TNT.
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/though-the-collision-occurred-at-low-speed-the-barrels-of-benzol-spilled-and-sparks-from-the-crash-ignited-the-fuel-minutes-later-the-mont-blanc-exploded-with-the-force-of-2989-tons-of-tnt-1469715643071/vunolonnhatlichsutruockhibomnguyenturadoidaxayranhuthenao.jpg" style="margin:0px" />
<p>D&ugrave; chỉ va chạm ở tốc độ chậm, nhưng từng đ&oacute; lực t&aacute;c động cũng khiến những th&ugrave;ng dầu benzen tr&agrave;n ra ngo&agrave;i, tia lửa từ vụ va chạm đ&atilde; l&agrave;m cho nhi&ecirc;n liệu benzen ph&aacute;t nổ, k&eacute;o theo to&agrave;n bộ c&aacute;c chất g&acirc;y nổ kh&aacute;c c&oacute; tr&ecirc;n t&agrave;u, ước đo&aacute;n sức nổ l&ecirc;n tới tương đương 2.989 tấn TNT.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
<img alt="
Sóng xung kích từ vụ nổ đã san bằng vùng Richmond gần đó. Nhiệt độ vụ nổ lên tới gần 5.000 °C. Nước xung quanh tàu Mont Blanc bị đẩy thành một cơn sóng thần 16 m tràn vào bờ.
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/4-1469716324376/vunolonnhatlichsutruockhibomnguyenturadoidaxayranhuthenao.jpg" style="margin:0px" />
<p>S&oacute;ng xung k&iacute;ch từ vụ nổ đ&atilde; san bằng v&ugrave;ng Richmond gần đ&oacute;. Nhiệt độ vụ nổ l&ecirc;n tới gần 5.000 &deg;C. Nước xung quanh t&agrave;u Mont Blanc bị đẩy th&agrave;nh một cơn s&oacute;ng thần 16 m tr&agrave;n v&agrave;o bờ.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
<img alt="
Lực từ vụ nổ đã ném bay con tàu Imo lên bờ, còn tàu Mont Blanc nổ tung và gần như không còn mảnh xác nào còn sót lại.
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/5-1469716572343/vunolonnhatlichsutruockhibomnguyenturadoidaxayranhuthenao.jpg" style="margin:0px" />
<p>Lực từ vụ nổ đ&atilde; n&eacute;m bay con t&agrave;u Imo l&ecirc;n bờ, c&ograve;n t&agrave;u Mont Blanc nổ tung v&agrave; gần như kh&ocirc;ng c&ograve;n mảnh x&aacute;c n&agrave;o c&ograve;n s&oacute;t lại.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
<img alt="
Một mảnh mỏ neo nặng hơn nửa tấn được tìm thấy cách trung tâm vụ nổ 3 km, một nòng súng trên tàu văng xa hơn 5 km.
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/6-1469716664097/vunolonnhatlichsutruockhibomnguyenturadoidaxayranhuthenao.jpg" style="margin:0px" />
<p>Một mảnh mỏ neo nặng hơn nửa tấn được t&igrave;m thấy c&aacute;ch trung t&acirc;m vụ nổ 3 km, một n&ograve;ng s&uacute;ng tr&ecirc;n t&agrave;u văng xa hơn 5 km.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
<img alt="
Gần như toàn bộ thành phố cảng bị san bằng, hơn 12.000 tòa nhà bị phá hủy, khiến nhiều người dân phải sống trong cảnh không nhà khi mà mùa đông đang sắp tới. Báo cáo cho biết có những cửa kính cách xa vụ nổ 80 km cũng bị hư hại.
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/almost-every-window-in-the-city-shattered-some-reportedly-50-miles-away-even-the-buildings-left-standing-were-severely-damaged-1469717197891/vunolonnhatlichsutruockhibomnguyenturadoidaxayranhuthenao.jpg" style="margin:0px" />
<p>Gần như to&agrave;n bộ th&agrave;nh phố cảng bị san bằng, hơn 12.000 t&ograve;a nh&agrave; bị ph&aacute; hủy, khiến nhiều người d&acirc;n phải sống trong cảnh kh&ocirc;ng nh&agrave; khi m&agrave; m&ugrave;a đ&ocirc;ng đang sắp tới. B&aacute;o c&aacute;o cho biết c&oacute; những cửa k&iacute;nh c&aacute;ch xa vụ nổ 80 km cũng bị hư hại.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
<img alt="
Có khoảng 1.600 người chết ngay lập tức bởi ảnh hưởng từ vụ nổ. Con số thương vong lên tới 9.000 người, bằng với 22% dân số thành phố.
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/7-1469717362727/vunolonnhatlichsutruockhibomnguyenturadoidaxayranhuthenao.jpg" style="margin:0px" />
<p>C&oacute; khoảng 1.600 người chết ngay lập tức bởi ảnh hưởng từ vụ nổ. Con số thương vong l&ecirc;n tới 9.000 người, bằng với 22% d&acirc;n số th&agrave;nh phố.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
<img alt="
Con số thương vong có thể đã cao hơn, nếu không có sự ngăn chặn kịp thời của Vincent Coleman, một viên chỉ huy đường ray tòa hỏa. Ông đã cho dừng một đoàn tàu chở 300 hành khách, chuẩn bị tới nhà ga ngay trước những con tàu vừa va chạm.
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/8-1469717462206/vunolonnhatlichsutruockhibomnguyenturadoidaxayranhuthenao.jpg" style="margin:0px" />
<p>Con số thương vong c&oacute; thể đ&atilde; cao hơn, nếu kh&ocirc;ng c&oacute; sự ngăn chặn kịp thời của Vincent Coleman, một vi&ecirc;n chỉ huy đường ray t&ograve;a hỏa. &Ocirc;ng đ&atilde; cho dừng một đo&agrave;n t&agrave;u chở 300 h&agrave;nh kh&aacute;ch, chuẩn bị tới nh&agrave; ga ngay trước những con t&agrave;u vừa va chạm.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
<img alt="
Bức điện tín cảnh báo mà ông Coleman đã gửi có nội dung: Hãy dừng đoàn tàu lại. Tàu chở đạn tại Cảng số 6 sắp nổ. Có vẻ như đây là thông điệp cuối cùng mà tôi sẽ gửi đi. Tạm biệt các anh.
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/9-1469717580680/vunolonnhatlichsutruockhibomnguyenturadoidaxayranhuthenao.jpg" style="margin:0px" />
<p>Bức điện t&iacute;n cảnh b&aacute;o m&agrave; &ocirc;ng Coleman đ&atilde; gửi c&oacute; nội dung: &quot;H&atilde;y dừng đo&agrave;n t&agrave;u lại. T&agrave;u chở đạn tại Cảng số 6 sắp nổ. C&oacute; vẻ như đ&acirc;y l&agrave; th&ocirc;ng điệp cuối c&ugrave;ng m&agrave; t&ocirc;i sẽ gửi đi. Tạm biệt c&aacute;c anh&quot;.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
<img alt="
Vụ nổ tại Halifax là vụ nổ nhân tạo lớn nhất lịch sử, trước khi nước Mỹ bắt đầu thử bom nguyên tử năm 1945.
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/10-1469718035823/vunolonnhatlichsutruockhibomnguyenturadoidaxayranhuthenao.jpg" style="margin:0px" />
<p>Vụ nổ tại Halifax l&agrave; vụ nổ nh&acirc;n tạo lớn nhất lịch sử, trước khi nước Mỹ bắt đầu thử bom nguy&ecirc;n tử năm 1945.</p>

<p>&nbsp;</p>
',N'Vụ nổ lớn nhất lịch sử trước khi bom nguyên tử ra đời đã xảy ra như thế nào?',N'Vụ nổ san bằng thành phố cảng Halifax và hành động anh dũng của chỉ huy Vincent Coleman sẽ được lưu lại mãi mãi trong lịch sử.
',N'publish',N'vu-no-lon-nhat-lich-su-truoc-khi-bom-nguyen-tu-ra-doi-da-xay-ra-nhu-the-nao',{ts '2016-07-29 18:52:14.973'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
69,1,{ts '2016-07-29 18:53:57.897'},N'<p>Th&ocirc;ng tin về con chip mới Exynos 8895 của Samsung vừa bất ngờ xuất hiện tr&ecirc;n website Zauba của Ấn Độ.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/exynos-1469782106003/lodienchipexynos8895moicuasamsungdoithucuasnapdragon821.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Theo website chuy&ecirc;n quản l&yacute; xuất/nhập khẩu Zauba của Ấn Độ, Samsung vừa gửi hai bảng mạch v&agrave;o nước n&agrave;y để thử nghiệm. Điều th&uacute; vị l&agrave; c&oacute; sự xuất hiện của con chip Exynos 8895 chưa từng được Samsung c&ocirc;ng bố trước đ&acirc;y.</p>

<p>Con chip cao cấp nhất của Samsung hiện nay l&agrave; Exynos 8890 đang được sử dụng cho bộ đ&ocirc;i Galaxy S7 v&agrave; Galaxy S7 Edge. Gần đ&acirc;y, một đoạn video r&ograve; rỉ cho thấy nguy&ecirc;n mẫu chiếc điện thoại Galaxy Note7 cũng sử dụng chipset Exynos 8890.</p>

<p>Trước đ&oacute;, cũng từng xuất hiện th&ocirc;ng tin Galaxy Note7 sẽ sử dụng chipset Exynos 8893 nhưng hiện vẫn kh&ocirc;ng c&oacute; th&ocirc;ng tin n&agrave;o về con chip n&agrave;y.</p>

<p>Về thiết kế, Exynos 8895 kh&ocirc;ng c&oacute; nhiều kh&aacute;c biệt so với Snapdragon 821 m&agrave; Qualcomm vừa giới thiệu hồi đầu th&aacute;ng. D&ugrave; cũng sử dụng 4 nh&acirc;n Kryo nhưng con chip mới của Qualcomm nhanh hơn 10% đến 25% so với Snapdragon 820. Trong đ&oacute;, cụm nh&acirc;n hiệu suất cao c&oacute; tốc độ xung nhịp 2.4 GHz, cụm nh&acirc;n c&ograve;n lại c&oacute; tốc độ xung nhịp 2.2 GHz. Mới đ&acirc;y, th&ocirc;ng tin về con chip Snapdragon 830 tiếp theo của Qualcomm cũng đ&atilde; bị r&ograve; rỉ tr&ecirc;n mạng x&atilde; hội Weibo của Trung Quốc.</p>

<p>Trong bối cảnh đ&oacute;, c&aacute;c nh&agrave; ph&acirc;n t&iacute;ch hi vọng&nbsp;<a href="http://genk.vn/exynos.htm" target="_blank">Exynos</a>&nbsp;8895 sẽ l&agrave; con chip đầu bảng tiếp theo của Samsung v&agrave; sẽ xuất hiện tr&ecirc;n chiếc điện thoại Galaxy S8 trong năm tới.</p>
',N'Lộ diện chip Exynos 8895 mới của Samsung, đối thủ của Snapdragon 821',N'Zauba - website quản lý xuất nhập khẩu của Ấn Độ đã vô tình tiết lộ con chip mới Exynos 8895 của Samsung.
',N'publish',N'lo-dien-chip-exynos-8895-moi-cua-samsung-doi-thu-cua-snapdragon-821',{ts '2016-07-29 18:53:00.000'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
70,1,{ts '2016-07-29 18:56:08.723'},N'<p>Nh&igrave;n v&agrave;o biểu đồ dưới đ&acirc;y, ch&uacute;ng ta c&oacute; thể thấy r&otilde;&nbsp;<a href="http://genk.vn/apple.htm" target="_blank">Apple</a>&nbsp;phụ thuộc v&agrave;o iPhone như thế n&agrave;o. Kể từ khi ra mắt chiếc iPhone đầu ti&ecirc;n v&agrave;o năm 2007, người ta đ&atilde; mặc định&nbsp;g&aacute;n sự&nbsp;th&agrave;nh c&ocirc;ng của Apple với những chiếc iPhone. Tho&aacute;t khỏi c&aacute;i b&oacute;ng iPhone, Apple chả l&agrave; c&aacute;i g&igrave; cả.</p>

<p>&nbsp;</p>
<img alt="
Doanh thu theo sản phẩm từng quý trên toàn cầu của Apple (tỷ USD).
" src="http://genknews.genkcdn.vn/k:2016/1-decheapplesau5namtukhithuyentruongtimcooklennamquyen-1469767978757/thanhboiiphonebaiboiiphonedadenlucapplecanhoctapsamsung.jpg" style="margin:0px" />
<p>Doanh thu theo sản phẩm từng qu&yacute; tr&ecirc;n to&agrave;n cầu của Apple (tỷ USD).</p>

<p>&nbsp;</p>

<p>Đ&oacute; l&agrave; sự thật, bởi khi doanh số iPhone sụt giảm ch&uacute;ng ta c&oacute; thể thấy Apple bị ảnh hưởng nặng nề đến như thế n&agrave;o. H&atilde;y nh&igrave;n v&agrave;o biểu đồ doanh thu của Apple v&agrave; doanh số b&aacute;n ra của iPhone, c&oacute; một sự giống nhau đến kỳ lạ.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/1-decheapplesau5namtukhithuyentruongtimcooklennamquyen-1469768005047/thanhboiiphonebaiboiiphonedadenlucapplecanhoctapsamsung.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>&nbsp;</p>
<img alt="
Đồ thị doanh thu và doanh số iPhone của Apple rất giống nhau, kể từ năm 2011 đến nay.
" src="http://genknews.genkcdn.vn/k:2016/1-decheapplesau5namtukhithuyentruongtimcooklennamquyen-1469768018971/thanhboiiphonebaiboiiphonedadenlucapplecanhoctapsamsung.jpg" style="margin:0px" />
<p>Đồ thị doanh thu v&agrave; doanh số iPhone của Apple rất giống nhau, kể từ năm 2011 đến nay.</p>

<p>&nbsp;</p>

<p>Trong khi đ&oacute;, iPad hay m&aacute;y t&iacute;nh Mac chỉ l&agrave; những sản phẩm phụ v&agrave; t&ocirc; điểm v&agrave;o bản b&aacute;o c&aacute;o t&agrave;i ch&iacute;nh của Apple. Tr&ecirc;n thực tế những sản phẩm n&agrave;y kh&ocirc;ng qu&aacute; ảnh hưởng đến doanh thu của Apple, thậm ch&iacute; c&oacute; l&uacute;c doanh thu Apple tăng trưởng mạnh khi doanh số iPad sụt giảm th&ecirc; thảm.</p>

<p>&ldquo;Th&agrave;nh bởi iPhone, bại bởi iPhone&rdquo;, đ&oacute; l&agrave; những g&igrave; người ta nhận x&eacute;t về Apple trong t&igrave;nh h&igrave;nh hiện nay. Đ&atilde; 2 qu&yacute; li&ecirc;n tiếp Apple b&aacute;o c&aacute;o sụt giảm về doanh thu, kh&ocirc;ng n&oacute;i chắc ch&uacute;ng ta cũng c&oacute; thể đo&aacute;n nguy&ecirc;n nh&acirc;n ch&iacute;nh l&agrave; do doanh số iPhone sụt giảm.</p>

<p>&nbsp;</p>
<img alt="
iPhone đã đưa Apple lên đỉnh cao, nhưng cũng đã nhấn chìm Apple.
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/1-gettyimages-455691914-1-1469767584165/thanhboiiphonebaiboiiphonedadenlucapplecanhoctapsamsung.jpg" style="margin:0px" />
<p>iPhone đ&atilde; đưa Apple l&ecirc;n đỉnh cao, nhưng cũng đ&atilde; nhấn ch&igrave;m Apple.</p>

<p>&nbsp;</p>

<p>Mặc d&ugrave; với những chiến lược kinh doanh đại t&agrave;i của CEO Tim Cook, Apple vẫn c&oacute; thể kiếm được tiền, thậm ch&iacute; l&agrave; rất nhiều tiền. Nhưng nếu như tiếp tục kh&ocirc;ng c&oacute; sự thay đổi về cả sản phẩm, lẫn những dự &aacute;n mới, một Apple chỉ sống dựa v&agrave;o iPhone sẽ kh&ocirc;ng thể tồn tại được m&atilde;i m&atilde;i.</p>

<p>Thế giới c&ocirc;ng nghệ c&oacute; một quy tắc v&ocirc; c&ugrave;ng khắc nghiệt, đ&oacute; l&agrave; nếu kh&ocirc;ng thay đổi đồng nghĩa với chết. Ngay cả khi bạn thay đổi, nhưng qu&aacute; chậm th&igrave; bạn cũng chết. iPhone của Apple đang như vậy, thay đổi qu&aacute; chậm v&agrave; khiến cho Apple phải trả gi&aacute; bằng kết quả kinh doanh yếu k&eacute;m.</p>

<p><strong>Đ&atilde; đến l&uacute;c cần phải học tập Samsung</strong></p>

<p>C&oacute; thể n&oacute;i t&igrave;nh cảnh hiện nay của Apple rất giống với&nbsp;<a href="http://genk.vn/samsung.htm" target="_blank">Samsung</a>&nbsp;2 năm trước đ&acirc;y, l&uacute;c đ&oacute; h&atilde;ng smartphone H&agrave;n Quốc vừa ra mắt &ldquo;bom tấn&rdquo; Galaxy S5. Thế nhưng chiếc smartphone n&agrave;y kh&ocirc;ng c&oacute; nhiều sự thay đổi, dẫn tới việc doanh số sụt giảm v&agrave; Samsung l&acirc;m v&agrave;o t&igrave;nh cảnh kh&oacute; khăn.</p>

<p>Mảng kinh doanh smartphone của h&atilde;ng điện thoại h&agrave;ng đầu thế giới Samsung bị v&iacute; giống như một đống b&ugrave;n lầy. Bởi thực tế, Samsung vẫn kh&ocirc;ng thể t&igrave;m ra được lối tho&aacute;t cho mảng smartphone của m&igrave;nh.</p>

<p>&nbsp;</p>
<img alt="
Samsung đã từng gặp rất nhiều khó khăn với mảng smartphone, trong năm 2014 -2015.
" src="http://genknews.genkcdn.vn/k:2016/1-201406041814418969-root-samsung-galaxy-s4-google-play-edition-gt-i9505g-1469768161654/thanhboiiphonebaiboiiphonedadenlucapplecanhoctapsamsung.jpg" style="margin:0px" />
<p>Samsung đ&atilde; từng gặp rất nhiều kh&oacute; khăn với mảng smartphone, trong năm 2014 -2015.</p>

<p>&nbsp;</p>

<p>Tuy nhi&ecirc;n trong t&igrave;nh cảnh m&agrave; mảng kinh doanh cốt l&otilde;i l&agrave; smartphone gặp rất nhiều kh&oacute; khăn, Samsung đ&atilde; biết c&aacute;ch để gi&uacute;p m&igrave;nh kh&ocirc;ng bị ch&igrave;m trong đống b&ugrave;n lầy đ&oacute;. Thứ đ&atilde; gi&uacute;p Samsung vực dậy t&igrave;nh h&igrave;nh kinh doanh trong thời khắc đen tối đ&oacute; ch&iacute;nh l&agrave; mảng sản xuất vi xử l&yacute;.</p>

<p>Trong Q4/2014, khi m&agrave; Samsung sụt giảm nghi&ecirc;m trọng cả doanh thu lẫn doanh số smartphone. Ch&iacute;nh mảng sản xuất vi xử l&yacute; đ&atilde; đem về lợi nhuận kỷ lục 2,7 ngh&igrave;n tỷ Won (2,4 tỷ USD), mặc d&ugrave; kh&ocirc;ng phải l&agrave; nhiều so với sự sụt giảm của mảng smartphone nhưng đ&atilde; gi&uacute;p Samsung vực dậy t&igrave;nh h&igrave;nh kinh doanh.</p>

<p>Đ&oacute; cũng l&agrave; l&yacute; do m&agrave; Samsung bắt đầu tập trung v&agrave;o việc sản xuất vi xử l&yacute; cho Apple trong năm tiếp theo. Samsung đ&atilde; dạy cho ch&uacute;ng ta một b&agrave;i học, đ&oacute; l&agrave; đ&ocirc;i khi cuộc đời thay đổi theo c&aacute;ch m&agrave; ch&uacute;ng ta kh&ocirc;ng hề muốn, v&igrave; vậy điều cần l&agrave;m l&agrave; lu&ocirc;n th&iacute;ch nghi để tồn tại chứ kh&ocirc;ng phải giữ một suy nghĩ bảo thủ rằng m&igrave;nh lu&ocirc;n lu&ocirc;n đ&uacute;ng.</p>

<p>&nbsp;</p>
<img alt="
Chuyển hướng tập trung vào sản xuất chip xử lý cho các nhà sản xuất khác như Apple, đã giúp Samsung tồn tại qua khó khăn.
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/1-960-apple-inc-a9-chips-to-be-built-by-samsung-electronics-1469768216133/thanhboiiphonebaiboiiphonedadenlucapplecanhoctapsamsung.jpg" style="margin:0px" />
<p>Chuyển hướng tập trung v&agrave;o sản xuất chip xử l&yacute; cho c&aacute;c nh&agrave; sản xuất kh&aacute;c như Apple, đ&atilde; gi&uacute;p Samsung tồn tại qua kh&oacute; khăn.</p>

<p>&nbsp;</p>

<p>Việc chấp nhận tạm thời từ bỏ mảng smartphone để tập trung v&agrave;o sản xuất chip xử l&yacute;, linh kiện v&agrave; m&agrave;n h&igrave;nh cho c&aacute;c h&atilde;ng kh&aacute;c, ch&iacute;nh l&agrave; một chiếc lược đ&uacute;ng đắn gi&uacute;p Samsung c&oacute; thể tồn tại trong thời kỳ kh&oacute; khăn. Sau 2 năm, đến nay mảng smartphone của Samsung đ&atilde; được hồi sinh v&agrave; c&oacute; thể coi l&agrave; th&agrave;nh c&ocirc;ng nhờ bộ đ&ocirc;i Galaxy S7/S7 edge.</p>

<p>Kh&ocirc;ng chỉ Samsung, rất nhiều c&ocirc;ng ty c&ocirc;ng nghệ tr&ecirc;n thế giới cũng đang cố gắng ph&aacute;t triển 2 mảng kinh doanh mũi nhọn song song nhau. Đề ph&ograve;ng một mảng kinh doanh gặp kh&oacute; khăn, th&igrave; c&ocirc;ng ty cũng kh&ocirc;ng bị ảnh hưởng qu&aacute; nhiều.</p>

<p>Microsoft, Google hay Amazon đều đang hướng đến điện to&aacute;n đ&aacute;m m&acirc;y b&ecirc;n cạnh mảng kinh doanh cốt l&otilde;i của m&igrave;nh. Samsung, LG th&igrave; nghi&ecirc;n cứu v&agrave; sản xuất linh kiện, m&agrave;n h&igrave;nh cho c&aacute;c h&atilde;ng kh&aacute;c, b&ecirc;n cạnh đ&oacute; c&ograve;n c&oacute; cả mảng thiết bị điện tử.</p>

<p>&nbsp;</p>
<img alt="
Apple vẫn đang loay hoay tìm một hướng đi khác, để không còn phụ thuộc vào iPhone.
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/1-applewatch-12-1469768294598/thanhboiiphonebaiboiiphonedadenlucapplecanhoctapsamsung.jpg" style="margin:0px" />
<p>Apple vẫn đang loay hoay t&igrave;m một hướng đi kh&aacute;c, để kh&ocirc;ng c&ograve;n phụ thuộc v&agrave;o iPhone.</p>

<p>&nbsp;</p>

<p>Trong khi đ&oacute;, Apple vẫn chỉ c&oacute; iPhone.&nbsp;<a href="http://genk.vn/nhin-vao-bieu-do-nay-ta-thay-apple-dang-khat-khao-tim-huong-di-moi-ngoai-iphone-20160727111213982.chn" target="_blank">Mặc d&ugrave; Apple đ&atilde; đổ rất rất nhiều tiền v&agrave;o R&amp;D</a>, để cố gắng t&igrave;m ra một sản phẩm mũi nhọn mới, một hướng đi mới. Nhưng cho đến nay, những thứ như xe điện tự l&aacute;i, c&ocirc;ng nghệ thực tế ảo tất cả vẫn chỉ dừng ở mức tin đồn.</p>

<p>Đ&atilde; đến l&uacute;c để Apple học tập Samsung v&agrave; c&aacute;c c&ocirc;ng ty c&ocirc;ng nghệ kh&aacute;c, để c&oacute; thể sống khỏe ngay cả khi iPhone &ldquo;chết&rdquo;. Thật sự, t&ocirc;i cũng kh&ocirc;ng biết phải gọi Apple l&agrave; &ldquo;nh&agrave; sản xuất&hellip;&rdquo; h&atilde;y &ldquo;h&atilde;ng c&ocirc;ng nghệ&hellip;&rdquo; g&igrave; nếu họ kh&ocirc;ng c&ograve;n c&oacute; iPhone.</p>
',N'“Thành bởi iPhone, bại bởi iPhone” - Đã đến lúc Apple cần học tập Samsung',N'Apple đã quá phụ thuộc vào iPhone, trong khi Samsung luôn có một chiến lược dự phòng nếu như mảng smartphone gặp khó khăn.
',N'publish',N'thanh-boi-iphone-bai-boi-iphone-da-den-luc-apple-can-hoc-tap-samsung',{ts '2016-07-29 18:56:08.723'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
71,1,{ts '2016-07-29 18:57:15.613'},N'<p><strong>Op-amp l&agrave; g&igrave;?</strong></p>

<p>&nbsp;</p>
<img alt="
Một số mẫu op-amp cỡ nhỏ (monolithic).
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/65aacf8b-2013-04-2209-58-10-1469598993919/opampgiaiphapcuchaychonhungnguoikhongmuontroiamplivaomotchatamduynhat.jpg" style="margin:0px" />
<p>Một số mẫu op-amp cỡ nhỏ (monolithic).</p>

<p>&nbsp;</p>

<p>Ch&uacute;ng t&ocirc;i đ&atilde; c&oacute; lần chia sẻ với bạn đọc về&nbsp;<a href="http://genk.vn/nghe-nhin/am-thanh-ma-thuat-dang-sau-nhung-bong-den-le-loi-2016040322500771.chn" target="_blank">&acirc;m thanh analog tr&ecirc;n những chiếc amp đ&egrave;n</a>. Thế nhưng, bất chấp sự hấp dẫn của &acirc;m thanh analog n&agrave;y, những chiếc amp đ&egrave;n vẫn c&oacute; một số điểm yếu ri&ecirc;ng: phần lớn amp đ&egrave;n chỉ hợp với tai nghe trở cao v&agrave; cũng kh&oacute; k&eacute;o được những chiếc tai nghe &quot;ăn d&ograve;ng&quot; qu&aacute; nhiều; amp đ&egrave;n kh&ocirc;ng thể b&igrave; kịp amp rắn về độ chi tiết v&agrave; ch&iacute;nh x&aacute;c; b&oacute;ng đ&egrave;n thuộc nh&oacute;m sản phẩm kh&oacute; vận chuyển v&agrave; bảo quản... Cuối c&ugrave;ng, nguồn đ&egrave;n tại Việt Nam kh&ocirc;ng qu&aacute; phong ph&uacute; v&agrave; việc ship h&agrave;ng từ eBay sẽ lu&ocirc;n tồn tại những trở ngại nhất định.</p>

<p>Những đặc điểm n&agrave;y l&agrave; l&yacute; do v&igrave; sao nhiều người vẫn gắn b&oacute; với amp thể rắn bất chấp những &acirc;m thanh hấp dẫn v&agrave; khả năng t&ugrave;y biến tối đa m&agrave; amp đ&egrave;n mang lại.</p>

<p>Thật may mắn, điều n&agrave;y kh&ocirc;ng c&oacute; nghĩa rằng c&aacute;c fan của amp thể rắn sẽ bị &quot;tr&oacute;i&quot; v&agrave;o một chất &acirc;m duy nhất. Tr&aacute;i lại, bằng c&aacute;ch thay đổi một &quot;con chip&quot; nhỏ c&oacute; t&ecirc;n gọi &quot;op-amp&quot; tr&ecirc;n bo mạch của ampli, bạn c&oacute; thể thay đổi được chất &acirc;m của chiếc amp y&ecirc;u qu&yacute;.</p>

<p>&nbsp;</p>
<img alt="
Một số mẫu opamp cỡ lớn đình đám trên thị trường: Burson V5i, Burson V5 SS, Sparko Labs SS3602 và SIL 994.
" src="http://genknews.genkcdn.vn/k:2016/img-0119-copy-1469598993958/opampgiaiphapcuchaychonhungnguoikhongmuontroiamplivaomotchatamduynhat.jpg" style="margin:0px" />
<p>Một số mẫu opamp cỡ lớn đ&igrave;nh đ&aacute;m tr&ecirc;n thị trường: Burson V5i, Burson V5 SS, Sparko Labs SS3602 v&agrave; SIL 994.</p>

<p>&nbsp;</p>

<p>Vậy th&igrave; &quot;Op-amp&quot; l&agrave; g&igrave;? N&oacute;i một c&aacute;ch đơn giản, đ&acirc;y l&agrave; mạch điện tử d&ugrave;ng để khuếch đại t&iacute;n hiệu tr&ecirc;n ampli (b&ecirc;n cạnh nhiều c&ocirc;ng dụng kh&aacute;c m&agrave; ch&uacute;ng ta sẽ kh&ocirc;ng nhắc tới ở đ&acirc;y). Trong thế giới audiophile, op-amp thường l&agrave; một bo mạch c&oacute; k&iacute;ch cỡ bằng m&oacute;ng tay &uacute;t với 8 ch&acirc;n kết nối. T&ugrave;y v&agrave;o loại thiết bị, bạn c&oacute; thể sử dụng op-amp dual (phổ biến hơn) hoặc single.</p>

<p><strong>Phi&ecirc;n bản solid-state của b&oacute;ng đ&egrave;n</strong></p>

<p>Do đ&oacute;ng vai tr&ograve; l&agrave; bộ phận khuếch đại t&iacute;n hiệu tr&ecirc;n &acirc;m-li n&ecirc;n op-amp cũng c&oacute; ảnh hưởng rất nhiều tới chất &acirc;m. C&aacute;c mẫu op-amp c&oacute; mặt tr&ecirc;n thị trường v&igrave; vậy cũng v&ocirc; c&ugrave;ng phong ph&uacute; với c&aacute;c mức gi&aacute; kh&aacute;c nhau. Rẻ tiền nhất c&oacute; thể kể tới c&aacute;c mẫu op-amp chưa đến 1 USD như NJM2068 hoặc c&aacute;c loại op-amp được gắn tr&ecirc;n amp Trung Quốc, thường c&oacute; m&atilde; hiệu bắt đầu bằng cụm chữ &quot;CHN&quot;. Ở th&aacute;i cực c&ograve;n lại l&agrave; c&aacute;c mẫu op-amp c&oacute; gi&aacute; đắt hơn cả c&aacute;c mẫu amp của Fiio hoặc iBasso, v&iacute; dụ như chiếc Burson V5 SS (70 USD, tức khoảng 1,6 triệu đồng) hoặc Sparko (80 USD, tức khoảng 1,8 triệu đồng).</p>

<p>&nbsp;</p>
<img alt="Sparko Labs SS3602 trên card sound ASUS." src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/900x900px-ll-927b116b-imag0030-1469598993874/opampgiaiphapcuchaychonhungnguoikhongmuontroiamplivaomotchatamduynhat.jpg" style="margin:0px" /><br />
Sparko Labs SS3602 tr&ecirc;n card sound ASUS.
<p>&nbsp;</p>

<p>Bạn sẽ nhận được g&igrave; khi thay thế op-amp cho chiếc headamp y&ecirc;u qu&iacute; của m&igrave;nh? C&acirc;u trả lời l&agrave; chất lượng &acirc;m thanh được &quot;cởi tr&oacute;i&quot;. Thị trường audiophile những năm gần đ&acirc;y đ&atilde; đ&aacute;nh dấu những bước tiến vượt bậc tr&ecirc;n ph&acirc;n kh&uacute;c tầm thấp, khi ngay cả những chiếc amp gi&aacute; rẻ cũng c&oacute; thể mang lại chất lượng ngang h&agrave;ng hoặc vượt trội sản phẩm gi&aacute; cao hơn từ c&aacute;c h&atilde;ng T&acirc;y &Acirc;u như Schiit hoặc CEntrance. Tuy vậy, cuối c&ugrave;ng th&igrave; amp gi&aacute; rẻ vẫn đ&ograve;i hỏi phải cắt bỏ chi ph&iacute;, v&agrave; những chiếc op-amp gi&aacute; rẻ lu&ocirc;n l&agrave; nạn nh&acirc;n đầu ti&ecirc;n trong h&agrave;nh tr&igrave;nh cắt giảm chi ph&iacute; của c&aacute;c h&atilde;ng Trung Quốc như iBasso, Little Dot hoặc xDuoo.</p>

<p>Điều n&agrave;y c&oacute; nghĩa rằng ngay cả những chiếc amp DAC ngh&igrave;n đ&ocirc; như Aune S16 c&oacute; chất lượng ở mức 60% tiềm năng v&igrave; mạch amp của sản phẩm n&agrave;y kh&aacute; k&eacute;m cỏi. Nhưng nếu đầu tư v&agrave;o op-amp, bạn sẽ ph&aacute;t huy được tối đa tiềm năng của S16 v&agrave; cũng sẽ tiết kiệm được đ&aacute;ng kể chi ph&iacute; cần phải bỏ ra để đầu tư v&agrave;o một chiếc amp mới để kết hợp c&ugrave;ng DAC tr&ecirc;n S16.</p>

<p><strong>Kh&ocirc;ng một kh&oacute; khăn cho d&acirc;n chơi Việt</strong></p>

<p>Đ&acirc;u l&agrave; những trở ngại cho th&uacute; chơi op-amp? Việc thay op-amp thường đ&ograve;i hỏi người d&ugrave;ng phải th&aacute;o vỏ m&aacute;y v&agrave; do đ&oacute; c&oacute; thể g&acirc;y ra suy nghĩ rằng đ&acirc;y l&agrave; một th&uacute; chơi d&agrave;nh ri&ecirc;ng cho những người th&iacute;ch vọc vạch v&agrave; c&oacute; hiểu biết nhất định về điện tử. Đ&acirc;y l&agrave; một suy nghĩ ho&agrave;n to&agrave;n sai lầm. Tất cả những g&igrave; bạn cần để tham gia th&uacute; chơi n&agrave;y chỉ l&agrave; một chiếc tuốc-nơ-v&iacute;t để mở phần vỏ của amp v&agrave; dĩ nhi&ecirc;n l&agrave; một mẫu op-amp ph&ugrave; hợp với sở th&iacute;ch của m&igrave;nh. Do op-amp l&agrave; bộ phận dễ thay thế nhất tr&ecirc;n headamp, những &quot;con chip&quot; nhỏ b&eacute; n&agrave;y cũng l&agrave; ch&igrave;a kh&oacute;a để ngay cả những tay chơi &quot;g&agrave; mờ&quot; cũng c&oacute; thể ph&aacute;t huy tối đa nội lực tr&ecirc;n ampli của m&igrave;nh.</p>

<p>&nbsp;</p>
<img alt="Khác với các mặt hàng điện tử khác, quá trình ship op-amp về Việt Nam thường không gây ra bất cứ phiền nhiễu nào cho người mua." src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/123xcv-copy-1469598993930/opampgiaiphapcuchaychonhungnguoikhongmuontroiamplivaomotchatamduynhat.jpg" style="margin:0px" /><br />
Kh&aacute;c với c&aacute;c mặt h&agrave;ng điện tử kh&aacute;c, qu&aacute; tr&igrave;nh ship op-amp về Việt Nam thường kh&ocirc;ng g&acirc;y ra bất cứ phiền nhiễu n&agrave;o cho người mua.
<p>&nbsp;</p>

<p>Một khi đ&atilde; nh&igrave;n thấy bo mạch, bạn sẽ dễ d&agrave;ng ph&aacute;t hiện ra vị tr&iacute; của bộ phận op-amp. Bạn cũng chẳng cần phải biết bất cứ nguy&ecirc;n tắc điện tử n&agrave;o ngoại trừ lưu &yacute; rằng op-amp phải được lắp đ&uacute;ng chiều (tr&ecirc;n op-amp bao giờ cũng c&oacute; một h&igrave;nh tr&ograve;n hoặc h&igrave;nh b&aacute;n nguyệt, tr&ecirc;n khe cắm cũng c&oacute; h&igrave;nh b&aacute;n nguyệt v&agrave; bạn phải đảm bảo để ch&uacute;ng ở c&ugrave;ng một hướng).</p>

<p>Cuối c&ugrave;ng v&agrave; quan trọng nhất, do l&agrave; những sản phẩm c&oacute; k&iacute;ch cỡ cực nhỏ v&agrave; thường được c&aacute;c h&atilde;ng vận chuyển bằng phong b&igrave; nhỏ, những chiếc op-amp của Burson hay Sparko Labs đều c&oacute; thể đến tay người d&ugrave;ng bằng c&aacute;ch đặt h&agrave;ng trực tiếp tr&ecirc;n website của nh&agrave; sản xuất. Theo kinh nghiệm c&aacute; nh&acirc;n, người viết đ&atilde; từng rất nhiều lần nhận op-amp tại nh&agrave; m&agrave; kh&ocirc;ng gặp phải bất cứ phiền to&aacute;i n&agrave;o cả. So với trải nghiệm phức tạp, tốn k&eacute;m khi muốn mua một m&oacute;n h&agrave;ng audio kh&aacute;c từ nước ngo&agrave;i, đ&acirc;y quả thật l&agrave; một niềm vui lớn lao.</p>

<p><strong>Ph&aacute;t huy nội lực của amp bằng 100.000 đồng - 2 triệu đồng</strong></p>

<p>Như ch&uacute;ng t&ocirc;i đ&atilde; khẳng định ở tr&ecirc;n,ngay cả op-amp gi&aacute; rẻ cũng c&oacute; thể mang tới sự cải thiện đ&aacute;ng ngạc nhi&ecirc;n. Phổ biến v&agrave; nổi tiếng nhất c&oacute; lẽ l&agrave; chiếc OPA2107 của BurrBrown. Ở mức gi&aacute; khoảng 20 USD trở xuống, OPA2107 mang lại &acirc;m thanh ấm &aacute;p, tự nhi&ecirc;n nhưng vẫn kh&ocirc;ng qu&aacute; b&iacute; b&aacute;ch như c&aacute;c mẫu op-amp CHN (China). Điểm yếu lớn nhất của OPA2107 l&agrave; c&oacute; qu&aacute; nhiều h&agrave;ng giả, thế nhưng đ&acirc;y cũng kh&ocirc;ng hẳn l&agrave; một điểm yếu, bởi OPA2107 giả cũng c&oacute; chất lượng kh&ocirc;ng qu&aacute; thua k&eacute;m phi&ecirc;n bản &quot;xịn&quot; của BurrBrown/Texas Instrument (mua lại BB v&agrave;o đầu thập ni&ecirc;n 2000).</p>

<p>&nbsp;</p>
<img alt="
Một trong những điểm mạnh của chiếc amp mã nguồn mở Objective2 là khả năng thay thế opamp.
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/22246615-2014-03-08-0513-1469600443446/opampgiaiphapcuchaychonhungnguoikhongmuontroiamplivaomotchatamduynhat.jpeg" style="margin:0px" />
<p>Một trong những điểm mạnh của chiếc amp m&atilde; nguồn mở Objective2 l&agrave; khả năng thay thế opamp.</p>

<p>&nbsp;</p>

<p>Ở c&ugrave;ng một ph&acirc;n kh&uacute;c gi&aacute; với OPA2017 c&ograve;n c&oacute; mẫu LM4562 của Texas Instrument v&agrave; OPA627 của BurrBrown, vốn đều l&agrave; c&aacute;c mẫu op-amp c&oacute; gi&aacute; gốc (từ eBay) chưa tới 10 USD. Trong khi LM4562 mang lại &acirc;m thanh kh&ocirc; khanh v&agrave; ch&iacute;nh x&aacute;c hơn, OPA627 mang lại chất &acirc;m ấm &aacute;p đặc trưng của BurrBrown v&agrave; c&oacute; lẽ sẽ l&agrave; lựa chọn ưa th&iacute;ch của nhiều người d&ugrave;ng O2 hoặc cMoyBB.</p>

<p>Ở ph&acirc;n kh&uacute;c gi&aacute; cao hơn một ch&uacute;t, bạn c&oacute; thể chạm tay tới một trong những thương hiệu op-amp danh tiếng nhất: MUSES với hai mẫu 8820 v&agrave; 890. Được b&aacute;n với gi&aacute; từ 10 đến 20 USD (eBay.com), hai mẫu op-amp n&agrave;y mang tới chất &acirc;m cực kỳ rộng r&atilde;i v&agrave; chi tiết v&agrave; c&oacute; thể coi l&agrave; lựa chọn hợp l&yacute; nhất cho những chiếc amp/DAC gi&aacute; rẻ đến từ Trung Quốc như xDuoo XD05 hay iBasso DB2. Tuy vậy, một số người d&ugrave;ng cũng đưa ra lời ph&agrave;n n&agrave;n rằng 8820 v&agrave; 8920 khiến cho một số mẫu tai nghe qu&aacute; thiếu nhạc t&iacute;nh trở n&ecirc;n kh&ocirc; khan hơn nữa, v&agrave; lời ph&agrave;n n&agrave;n n&agrave;y cũng &aacute;p dụng cả với 2 mẫu MUSES01 lẫn MUSES02, vốn từng được coi l&agrave; &quot;đỉnh cao&quot; của thế giới op-amp với mức gi&aacute; ch&iacute;nh h&atilde;ng từ nh&agrave; sản xuất v&agrave;o khoảng 50 USD.</p>

<p><strong>Op-amp cao cấp cho chất &acirc;m tuyệt vời nhất c&oacute; thể</strong></p>

<p>Vấn đề l&agrave; ở chỗ ngay cả những mẫu op-amp cao cấp như MUSES01 v&agrave; MUSES02 cũng vẫn c&oacute; h&agrave;ng &quot;nh&aacute;i&quot; của Trung Quốc, v&agrave; ngay cả khi c&aacute;c phi&ecirc;n bản nh&aacute;i c&oacute; chất &acirc;m kh&ocirc;ng hề tệ so với khoản tiền bỏ ra, ch&uacute;ng vẫn c&oacute; thể l&agrave;m ch&ugrave;n ch&acirc;n người d&ugrave;ng. Giải ph&aacute;p l&agrave; hai mẫu op-amp số 1 tr&ecirc;n thị trường hiện nay: Burson V5 Supreme Sound v&agrave; Sparko Labs SS3602.</p>

<p>&nbsp;</p>
<img alt="
Burson V5 SS cởi trói cho Aune S16, một chiếc amp/DAC vốn không được đánh giá cao phần amp.
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/aune-s16-opamp-upgrade-copy-1469598993946/opampgiaiphapcuchaychonhungnguoikhongmuontroiamplivaomotchatamduynhat.jpg" style="margin:0px" />
<p>Burson V5 SS &quot;cởi tr&oacute;i&quot; cho Aune S16, một chiếc amp/DAC vốn kh&ocirc;ng được đ&aacute;nh gi&aacute; cao phần amp.</p>

<p>&nbsp;</p>

<p>L&agrave; một h&atilde;ng amp nổi danh đến từ nước &Uacute;c, Burson đ&atilde; từng nhiều lần chinh phục người nghe với c&aacute;c sản phẩm &quot;đỉnh&quot; như Soloist, Conductor v&agrave; Timekeeper. Điểm yếu n&oacute;i chung của c&aacute;c d&ograve;ng sản phẩm Burson đều l&agrave; mức gi&aacute; qu&aacute; cao, v&agrave; quả thật với gi&aacute; b&aacute;n ra 80 USD (khoảng 1,8 triệu đồng), mẫu op-amp V5 Supreme Sound cũng đ&egrave; bẹp c&aacute;c đối thủ tr&ecirc;n thị trường về gi&aacute; b&aacute;n.</p>

<p>Đổi lại, người d&ugrave;ng được nhận một chiếc op-amp dạng discrete (k&iacute;ch cỡ lớn thay v&igrave; chỉ l&agrave; một &quot;con chip&quot; bằng m&oacute;ng tay như th&ocirc;ng thường) c&oacute; thiết kế đẹp v&agrave; &acirc;m thanh trong trẻo, qu&yacute; ph&aacute;i. Đặc trưng của Burson l&agrave; thứ &acirc;m thanh mềm mại, tự nhi&ecirc;n nhưng kh&ocirc;ng đ&aacute;nh đổi bằng chi tiết hay &acirc;m trường/&acirc;m h&igrave;nh &ndash; n&oacute;i c&aacute;ch kh&aacute;c, giấc mơ của những fan nhạc nhẹ. Tr&ecirc;n V5 SS, chất &acirc;m n&agrave;y được t&aacute;i hiện lại một c&aacute;ch gần như ho&agrave;n hảo, tạo ra một lựa chọn bổ sung đ&aacute;ng gi&aacute; cho cả những chiếc amp cấp thấp như xDuoo XD05, Little Dot I+ cho tới những sản phẩm cao cấp như Gustard H10 hay Aune S16.</p>

<p>&nbsp;</p>
<img alt="
Sparko Labs SS3602 cởi trói cho ASUS Xonar STX gắn trong Voodoo MS.
" src="http://genknews.genkcdn.vn/k:2016/234cv-1469600601110/opampgiaiphapcuchaychonhungnguoikhongmuontroiamplivaomotchatamduynhat.jpg" style="margin:0px" />
<p>Sparko Labs SS3602 &quot;cởi tr&oacute;i&quot; cho ASUS Xonar STX gắn trong Voodoo MS.</p>

<p>&nbsp;</p>

<p>Kh&aacute;c với Burson đ&atilde; &iacute;t nhiều c&oacute; t&ecirc;n tuổi, Sparko Labs lại được th&agrave;nh lập v&agrave; vận h&agrave;nh bởi một ch&agrave;ng trai trẻ tuổi c&oacute; th&uacute; vui DIY mang t&ecirc;n Andrew Sparks. Tuy nhỏ b&eacute; v&agrave; non trẻ nhưng Sparko đ&atilde; nhanh ch&oacute;ng thu h&uacute;t tiếng tăm lẫy lừng với mẫu SS3602 (dual) v&agrave; SS3601 (single). Ở c&ugrave;ng một mức gi&aacute; cao cấp với V5 SS, op-amp của Sparkos kh&ocirc;ng theo đuổi thứ trebles v&agrave; &acirc;m trường h&agrave;o nho&aacute;ng, thay v&agrave;o đ&oacute; tập trung v&agrave;o &acirc;m thanh trung t&iacute;nh tuyệt đối. Ph&eacute;p so s&aacute;nh giữa V5 SS v&agrave; SS3602 c&oacute; thể v&iacute; như ph&eacute;p so s&aacute;nh giữa Chord Mojo v&agrave; iFi iDSD Micro, một b&ecirc;n tập trung l&agrave;m vừa l&ograve;ng người nghe, b&ecirc;n c&ograve;n lại đi t&igrave;m sự trung thực v&agrave; ch&iacute;nh x&aacute;c của &acirc;m thanh.</p>

<p>V&agrave; cũng như V5 SS, SS3602 c&oacute; th&acirc;n h&igrave;nh kh&aacute; to lớn v&agrave; c&oacute; thể kh&ocirc;ng vừa kh&iacute;t với một v&agrave;i mẫu amp c&oacute; mặt tr&ecirc;n thị trường. Tuy vậy, đ&acirc;y vẫn sẽ l&agrave; một lựa chọn tuyệt vời để ph&aacute;t huy tối đa chất lượng của amp/DAC, đặc biệt l&agrave; những sản phẩm mạnh về DAC nhưng lại kh&aacute; yếu về amp như Aune S16 hay xDuoo XD05.</p>

<p>&nbsp;</p>
<img alt="
Burson V5i.
" src="http://genknews.genkcdn.vn/k:2016/2016-07-18-578c97c5b8cfd-imag0256-1469600758459/opampgiaiphapcuchaychonhungnguoikhongmuontroiamplivaomotchatamduynhat.jpg" style="margin:0px" />
<p>Burson V5i.</p>

<p>&nbsp;</p>

<p>B&ecirc;n cạnh Burson v&agrave; Sparko Labs, thị trường op-amp cao cấp c&ograve;n một số lựa chọn kh&aacute;c như c&aacute;c sản phẩm DEXA từ NewClassD hoặc HDAM từ Audio-GD. Tất cả đều l&agrave; những sản phẩm non trẻ, đến từ c&aacute;c c&ocirc;ng ty c&oacute; quy m&ocirc; kh&aacute; nhỏ, chưa sản xuất h&agrave;ng loạt ở tầm cỡ Fiio hay Schiit. Điều n&agrave;y n&oacute;i l&ecirc;n một sự thật quan trọng: op-amp đang dần trở (lại) th&agrave;nh một xu hướng mới trong thế giới audiophile, kh&ocirc;ng giới hạn người mua hay người sản xuất.</p>

<p>Cũng bởi vậy, b&acirc;y giờ l&agrave; l&uacute;c hợp l&yacute; hơn bao giờ hết để bạn n&acirc;ng cấp op-amp cho chiếc headamp y&ecirc;u qu&yacute; của m&igrave;nh: chỉ từ v&agrave;i trăm ngh&igrave;n đồng cho tới 2 triệu đồng, những chiếc op-amp sẽ gi&uacute;p bạn ph&aacute;t huy tối đa nội lực từ những chiếc amp thể rắn.</p>
',N'Op-amp: Giải pháp cực hay cho những người không muốn "trói" ampli vào một chất âm duy nhất',N'Có thể ví rằng op-amp là những bóng đèn của thế giới amp thể rắn (solid-state). Với khoản tiền từ 100.000 đồng đến 2 triệu đồng, những "con chip" cỡ nhỏ này sẽ giúp bạn phát huy đầy đủ tiềm năng của chiếc amp yêu quý.
',N'publish',N'op-amp-giai-phap-cuc-hay-cho-nhung-nguoi-khong-muon-troi-ampli-vao-mot-chat-am-duy-nhat',{ts '2016-07-29 18:57:15.613'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
72,1,{ts '2016-07-29 18:58:12.320'},N'<p>Xiaomi kh&ocirc;ng phải l&agrave; c&ocirc;ng ty duy nhất của Trung Quốc tung ra một m&aacute;y t&iacute;nh x&aacute;ch tay 13 inch si&ecirc;u mỏng sử dụng bộ vi xử l&iacute; Intel Skylake, đồ họa NVIDIA v&agrave; b&aacute;n ra với mức gi&aacute; 750 USD.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/lenovo1-1469707927984/hetxiaominotebookairlaidenluotlenovoair13prodat1caitenmoikhodenvaysao.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Lenovo cũng vừa l&agrave;m điều tương tự với chiếc laptop Lenovo Air 13 Pro. Hiện sản phẩm n&agrave;y đ&atilde; l&ecirc;n kệ tại thị trường Trung Quốc c&ugrave;ng với mức gi&aacute; 750 USD (16,6 triệu đồng).</p>

<p>Lenovo Air 13 Pro cũng được trang bị m&agrave;n h&igrave;nh 13 inch, độ ph&acirc;n giải 1920 x 1080 pixel (tương tự như Xiaomi Mi Notebook Air), nặng khoảng 1,27 kg v&agrave; d&agrave;y chỉ 1,5 cm.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/lenovo2-1469707927992/hetxiaominotebookairlaidenluotlenovoair13prodat1caitenmoikhodenvaysao.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Thiết bị sử dụng vi xử l&iacute; Intel Core i5-6200U với đồ họa NVIDIA GeForce 940MX, RAM 4 GB, ổ SSD 256 GB. Chiếc m&aacute;y t&iacute;nh x&aacute;ch tay mới của Lenovo hỗ trợ WiFi 802.11ac v&agrave; Bluetooth 4.1, t&iacute;ch hợp 1 cổng USB 3.0, 1 cổng USB 2.0. Ngo&agrave;i ra, Lenovo Air 13 Pro cũng sở hữu cổng kết nối USB Type-C thời thượng c&ugrave;ng jack cắm tai nghe, microphone k&eacute;p v&agrave; loa &acirc;m thanh stereo 1W.</p>

<p>C&aacute;c th&ocirc;ng số kh&aacute;c của thiết bị bao gồm một thỏi pin 46 Wh, webcam 720p, một đầu đọc thẻ SDXC v&agrave; một b&agrave;n ph&iacute;m backlit.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/lenovo3-1469707927997/hetxiaominotebookairlaidenluotlenovoair13prodat1caitenmoikhodenvaysao.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>So với sản phẩm của Xiaomi, Lenovo Air 13 Pro sử dụng chipset yếu hơn một ch&uacute;t, RAM &iacute;t hơn nhưng lại c&oacute; đồ họa tương tự v&agrave; pin dung lượng lớn hơn.</p>

<p>Hiện chưa r&otilde; Lenovo Air 13 Pro c&oacute; được b&aacute;n ra tại c&aacute;c thị trường ngo&agrave;i Trung Quốc hay kh&ocirc;ng. Sản phẩm n&agrave;y cũng c&oacute; nhiều n&eacute;t tương đồng trong thiết kế với chiếc laptop&nbsp;<a href="http://genk.vn/lenovo.htm" target="_blank">Lenovo</a>&nbsp;IdeaPad 710S được c&ocirc;ng ty giới thiệu tại CES 2016 hồi th&aacute;ng Gi&ecirc;ng (chỉ kh&aacute;c một ch&uacute;t về c&aacute;ch bố tr&iacute; c&aacute;c cổng kết nối v&agrave; phần cứng b&ecirc;n trong).</p>
',N'Hết Xiaomi Notebook Air lại đến lượt Lenovo Air 13 Pro, đặt 1 cái tên mới khó đến vậy sao?',N'Ngay sau khi Xiaomi Mi Notebook Air trình làng, Lenovo cũng trình làng chiếc laptop Lenovo Air 13 Pro siêu mỏng với phần cứng và mức giá tương tự. Nhưng cái tên gọi thì thật khó chấp nhận.
',N'publish',N'het-xiaomi-notebook-air-lai-den-luot-lenovo-air-13-pro-dat-1-cai-ten-moi-kho-den-vay-sao',{ts '2016-07-29 18:58:12.320'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
73,1,{ts '2016-07-29 19:00:06.797'},N'<p>Airbus &ndash; nh&agrave; sản xuất m&aacute;y bay của Ph&aacute;p &ndash; đ&atilde; bắt đầu thử nghiệm m&aacute;y bay kh&ocirc;ng người l&aacute;i (drone) v&agrave;o quy tr&igrave;nh kiểm tra m&aacute;y bay của m&igrave;nh. Th&ocirc;ng tin n&agrave;y vừa được đại diện của c&ocirc;ng ty c&ocirc;ng bố tại sự kiện Farnborough Airshow.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/airbus1-1469701041712/kiemtramaybaylacongdoantonthoigiancothekhienchuyenbaydelayvaairbusdacogiaiphaptuyetvoichodieudo.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Từ trước đến nay, drone lu&ocirc;n được cho l&agrave; mối nguy hiểm tiềm ẩn cho ng&agrave;nh c&ocirc;ng nghiệp h&agrave;ng kh&ocirc;ng nhưng trong đoạn video của m&igrave;nh, Airbus cho thấy m&aacute;y bay kh&ocirc;ng người l&aacute;i sẽ c&oacute; t&aacute;c dụng rất lớn đối với c&ocirc;ng ty trong thời gian tới.</p>

<p>Theo truyền thống, việc kiểm tra m&aacute;y bay được thực hiện trực tiếp bằng con người. C&aacute;c kỹ sư sẽ đi v&ograve;ng quanh m&aacute;y bay, sử dụng thang m&aacute;y nhỏ để quan s&aacute;t những ng&oacute;c ng&aacute;ch phức tạp v&agrave; những vết nứt kh&ocirc;ng thể được quan s&aacute;t được từ mặt đất. Qu&aacute; tr&igrave;nh n&agrave;y thường mất khoảng 2 giờ để ho&agrave;n th&agrave;nh tất cả c&aacute;c c&ocirc;ng đoạn.</p>

<p>Bằng c&aacute;ch sử dụng những chiếc m&aacute;y bay kh&ocirc;ng người l&aacute;i chuy&ecirc;n dụng của m&igrave;nh,&nbsp;<strong>Airbus c&oacute; thể r&uacute;t ngắn thời gian kiểm tra m&aacute;y bay xuống c&ograve;n 10 ph&uacute;t.</strong>&nbsp;Kh&ocirc;ng chỉ tiết kiệm thời gian, sử dụng drone c&ograve;n ngăn ngừa c&aacute;c thương t&iacute;ch kh&ocirc;ng đ&aacute;ng c&oacute; khi c&ocirc;ng việc được thực hiện trực tiếp bởi con người.</p>

<p>Những chiếc m&aacute;y bay Airbus sử dụng cho việc kiểm tra l&agrave; AscTec Falcon 8, được thiết kế bởi Ascending Technologies. N&oacute; c&oacute; khả năng tự điều khiển trong suốt qu&aacute; tr&igrave;nh kiểm tra nhờ c&ocirc;ng nghệ RealSense 3D của Intel. Mặc d&ugrave; vậy c&aacute;c kỹ sư của Airbus vẫn phải để mắt đến thiết bị để tr&aacute;nh những sai s&oacute;t đ&aacute;ng tiếc.</p>
&nbsp;

<p>Airbus d&ugrave;ng drone để kiểm tra m&aacute;y bay</p>

<p>Để chụp những bức ảnh cho qu&aacute; tr&igrave;nh kiểm tra, những chiếc&nbsp;<a href="http://genk.vn/may-bay-khong-nguoi-lai.htm" target="_blank">m&aacute;y bay kh&ocirc;ng người l&aacute;i</a>&nbsp;mang theo một m&aacute;y ảnh Sony a7R với ống k&iacute;nh Sonnar T* FE 35mm f/2.8 ZA. Độ ph&acirc;n giải cao của chiếc camera n&agrave;y gi&uacute;p người ta ph&aacute;t hiện ra c&aacute;c vết nứt tr&ecirc;n m&aacute;y bay một c&aacute;ch dễ d&agrave;ng hơn. M&aacute;y ảnh sẽ chụp khoảng 150 ảnh sau đ&oacute; dựng lại bằng m&ocirc; h&igrave;nh 3D để c&aacute;c chuy&ecirc;n gia xem x&eacute;t.</p>

<p>Hiện nay, Airbus đang thử nghiệm quy tr&igrave;nh n&agrave;y tr&ecirc;n d&ograve;ng m&aacute;y bay A350 của c&ocirc;ng ty. Nathalie Ducombeau, người đứng đầu bộ phận kiểm định chất lượng của c&ocirc;ng ty hi vọng qu&aacute; tr&igrave;nh thử nghiệm sẽ kết th&uacute;c v&agrave;o cuối năm 2016. Nếu th&agrave;nh c&ocirc;ng, m&aacute;y bay kh&ocirc;ng người l&aacute;i sẽ tiếp tục được d&ugrave;ng cho quy tr&igrave;nh kiểm tra c&aacute;c d&ograve;ng m&aacute;y bay kh&aacute;c của c&ocirc;ng ty.</p>
',N'Kiểm tra máy bay là công đoạn tốn thời gian, có thể khiến chuyến bay delay và Airbus đã có giải pháp tuyệt vời cho điều đó',N'Airbus đang thử nghiệm dùng drone để thay thế con người trong quá trình kiểm tra các máy bay của hãng.',N'publish',N'kiem-tra-may-bay-la-cong-doan-ton-thoi-gian-co-the-khien-chuyen-bay-delay-va-airbus-da-co-giai-phap-tuyet-voi-cho-dieu-do',{ts '2016-07-29 19:00:06.797'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
74,1,{ts '2016-07-29 19:01:52.597'},N'<p>Đ&uacute;ng như dự đo&aacute;n, ng&agrave;y h&ocirc;m nay RX460 đ&atilde; ch&iacute;nh thức lộ diện ở một số thị trường, cả bản Reference v&agrave; c&aacute;c phi&ecirc;n bản custom. Dự kiến, ng&agrave;y 2/8 tới đ&acirc;y, AMD cũng sẽ b&aacute;n ra RX470.</p>

<p>Để hấp dẫn người d&ugrave;ng, nh&agrave; ph&aacute;t triển vừa tung ra kết quả benchmark hiệu năng chơi game thực tế của 2 card đồ họa gi&aacute; rẻ v&agrave; si&ecirc;u rẻ n&agrave;y.</p>

<p>Đ&uacute;ng như những hứa hẹn ban đầu, RX470 sẽ nhắm tới nhu cầu chơi game tầm trung, tự tin trước c&aacute;c tựa game nặng bao gồm cả Battlefield 4, DOOM hay Fallout 4.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/rx460-2-1469706310321/hieunangthuctecuarx460choidota2overwatchtren100fpsgiatu2trieudong.PNG" style="margin:0px" />
<p>&nbsp;</p>

<p>Trong khi đ&oacute;, RX460 lại nhắm tới fan của c&aacute;c tựa game e-sport như Dota 2, CS:GO, Overwatch hay Li&ecirc;n Minh Huyền Thoại, bởi d&ugrave; gi&aacute; rẻ nhưng card đồ họa n&agrave;y c&oacute; thể đ&aacute;p ứng được trải nghiệm cực tốt, FPS cao ngay cả ở thiết lập cao nhất.</p>

<p>Để chứng minh rằng d&ograve;ng card đồ họa mới kh&ocirc;ng chỉ l&agrave; những sản phẩm thay đổi t&ecirc;n gọi, AMD so s&aacute;nh ch&iacute;nh những thế hệ tương ứng trước để cho thấy c&aacute;c VGA sử dụng GPU Polaris mang tới hiệu năng vượt trội, mạnh hơn từ 50 - 150% so với c&aacute;c sản phẩm cũ.</p>

<p><strong>RX470 mạnh hơn tới 140% so với R9 270</strong></p>

<p>Giống với đ&agrave;n anh RX480, RX470 cũng sử dụng GPU Polaris 10. Card đồ họa tầm trung n&agrave;y sẽ được b&aacute;n ra với mức gi&aacute; chỉ 149 USD (chưa r&otilde; bản custom về Việt Nam c&oacute; gi&aacute; bao nhi&ecirc;u). V&agrave; người d&ugrave;ng sẽ nhận được một chiếc card đồ họa với 2048 GCN 4.0 Cores, xung nhịp 1206Mhz, 4GB VRAM đồng thời chỉ y&ecirc;u cầu tối đa 120W.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/amd-radeon-rx-470-performance-635x357-1469706288726/hieunangthuctecuarx460choidota2overwatchtren100fpsgiatu2trieudong.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Người d&ugrave;ng c&oacute; thể lựa chọn phi&ecirc;n bản 8GB VRAM, gi&aacute; b&aacute;n cao hơn 30 USD so với bản 4GB nhưng chắc chắn hiệu năng sẽ được cải thiện tương đối.</p>

<p>X&eacute;t tới sức mạnh xử l&yacute; của RX470, card đồ họa n&agrave;y đạt mức 5 TFLOPS, tức chỉ k&eacute;m RX480 khoảng 20% m&agrave; th&ocirc;i.</p>

<p><strong>RX460 mạnh hơn 30% so với R7 260X</strong></p>

<p>Được xếp v&agrave;o ph&acirc;n kh&uacute;c gi&aacute; rẻ, RX460 ra mắt để thay thế cho hầu hết c&aacute;c VGA tầm thấp dưới 3 triệu trước đ&acirc;y của AMD. So s&aacute;nh với một đại diện nổi bật l&agrave; R7 260X, hiệu năng chơi game thực tế của RX460 ho&agrave;n to&agrave;n vượt trội trong c&aacute;c game e-sport.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/amd-radeon-rx-460-performance-635x357-1469706289921/hieunangthuctecuarx460choidota2overwatchtren100fpsgiatu2trieudong.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Với khả năng chơi Dota 2 v&agrave; Overwatch ở mức tr&ecirc;n 100 FPS, chắc chắn VGA n&agrave;y sẽ l&agrave;m mưa l&agrave;m gi&oacute; thị trường gi&aacute; rẻ, game n&eacute;t trong những th&aacute;ng cuối năm 2016. Một lợi thế kh&aacute;c của VGA n&agrave;y l&agrave; kh&ocirc;ng cần tới nguồn phụ, điện năng thiết kế m&agrave; RX460 y&ecirc;u cầu chỉ l&agrave; 75W, được cấp ho&agrave;n to&agrave;n th&ocirc;ng qua khe PCI-e.</p>

<p>Nếu bạn muốn thử sức c&ugrave;ng c&aacute;c game Offline đồ họa nặng, kết quả m&agrave; AMD cung cấp cũng đủ l&agrave;m bạn y&ecirc;n l&ograve;ng. Card đồ họa gi&aacute; rẻ n&agrave;y với bộ nhớ tối đa 4GB c&oacute; thể chơi ngon l&agrave;nh GTA V ở mức ~75FPS, kh&aacute; ổn đ&uacute;ng kh&ocirc;ng?</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/sapphire-radeon-rx-460-dual-1-900x600-1469706486632/hieunangthuctecuarx460choidota2overwatchtren100fpsgiatu2trieudong.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>RX460 sẽ được b&aacute;n ra với gi&aacute; 99 - 119 USD lần lượt 2 phi&ecirc;n bản l&agrave; 2GB VRAM v&agrave; 4GB VRAM. Trong ng&agrave;y h&ocirc;m nay, nh&agrave; sản xuất Shapphire cũng đ&atilde; giới thiệu bản custom tản nhiệt của RX460 do h&atilde;ng thiết kế.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/rx460-3-1469706492902/hieunangthuctecuarx460choidota2overwatchtren100fpsgiatu2trieudong.PNG" style="margin:0px" />
<p>&nbsp;</p>
',N'Hiệu năng thực tế của RX460: Chơi Dota 2, Overwatch trên 100FPS, giá từ 2 triệu đồng',N'Thậm chí VGA này còn có thể đáp ứng được những tựa game mạnh như GTA V với mức FPS ấn tượng.
',N'publish',N'hieu-nang-thuc-te-cua-rx460-choi-dota-2-overwatch-tren-100fps-gia-tu-2-trieu-dong',{ts '2016-07-29 19:01:52.597'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
75,1,{ts '2016-07-29 19:04:35.737'},N'https://www.youtube.com/watch?v=Y3eVD1WgZgQ',N'Trên tay chuột chơi game không dây Logitech G900 Chaos Spectrum',N'https://www.youtube.com/watch?v=Y3eVD1WgZgQ',N'publish',N'tren-tay-chuot-choi-game-khong-day-logitech-g900-chaos-spectrum',{ts '2016-07-29 19:04:35.737'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
76,1,{ts '2016-07-29 19:05:20.950'},N'https://www.youtube.com/watch?v=MvEjnSvZjJ0',N'Những trang bị cần thiết khi đi phượt bằng xe mô tô',N'https://www.youtube.com/watch?v=MvEjnSvZjJ0',N'publish',N'nhung-trang-bi-can-thiet-khi-di-phuot-bang-xe-mo-to',{ts '2016-07-29 19:05:20.950'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
77,1,{ts '2016-07-29 19:08:49.733'},N'<p>C&ugrave;ng với việc ra mắt chiếc Galaxy J2 Pro mới, Samsung c&ocirc;ng bố một đoạn video ngắn giải th&iacute;ch c&ocirc;ng nghệ ẩn giấu trong ph&aacute;t minh mới nhất của m&igrave;nh. Được gọi l&agrave; Turbo Speed Technology (TST), c&ocirc;ng nghệ n&agrave;y được xem l&agrave; giải ph&aacute;p tối ưu phần mềm nhằm cải thiện c&aacute;c thước đo quan trọng cho hiệu suất của smartphone: v&iacute; dụ như thời gian tải ứng dụng, độ mượt m&agrave; của t&aacute;c vụ đa nhiệm, v&agrave; hiệu quả sử dụng bộ nhớ RAM.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/samsung1-1469691382226/hayxemsamsungbiensmartphonethuongchaynhanhhoncasmartphonecaocapnhuthenao.png" style="margin:0px" />
<p>&nbsp;</p>

<p>Thay v&igrave; phải gia tăng c&aacute;c t&agrave;i nguy&ecirc;n hệ thống như bộ xử l&yacute; mạnh hơn, nhiều RAM hơn để giải quyết vấn đề n&agrave;y, Samsung quản l&yacute; chặt c&aacute;c lĩnh vực cụ thể, c&oacute; t&aacute;c động trực tiếp đến c&aacute;c thao t&aacute;c th&ocirc;ng thường khi sử dụng smartphone h&agrave;ng ng&agrave;y.</p>

<p>Đầu ti&ecirc;n, c&aacute;c kỹ sư của họ giảm dung lượng v&agrave; bộ nhớ bị chiếm dụng bởi c&aacute;c ứng dụng cốt l&otilde;i như gọi điện, nhắn tin, hiệu suất v&agrave; kết nối th&ocirc;ng tin. Họ cũng ph&acirc;n bổ lại c&aacute;c ứng dụng n&agrave;y tr&ecirc;n m&agrave;n h&igrave;nh ch&iacute;nh v&agrave; tối ưu engine quản l&yacute; RAM để giải ph&oacute;ng bộ nhớ một c&aacute;ch th&ocirc;ng minh trong hệ điều h&agrave;nh, nh&acirc;n kernel v&agrave; c&aacute;c cấp phần cứng kh&aacute;c nhau.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/samsung2-1469691453313/hayxemsamsungbiensmartphonethuongchaynhanhhoncasmartphonecaocapnhuthenao.png" style="margin:0px" />
<p>&nbsp;</p>

<p>Kết quả của c&ocirc;ng nghệ n&agrave;y được khẳng định với chiếc Galaxy J2 Pro,&nbsp;<strong>với bộ nhớ RAM 2GB, c&oacute; thể tải c&aacute;c ứng dụng nhanh hơn 40% so với một chiếc smartphone với dung lượng bộ nhớ RAM gấp đ&ocirc;i. N&oacute;i c&aacute;ch kh&aacute;c, thiết bị d&ograve;ng J n&agrave;y c&ograve;n c&oacute; thể nhanh hơn cả những thiết bị cao cấp d&ograve;ng S của Samsung.</strong></p>

<p>Do vậy, rất c&oacute; thể trong thời gian tới Samsung sẽ mang c&ocirc;ng nghệ Turbo Speed Technology đến với h&agrave;ng loạt c&aacute;c thiết bị nổi tiếng của họ, trừ khi c&oacute; những giới hạn về kỹ thuật ngăn họ l&agrave;m như vậy.</p>
&nbsp;

<p>C&ocirc;ng nghệ Turbo Speed Technology của Samsung.</p>
',N'Hãy xem Samsung biến smartphone thường chạy nhanh hơn cả smartphone cao cấp như thế nào',N'Quan trọng hơn, điện thoại của bạn không cần cấu hình cao để có thể đua tốc độ với những chiếc smartphone cao cấp.
',N'publish',N'hay-xem-samsung-bien-smartphone-thuong-chay-nhanh-hon-ca-smartphone-cao-cap-nhu-the-nao',{ts '2016-07-29 19:08:49.733'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
78,1,{ts '2016-07-30 08:59:17.383'},N'<p><strong>1. Khi cả một thị trường người d&ugrave;ng kh&ocirc;ng biết c&aacute;ch sử dụng giao diện mới</strong></p>

<p>Khi Tinder mới ti&ecirc;n phong giao diện card trượt sang một b&ecirc;n, c&ocirc;ng ty đ&atilde; phải để th&ecirc;m n&uacute;t Yes/No để đề ph&ograve;ng người d&ugrave;ng kh&ocirc;ng biết k&eacute;o card th&igrave; sẽ bấm v&agrave;o đ&acirc;y.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/1-elwmbhb3usglej694vsg9a-1469691103564/4baihocxuongmaudanhchodanthietke.png" style="margin:0px" />
<p>&nbsp;</p>

<p>V&agrave;i năm sau, khoảng năm 2014, khi giao diện card k&eacute;o bắt đầu thịnh h&agrave;nh với nhiều ứng dụng sử dụng hơn (bạn thậm ch&iacute; c&oacute; thể shopping hay t&igrave;m việc tr&ecirc;n những chiếc card ảo n&agrave;y), t&ocirc;i muốn thiết kế n&uacute;t Home cho ứng dụng Paktor (app hẹn h&ograve; tương tự Tinder d&agrave;nh cho khu vực Đ&ocirc;ng Nam &Aacute;) bằng c&aacute;ch bỏ đi những n&uacute;t Yes/No rườm r&agrave; n&agrave;y v&igrave; nghĩ chắc ai cũng biết c&aacute;ch trượt card rồi.</p>

<p><strong>Ho&agrave;n to&agrave;n sai.</strong>&nbsp;Ngay khi ch&uacute;ng t&ocirc;i ra mắt giao diện card mới, người d&ugrave;ng Indonesia đ&atilde; phản ứng lại tức th&igrave;. Kết quả A/B test (b&agrave;i test thử nghiệm giữa 2 hay nhiều kiểu giao diện/t&iacute;nh năng kh&aacute;c nhau để xem người d&ugrave;ng phản ứng với ch&uacute;ng ra sao) cho thấy trong khi Singapore hay c&aacute;c thị trường người d&ugrave;ng high-tech hơn đều kh&ocirc;ng gặp vấn đề g&igrave; với giao diện mới n&agrave;y th&igrave; hầu hết người d&ugrave;ng Indonesia lại kh&ocirc;ng biết c&aacute;ch trượt card tr&ecirc;n để mở ra card dưới, c&aacute;c chỉ số tương t&aacute;c tụt giảm đ&aacute;ng kể.</p>

<p>Đ&uacute;ng vậy, cả một đất nước kh&ocirc;ng biết c&aacute;ch trượt card tr&ecirc;n ứng dụng!!! Đ&acirc;y ch&iacute;nh l&agrave; thời điểm c&oacute; lẽ to&agrave;n bộ người d&ugrave;ng Indonesia đều nguyền rủa ch&uacute;ng t&ocirc;i.</p>

<p>&nbsp;</p>
<img alt="
Tất cả các bản thiết kế giao diện card trượt của tôi đều không bao gồm nút Yes/No
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/1-y2azz9nkt0bz8my5svn1qg-1469691225981/4baihocxuongmaudanhchodanthietke.jpeg" style="margin:0px" />
<p>Tất cả c&aacute;c bản thiết kế giao diện card trượt của t&ocirc;i đều kh&ocirc;ng bao gồm n&uacute;t Yes/No</p>

<p>&nbsp;</p>

<p>Vậy nguy&ecirc;n nh&acirc;n tại sao chỉ Indonesia d&iacute;nh phốt? L&yacute; do l&agrave; bởi mỗi thị trường đều đang ở những giai đoạn kh&aacute;c nhau trong qu&aacute; tr&igrave;nh tiến triển của ng&agrave;nh thiết kế. Những thị trường gia nhập Internet muộn m&agrave;ng hơn nay vẫn đang ở giai đoạn đầu của việc l&agrave;m quen với c&aacute;c ứng dụng, hay c&oacute; thể n&oacute;i l&agrave; c&aacute;c thị trường n&agrave;y chưa &ldquo;trưởng th&agrave;nh&rdquo;. Ch&iacute;nh v&igrave; vậy m&agrave; người thiết kế chưa thể đốt ch&aacute;y giai đoạn để chuyển sang những lối thiết kế mới như &ldquo;k&eacute;o xuống để F5&rdquo; hay &ldquo;k&eacute;o sang để tho&aacute;t&rdquo; m&agrave; cần hướng dẫn họ từ từ để l&agrave;m quen.</p>

<p><strong>B&agrave;i học:</strong>&nbsp;Khi thiết kế một sản phẩm cho nhiều thị trường kh&aacute;c nhau, h&atilde;y lu&ocirc;n nhớ trong đầu rằng bạn phải thiết kế cho cả thị trường &ldquo;low-tech&rdquo; nhất cũng x&agrave;i được.</p>

<p><strong>2. Khi thiết kế xấu c&ograve;n mang lại hiệu quả cao hơn thiết kế đẹp</strong></p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/1-ethlsdmmeldnoosd7q8iba-1469691260274/4baihocxuongmaudanhchodanthietke.png" style="margin:0px" />
<p>&nbsp;</p>

<p>T&ocirc;i từng rất th&iacute;ch chiếc n&uacute;t &ldquo;hamburger&rdquo; n&agrave;y bởi n&oacute; thực sự rất tuyệt vời. Chiếc n&uacute;t c&oacute; thể gi&uacute;p c&aacute;c nh&agrave; thiết kế tối giản h&agrave;ng loạt đầu mục menu v&agrave;o 3 đường kẻ b&eacute; x&iacute;u. Tuy nhi&ecirc;n, đ&ocirc;i khi bấm v&agrave;o một n&uacute;t hamburger như vậy cũng giống như đụng v&agrave;o một n&uacute;t &ldquo;?&rdquo; tr&ecirc;n game Super Mario - chỉ những người ham t&igrave;m hiểu mới bấm v&agrave;o để xem c&ograve;n g&igrave; mới ở đ&acirc;y m&agrave; họ chưa biết. Việc bấm v&agrave;o đ&acirc;y kh&ocirc;ng phải bao giờ cũng dễ chịu bởi n&oacute; đẩy người d&ugrave;ng ra tận viền xa nhất của m&agrave;n h&igrave;nh ứng dụng họ đang d&ugrave;ng. Đối với nhiều người, đ&acirc;y thực sự l&agrave; một việc rất đ&aacute;ng gh&eacute;t.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/1-l9qfzitkooqqfbfqzaryvg-1469691301931/4baihocxuongmaudanhchodanthietke.gif" style="margin:0px" />
<p>&nbsp;</p>

<p>Thay v&agrave;o đ&oacute;, một thanh điều hướng ở dưới c&ugrave;ng như thế n&agrave;y sẽ khiến họ dễ chịu hơn, theo kiểu<em>&ldquo;Được, t&ocirc;i sẽ t&igrave;m c&aacute;c thứ m&igrave;nh cần ở ngay đ&acirc;y.&rdquo;</em></p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/1-uzlxe2dbywftc-4yujwuyq-1469691334813/4baihocxuongmaudanhchodanthietke.png" style="margin:0px" />
<p>&nbsp;</p>

<p>Ch&iacute;nh v&igrave; vậy m&agrave; thanh điều hướng thường được đặt ở ph&iacute;a dưới c&ugrave;ng m&agrave;n h&igrave;nh, ở vị tr&iacute; dễ chạm nhất, gi&uacute;p người d&ugrave;ng kh&ocirc;ng cần phải đưa ng&oacute;n tay qu&aacute; xa. Mặc d&ugrave; từng rất th&iacute;ch n&uacute;t hamburger nhưng sau nhiều A/B test, t&ocirc;i cũng phải thừa nhận rằng thanh điều hướng lu&ocirc;n mang lại trải nghiệm tốt hơn, cho d&ugrave; c&oacute; l&uacute;c tr&ocirc;ng sẽ xấu hơn.</p>

<p><strong>B&agrave;i học</strong>: Đ&ocirc;i khi thiết kế xấu hơn lại mang về hiệu quả cao hơn, bởi ch&uacute;ng thỏa m&atilde;n tốt hơn mong muốn của người d&ugrave;ng. Đ&acirc;y ch&iacute;nh l&agrave; v&iacute; dụ r&otilde; r&agrave;ng nhất chứng minh rằng người thiết kế kh&ocirc;ng n&ecirc;n l&uacute;c n&agrave;o cũng chỉ nghĩ đến mặt thẩm mỹ m&agrave; lu&ocirc;n phải đặt hiệu năng sử dụng v&agrave; sự r&otilde; r&agrave;ng l&ecirc;n đầu.</p>

<p><strong>3. Khi t&ocirc;i cố thiết kế một bộ font nhưng lại ra 26 h&igrave;nh tr&ograve;n đ&aacute;ng gh&eacute;t</strong></p>

<p>T&ocirc;i l&agrave; một người kh&aacute; luộm thuộm (c&oacute; phải hầu hết designer đều thế kh&ocirc;ng nhỉ?) nhưng khi thiết kế th&igrave; lại lu&ocirc;n biết c&aacute;ch &ldquo;dọn sạch&rdquo; đầu &oacute;c. T&ocirc;i c&oacute; những chuẩn mực ri&ecirc;ng &iacute;t khi ph&aacute; vỡ, một trong số đ&oacute; l&agrave; việc phải giữ mọi thứ đồng nhất với nhau. Trong hầu hết c&aacute;c trường hợp, quy tắc n&agrave;y ph&aacute;t huy t&aacute;c dụng v&agrave; gi&uacute;p t&ocirc;i tạo ra được những thứ tuyệt vời như thế n&agrave;y:</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/1-almrxb80be-krf47llqjtq-1469691367236/4baihocxuongmaudanhchodanthietke.png" style="margin:0px" />
<p>&nbsp;</p>

<p>H&atilde;y tưởng tượng t&aacute;c phẩm sẽ ra sao nếu t&ocirc;i sử dụng to&agrave;n c&aacute;c h&igrave;nh tam gi&aacute;c, &iacute;t m&agrave;u sắc hơn v&agrave; thiết kế hướng của ch&uacute;ng một c&aacute;ch t&ugrave;y hứng ngẫu nhi&ecirc;n?</p>

<p>Thế nhưng thực tế t&aacute;c phẩm như vậy kh&ocirc;ng phải l&uacute;c n&agrave;o tinh giản v&agrave; ấn tượng m&agrave; lại rất luộm thuộm v&agrave; cồng kềnh. Ch&iacute;nh v&igrave; vậy m&agrave; trong nhiều trường hợp, việc m&ugrave; qu&aacute;ng chạy theo sự đồng nhất sẽ kh&ocirc;ng mang lại kết quả mong muốn.</p>

<p>Một lần, t&ocirc;i cố gắng thiết kế một bộ font dựa tr&ecirc;n những h&igrave;nh tr&ograve;n. Sau khi thiết kế được một nửa, quy tắc &ldquo;dựa tr&ecirc;n những h&igrave;nh tr&ograve;n&rdquo; h&oacute;a ra lại chuyển th&agrave;nh &ldquo;ch&iacute;nh l&agrave; những h&igrave;nh tr&ograve;n&rdquo;. T&ocirc;i đ&atilde; tối giản h&oacute;a bộ font qu&aacute; mức cho ph&eacute;p.</p>

<p>T&ocirc;i chợt nhận ra rằng trong typography, sự đồng nhất l&agrave; thứ gần như kh&ocirc;ng thể đạt được. Bạn cần phải tạo ra sự ph&aacute; c&aacute;ch ở chỗ n&agrave;y hay chỗ kia. Mỗi con chữ c&oacute; c&acirc;u chuyện ri&ecirc;ng của n&oacute;, v&agrave; n&ecirc;n được thể hiện bằng những h&igrave;nh dạng v&agrave; tỷ lệ kh&aacute;c nhau.</p>

<p>Ở đ&acirc;y, việc t&ocirc;i cố vẽ n&ecirc;n một h&igrave;nh tr&ograve;n l&agrave;m khung bao tất cả c&aacute;c con chữ ch&iacute;nh l&agrave; thứ khiến t&ocirc;i thất bại thảm hại. C&oacute; thể c&oacute; những con chữ nh&eacute;t v&agrave;o h&igrave;nh tr&ograve;n rất hợp l&yacute;, nhưng những con chữ kh&aacute;c th&igrave; ho&agrave;n to&agrave;n kh&ocirc;ng.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/1-88jecwd03gcti58aydtmla-1469691407137/4baihocxuongmaudanhchodanthietke.png" style="margin:0px" />
<p>&nbsp;</p>

<p><strong>B&agrave;i học:</strong>&nbsp;Ch&egrave;n &eacute;p sự đồng nhất v&agrave;o c&aacute;c t&aacute;c phẩm của m&igrave;nh kh&ocirc;ng phải l&uacute;c n&agrave;o cũng l&agrave; hướng đi đ&uacute;ng đắn. Đ&ocirc;i khi ch&uacute;ng ta cần thiết kế dựa tr&ecirc;n ngữ cảnh v&agrave; buộc phải ph&aacute; bỏ sự đồng nhất để đạt được điều đ&oacute;. Thiết kế font chữ l&agrave; một v&iacute; dụ điển h&igrave;nh.</p>

<p><strong>4. Khi ch&iacute;nh t&ocirc;i trở th&agrave;nh kiểu kh&aacute;ch h&agrave;ng m&igrave;nh cực gh&eacute;t</strong></p>

<p>C&oacute; lẽ nhiều designer ho&agrave;n to&agrave;n hiểu t&igrave;nh cảnh kh&aacute;ch h&agrave;ng đ&ograve;i thay đổi thiết kế gần như mỗi ph&uacute;t một lần. C&oacute; những trường hợp họ c&ograve;n &ldquo;tra tấn&rdquo; t&ocirc;i bằng h&agrave;ng loạt email v&agrave;o l&uacute;c 3h s&aacute;ng. Thế nhưng đ&ocirc;i khi ch&iacute;nh t&ocirc;i lại biến th&agrave;nh loại kh&aacute;ch h&agrave;ng đ&aacute;ng gh&eacute;t đ&oacute;.</p>

<p>Đ&oacute; l&agrave; khi t&ocirc;i thực hiện một dự &aacute;n nhỏ ngo&agrave;i lề. Sau khi ho&agrave;n th&agrave;nh phần thiết kế giao diện, t&ocirc;i thu&ecirc; một lập tr&igrave;nh vi&ecirc;n gắn n&oacute; v&agrave;o ứng dụng. Sau khi bắt tay v&agrave;o l&agrave;m việc một l&uacute;c, anh ta hỏi t&ocirc;i mấy c&acirc;u n&agrave;y:&nbsp;<em>&ldquo;&Ecirc; Nina, ch&uacute;ng ta chỉnh chỗ viền n&agrave;y thế n&agrave;o nhỉ? L&agrave;m thế n&agrave;o để hiển thị in-app purchase kh&ocirc;ng down được?&quot;&nbsp;</em>T&ocirc;i chưa từng nghĩ về những điều đ&oacute; n&ecirc;n cuối c&ugrave;ng đ&atilde; đưa ra một v&agrave;i &yacute; thế n&agrave;y:</p>

<p><em>&ldquo;Hay l&agrave; cho chạy một c&aacute;i pop-up message nổi l&ecirc;n khi họ bấm nhỉ? Chờ đ&atilde;, mấy c&aacute;i n&agrave;y như dở hơi &yacute;&hellip;Hm&hellip;Hay th&ocirc;i chẳng cho chạy g&igrave; nữa&hellip;*3 ph&uacute;t sau*&hellip;Thật ra th&igrave; ch&egrave;n c&aacute;i pop-up message đ&oacute; cũng được. Chốt thế nh&eacute;.&rdquo;</em></p>

<p>Thế nhưng đến đ&acirc;y mọi chuyện vẫn chưa xong. Đ&oacute; ch&iacute;nh l&agrave; l&uacute;c t&ocirc;i nhận ra m&igrave;nh đang biến th&agrave;nh đ&uacute;ng thứ kh&aacute;ch h&agrave;ng t&ocirc;i vốn rất gh&eacute;t.</p>

<p>Những kh&aacute;ch h&agrave;ng đ&ograve;i hỏi v&agrave; hay thay đổi quyết định n&agrave;y thực ra chỉ như những người b&igrave;nh thường th&ocirc;i, chỉ c&oacute; điều họ kh&ocirc;ng c&oacute; nguy&ecirc;n tắc l&agrave;m việc hợp l&yacute; n&ecirc;n cứ đổi &yacute; li&ecirc;n tục mỗi khi nghĩ lại. Trong trường hợp tr&ecirc;n kia, ch&iacute;nh v&igrave; t&ocirc;i đốt ch&aacute;y giai đoạn nhiều phần trong quy tr&igrave;nh thiết kế n&ecirc;n cuối c&ugrave;ng mới dẫn đến chuyện lộn xộn như vậy.</p>

<p><strong>B&agrave;i học:&nbsp;</strong>Đừng đốt ch&aacute;y giai đoạn. User flow, user scenario, c&acirc;u chuyện,&hellip; tất cả những thứ trong chu tr&igrave;nh thiết kế đều tồn tại c&oacute; l&yacute; do của ch&uacute;ng, xin đừng bỏ qua!</p>
',N'4 bài học xương máu dành cho dân thiết kế',N'Với dân thiết kế, những tình huống như thế này không hiếm khi xảy ra.
',N'publish',N'4-bai-hoc-xuong-mau-danh-cho-dan-thiet-ke',{ts '2016-07-30 08:59:00.000'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
79,1,{ts '2016-07-30 09:00:43.243'},N'<p>Kh&ocirc;ng kh&oacute; để nhận ra Facebook đang chuyển dần bản web sang lối thiết kế tương tự tr&ecirc;n ứng dụng Messenger. Cửa sổ chat nay đ&atilde; giống hệt giao diện chat của Messenger với m&agrave;u sắc v&agrave; icon sặc sỡ, sinh động hơn.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/facebook-chat-windows-1469617081284/facebookdathaydoithietkewebtheongonngucuamessengerbandanhanrachua.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Việc hiển thị m&agrave;u khớp với m&agrave;u chat đ&atilde; chọn với từng người tr&ecirc;n Messenger gi&uacute;p người d&ugrave;ng dễ d&agrave;ng ph&acirc;n biệt c&aacute;c cuộc hội thoại hơn, tr&aacute;nh t&igrave;nh trạng g&otilde; nhầm khi chat nhiều như trước đ&acirc;y.</p>

<p>Ng&ocirc;n ngữ thiết kế của Messenger r&otilde; r&agrave;ng cũng gọn g&agrave;ng v&agrave; hiện đại hơn lối thiết kế cũ của trang Facebook. Tr&ecirc;n thực tế, c&aacute;c chi tiết thiết kế tr&ecirc;n phi&ecirc;n bản cũ tr&ocirc;ng đ&atilde; kh&aacute; lỗi thời, chưa kể đến sự thiếu nhất qu&aacute;n giữa c&aacute;c bộ phận, icon, emoji,&hellip;</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/emoji-1469617091685/facebookdathaydoithietkewebtheongonngucuamessengerbandanhanrachua.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Những thay đổi n&agrave;y c&oacute; thể l&agrave; khởi đầu cho những thay đổi lớn hơn tr&ecirc;n bản web Facebook. Trong số những thay đổi đang được thử nghiệm kh&aacute;c của mạng x&atilde; hội n&agrave;y c&ograve;n c&oacute; cả mục trending topic với hiển thị th&ecirc;m về số lượng người đang b&agrave;n luận. Rất c&oacute; thể việc th&ecirc;m số người n&agrave;y nằm trong nỗ lực cắt giảm sự can thiệp của con người v&agrave;o c&aacute;c topic n&agrave;y, vấn đề từng khiến Facebook phải đối mặt với rất nhiều lời chỉ tr&iacute;ch thời gian vừa qua.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/facebook-trending-1469617132143/facebookdathaydoithietkewebtheongonngucuamessengerbandanhanrachua.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p><em>Tham khảo The Next Web</em></p>
',N'Facebook đã thay đổi thiết kế web theo ngôn ngữ của Messenger, bạn đã nhận ra chưa?',N'Những thay đổi gần đây trên Facebook bản web có thể sẽ khiến một bộ phận người dùng vốn quen với giao diện cũ phải khó chịu.
',N'publish',N'facebook-da-thay-doi-thiet-ke-web-theo-ngon-ngu-cua-messenger-ban-da-nhan-ra-chua',{ts '2016-07-30 09:00:43.243'},0,NULL,NULL,N'post',N'Open',1);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
80,1,{ts '2016-07-30 09:01:35.750'},N'<p>D&ugrave; đang l&agrave; c&ocirc;ng ty c&oacute; gi&aacute; trị nhất thế giới th&igrave; Google vẫn ng&agrave;y ng&agrave;y phải đối mặt với c&aacute;c đối thủ lớn tr&ecirc;n nhiều lĩnh vực. Trong số đ&oacute; c&oacute; mảng t&igrave;m kiếm nội dung, lĩnh vực Google đ&atilde; dẫn đầu nhiều năm nay. Thế nhưng ng&ocirc;i vị đ&oacute; lại đang dần bị đe dọa bởi một v&agrave;i c&aacute;i t&ecirc;n nổi bật trong giới c&ocirc;ng nghệ m&agrave; ch&uacute;ng ra sẽ điểm danh dưới đ&acirc;y.</p>

<p><strong>1. Bing</strong></p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/google-vs-bing-1469777111279/cothebanchuanhanragoogledangbi3luoidaokesatco.png" style="margin:0px" />
<p>&nbsp;</p>

<p>Bạn c&oacute; thể kh&ocirc;ng để &yacute; nhưng Bing, đối thủ t&igrave;m kiếm h&agrave;ng đầu của Google đang trỗi dậy ở mức đ&aacute;ng kinh ngạc.</p>

<p>Ngay từ khi mới ra mắt năm 2008, nhiều người đ&atilde; đ&aacute;nh gi&aacute; Bing l&agrave; nỗ lực thất bại của Microsoft trong cuộc chạy đua với Google, thế nhưng những số liệu gần đ&acirc;y về Bing c&oacute; thể sẽ khiến bạn giật m&igrave;nh.</p>

<p>B&aacute;o c&aacute;o từ c&ocirc;ng ty nghi&ecirc;n cứu thị trường comScore cho thấy Bing đang nhanh ch&oacute;ng nuốt dần thị phần t&igrave;m kiếm từ Google với 21,6% tổng lượng t&igrave;m kiếm to&agrave;n cầu (so với mức 63,8% của Google), t&iacute;nh đến th&aacute;ng 5/2016. Ch&iacute;nh x&aacute;c l&agrave; trong qu&yacute; đầu năm 2016, thị phần t&igrave;m kiếm của Bing tăng 0,2% c&ograve;n Google lại giảm 0,2%. Nếu so với mức thị phần 9,8% hồi năm 2008, Bing thực sự đ&atilde; c&oacute; một c&uacute; lội ngược d&ograve;ng ấn tượng.</p>

<p>&nbsp;</p>
<img alt="
Phần search video của Bing cho ra hình thumbnail rõ ràng và dễ tương tác hơn Google
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/bing-1469778068268/cothebanchuanhanragoogledangbi3luoidaokesatco.png" style="margin:0px" />
<p>Phần search video của Bing cho ra h&igrave;nh thumbnail r&otilde; r&agrave;ng v&agrave; dễ tương t&aacute;c hơn Google</p>

<p>&nbsp;</p>

<p>Một v&agrave;i l&yacute; do đứng sau đ&agrave; tăng trưởng nhanh ch&oacute;ng n&agrave;y c&oacute; thể kể đến việc Microsoft cho ra mắt Windows 10 hồi năm 2015. C&oacute; mặt tr&ecirc;n 270 triệu thiết bị tr&ecirc;n to&agrave;n cầu (bao gồm cả PC, tablet, mobile, Xbox One console) v&agrave; được đồng bộ s&acirc;u c&ocirc;ng cụ t&igrave;m kiếm v&agrave;o trải nghiệm người d&ugrave;ng, Windows 10 đ&atilde; gi&uacute;p Microsoft mang về lưu lượng search đ&aacute;ng kể cho Bing.</p>

<p>Động lực tăng trưởng thứ hai l&agrave; xu hướng gia tăng t&igrave;m kiếm qua Voice search tr&ecirc;n c&aacute;c trợ l&yacute; ảo chạy Bing, v&agrave; ở đ&acirc;y kh&ocirc;ng ai kh&aacute;c ch&iacute;nh l&agrave; những c&aacute;i t&ecirc;n nổi bật nhất hiện nay: Cortana tr&ecirc;n Windows 10, Siri tr&ecirc;n iOS v&agrave; Amazon Echo. C&aacute;c nền tảng Voice search n&agrave;y cho ph&eacute;p người d&ugrave;ng nhanh ch&oacute;ng đặt c&acirc;u hỏi v&agrave; mang đến một trải nghiệm tuyệt vời về &#39;tự động h&oacute;a&#39;.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/google-sweating-siri-latent-search-1469777641832/cothebanchuanhanragoogledangbi3luoidaokesatco.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Nếu như bạn nghĩ Apple vẫn để c&ocirc;ng cụ t&igrave;m kiếm mặc định cho Siri l&agrave; Google như tr&ecirc;n tr&igrave;nh duyệt Safari th&igrave; lần tới gọi Siri h&atilde;y xem lại một ch&uacute;t nh&eacute;, đ&acirc;y cũng ch&iacute;nh l&agrave; c&aacute;ch Apple &ldquo;đ&aacute;p trả&rdquo; Google tr&ecirc;n cuộc đua với Android ngay khi vẫn đang bị tr&oacute;i buộc v&agrave;o thương vụ mặc định t&igrave;m kiếm Google tr&ecirc;n Safari.</p>

<p><strong>2. Facebook</strong></p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/facebook-vs-google-1469777151584/cothebanchuanhanragoogledangbi3luoidaokesatco.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>B&aacute;o c&aacute;o t&agrave;i ch&iacute;nh qu&yacute; vừa qua của Facebook đ&atilde; đ&aacute;nh dấu một cột mốc v&ocirc; c&ugrave;ng nổi bật: Mỗi ng&agrave;y c&oacute; tới 2 tỷ lượt t&igrave;m kiếm được thực hiện tr&ecirc;n mạng x&atilde; hội lớn nhất h&agrave;nh tinh, tăng tới 33% chỉ sau 9 th&aacute;ng. Tuy kh&ocirc;ng phải một c&ocirc;ng cụ t&igrave;m kiếm ch&iacute;nh thống nhưng Facebook chắc chắn sẽ khiến nhiều người phải ngạc nhi&ecirc;n khi so con số 2 tỷ n&agrave;y với mức 3,5 tỷ lượt t&igrave;m kiếm/ng&agrave;y của Google.</p>

<p>Theo số liệu từ trang đ&aacute;nh gi&aacute; lưu lượng Parse.ly, Facebook đang vượt Google trong cuộc chiến t&igrave;m kiếm nội dung. Người d&ugrave;ng internet c&oacute; xu hướng t&igrave;m kiếm v&agrave; click xem nội dung từ Facebook nhiều hơn l&agrave; từ Google.</p>

<p>&nbsp;</p>
<img alt="
Tỷ lệ lượt xem các trang tin với nguồn từ Facebook bắt đầu vượt Google từ tháng 7/2015
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/parsely-1469777290583/cothebanchuanhanragoogledangbi3luoidaokesatco.png" style="margin:0px" />
<p>Tỷ lệ lượt xem c&aacute;c trang tin với nguồn từ Facebook bắt đầu vượt Google từ th&aacute;ng 7/2015</p>

<p>&nbsp;</p>

<p>L&yacute; do đằng sau th&agrave;nh c&ocirc;ng của Facebook l&agrave; News Feed được c&aacute; nh&acirc;n h&oacute;a theo sở th&iacute;ch của người d&ugrave;ng. Chẳng ai l&ecirc;n mạng c&oacute; thể d&agrave;nh thời gian đọc hết mọi th&ocirc;ng tin được tung ra mỗi ng&agrave;y, thậm ch&iacute; cả t&iacute;t b&aacute;o hay ti&ecirc;u đề. Với thực tế đ&oacute;, thứ Facebook l&agrave;m tốt hơn Google l&agrave; khả năng t&igrave;m kiếm những th&ocirc;ng tin hấp dẫn nhất (từ bạn b&egrave; c&aacute;c page, group) với từng người d&ugrave;ng để hiển thị tr&ecirc;n News Feed của họ.</p>

<p>Hơn thế nữa, trong nhiều trường hợp, c&aacute;c kết quả t&igrave;m kiếm của Facebook cũng &ldquo;đ&uacute;ng gu&rdquo; người d&ugrave;ng hơn bởi c&aacute;c&nbsp;<strong>cập nhật từ bạn b&egrave; v&agrave; c&aacute;c page, group bạn theo d&otilde;i lu&ocirc;n được đẩy l&ecirc;n top đầu.&nbsp;</strong>Chẳng hạn nếu bạn đang t&igrave;m một nh&agrave; h&agrave;ng sushi ngon m&agrave; bạn b&egrave; m&igrave;nh từng check in ở H&agrave; Nội hay search nhanh tin hot đang lan truyền (trending) th&igrave; Facebook lại l&agrave; nơi t&igrave;m kiếm tuyệt vời &iacute;t c&oacute; nền tảng n&agrave;o s&aacute;nh bằng. Bản th&acirc;n người viết b&agrave;i cũng từng t&igrave;m mua được rất nhiều sản phẩm qua Facebook bởi kết quả cho về to&agrave;n từ c&aacute;c cửa h&agrave;ng tin tưởng đ&atilde; like chứ kh&ocirc;ng hiện qu&aacute; nhiều quảng c&aacute;o Adword như khi t&igrave;m tr&ecirc;n Google. Xu hưởng mobile-h&oacute;a hiện nay cũng khiến nhiều người lựa chọn search tr&ecirc;n Facebook hơn bởi ứng dụng Facebook dễ d&agrave;ng mang lại trải nghiệm mobile tốt hơn so với Google tr&ecirc;n tr&igrave;nh duyệt.</p>

<p>&nbsp;</p>
<img alt="
Ngoài các bộ lọc về địa điểm, thời gian như trên Google, Graph Search của Facebook còn cho phép tìm cả group, app, sự kiện ở gần, cho cả người có và không có tài khoản Facebook.
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/fb-cap-1469779134211/cothebanchuanhanragoogledangbi3luoidaokesatco.png" style="margin:0px" />
<p>Ngo&agrave;i c&aacute;c bộ lọc về địa điểm, thời gian như tr&ecirc;n Google, Graph Search của Facebook c&ograve;n cho ph&eacute;p t&igrave;m cả group, app, sự kiện ở gần, cho cả người c&oacute; v&agrave; kh&ocirc;ng c&oacute; t&agrave;i khoản Facebook.</p>

<p>&nbsp;</p>

<p>Một lợi thế kh&aacute;c của Facebook l&agrave; lượng dữ liệu mạng x&atilde; hội khổng lồ n&agrave;y nắm được về người d&ugrave;ng để điều tiết c&aacute;c kết quả t&igrave;m kiếm. Nếu như Google chỉ nắm dữ liệu người d&ugrave;ng qua c&aacute;c từ kh&oacute;a trước đ&acirc;y họ t&igrave;m th&igrave; Facebook lại biết cả nơi sống, sở th&iacute;ch, người th&acirc;n hay thậm ch&iacute; l&agrave; những g&igrave; bạn b&egrave; của bạn vừa l&agrave;m. Những dữ liệu n&agrave;y cực kỳ đ&aacute;ng gi&aacute; trong việc t&igrave;m kiếm ra c&aacute;c địa điểm, người quen, sự kiện, game, app,&hellip; m&agrave; bạn sẽ quan t&acirc;m.</p>

<p><strong>3. Amazon</strong></p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/amazon-vs-google-1469776978608/cothebanchuanhanragoogledangbi3luoidaokesatco.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Nghe c&oacute; vẻ l&agrave; một c&aacute;i t&ecirc;n chẳng li&ecirc;n quan g&igrave; đến địa hạt t&igrave;m kiếm nhưng Amazon cũng đang l&agrave; một mối nguy tiềm t&agrave;ng của Google. Năm 2014, chủ tịch điều h&agrave;nh Google Eric Schmidt từng chia sẻ:&nbsp;<em>&ldquo;Mọi người thường nghĩ Bing v&agrave; Yahoo l&agrave; đối thủ của ch&uacute;ng t&ocirc;i nhưng thực ra đối thủ lớn nhất về search của Google lại l&agrave; ch&iacute;nh l&agrave; Amazon.&rdquo;</em></p>

<p>Schmidt c&ograve;n chỉ ra việc kh&aacute;ch mua h&agrave;ng online rất thường xuy&ecirc;n bỏ qua Google v&agrave; truy cập thẳng v&agrave;o Amazon để t&igrave;m kiếm sản phẩm, đề cập rằng&nbsp;<em>&ldquo;năm ngo&aacute;i, 1/3 lượng người t&igrave;m kiếm sản phẩm tr&ecirc;n mạng search bằng Amazon, gấp đ&ocirc;i lượng người search bằng Google.&rdquo;</em>&nbsp;Một nghi&ecirc;n cứu từ Forrester Research cũng cho thấy 30% số người shopping online tới thẳng trang chủ Amazon; chỉ 13% bắt đầu từ Google. Năm 2015, số lượt search sản phẩm tr&ecirc;n Amazon cũng tăng tới 73%, trong khi con số n&agrave;y của Google lại dậm ch&acirc;n tại chỗ.</p>

<p>Với việc t&igrave;m kiếm sản phẩm ch&iacute;nh l&agrave; mảng search gi&uacute;p Google thu về lợi nhuận cực cao (qua Adwords), sự ưu &aacute;i d&agrave;nh cho Amazon r&otilde; r&agrave;ng đang b&aacute;o trước một tương lai đ&aacute;ng lo ngại cho g&atilde; khổng lồ t&igrave;m kiếm.</p>

<p><strong>Google c&oacute; đang đi chệch hướng?</strong></p>

<p>Nhiều &yacute; kiến cho rằng Google đang tự bắn v&agrave;o ch&acirc;n m&igrave;nh khi chuyển dịch dần từ m&ocirc; h&igrave;nh truyền thống (tập trung v&agrave;o trải nghiệm người d&ugrave;ng qua c&aacute;c kết quả search tự nhi&ecirc;n) sang hướng tận dụng tối đa c&aacute;c dịch vụ quảng c&aacute;o để kiếm doanh thu.</p>

<p>&nbsp;</p>
<img alt="
Khi quảng cáo lấn lướt kết quả tìm kiếm trên Google
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/gg-qc-1469779297558/cothebanchuanhanragoogledangbi3luoidaokesatco.png" style="margin:0px" />
<p>Khi quảng c&aacute;o lấn lướt kết quả t&igrave;m kiếm tr&ecirc;n Google</p>

<p>&nbsp;</p>

<p>Điều n&agrave;y c&oacute; thể dễ d&agrave;ng nh&igrave;n thấy qua phần diện t&iacute;ch lớn cho quảng c&aacute;o tr&ecirc;n trang đầu kết quả t&igrave;m kiếm. Tuy Google kh&ocirc;ng hẳn l&agrave; kh&ocirc;ng tạo cơ hội n&agrave;o cho c&aacute;c website nhỏ ngoi l&ecirc;n top đầu nhưng với chiến lược &ldquo;khai th&aacute;c triệt để&rdquo; mọi kh&iacute;a cạnh search, từ địa điểm, h&igrave;nh ảnh cho đến video,&hellip; th&igrave; c&oacute; lẽ việc lọt top đầu t&igrave;m kiếm Google sẽ rất kh&oacute; đối với c&aacute;c doanh nghiệp, website với ng&acirc;n s&aacute;ch quảng c&aacute;o eo hẹp chứ kh&ocirc;ng hề đơn giản như tr&ecirc;n Facebook (thường hiện l&ecirc;n top đầu với người d&ugrave;ng like page; chi ph&iacute; quảng c&aacute;o cũng thấp hơn Google). Ch&iacute;nh v&igrave; vậy, nếu c&aacute;c c&ocirc;ng cụ t&igrave;m kiếm thay thế như Facebook, Bing, Amazon c&oacute; thể khắc phục được yếu tố n&agrave;y, lẽ dĩ nhi&ecirc;n người d&ugrave;ng sẽ muốn quay sang với họ.</p>

<p>Google hiện vẫn l&agrave; c&ocirc;ng cụ t&igrave;m kiếm chủ đạo tr&ecirc;n Internet, nhưng c&aacute;c xu hướng kể tr&ecirc;n cũng c&oacute; thể mở ra những hướng đi kh&aacute;c cho c&aacute;c hoạt động marketing online. C&aacute;c hướng đi thay thế c&oacute; thể kể đến chuyển dịch dần sang c&aacute;c nền tảng như Facebook, Instagram, c&aacute;c site b&aacute;n h&agrave;ng online phổ biến,... hay c&aacute;c h&igrave;nh thức branding khuyến kh&iacute;ch giới thiệu, gợi &yacute; cho bạn b&egrave;, người th&acirc;n.</p>
',N'Có thể bạn chưa nhận ra Google đang bị 3 lưỡi dao kề sát cổ',N'Vị thế số 1 trong lĩnh vực tìm kiếm thông tin của Google có khi nào bị đe dọa hay không?',N'publish',N'co-the-ban-chua-nhan-ra-google-dang-bi-3-luoi-dao-ke-sat-co',{ts '2016-07-30 09:01:35.750'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
81,1,{ts '2016-07-30 09:03:17.320'},N'<p>So với h&igrave;nh thức taxi truyền thống, taxi online như&nbsp;<a href="http://genk.vn/uber.htm" target="_blank">Uber</a>&nbsp;v&agrave; Grab đang được nhiều người lựa chọn. Tuy nhi&ecirc;n, loại h&igrave;nh taxi n&agrave;y cũng chứa nhiều điều bất cập.</p>

<p>Điển h&igrave;nh như tại H&agrave; Nội, do ảnh hưởng của cơn b&atilde;o số 1, mưa gi&oacute; khiến nhiều tuyến đường bị ngập, c&acirc;y đổ, kh&oacute; lưu th&ocirc;ng. Do đ&oacute;, nhiều người d&acirc;n đ&atilde; t&iacute;nh đến việc đi taxi như một phương tiện &quot;cứu c&aacute;nh&quot;.</p>

<p>&nbsp;</p>
<img alt="Tại một số khu bực Uber tăng cước gấp 2,9 lần lên mức 14,5 nghìn đồng, nhưng vẫn không có xe taxi" src="http://genknews.genkcdn.vn/k:2016/1-muabaotaihanoiubergrabtanggiakyluc-1469761303074/muabaotaihanoiubergrabtanggiakyluc.png" style="margin:0px" /><br />
<em>Tại một số khu bực Uber tăng cước gấp 2,9 lần l&ecirc;n mức 14,5 ngh&igrave;n đồng, nhưng vẫn kh&ocirc;ng c&oacute; xe taxi</em>

<p>&nbsp;</p>

<p>Tuy nhi&ecirc;n, c&aacute;c ứng dụng taxi như Uber v&agrave; Grab đ&atilde; lập tức tăng gi&aacute;. Tại một số khu vực kh&aacute; xa trung t&acirc;m th&agrave;nh phố, taxi Uber 4 chỗ đ&atilde; tăng gi&aacute; đến 2,7 lần v&agrave; Uber 7 chỗ tăng 2,9 lần. D&ugrave; vậy, những khu vực n&agrave;y cũng hiếm c&oacute; taxi n&agrave;o hoạt động.</p>

<p>&nbsp;</p>
<img alt="Tại khu vực Hàng Trống có khá nhiều taxi trống nhưng giá cũng tăng 1,6 lần" src="http://genknews.genkcdn.vn/k:2016/2-muabaotaihanoiubergrabtanggiakyluc-1469761299690/muabaotaihanoiubergrabtanggiakyluc.jpg" style="margin:0px" /><br />
<em>Tại khu vực H&agrave;ng Trống c&oacute; kh&aacute; nhiều taxi trống nhưng gi&aacute; cũng tăng 1,6 lần</em>

<p>&nbsp;</p>

<p>Trong khi đ&oacute;, tại một điểm nằm kh&aacute; gần trung t&acirc;m như phố H&agrave;ng Trống, gi&aacute; taxi Uber cũng tăng đến 1,6 lần, d&ugrave; c&oacute; kh&aacute; nhiều xe trống.</p>

<p>&nbsp;</p>
<img alt="Taxi Grab cũng tăng giá không kém" src="http://genknews.genkcdn.vn/k:2016/3-muabaotaihanoiubergrabtanggiakyluc-1469761283379/muabaotaihanoiubergrabtanggiakyluc.jpg" style="margin:0px" /><br />
<em>Taxi Grab cũng tăng gi&aacute; kh&ocirc;ng k&eacute;m</em>

<p>&nbsp;</p>

<p>Sở dĩ, gi&aacute; taxi của c&aacute;c ứng dụng online tăng gi&aacute; bất thường khi xảy ra thời tiết xấu. Bởi thực chất, đ&acirc;y chỉ l&agrave; một m&ocirc; h&igrave;nh li&ecirc;n kết, kh&ocirc;ng c&oacute; sự r&agrave;ng buộc giữa c&aacute;c ứng dụng v&agrave; c&aacute;c t&agrave;i xế.</p>

<p>&nbsp;</p>
<img alt="Thới tiết mưa bão, mức giá taxi Uber thay đổi theo từng phút" src="http://genknews.genkcdn.vn/k:2016/4-muabaotaihanoiubergrabtanggiakyluc-1469761280148/muabaotaihanoiubergrabtanggiakyluc.jpg" style="margin:0px" /><br />
<em>Thới tiết mưa b&atilde;o, mức gi&aacute; taxi Uber thay đổi theo từng ph&uacute;t</em>

<p>&nbsp;</p>

<p>V&igrave; vậy, khi xảy ra điều kiện thời tiết kh&ocirc;ng thuận lợi, chắc chắn sẽ dẫn đến t&igrave;nh trạng khan hiếm taxi v&agrave; tăng gi&aacute;.</p>

<p>Điều n&agrave;y cho thấy một yếu điểm rất lớn khi so s&aacute;nh m&ocirc; h&igrave;nh taxi trực tuyến n&agrave;y với c&aacute;c thương hiệu vận tải taxi truyền thống. Bởi, m&ocirc; h&igrave;nh n&agrave;y thường thiếu t&iacute;nh ổn định v&agrave; sự tiện dụng trong nhiều trường hợp.</p>
',N'Mưa bão tại Hà Nội, Uber, Grab tăng giá “kỷ lục”',N'Trong sáng ngày 28/7, thời tiết mưa bão tại Hà Nội đã khiến giá cước taxi online như Uber hay Grab tăng liên tục, gấp gần 3 lần thông thường.
',N'publish',N'mua-bao-tai-ha-noi-uber-grab-tang-gia-ky-luc',{ts '2016-07-30 09:03:17.320'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
82,1,{ts '2016-07-30 09:04:24.963'},N'<p>Tại Google c&oacute; một ph&ograve;ng th&iacute; nghiệm c&oacute; t&ecirc;n Google X. Đ&acirc;y l&agrave; ph&ograve;ng th&iacute; nghiệm phần mềm khổng lồ, thực hiện rất nhiều dự &aacute;n như xe tự l&aacute;i, k&iacute;nh Google Glass v&agrave; tất cả được gọi l&agrave; những dự &aacute;n &ldquo;moonshot&rdquo;.</p>

<p>Từ &ldquo;moonshot&rdquo; để chỉ những dự &aacute;n mang t&iacute;nh c&aacute;ch mạng, bắt nguồn từ những &yacute; tưởng &ldquo;cao si&ecirc;u&rdquo; nhưng chi ph&iacute; cho những dự &aacute;n n&agrave;y l&ecirc;n tới h&agrave;ng tỷ USD. Tất nhi&ecirc;n những &yacute; tưởng n&agrave;y đều phải c&oacute; tiềm năng rất lớn.</p>

<p>Năm 2011, một nh&oacute;m c&aacute;c kỹ sư phần mềm v&agrave; kiến tr&uacute;c sư l&agrave;m việc tại dự &aacute;n n&agrave;y đ&atilde; c&ugrave;ng nhau nghi&ecirc;n cứu việc l&agrave;m thế n&agrave;o để năm 2045 sẽ c&oacute; 6 tỷ người sống ở c&aacute;c đ&ocirc; thị. Để thực hiện được điều n&agrave;y, c&aacute;c kiến tr&uacute;c sư cần c&oacute; khả năng thiết kế c&aacute;c kh&ocirc;ng gian hay cụ thể l&agrave; c&aacute;c t&ograve;a nh&agrave; hiện quả hơn.</p>

<p>Tuy nhi&ecirc;n quy tr&igrave;nh thiết kế v&agrave; cả những việc phải l&agrave;m trong qu&aacute; tr&igrave;nh tạo ra một bản thiết kế ho&agrave;n chỉnh của một t&ograve;a nh&agrave; với mỗi c&ocirc;ng ty lại c&oacute; sự kh&aacute;c nhau. Do đ&oacute; nh&oacute;m ph&aacute;t triển nhận ra việc cần l&agrave;m của họ l&agrave; tạo ra một c&ocirc;ng cụ gi&uacute;p cho c&aacute;c bộ phận thiết kế kiến tr&uacute;c c&oacute; thể l&agrave;m việc trực tiếp với nhau li&ecirc;n tục dựa tr&ecirc;n nền tảng đ&aacute;m m&acirc;y.</p>

<p>Theo người đứng đầu mảng ph&aacute;t triển kinh doanh của Flux: &ldquo;<em>C&aacute;c kiến tr&uacute;c sư thường mất nhiều giờ để l&agrave;m cho tập tin của nền tảng n&agrave;y đọc được tr&ecirc;n nền tảng kh&aacute;c. Nhưng với Flux, mọi thứ sẽ l&agrave; tức th&igrave;. Một tập tin được l&agrave;m bằng phần mềm n&agrave;y th&igrave; cũng c&oacute; thể mở v&agrave; cập nhật từ phần mềm kh&aacute;c</em>&quot;.</p>

<p>&nbsp;</p>

<p>Về mặt l&yacute; thuyết, Flux chia sẻ dữ liệu chứ kh&ocirc;ng chia sẻ tập tin. Do đ&oacute; thời gian xử l&yacute; v&agrave; chuyển dữ liệu sẽ nhanh hơn nhiều. Giảm thời gian để ho&agrave;n th&agrave;nh kh&acirc;u thiết kế c&ocirc;ng tr&igrave;nh. Ngo&agrave;i ra thời gian l&agrave;m việc thực tế giảm xuống cũng sẽ gi&uacute;p cho c&ocirc;ng ty thiết kế tiết kiệm được nh&acirc;n lực thực hiện dự &aacute;n.</p>

<p><strong>Ra đi để ph&aacute;t triển hơn</strong></p>

<p>Sau một năm l&agrave;m việc c&ugrave;ng c&aacute;c dự &aacute;n kh&aacute;c của Google X, Flux t&aacute;ch ra trở th&agrave;nh một c&ocirc;ng ty ri&ecirc;ng trong năm 2012.</p>

<p>L&yacute; do của việc t&aacute;ch ra n&agrave;y một phần v&igrave; Google X hoạt động theo hướng nghi&ecirc;n cứu với rất nhiều th&agrave;nh vi&ecirc;n từ nhiều dự &aacute;n kh&aacute;c nhau nhưng họ c&oacute; điểm chung l&agrave; c&oacute; một ch&uacute;t &ldquo;đi&ecirc;n&rdquo; của c&aacute;c nh&agrave; khoa học.</p>

<p>Kể từ khi t&aacute;ch ra khỏi Google, từ một c&ocirc;ng ty kh&ocirc;ng c&oacute; bất cứ kế hoạch n&agrave;o cho sản phẩm đ&atilde; ra mắt được th&ecirc;m phi&ecirc;n bản cho c&aacute;c hệ điều h&agrave;nh kh&aacute;c v&agrave; h&agrave;ng loạt plugin gi&uacute;p n&oacute; c&oacute; thể hoạt động với mọi c&ocirc;ng cụ thiết kế phổ biến.</p>

<p>Nhờ vậy sản phẩm kh&ocirc;ng chỉ được sử dụng trong một nh&oacute;m c&aacute;c kiến tr&uacute;c sư độc lập m&agrave; c&ograve;n cả những c&ocirc;ng ty thiết kế lớn.</p>

<p>Ch&iacute;nh điều n&agrave;y cũng l&agrave; trở ngại của Flux. Nhiều kiến tr&uacute;c sư hiện nay đang coi những c&ocirc;ng cụ như Flux l&agrave; mối đe dọa cho c&ocirc;ng việc của họ. C&aacute;c c&ocirc;ng việc trước đ&acirc;y thường được l&agrave;m thủ c&ocirc;ng nay sẽ c&oacute; những ứng dụng thay thế.</p>

<p>Đồng s&aacute;ng lập Flux Jen Carlile cho rằng: &ldquo;<em>C&aacute;ch duy nhất để thay đổi suy nghĩ n&agrave;y đ&oacute; l&agrave; l&agrave;m cho ch&iacute;nh những kiến tr&uacute;c sư, những người d&ugrave;ng Flux v&agrave; c&aacute;c phần m&ecirc;m thiết kế hằng ng&agrave;y hiểu rằng đ&acirc;y chỉ l&agrave; c&ocirc;ng cụ hỗ trợ, kh&ocirc;ng tự động h&oacute;a c&ocirc;ng việc của người kh&aacute;c</em>&rdquo;.</p>

<p>R&otilde; r&agrave;ng thiết kế l&agrave; một c&ocirc;ng việc phức tạp v&agrave; phần mềm kh&ocirc;ng thể thay con người s&aacute;ng tạo. Flux ph&aacute;t triển hướng đến những kiến tr&uacute;c sư kh&ocirc;ng c&oacute; th&oacute;i quen sử dụng nhiều phần mềm.</p>

<p>Nền tảng đ&aacute;m m&acirc;y của Flux cũng c&oacute; thể l&agrave;m việc với nền tảng dữ liệu mở về sức khỏe, t&aacute;c động m&ocirc;i trường, gi&uacute;p người d&ugrave;ng ho&agrave;n thiện thiết kế của m&igrave;nh một c&aacute;ch đơn giản nhất. Nhưng hiện nay chức năng n&agrave;y vẫn đang trong giai đoạn ph&aacute;t triển v&agrave; Google vẫn l&agrave; đối t&aacute;c c&ugrave;ng thực hiện với Flux.</p>
',N'Flux: Startup tách khỏi Google để phát triển hơn',N'Có thể Google là môi trường hỗ trợ cho nghiên cứu sản phẩm tuyệt vời nhưng lựa chọn rời khỏi “ông lớn” mới là cách đưa sản phẩm phát triển.
',N'publish',N'flux-startup-tach-khoi-google-de-phat-trien-hon',{ts '2016-07-30 09:04:24.963'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
83,1,{ts '2016-07-30 09:05:29.527'},N'<p>Samsung Mobile Korea vừa đăng tải video quảng c&aacute;o cho thấy những h&igrave;nh ảnh đầu ti&ecirc;n của chiếc điện thoại Galaxy Note7 tr&ecirc;n k&ecirc;nh YouTube ch&iacute;nh thức của c&ocirc;ng ty. Một v&agrave;i t&iacute;nh năng của chiếc phablet 5.8 inch cũng đ&atilde; lộ diện. Mặc d&ugrave; kh&ocirc;ng đề cập trực tiếp nhưng cũng dễ d&agrave;ng nhận ra t&iacute;nh năng qu&eacute;t v&acirc;n tay v&agrave; m&agrave;n h&igrave;nh mở kh&oacute;a bằng h&igrave;nh vẽ mới của Galaxy Note7.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/not7-1469698267653/dacovideoquangcaodautienchosamsunggalaxynote7helonhieutinhnangmoi.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Chiếc điện thoại n&agrave;y cũng được trang bị một m&aacute;y qu&eacute;t mống mắt c&oacute; thể mở kh&oacute;a trong thời gian 22 gi&acirc;y.</p>

<p>H&igrave;nh ảnh một loạt thiết bị được thả xuống nước cũng l&agrave; một lời gợi &yacute; cho việc Galaxy Note7 sẽ đ&aacute;p ứng ti&ecirc;u chuẩn IP68. Nếu th&ocirc;ng tin n&agrave;y ch&iacute;nh x&aacute;c th&igrave; Galaxy Note7 sẽ l&agrave; chiếc Galaxy Note đầu ti&ecirc;n được trang bị khả năng chống thấm nước (cho ph&eacute;p thiết bị hoạt động b&igrave;nh thường trong điều kiện ngập s&acirc;u dưới 1 m&eacute;t nước trong thời gian 30 ph&uacute;t).</p>
&nbsp;

<p>Video quảng c&aacute;o Galaxy Note7</p>

<p>Ngo&agrave;i ra, một d&atilde;y số lần lượt ph&aacute;t s&aacute;ng từ 1 đến 5 c&ugrave;ng dấu chấm hỏi cuối c&ugrave;ng thể hiện quyết t&acirc;m của Samsung trong việc bỏ qua t&ecirc;n gọi Galaxy Note6 để tiến thẳng l&ecirc;n&nbsp;<a href="http://genk.vn/galaxy-note7.htm" target="_blank">Galaxy Note7</a>. Theo một số nh&agrave; ph&acirc;n t&iacute;ch th&igrave; Samsung đang muốn đồng bộ t&ecirc;n gọi giữa c&aacute;c d&ograve;ng sản phẩm cao cấp của c&ocirc;ng ty v&agrave; x&oacute;a bỏ cảm gi&aacute;c d&ograve;ng Galaxy Note lu&ocirc;n đi sau Galaxy S một bước.</p>

<p>Theo dự kiến, chiếc Galaxy Note tiếp theo sẽ được tr&igrave;nh l&agrave;ng tại sự kiện Unpacked 2016 v&agrave;o ng&agrave;y 2 th&aacute;ng T&aacute;m tới tại New York. H&atilde;y c&ugrave;ng chờ xem Samsung sẽ mang bất ngờ n&agrave;o đến cho ch&uacute;ng ta khi tr&igrave;nh l&agrave;ng thiết bị mới nhất của m&igrave;nh.</p>
',N'Đã có video quảng cáo đầu tiên cho Samsung Galaxy Note7, hé lộ nhiều tính năng mới',N'Samsung Hàn Quốc vừa tung một video quảng cáo hé lộ một số tính năng của chiếc phablet Galaxy Note7 sắp tới.
',N'publish',N'da-co-video-quang-cao-dau-tien-cho-samsung-galaxy-note7-he-lo-nhieu-tinh-nang-moi',{ts '2016-07-30 09:05:29.527'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
84,1,{ts '2016-07-30 09:06:18.757'},N'<p>Sau khi b&aacute;n ra 324,8 triệu chiếc smartphone trong năm ngo&aacute;i, một số nguồn tin th&acirc;n cận cho biết Samsung đ&atilde; n&acirc;ng mục ti&ecirc;u l&ecirc;n 350 triệu thiết bị trong năm nay. Theo c&aacute;c nh&agrave; ph&acirc;n t&iacute;ch, nếu thực hiện th&agrave;nh c&ocirc;ng mục ti&ecirc;u n&agrave;y Samsung nhiều khả năng sẽ giữ vững vị tr&iacute; nh&agrave; sản xuất điện thoại th&ocirc;ng minh lớn nhất thế giới trong năm 2016.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/note7b-1469607937538/2016selanamvangcuasamsungkhicongtydutinhbanduoctoi350trieuchiecsmartphone.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Trong Qu&yacute; 1/2016, Samsung đ&atilde; b&aacute;n ra thị trường được 81,9 triệu chiếc smartphone. Trong qu&yacute; 2, con số n&agrave;y đ&atilde; giảm 7%, đạt 77 triệu thiết bị.</p>

<p>Để đạt được mục ti&ecirc;u 350 triệu chiếc smartphone b&aacute;n ra trong năm nay, Samsung phải b&aacute;n ra được 191,1 triệu chiếc smartphone trong 2 qu&yacute; c&ograve;n lại của năm. Qu&yacute; 4 h&agrave;ng năm l&agrave; m&ugrave;a mua sắm v&agrave; đ&acirc;y c&oacute; thể l&agrave; một cơ hội lớn để Samsung ho&agrave;n th&agrave;nh mục ti&ecirc;u của m&igrave;nh.</p>

<p>Samsung Galaxy S7 v&agrave; Samsung Galaxy S7 edge đ&atilde; đạt doanh số 27 triệu chiếc trong nửa đầu năm nay. Đ&acirc;y l&agrave; một con số kh&aacute; ấn tượng nếu như ch&uacute;ng ta biết rằng năm 2010, Samsung chỉ hi vọng b&aacute;n được 25 triệu smartphone cả năm.</p>

<p>Niềm tin của Samsung trong nửa c&ograve;n lại của năm 2016 c&oacute; lẽ sẽ tập trung v&agrave;o chiếc phablet Galaxy Note7. Thiết bị n&agrave;y dự kiến sẽ được tr&igrave;nh l&agrave;ng v&agrave;o ng&agrave;y 2 th&aacute;ng T&aacute;m tới trong sự kiện<a href="http://genk.vn/samsung.htm" target="_blank">Samsung</a>&nbsp;Unpacked tại th&agrave;nh phố New York.</p>

<p>Theo những tin đồn gần đ&acirc;y th&igrave; Samsung Galaxy Note7 sẽ sở hữu một m&agrave;n h&igrave;nh hiển thị Super AMOLED 5,8-inch với độ ph&acirc;n giải 1440 x 2560 pixel. M&aacute;y sử dụng vi xử l&iacute; Snapdragon 820 (hoặc Snapdragon 821) cho phi&ecirc;n bản tại Hoa Kỳ v&agrave; chip Exynos 8893 tại một số thị trường kh&aacute;c. Galaxy Note7 c&oacute; RAM 4 GB, m&aacute;y ảnh ch&iacute;nh 12 MP, m&aacute;y ảnh phụ 8 MP, t&iacute;ch hợp pin 3500 mAh v&agrave; chạy Android 6.0. Ngo&agrave;i ra, Galaxy Note7 nhiều khả năng sẽ được trang bị m&aacute;y qu&eacute;t mống mắt b&ecirc;n cạnh cảm biến v&acirc;n tay.</p>
',N'2016 sẽ là năm vàng của Samsung khi công ty dự tính bán được tới 350 triệu chiếc smartphone',N'Theo một số nguồn tin thân cận với Samsung thì công ty Hàn Quốc dự kiến sẽ bán ra thị trường được 350 triệu chiếc smartphone trong năm 2016.
',N'publish',N'2016-se-la-nam-vang-cua-samsung-khi-cong-ty-du-tinh-ban-duoc-toi-350-trieu-chiec-smartphone',{ts '2016-07-30 09:06:18.757'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
85,1,{ts '2016-07-30 09:08:33.123'},N'<p>Phần mềm Dumpster l&agrave; một phần mềm được sinh ra để hỗ trợ người d&ugrave;ng ngăn chặn những sự cố đ&aacute;ng tiếc xảy ra khi x&oacute;a nhầm dữ liệu ngay từ đầu. C&aacute;ch thức hoạt động của phần mềm n&agrave;y cũng tương tự như &quot;Th&ugrave;ng r&aacute;c&quot; ở tr&ecirc;n Windows. N&oacute; sẽ giữ lại những file m&agrave; người d&ugrave;ng đ&atilde; x&oacute;a, v&agrave; c&oacute; thể gi&uacute;p người d&ugrave;ng kh&ocirc;i phục những nội dung đ&oacute;. H&atilde;y c&ugrave;ng xem video dưới đ&acirc;y để biết r&otilde; hơn về phần mềm n&agrave;y.</p>
&nbsp;

<p>Dumpster - Xua tan nỗi lo x&oacute;a nhầm dữ liệu</p>
',N'Không còn lo sợ xóa nhầm dữ liệu với phần mềm Dumpster - "Recycle Bin" của Android',N'Việc xóa nhầm dữ liệu, hình ảnh quan trọng là điều thường xảy ra đối với người dùng điện thoại, đặc biệt là đối với điện thoại hiện đại bởi màn hình cảm ứng của chúng. Việc tìm lại những file đã bị xóa là một điều khá khó khăn và chỉ mang tính may rủi
',N'publish',N'khong-con-lo-so-xoa-nham-du-lieu-voi-phan-mem-dumpster-recycle-bin-cua-android',{ts '2016-07-30 09:08:33.123'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
86,1,{ts '2016-07-31 13:49:39.740'},N'<p>Giữ vững vị tr&iacute; l&agrave; c&ocirc;ng cụ t&igrave;m kiếm số 1 của m&igrave;nh, Google đ&atilde; đưa v&agrave;o rất nhiều t&iacute;nh năng để gi&uacute;p người d&ugrave;ng t&igrave;m kiếm hầu như bất cứ thứ g&igrave;. V&agrave; Google Flights l&agrave; c&ocirc;ng cụ được nhắm đến cho c&aacute;c kế hoạch du lịch của người d&ugrave;ng.</p>

<p>Trang ch&iacute;nh thức của Google Flights tại địa chỉ:&nbsp;<a href="https://www.google.com/flights" target="_blank">https://www.google.com/flights</a>, h&igrave;nh dưới l&agrave; giao diện ch&iacute;nh</p>

<p>&nbsp;</p>
<img alt="Theo dõi giá vé máy bay với Google Flights" src="http://www.techsignin.com/wp-content/uploads/2016/07/cach-su-dung-google-flights.png" style="height:auto; width:800px" />
<p>Giao diện ch&iacute;nh của Google Flights</p>

<p>Tại đ&acirc;y c&oacute; nhiều th&ocirc;ng tin bạn c&oacute; thể nhập v&agrave;o để Google Flights t&igrave;m kiếm cho bạn chuyến bay ph&ugrave; hợp nhất, từ c&aacute;c chuyến bay (khứ hồi, một chiều, nhiều chặng) hạng bay (phổ th&ocirc;ng, cao cấp, thương gia, hạng nhất) v&agrave; số lượng người bay (người lớn, trẻ em&hellip;), lựa chọn điểm đi/điểm đến.</p>

<p>Điểm th&uacute; vị l&agrave; phần kh&aacute;m ph&aacute; điểm đến, bạn sẽ c&oacute; 3 thẻ l&agrave; ng&agrave;y, địa điểm v&agrave; theo sở th&iacute;ch</p>
<img alt="Theo dõi giá vé máy bay với Google Flights" src="http://www.techsignin.com/wp-content/uploads/2016/07/techsignin-kham-pha-dia-diem-google-flights.jpg" style="height:auto; width:800px" />
<p>Menu kh&aacute;m ph&aacute; địa điểm của Google Flights</p>

<p>T&ugrave;y theo những lựa chọn của m&igrave;nh, Google Flights sẽ xuất hiện danh s&aacute;ch những địa điểm bạn c&oacute; thể đến đ&oacute; c&ugrave;ng với gi&aacute; v&eacute; m&aacute;y bay ước lượng. V&iacute; dụ khi Techsignin lựa chọn một chuyến bay từ TP.HCM ra Đ&agrave; Nẵng th&igrave; nội dung sau sẽ xuất hiện</p>
<img alt="Theo dõi giá vé máy bay với Google Flights" src="http://www.techsignin.com/wp-content/uploads/2016/07/techsignin-gia-ve-may-bay-google-flights.png" style="height:auto; width:800px" />
<p>Gi&aacute; v&eacute; m&aacute;y bay được Google Flights đề xuất</p>

<p>Tại đ&acirc;y c&oacute; một mục th&uacute; vị l&agrave; theo d&otilde;i gi&aacute;, với c&aacute;c t&ugrave;y chọn bạn thiết lập cho h&agrave;nh tr&igrave;nh, bạn c&oacute; thể nhờ Google Flights th&ocirc;ng b&aacute;o khi c&oacute; chuyến hay gi&aacute; tốt v&agrave; gửi nội dung về email của m&igrave;nh:</p>

<p><img alt="Theo dõi giá vé máy bay với Google Flights" src="http://www.techsignin.com/wp-content/uploads/2016/07/techsignin-theo-doi-gia-ve-may-bay-google-flights-2.png" style="height:auto; margin:0px auto 20px; width:600px" /></p>

<p>&nbsp;</p>

<p>Tiếp tục đặt v&eacute;, lựa chọn điểm đi v&agrave; điểm đến, Google sẽ mở nội dung như b&ecirc;n dưới</p>

<p><img alt="Theo dõi giá vé máy bay với Google Flights" src="http://www.techsignin.com/wp-content/uploads/2016/07/techsignin-gia-ve-may-bay-google-flights-2.png" style="height:auto; margin:0px auto 20px; width:800px" /></p>

<p>B&ecirc;n cạnh đ&oacute;, bạn cũng c&oacute; thể quản l&yacute; những th&ocirc;ng tin m&igrave;nh đ&atilde; nhập cũng như theo d&otilde;i qua Menu h&igrave;nh b&aacute;nh kẹp ở dưới logo Google</p>
<img alt="Theo dõi giá vé máy bay với Google Flights" src="http://www.techsignin.com/wp-content/uploads/2016/07/techsignin-theo-doi-gia-ve-may-bay-google-flights-3.png" style="height:auto; width:464px" />
<p>Menu b&aacute;nh kẹp dưới logo Google</p>

<p>Khi mở menu n&agrave;y, bạn cũng c&oacute; thể thay đổi ng&ocirc;n ngữ sử dụng cũng như đơn vị tiền tệ cho ph&ugrave; hợp với m&igrave;nh.</p>

<p>Hiện Techsignin chưa r&otilde; Google Flights c&oacute; li&ecirc;n kết để th&ocirc;ng b&aacute;o những đợt khuyến m&atilde;i v&eacute; m&aacute;y bay gi&aacute; rẻ đến từ c&aacute;c h&atilde;ng h&agrave;ng kh&ocirc;ng hay chưa, nếu c&oacute; th&igrave; sẽ thật sự tiện lợi cho người d&ugrave;ng khi c&oacute; thể dễ d&agrave;ng săn v&eacute; m&aacute;y bay gi&aacute; rẻ ph&ugrave; hợp với nhu cầu của m&igrave;nh.</p>
',N'Theo dõi giá vé máy bay với Google Flights',N'Google Flights là công cụ Google giúp bạn có thể tìm kiếm vé máy bay giá rẻ, cũng như khám phá nhiều điểm đến hấp dẫn, đặc biệt còn giúp bạn đặt theo dõi những chuyến bay bạn muốn.',N'publish',N'theo-doi-gia-ve-may-bay-voi-google-flights',{ts '2016-07-31 13:49:00.000'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
87,NULL,{ts '2016-07-31 13:51:37.790'},N'Image upload',N'planning-a-vacation-let-google-inc-google-flights-be-your-guide',NULL,N'inherit',N'af2a18f8-24d7-46d1-adc4-6140bd9016f3planning-a-vacation-let-google-inc-google-flights-be-your-guide',{ts '2016-07-31 13:51:37.803'},0,N'af2a18f8-24d7-46d1-adc4-6140bd9016f3planning-a-vacation-let-google-inc-google-flights-be-your-guide.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
88,1,{ts '2016-07-31 13:54:03.793'},N'<p><img alt="Đánh giá Obi Worldphone MV1: hiệu năng tạm, thiết kế gây tò mò" src="http://www.techsignin.com/wp-content/uploads/2016/06/danh-gia-obi-worldphone-mv1-50.jpg" style="margin:0px auto 20px; width:500px" /></p>

<p>T&iacute;nh đ&uacute;ng ra th&igrave; Obi Worldphone MV1 m&agrave; Techsign.in c&oacute; dịp trải nghiệm l&agrave; mẫu smartphone thứ tư của thương hiệu đến từ nước Mỹ n&agrave;y, song về thực chất MV1 phi&ecirc;n bản thứ 3 hầu như chỉ kh&aacute;c biệt về cấu h&igrave;nh chip v&agrave; chạy Android của Google, c&ograve;n bản mới xuất hiện tại thị trường Việt Nam với dung lượng RAM 2GB (gấp đ&ocirc;i bản trước) th&igrave; chạy hệ điều h&agrave;nh Cyanogen OS 12.1.1 (t&ugrave;y biến từ Android 5.1)</p>

<p><em><strong>Thiết kế:</strong></em></p>

<p>Obi Worldphone MV1 c&oacute; một vẻ bề ngo&agrave;i được xem l&agrave; lai tạo giữa 2 người tiền nhiệm l&agrave; Obi SF1 v&agrave; Obi SJ1.5, với chữ viết MV l&agrave; Mountain View. M&aacute;y c&oacute; thiết kế phần đầu với cạnh bằng, trong khi phần đ&aacute;y l&agrave; cạnh bo cong (giống Obi SJ1.5), phần mặt k&iacute;nh m&agrave;n h&igrave;nh được nh&ocirc; l&ecirc;n so với th&acirc;n m&aacute;y v&agrave; bao quanh bằng đường viền cũng bo cong cả 4 cạnh (như Obi SF1). Thiết kế n&agrave;y gi&uacute;p cho MV1 trở n&ecirc;n kh&aacute;c biệt như 2 người tiền nhiệm, kết hợp với lớp sơn đen phủ đường viền v&agrave; mặt sau tạo cho m&aacute;y một vẻ đẹp cuốn h&uacute;t.</p>
<a href="http://www.techsignin.com/wp-content/uploads/2016/05/techsignin-anh-thuc-te-obi-worldphone-mv1-1.jpg"><img alt="Hình ảnh Obi Worldphone MV1" src="http://www.techsignin.com/wp-content/uploads/2016/05/techsignin-anh-thuc-te-obi-worldphone-mv1-1-150x150.jpg" style="height:auto; margin:0px; width:150px" />H&igrave;nh ảnh Obi Worldphone MV1</a><br />
<a href="http://www.techsignin.com/wp-content/uploads/2016/05/techsignin-anh-thuc-te-obi-worldphone-mv1-5.jpg"><img alt="Hình ảnh Obi Worldphone MV1" src="http://www.techsignin.com/wp-content/uploads/2016/05/techsignin-anh-thuc-te-obi-worldphone-mv1-5-150x150.jpg" style="height:auto; margin:0px; width:150px" />H&igrave;nh ảnh Obi Worldphone MV1</a><br />
<a href="http://www.techsignin.com/wp-content/uploads/2016/05/techsignin-anh-thuc-te-obi-worldphone-mv1-4.jpg"><img alt="Hình ảnh Obi Worldphone MV1" src="http://www.techsignin.com/wp-content/uploads/2016/05/techsignin-anh-thuc-te-obi-worldphone-mv1-4-150x150.jpg" style="height:auto; margin:0px; width:150px" />H&igrave;nh ảnh Obi Worldphone MV1</a><br />
<a href="http://www.techsignin.com/wp-content/uploads/2016/05/techsignin-anh-thuc-te-obi-worldphone-mv1-3.jpg"><img alt="Hình ảnh Obi Worldphone MV1" src="http://www.techsignin.com/wp-content/uploads/2016/05/techsignin-anh-thuc-te-obi-worldphone-mv1-3-150x150.jpg" style="height:auto; margin:0px; width:150px" />H&igrave;nh ảnh Obi Worldphone MV1</a><br />
<a href="http://www.techsignin.com/wp-content/uploads/2016/05/techsignin-anh-thuc-te-obi-worldphone-mv1-2.jpg"><img alt="Hình ảnh Obi Worldphone MV1" src="http://www.techsignin.com/wp-content/uploads/2016/05/techsignin-anh-thuc-te-obi-worldphone-mv1-2-150x150.jpg" style="height:auto; margin:0px; width:150px" />H&igrave;nh ảnh Obi Worldphone MV1</a><br />
<a href="http://www.techsignin.com/wp-content/uploads/2016/06/danh-gia-obi-worldphone-mv1-51.jpg"><img alt="Đánh giá Obi Worldphone MV1: hiệu năng tạm, thiết kế gây tò mò" src="http://www.techsignin.com/wp-content/uploads/2016/06/danh-gia-obi-worldphone-mv1-51-150x150.jpg" style="height:auto; margin:0px; width:150px" />Đ&aacute;nh gi&aacute; Obi Worldphone MV1: hiệu năng tạm, thiết kế g&acirc;y t&ograve; m&ograve;</a><br />
<a href="http://www.techsignin.com/wp-content/uploads/2016/06/danh-gia-obi-worldphone-mv1-54.jpg"><img alt="Đánh giá Obi Worldphone MV1: hiệu năng tạm, thiết kế gây tò mò" src="http://www.techsignin.com/wp-content/uploads/2016/06/danh-gia-obi-worldphone-mv1-54-150x150.jpg" style="height:auto; margin:0px; width:150px" />Đ&aacute;nh gi&aacute; Obi Worldphone MV1: hiệu năng tạm, thiết kế g&acirc;y t&ograve; m&ograve;</a><br />
<a href="http://www.techsignin.com/wp-content/uploads/2016/06/danh-gia-obi-worldphone-mv1-56.jpg"><img alt="Đánh giá Obi Worldphone MV1: hiệu năng tạm, thiết kế gây tò mò" src="http://www.techsignin.com/wp-content/uploads/2016/06/danh-gia-obi-worldphone-mv1-56-150x150.jpg" style="height:auto; margin:0px; width:150px" />Đ&aacute;nh gi&aacute; Obi Worldphone MV1: hiệu năng tạm, thiết kế g&acirc;y t&ograve; m&ograve;</a>

<p>D&ugrave; vậy phần viền m&agrave;n h&igrave;nh của Obi MV1 l&agrave; kh&aacute; dầy, tuy việc n&agrave;y sẽ gi&uacute;p tr&aacute;nh được việc v&ocirc; t&igrave;nh chạm ng&oacute;n tay v&agrave;o, nhưng thiết kế n&agrave;y c&oacute; phần hơi ngược xu hướng viền mỏng hiện nay, th&ecirc;m v&agrave;o đ&oacute; ph&iacute;a cạnh dưới phần r&igrave;a m&agrave;n h&igrave;nh kh&ocirc;ng được Obi tận dụng bằng n&uacute;t điều hướng, m&agrave; 3 ph&iacute;m n&agrave;y được đưa thằng v&agrave;o b&ecirc;n trong m&agrave;n h&igrave;nh, việc cho&aacute;n chỗ n&agrave;y thấy r&otilde; nhất l&agrave; khi xem c&aacute;c trang web bằng tr&igrave;nh duyệt.</p>

<p>Obi MV1 bố tr&iacute; ph&iacute;m nguồn v&agrave; &acirc;m lượng ở cạnh phải, jack microUSB ở cạnh dưới v&agrave; jack &acirc;m thanh 3.5mm ở cạnh tr&ecirc;n, bố tr&iacute; n&agrave;y l&agrave; ph&ugrave; hợp với người thường d&ugrave;ng tay tr&aacute;i để cầm điện thoại. Ở mặt sau m&aacute;y c&oacute; camera, đ&egrave;n LED Flash v&agrave; loa ngo&agrave;i, Obi MV1 bố tr&iacute; khe cắm 2 SIM chuẩn Micro v&agrave; khay thẻ MicroSD nằm đằng sau miếng nhựa, pin c&oacute; thể th&aacute;o rời dễ d&agrave;ng (cần th&aacute;o ra để cắm SIM, thẻ nhớ)</p>

<p><em><strong>Trải nghiệm:</strong></em></p>

<p>Được trang bị m&agrave;n h&igrave;nh 5 inch IPS độ ph&acirc;n giải HD (1280 x 720p), Obi MV1 hiển thị h&igrave;nh ảnh trong v&agrave; chi tiết, m&aacute;y cũng tự động tăng độ s&aacute;ng khi ph&aacute;t hiện đang ở dưới nguồn s&aacute;ng mạnh để đảm bảo vẫn đọc được nội dung r&otilde; r&agrave;ng. M&aacute;y sử dụng vi xử l&yacute; Qualcomm Snapdragon 212, đ&acirc;y l&agrave; một con chip d&agrave;nh cho c&aacute;c smartphone, tablet phổ th&ocirc;ng (trang bị tr&ecirc;n Lumia 650) n&ecirc;n thực sự kh&ocirc;ng kỳ vọng nhiều ở hiệu năng.</p>

<p>Song điểm đ&aacute;ng gi&aacute; ở Obi Worldphone MV1 l&agrave; việc t&iacute;ch hợp bộ nhớ RAM 2GB v&agrave; sử dụng Cyanogen &ndash; hệ điều h&agrave;nh được biết đến với t&iacute;nh ổn định v&agrave; tốc độ nhờ việc tối ưu tốt c&aacute;c ứng dụng, loại bỏ những chương tr&igrave;nh c&agrave;i đặt sẵn thường thấy (bloatware), đ&acirc;y cũng l&agrave; hệ điều h&agrave;nh đ&atilde; &ldquo;cứu sống&rdquo; lại nhiều chiếc smartphone cũ (vốn c&ograve;n kh&ocirc;ng được nh&agrave; sản xuất hỗ trợ n&acirc;ng cấp mới) c&oacute; thể sống tiếp v&agrave; vẫn hoạt động hiệu quả.</p>

<p>Tuy d&ugrave;ng Cyanogen, nhưng Obi MV1 vẫn giữ lại những tinh t&uacute;y giao diện của m&igrave;nh như c&aacute;c đ&agrave;n anh trước đ&oacute;, vẫn l&agrave; m&agrave;n h&igrave;nh mở kh&oacute;a h&igrave;nh tr&ograve;n đẹp mắt, c&aacute;c icon vẫn giữ kiểu d&aacute;ng vừa cong vừa vu&ocirc;ng cạnh (như kiểu d&aacute;ng chiếc điện thoại). Nh&igrave;n chung trong qu&aacute; tr&igrave;nh sử dụng, Techsign.in nhận thấy MV1 hầu như kh&ocirc;ng g&acirc;y ra hiện tượng lag, chậm khi mở ứng dụng, mở tr&igrave;nh duyệt, chuyển sang ứng dụng kh&aacute;c, thao t&aacute;c gọi điện, nhắn tin, mở trang web, xem video YouTube c&oacute; độ trễ rất thấp. Thử d&ugrave;ng ứng dụng CPU-Z kiểm tra th&igrave; m&aacute;y c&ograve;n trống hơn 1GB RAM, kh&aacute; đủ d&ugrave;ng cho c&aacute;c ứng dụng.</p>

<p><img alt="Điểm GeekBench và thông tin từ CPU-Z" src="http://www.techsignin.com/wp-content/uploads/2016/06/cpu-z-geekbench-obi-worldphone-mv1.jpg" style="height:auto; margin:0px auto 20px; width:800px" /></p>

<p>Nhưng khi thử với tựa game Angry Birds 2, Obi MV1 đ&atilde; cho thấy sự &igrave; ạch đ&aacute;ng kể. D&ugrave; rằng trong qu&aacute; tr&igrave;nh chơi game, techsign.in vẫn thấy h&igrave;nh ảnh mượt m&agrave;, c&aacute;c chuyển động kh&ocirc;ng giật lag, nhưng ở qu&aacute; tr&igrave;nh tải game ban đầu cũng như chuyển v&ograve;ng th&igrave; lại kh&aacute; chậm.</p>

<p>Thử đo điểm benchmark bằng Geekbench 3, MV1 đạt số điểm xử l&yacute; đơn l&otilde;i (Single-Core) ở mức 335, số điểm n&agrave;y ho&agrave;n to&agrave;n phản &aacute;nh đ&uacute;ng thực tế con chip Snapdragon 212 vốn được thiết kế để ho&agrave;n th&agrave;nh c&aacute;c ứng dụng giải tr&iacute; cơ bản như nghe nhạc, xem phim.</p>

<p><em><strong>Camera</strong></em></p>

<p>Obi Worldphone MV1 d&ugrave;ng camera sau c&oacute; số &lsquo;chấm&rsquo; l&agrave; 8 megapixels, khẩu độ f/2.2, giao diện của chương tr&igrave;nh camera kh&aacute; đơn giản với c&aacute;c n&uacute;t điều chỉnh to, hỗ trợ chụp nhiều k&iacute;ch thước h&igrave;nh ảnh, chụp nhận diện khu&ocirc;n mặt, c&oacute; thể thay đổi ISO, c&aacute;ch phơi s&aacute;ng, chống rung, quay video độ ph&acirc;n giải tối đa 720p, quay tốc độ cao, chuyển động chậm (60FPS).</p>

<p><img alt="Màn hình tùy chỉnh cho camera của Obi Worldphone MV1" src="http://www.techsignin.com/wp-content/uploads/2016/06/giao-dien-may-anh-obi-worldphone-mv1.jpg" style="height:auto; margin:0px auto 20px; width:800px" /></p>

<p>Nh&igrave;n chung ứng dụng chụp ảnh của MV1 ph&ugrave; hợp với người mới biết chụp ảnh cũng như người thường xuy&ecirc;n d&ugrave;ng m&aacute;y ảnh tr&ecirc;n điện thoại để s&aacute;ng t&aacute;c.</p>

<p>Dưới đ&acirc;y l&agrave; ảnh chụp từ Obi Worldphone MV1</p>
<img alt="Ảnh chụp từ Obi Worldphone MV1" src="http://www.techsignin.com/wp-content/uploads/2016/06/techsignin-anh-chup-obi-worldphone-mv1-01.jpg" style="height:auto; width:800px" />
<p>Ảnh chụp vật thể với nguồn s&aacute;ng từ b&oacute;ng đ&egrave;n LED</p>
<br />
<img alt="Ảnh chụp từ Obi Worldphone MV1" src="http://www.techsignin.com/wp-content/uploads/2016/06/techsignin-anh-chup-obi-worldphone-mv1-02.jpg" style="height:auto; width:375px" />
<p>Ảnh chụp trong m&ocirc;i trường rất tối</p>

<p>Ở cả hai trường hợp tr&ecirc;n, ảnh chụp từ Obi MW1 cho độ m&agrave;u hơi đậm hơn so với thực tế, khả năng bắt n&eacute;t của m&aacute;y cũng kh&ocirc;ng được nhanh. Techsign.in sẽ tiếp tục chụp v&agrave; cập nhật v&agrave;o b&agrave;i viết n&agrave;y.</p>

<p>Thời lượng sử dụng với vi&ecirc;n pin 2.500mAh của Obi MW1 l&agrave; kh&aacute; tốt, thử nghiệm cho thấy ở điều kiện d&ugrave;ng th&ocirc;ng thường với việc lướt web, Facebook, đọc v&agrave; trả lời email (d&ugrave;ng kết nối WiFi), chụp ảnh, m&aacute;y cho thời lượng sử dụng hơn 10 giờ. Trong qu&aacute; tr&igrave;nh sử dụng m&aacute;y c&oacute; ấm nhẹ ở phần mặt lưng nhưng nhiệt độ kh&ocirc;ng qu&aacute; cao.</p>

<p><em><strong>Lời kết:</strong></em></p>

<p>Hơn phi&ecirc;n bản Obi MW1 d&ugrave;ng 1GB RAM v&agrave; chạy Android l&agrave; 500 ng&agrave;n, phi&ecirc;n bản Obi MW1 d&ugrave;ng Cyanogen l&agrave; một lựa chọn hợp l&yacute; khi bạn cần một chiếc smartphone lạ mắt, th&iacute;ch chụp ảnh cũng như hay l&ecirc;n mạng x&atilde; hội, xem video.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
<br />
<strong>7.4</strong><strong>OVERALL SCORE</strong><br />
<strong>Đ&aacute;nh gi&aacute;</strong>

<p>Obi Worldphone MV1 ph&ugrave; hợp cho người d&ugrave;ng trẻ th&iacute;ch một chiếc smartphone c&oacute; kiểu d&aacute;ng v&agrave; m&agrave;n h&igrave;nh đẹp, hỗ trợ 2 SIM v&agrave; thẻ nhớ, th&iacute;ch lướt web, xem video, truy cập mạng x&atilde; hội, nhắn tin OTT v&agrave; giải tr&iacute; ở mức cơ bản</p>
',N'Đánh giá Obi Worldphone MV1: hiệu năng tạm, thiết kế gây tò mò',N'Obi Worldphone là thương hiệu non trẻ, chỉ mới ra mắt 3 mẫu smartphone song cũng sớm gây chú ý bởi thiết kế lạ mắt hơn các nhãn hàng khác.',N'publish',N'danh-gia-obi-worldphone-mv1-hieu-nang-tam-thiet-ke-gay-to-mo',{ts '2016-07-31 13:54:00.000'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
89,NULL,{ts '2016-07-31 13:54:26.300'},N'Image upload',N'danh-gia-obi-worldphone-mv1-50',NULL,N'inherit',N'ba80fc4a-5f24-42c1-979d-b5f5427b7638danh-gia-obi-worldphone-mv1-50',{ts '2016-07-31 13:54:26.300'},0,N'ba80fc4a-5f24-42c1-979d-b5f5427b7638danh-gia-obi-worldphone-mv1-50.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
91,1,{ts '2016-08-01 05:38:57.823'},N'<p>No More Ransom (www.nomoreransom.org) l&agrave; cổng th&ocirc;ng tin trực tuyến mới nhằm th&ocirc;ng b&aacute;o cho người d&ugrave;ng về sự nguy hiểm của ransomware v&agrave; gi&uacute;p đỡ c&aacute;c nạn nh&acirc;n phục hồi dữ liệu của họ m&agrave; kh&ocirc;ng cần phải trả tiền chuộc cho tội phạm mạng.</p>

<p>Ransomware l&agrave; một dạng phần mềm độc hại thường kh&oacute;a m&aacute;y t&iacute;nh hoặc m&atilde; h&oacute;a dữ liệu của nạn nh&acirc;n, y&ecirc;u cầu người bị hại phải trả tiền chuộc th&igrave; mới lấy lại được quyền kiểm so&aacute;t thiết bị hoặc tập tin đ&atilde; bị l&acirc;y nhiễm. Ransomware hiện l&agrave; mối đe dọa h&agrave;ng đầu đối với cơ quan h&agrave;nh ph&aacute;p tại EU: gần 2/3 th&agrave;nh vi&ecirc;n EU tiến h&agrave;nh điều tra loại tấn c&ocirc;ng bằng phần mềm độc hại n&agrave;y.</p>

<p>Mục ti&ecirc;u thường thấy của ramsomware l&agrave; thiết bị c&aacute; nh&acirc;n, nhưng mạng lưới doanh nghiệp&nbsp;v&agrave;&nbsp;thậm ch&iacute; ch&iacute;nh phủ cũng bị ảnh hưởng. Số lượng nạn nh&acirc;n đang ng&agrave;y c&agrave;ng tăng l&ecirc;n ở mức b&aacute;o động, theo Kaspesky Lab số người d&ugrave;ng bị tấn c&ocirc;ng đ&atilde; tăng 5,5%, &ndash; từ 131.000 trong khoảng 2014-2015 l&ecirc;n 718.000 trong khoảng 2015-2016.</p>

<h3>Cổng th&ocirc;ng tin No More Ransome</h3>

<p>Mục đ&iacute;ch của cổng th&ocirc;ng tin điện tử No More Ransome&nbsp;l&agrave; cung cấp th&ocirc;ng tin trực tuyến hữu &iacute;ch cho nạn nh&acirc;n của ransomware. Người d&ugrave;ng c&oacute; thể t&igrave;m hiểu th&ocirc;ng tin ransomware l&agrave; g&igrave;, c&aacute;ch hoạt động v&agrave; quan trọng nhất l&agrave; c&aacute;ch tự bảo vệ m&igrave;nh. Nhận thức ch&iacute;nh l&agrave; ch&igrave;a kh&oacute;a v&igrave; kh&ocirc;ng c&oacute; c&ocirc;ng cụ giải m&atilde; n&agrave;o cho tất cả c&aacute;c loại phần mềm độc hại hiện c&oacute;. Nếu bị l&acirc;y nhiễm, khả năng rất cao l&agrave; dữ liệu của nạn nh&acirc;n sẽ bị mất vĩnh viễn. Ch&iacute;nh v&igrave; vậy cổng th&ocirc;ng tin n&agrave;y sẽ gi&uacute;p người d&ugrave;ng tập th&oacute;i quen cảnh gi&aacute;c khi sử dụng Internet c&ugrave;ng với một số&nbsp;thủ&nbsp;đơn giản c&oacute; thể gi&uacute;p ngăn chặn l&acirc;y nhiễm ngay từ đầu.</p>

<p>Dự &aacute;n cung cấp cho người d&ugrave;ng c&aacute;c c&ocirc;ng cụ c&oacute; thể gi&uacute;p họ kh&ocirc;i phục dữ liệu ngay khi bị tội phạm mạng kh&oacute;a lại. Trong giai đoạn đầu, cổng th&ocirc;ng tin gồm 4 c&ocirc;ng cụ giải m&atilde; cho nhiều loại phần mềm độc hại kh&aacute;c nhau, loại mới nhất được ph&aacute;t triển v&agrave;o th&aacute;ng 6/2016 d&ugrave;ng cho c&aacute;c biến thể của Shade.</p>

<p>Shade l&agrave; ransomware nổi l&ecirc;n từ cuối năm 2014, n&oacute; ph&aacute;t t&aacute;n rộng r&atilde;i qua những website độc hại v&agrave; tệp đ&iacute;nh k&egrave;m bị l&acirc;y nhiễm trong email. Khi v&agrave;o được hệ thống người d&ugrave;ng, tập tin m&atilde; h&oacute;a Shade nằm tr&ecirc;n m&aacute;y t&iacute;nh v&agrave; file .txt chứa c&aacute;c ghi ch&uacute; v&agrave; hướng dẫn từ tội phạm mạng cho biết nạn nh&acirc;n phải l&agrave;m g&igrave; để lấy lại được tập tin c&aacute; nh&acirc;n. Shade sử dụng thuật to&aacute;n kh&oacute;a m&atilde; chặt chẽ cho mỗi tập tin bị m&atilde; h&oacute;a với 2 bộ key 256-bit AES ngẫu nhi&ecirc;n: một d&ugrave;ng để m&atilde; h&oacute;a nội dung tập tin, c&aacute;i c&ograve;n lại d&ugrave;ng để m&atilde; h&oacute;a t&ecirc;n tập tin.</p>

<p>Kể từ năm 2014, Kaspersky Lab v&agrave; Intel Security đ&atilde; ngăn chặn hơn 27 000 nỗ lực tấn c&ocirc;ng người d&ugrave;ng từ Shade. Phần lớn sự l&acirc;y nhiễm xuất hiện tại Nga, Ukraine, Đức, &Aacute;o v&agrave; Kazakhstan, hoạt động của n&oacute; cũng được ph&aacute;t hiện tại Ph&aacute;p, Cộng h&ograve;a Czech, &Yacute; v&agrave; Hoa Kỳ.</p>

<p>Nhờ hợp t&aacute;c chặt chẽ v&agrave; chia sẻ th&ocirc;ng tin, m&aacute;y chủ C&amp;C của Shade m&agrave; tội phạm mạng sử dụng để lưu giữ c&aacute;c ch&igrave;a kh&oacute;a (key) giải m&atilde; đ&atilde; bị ph&aacute;t hiện v&agrave; c&aacute;c&nbsp;ch&igrave;a kh&oacute;a&nbsp;n&agrave;y cũng đ&atilde; được Kaspersky Lab v&agrave; Intel Security chia sẻ, gi&uacute;p tạo ra một c&ocirc;ng cụ đặc biệt m&agrave; nạn nh&acirc;n c&oacute; thể tải từ No More Ransom để lấy lại dữ liệu m&agrave; kh&ocirc;ng phải trả tiền cho tội phạm. C&ocirc;ng cụ n&agrave;y chứa hơn 160.000 key.</p>

<h3><strong>Đạt được hợp t&aacute;c giữa tổ chức c&ocirc;ng v&agrave; tư nh&acirc;n</strong></h3>

<p>No More Ransome được nh&igrave;n nhận như một s&aacute;ng kiến phi lợi nhuận với mục đ&iacute;ch mang đến sự bảo vệ cho c&aacute;c tổ chức c&ocirc;ng v&agrave; tư nh&acirc;n. V&igrave; bản chất ransomware thay đổi, tội phạm mạng ph&aacute;t triển nhiều biến thể mới dựa tr&ecirc;n nền tảng th&ocirc;ng thường, cổng th&ocirc;ng tin n&agrave;y lu&ocirc;n mở cho sự hợp t&aacute;c với nhiều đối t&aacute;c mới.</p>
<img alt="Ransomware nhận sự quan tâm đặc biệt từ các tổ chức tư nhân và chính phủ" src="http://www.techsignin.com/wp-content/uploads/2016/07/kaspersky-europol-intel-security-nomoreransom.jpg" style="height:auto; width:1200px" />
<p>Ảnh buổi giới thiệu cổng th&ocirc;ng tin No More Ransom. Nguồn: Kaspersky</p>

<p>Wilbert Paulissen, Cục trưởng Cục điều tra tội phạm quốc gia, Cảnh s&aacute;t H&agrave; Lan chia sẻ: &ldquo;Ch&uacute;ng t&ocirc;i, cảnh s&aacute;t H&agrave; Lan, kh&ocirc;ng thể một m&igrave;nh chống lại tội phạm mạng v&agrave; ransomware. Đ&acirc;y l&agrave; tr&aacute;ch nhiệm hợp t&aacute;c giữa cảnh s&aacute;t, cơ quan luật ph&aacute;p, Europol v&agrave; c&aacute;c c&ocirc;ng ty ICT, v&agrave; đ&ograve;i hỏi nỗ lực hợp t&aacute;c. Đ&oacute; l&agrave; v&igrave; sao t&ocirc;i rất vui về việc hợp t&aacute;c giữa cảnh s&aacute;t, Intel Security v&agrave; Kaspersky Lab. Ch&uacute;ng t&ocirc;i sẽ l&agrave;m hết sức c&oacute; thể để ngăn chặn &acirc;m mưu kiếm tiền của tội phạm mạng v&agrave; trao trả tập tin cho chủ thực sự của n&oacute; m&agrave; họ kh&ocirc;ng phải trả một khoản tiền n&agrave;o&rdquo;.</p>

<p>Jornt van der Wiel, Nh&agrave; nghi&ecirc;n cứu Bảo mật tại Nh&oacute;m Ph&acirc;n t&iacute;ch v&agrave; Nghi&ecirc;n cứu to&agrave;n cầu, Kaspersky Lab cho biết &ldquo;Vấn đề lớn nhất đối với ransomware hiện nay l&agrave; khi dữ liệu bị kh&oacute;a, người d&ugrave;ng sẵn s&agrave;ng trả tiền cho tội phạm mạng để lấy lại. Việc n&agrave;y t&aacute;c động đến nền kinh tế ngầm v&agrave; kết quả l&agrave; ch&uacute;ng t&ocirc;i đang phải đối mặt với sự gia tăng số lượng những c&aacute;i t&ecirc;n mới v&agrave; c&aacute;c cuộc tấn c&ocirc;ng. Ch&uacute;ng t&ocirc;i chỉ c&oacute; thể thay đổi t&igrave;nh thế nếu ch&uacute;ng t&ocirc;i hợp lực để chống lại ransomware. Sự xuất hiện của c&ocirc;ng cụ giải m&atilde; chỉ l&agrave; bước đầu ti&ecirc;n tr&ecirc;n con đường n&agrave;y. Ch&uacute;ng t&ocirc;i mong rằng dự &aacute;n sẽ ph&aacute;t triển rộng hơn v&agrave; sẽ c&oacute; nhiều c&ocirc;ng ty v&agrave; cơ quan h&agrave;nh ph&aacute;p từ c&aacute;c quốc gia v&agrave; v&ugrave;ng l&atilde;nh thổ c&ugrave;ng tham chiến trong thời gian tới&rdquo;,</p>

<p>Raj Samani, Gi&aacute;m đốc c&ocirc;ng nghệ Intel Security khu vực Ch&acirc;u &Acirc;u, Trung Đ&ocirc;ng v&agrave; Ch&acirc;u Phi ph&aacute;t biểu: &ldquo;S&aacute;ng kiến n&agrave;y cho thấy gi&aacute; trị của sự hợp t&aacute;c giữa cơ quan nh&agrave; nước v&agrave; c&ocirc;ng ty tư nh&acirc;n với h&agrave;nh động nghi&ecirc;m t&uacute;c chống lại tội phạm mạng. Sự hợp t&aacute;c hơn cả chia sẻ kiến thức, gi&aacute;o dục người d&ugrave;ng để thực sự hỗ trợ sửa chữa thiệt hại của nạn nh&acirc;n. Bằng c&aacute;ch phục hồi truy cập v&agrave;o hệ thống, ch&uacute;ng t&ocirc;i trao quyền cho người d&ugrave;ng bằng c&aacute;ch cho họ thấy rằng họ c&oacute; thể h&agrave;nh động v&agrave; tr&aacute;nh thưởng cho tội phạm mạng bằng một khoản tiền chuộc&rdquo;.</p>

<p>Wil van Gemert, Ph&oacute; Gi&aacute;m đốc Điều h&agrave;nh Europol, chia sẻ: &ldquo;Trong v&agrave;i năm nay, ransomware đ&atilde; trở th&agrave;nh mối quan t&acirc;m ch&iacute;nh trong việc thực thi ph&aacute;p luật của EU. Đ&oacute; l&agrave; vấn đề ảnh hưởng đến c&ocirc;ng d&acirc;n v&agrave; doanh nghiệp, m&aacute;y t&iacute;nh v&agrave; c&aacute;c thiết bị di động, với việc tội phạm ph&aacute;t triển c&aacute;c kỹ thuật tinh vi hơn để g&acirc;y t&aacute;c động lớn nhất l&ecirc;n dữ liệu của nạn nh&acirc;n. C&aacute;c s&aacute;ng kiến như dự &aacute;n No More Ransom cho thấy rằng việc li&ecirc;n kết chuy&ecirc;n m&ocirc;n v&agrave; tham gia hợp t&aacute;c l&agrave; con đường đến cuộc chiến th&agrave;nh c&ocirc;ng chống lại tội phạm mạng. Ch&uacute;ng t&ocirc;i hy vọng sẽ gi&uacute;p nhiều người phục hồi quyền kiểm so&aacute;t tập tin của họ, trong khi n&acirc;ng cao nhận thức v&agrave; gi&aacute;o dục người d&acirc;n về c&aacute;ch duy tr&igrave; c&aacute;c thiết bị sạch trước phần mềm độc hại&rdquo;.<br />
Lu&ocirc;n b&aacute;o c&aacute;o</p>

<p>B&aacute;o c&aacute;o ransomware với cơ quan h&agrave;nh ph&aacute;p l&agrave; rất quan trọng để gi&uacute;p ch&iacute;nh quyền c&oacute; c&aacute;i nh&igrave;n chung r&otilde; r&agrave;ng hơn v&agrave; từ đ&oacute; c&oacute; khả năng giảm thiểu mối đe dọa cao hơn. Website No More Ransom mang đến cho nạn nh&acirc;n cơ hội b&aacute;o c&aacute;o về tội phạm, kết nối trực tiếp với cơ chế b&aacute;o c&aacute;o quốc gia của Europol.</p>

<p>Nếu bằng c&aacute;ch n&agrave;o đ&oacute; m&agrave; bạn trở th&agrave;nh nạn nh&acirc;n của ransomware, ch&uacute;ng t&ocirc;i khuy&ecirc;n bạn kh&ocirc;ng n&ecirc;n trả tiền chuộc. Trả tiền chuộc l&agrave; bạn đ&atilde; ủng hộ tội phạm mạng. Do đ&oacute;, kh&ocirc;ng c&oacute; g&igrave; để đảm bảo trả tiền l&agrave; bạn sẽ c&oacute; được quyền truy cập v&agrave;o dữ liệu đ&atilde; bị m&atilde; h&oacute;a. .</p>

<p>Theo Kaspersky Lab</p>
',N'Ransomware nhận sự quan tâm đặc biệt từ các tổ chức tư nhân và chính phủ',N'Kaspersky Lab cho biết đã hợp tác với cảnh sát Hà Lan, Europol và Intel để ra mắt sáng kiến No More Ransom, đây là bước tiến mới giúp chống lại ransomware.

',N'publish',N'ransomware-nhan-su-quan-tam-dac-biet-tu-cac-to-chuc-tu-nhan-va-chinh-phu',{ts '2016-08-01 05:38:00.000'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
92,NULL,{ts '2016-08-01 05:39:45.697'},N'Image upload',N'nomoreransome-cong-thong-tin-ransomware',NULL,N'inherit',N'dd95ef14-0387-47df-9a8c-006c4c6b10b9nomoreransome-cong-thong-tin-ransomware',{ts '2016-08-01 05:39:45.697'},0,N'dd95ef14-0387-47df-9a8c-006c4c6b10b9nomoreransome-cong-thong-tin-ransomware.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
93,1,{ts '2016-08-01 05:41:45.527'},N'<p>Khu&ocirc;n khổ b&agrave;i viết n&agrave;y sẽ l&yacute; giải c&aacute;c chỉ số xuất hiện trong game Pokemon Go v&agrave; c&aacute;ch t&iacute;nh to&aacute;n c&aacute;c chỉ số:</p>

<p><strong>1. Core Stats</strong></p>

<p>Pokemon c&oacute; 3 trạng th&aacute;i ch&iacute;nh l&agrave; attack, defense, stamia (HP). Mỗi lo&agrave;i đều c&oacute; 1 mức trạng th&aacute;i nhất định:</p>

<p>&ndash; Base Attack = 2 x ((Atk x SpAtk)^0.5 + Spd^0.5))</p>

<p>&ndash;&nbsp;Base Defense = 2 x ((Def x SpDef)^0.5 + Spd^0.5))</p>

<p>&ndash;&nbsp;Base Stamina = 2 x HP</p>

<p><strong>2. Individual Values (IVs)</strong></p>

<p><img alt="Tìm hiểu ý nghĩa và cách tính chỉ số bí ẩn trong Pokemon Go" src="http://www.techsignin.com/wp-content/uploads/2016/07/pokemon-go-tinh-ivs-skill-level-cp-multiplier-2.png" style="height:auto; margin:0px auto 20px; width:628px" /></p>

<p>Pokemon c&oacute; 1 chỉ số phụ đ&oacute; l&agrave; IVs, c&aacute;c chỉ số n&agrave;y l&agrave; ngẫu nhi&ecirc;n trong khoảng từ 1&nbsp;đến&nbsp;15 v&agrave; được cộng thẳng v&ocirc; base stats của pokemon. Những pokemon nở từ trứng thường c&oacute; IVs kh&aacute; cao.</p>

<p>IVs c&oacute; vai tr&ograve; quan trọng đối với CP của 1 pokemon, n&ocirc;m na l&agrave; tiềm năng của 1 pokemon. Pokemon n&agrave;o c&oacute; IVs attack, defense, stamia đều đạt 15 đc xem l&agrave; ho&agrave;n hảo về stats v&agrave; nếu bạn train n&oacute; l&ecirc;n cấp n&oacute; sẽ c&oacute; CP bằng với CP trong bảng max CP.</p>

<p>&ndash; Attack = (Base Attack + Individual Attack) x CP_Multiplier</p>

<p>&ndash;&nbsp;Defense = (Base Defense + Individual Defense) x CP_Multiplier</p>

<p>&ndash;&nbsp;Stamina = (Base Stamina + Individual Stamina) x CP_Multiplier</p>

<p>Stamia ở đ&acirc;y ch&iacute;nh l&agrave; thanh HP của pokemon.</p>

<p>B&ecirc;n cạnh đ&oacute; bạn c&oacute; thể tải v&agrave; c&agrave;i đặt tool hỗ trợ t&iacute;nh IVs cho Pokemon tr&ecirc;n hệ điều h&agrave;nh Android tại địa chỉ:&nbsp;&nbsp;<a href="https://drive.google.com/open?id=0BwZijhJUaVYucHNrRENNZFlUU2c" target="_blank">https://drive.google.com/open?id=0BwZijhJUaVYucHNrRENNZFlUU2c</a></p>

<p>Tr&ecirc;n Play Store cũng đ&atilde; c&oacute; ứng dụng&nbsp;<em>IV calculator for Pokemon Go,</em>&nbsp;tải ở link n&agrave;y:&nbsp;<a href="https://play.google.com/store/apps/details?id=fr.skarwild.pokemongoevolutioncalculator" target="_blank">https://play.google.com/store/apps/details?id=fr.skarwild.pokemongoevolutioncalculator</a></p>
<img alt="Tìm hiểu ý nghĩa và cách tính chỉ số bí ẩn trong Pokemon Go" src="http://www.techsignin.com/wp-content/uploads/2016/07/pokemon-go-iv-calculator.jpg" style="width:600px" />
<p>Giao diện ứng dụng IV calculator for Pokemon Go</p>

<p><strong>3. Pokemon level</strong></p>

<p>C&aacute;i thanh v&ograve;ng cung ai cũng nghĩ l&agrave; thanh CP thực chất lại ch&iacute;nh l&agrave; thanh Level của pokemon. Level thấp nhất của 1 pokemon l&agrave; 1 v&agrave; cao nhất l&agrave; bằng với Level của trainer v&agrave; cộng th&ecirc;m 1.5.&nbsp;Mỗi lần power up, pokemon sẽ tăng 0.5 Level</p>

<p>Mỗi lần Level pokemon tăng 2 (4 lần power up) th&igrave; lượng stardust cần d&ugrave;ng sẽ tăng l&ecirc;n,&nbsp;cứ mỗi lần pokemon tăng 10 Level (20 lần power up) lượng candy cần d&ugrave;ng sẽ tăng l&ecirc;n 1. Bạn để &yacute; rằng v&igrave; level của pokemon quyết định lượng stardust ti&ecirc;u hao n&ecirc;n ho&agrave;n to&agrave;n c&oacute; thể c&oacute; 1 pokemon với CP thấp nhưng lại cần nhiều stardust để Up, v&igrave; n&oacute; sẽ tăng &iacute;t CP khi Power Up v&agrave; n&oacute; c&oacute; CP cap thấp.</p>

<p>Do vậy, CP cao sẽ chỉ gi&uacute;p bạn tốn &iacute;t nguy&ecirc;n liệu cho power up chứ kh&ocirc;ng c&oacute; nghĩa l&agrave; pokemon đ&oacute; mạnh. N&ecirc;n c&aacute;ch t&igrave;m 1 pokemon mạnh l&agrave; t&igrave;m con c&oacute;<em>IVs thật cao</em>&nbsp;v&agrave; huấn luyện n&oacute; (train).</p>

<p><strong>4. Skills</strong></p>

<p>Bạn c&oacute; thể tham khảo skill của từng Pokemon tại li&ecirc;n kết n&agrave;y:&nbsp;<a href="http://pokemongo.gamepress.gg/pokemon-moves" target="_blank">http://pokemongo.gamepress.gg/pokemon-moves</a></p>

<p>Ch&uacute; &yacute; c&aacute;c STAB moves (same type attack bonus) l&agrave; c&aacute;c skill c&oacute; hệ tr&ugrave;ng với hệ của pokemon th&igrave; sẽ đc x1.25 damage bonus.</p>

<p><strong>5. Tiến h&oacute;a</strong></p>

<p>Khi 1 pokemon tiến h&oacute;a, n&oacute; sẽ thay đổi base stats của m&igrave;nh, v&agrave; do đ&oacute; lượng HP v&agrave; CP tăng l&ecirc;n. Tuy nhi&ecirc;n Level của pokemon v&agrave; IVs sẽ ko thay đổi, n&ecirc;n nếu c&oacute; 1 pokemon đ&atilde; mạnh th&igrave; khi tiến h&oacute;a c&aacute;c chỉ số cũng sẽ tăng tỷ lệ thuận v&agrave; kết quả l&agrave; pokemon sau evolve cũng mạnh.</p>

<p><strong>6. Chỉ số CP Multiplier</strong></p>

<p>Mỗi Level của pokemon c&oacute; 1 CP Multiplier nhất định cho&nbsp;Level&nbsp;đ&oacute;. Stats của pokemon sẽ được khuếch đại một lượng phụ thuộc v&agrave;o CP Multiplier. Khi bạn bắt 1 pokemon, n&oacute; sẽ c&oacute; base CP Multiplier tương ứng với&nbsp;Level&nbsp;của pokemon đ&oacute; v&agrave; 1 gi&aacute; trị Additional CP Multiplier = 0.</p>

<p><img alt="Tìm hiểu ý nghĩa và cách tính chỉ số bí ẩn trong Pokemon Go" src="http://www.techsignin.com/wp-content/uploads/2016/07/pokemon-go-tinh-ivs-skill-level-cp-multiplier-3.png" style="height:auto; margin:0px auto 20px; width:620px" /></p>

<p>Khi Power Up, Pokemon tăng Level th&igrave; Additional CP Multiplier cũng tăng 1 lượng nhất định phụ thuộc v&agrave;o Level mới của pokemon v&agrave; lượng n&agrave;y đc cộng v&ocirc; base CP Multiplier.</p>

<p>Bảng CP Multiplier theo từng Level bạn tra cứu tại đ&acirc;y:<a href="http://pokemongo.gamepress.gg/cp-multiplier" target="_blank">http://pokemongo.gamepress.gg/cp-multiplier</a></p>

<p><strong>7. T&iacute;nh CP&nbsp;<strong>Multiplier&nbsp;</strong>của Pokemon</strong></p>

<p>&ndash;&nbsp;CP = (Attack x Defense^0.5 x Stamina^0.5 x CP_Multiplier^2) / 10</p>

<p>&ndash;&nbsp;CP per Power Up = (Attack x Defense^0.5 x Stamina^0.5 x Half_Difference_of_Squared_Values) / 10</p>

<p><em>Half_Difference_of_Squared_Values</em>&nbsp;bạn tra cứu theo bảng CP Multiplier ở tr&ecirc;n.</p>

<p>Nếu thấy đống c&ocirc;ng thức b&ecirc;n tr&ecirc;n kh&oacute;, bạn c&oacute; thể theo li&ecirc;n kết sau để tự t&iacute;nh IVs của Pokemon&nbsp;để biết n&ecirc;n train hay transfer:</p>

<p><a href="https://docs.google.com/spreadsheets/d/1wbtIc33K45iU1ScUnkB0PlslJ-eLaJlSZY47sPME2Uk/copy" target="_blank">https://docs.google.com/spreadsheets/d/1wbtIc33K45iU1ScUnkB0PlslJ-eLaJlSZY47sPME2Uk/copy</a></p>

<p>Bạn truy cập v&agrave;o li&ecirc;n kết n&agrave;y, chọn Make a Copy để lưu tập tin n&agrave;y về Drive của bạn rồi v&agrave;o đ&oacute; mở tập tin ra.</p>

<p>C&aacute;ch d&ugrave;ng:</p>

<p>&ndash; Bạn nhập số liệu v&agrave;o c&aacute;c &ocirc; m&agrave;u v&agrave;ng, c&oacute; thể giữ chuột ở ti&ecirc;u đề c&aacute;c cột để xem th&ecirc;m th&ocirc;ng tin về cột đ&oacute;. C&aacute;c &ocirc; xanh sẽ thể hiện kết quả t&iacute;nh to&aacute;n,&nbsp;&ocirc;&nbsp;x&aacute;m l&agrave; th&ecirc;m 1 số th&ocirc;ng tin hữu &iacute;ch. Cụ thể như sau:</p>

<p>Bước 1: Chọn Pokemon bạn cần t&iacute;nh IVs, nhập c&aacute;c số liệu y&ecirc;u cầu v&ocirc; &ocirc; v&agrave;ng.</p>

<p>Bước 2: Nếu bạn kh&ocirc;ng chắc pokemon đ&atilde; power up hay chưa, h&atilde;y để &ocirc; power up trống, nếu chắc chắn đ&atilde; up rồi th&igrave; để gi&aacute; trị TRUE.</p>

<p>Bước 3: Nếu chỉ thấy xuất hiện một kết quả th&igrave; OK đ&atilde; xong. Nếu n&oacute; xuất hiện từ 2 combination trở l&ecirc;n nghĩa l&agrave; c&oacute; nhiều hơn 2 trường hợp IVs với chỉ số bạn đ&atilde; nhập. Bạn c&oacute; thể xem chi tiết bằng c&aacute;ch nhấn v&ocirc; mũi t&ecirc;n của combination. Mỗi combination sẽ cho một %, c&agrave;ng gần 100% nghĩa l&agrave; pokemon đ&oacute; c&oacute; IVs gần tối đa.</p>

<p>V&iacute; dụ khi hiện 4 combination v&agrave; 12-45% th&igrave; nghĩa l&agrave; trường hợp cao nhất cũng chỉ đạt 45% con đ&oacute; c&oacute; thể bỏ&nbsp;được. Chỉ l&agrave;m tiếp bước 4 khi bạn thấy pokemon c&oacute; thể đạt đc 80% trở l&ecirc;n.</p>

<p>Bước 4: Khi c&oacute; qu&aacute; nhiều combination v&agrave; bạn muốn t&igrave;m ch&iacute;nh x&aacute;c l&agrave; combination n&agrave;o th&igrave; bạn h&atilde;y nhập 1 c&aacute;i t&ecirc;n cho pokemon đ&oacute;.</p>

<p>Trong sheet đ&atilde; c&oacute; v&iacute; dụ l&agrave; đặt t&ecirc;n cho con Dratini l&agrave; Example. Lần 1 t&iacute;nh ra 17 combination (91-95% qu&aacute; ngon). Sau đ&oacute; bạn nhập t&ecirc;n l&agrave; Example 1, vẫn con dratini đ&oacute; bạn power up cho n&oacute;, rồi nhập lại c&aacute;c số liệu mới sau power up, cứ tiếp tục như vậy với t&ecirc;n Example 2, v&agrave; power up lần nữa rồi nhập chỉ số mới sau power up cho đến khi n&agrave;o kết quả ra ch&iacute;nh x&aacute;c. T&ecirc;n ko nhất thiết phải l&agrave; Example nh&eacute;, bất cứ t&ecirc;n n&agrave;o ko tr&ugrave;ng nhau l&agrave; được.</p>

<p>Thực ra nếu cận dưới % m&agrave; bạn t&iacute;nh đc tr&ecirc;n 80% rồi th&igrave; bạn c&oacute; thể up lu&ocirc;n m&agrave; ko cần t&iacute;nh to&aacute;n cũng đc. V&igrave; từ 80% trở l&ecirc;n l&agrave; IVs đ&atilde; cao rồi, v&agrave; 1 pokemon ho&agrave;n hảo th&igrave; IVs cao v&agrave; cần cả skills tốt nữa nh&eacute;</p>
',N'Tìm hiểu ý nghĩa và cách tính chỉ số bí ẩn trong Pokemon Go',N'Game nào cũng vậy, nếu bạn nắm thông tin trò chơi tường tận thì bạn sẽ rất dễ đưa nhân vật của mình đến một cấp độ mới trong thời gian ngắn hơn, Pokemon Go cũng có những chỉ số bí ẩn này.',N'publish',N'tim-hieu-y-nghia-va-cach-tinh-chi-so-bi-an-trong-pokemon-go',{ts '2016-08-01 05:41:00.000'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
94,NULL,{ts '2016-08-01 05:43:07.067'},N'Image upload',N'pokemon-go-smartphone-aplicacion',NULL,N'inherit',N'46c28186-fd52-4445-bddf-e5933f7a2ed0pokemon-go-smartphone-aplicacion',{ts '2016-08-01 05:43:07.067'},0,N'46c28186-fd52-4445-bddf-e5933f7a2ed0pokemon-go-smartphone-aplicacion.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
95,1,{ts '2016-08-01 05:45:10.993'},N'<p><a href="http://www.wsj.com/articles/verizon-finalizes-4-8-billion-yahoo-deal-1469380974" target="_blank">WSJ</a>&nbsp;cho biết, mức gi&aacute; mua lại n&agrave;y gồm c&aacute;c bất động sản cũng như bộ phận kinh doanh cốt l&otilde;i của Yahoo. Gi&aacute; thị trường của Yahoo hiện ở con số 38 tỷ USD, bao gồm cả cổ phần của h&atilde;ng ở Yahoo Nhật Bản (8,7 tỷ USD) cũng như Alibaba (31 tỷ USD). Theo&nbsp;<a href="http://www.nytimes.com/2016/07/26/business/verizon-yahoo-sale.html?_r=0" target="_blank">New York Time</a>&nbsp;th&igrave; Verizon kh&ocirc;ng mua lại c&aacute;c cổ phần n&agrave;y, thỏa thuận b&aacute;n đi&nbsp;cũng kh&ocirc;ng bao gồm tiền mặt v&agrave; bằng s&aacute;ng chế kh&ocirc;ng cốt l&otilde;i của Yahoo, h&atilde;ng đang c&oacute; dự định b&aacute;n ri&ecirc;ng.</p>

<p>Yahoo c&oacute; 2 dịch vụ thu h&uacute;t khoảng 1 tỷ người d&ugrave;ng to&agrave;n cầu mỗi th&aacute;ng l&agrave; Yahoo News v&agrave; Yahoo Mail, sẽ được t&iacute;ch hợp v&agrave;o dịch vụ AOL.</p>
<img alt="Marissa Mayer - CEO của Yahoo" src="http://www.techsignin.com/wp-content/uploads/2016/07/cuu-ceo-yahoo-marissa-mayer.jpg" style="width:600px" />
<p>Marissa Mayer &ndash; CEO của Yahoo</p>

<p>Sự kiện n&agrave;y kh&ocirc;ng g&acirc;y lạ cho giới ph&acirc;n t&iacute;ch khi Yahoo l&agrave; một trong những t&ecirc;n tuổi đi đầu trong cung cấp dịch vụ Internet, nhưng lại qu&aacute; chậm ch&acirc;n v&agrave; sai lầm trong việc thay đổi, dẫn đến c&aacute;c dịch vụ đ&agrave;n em như Google hay Facebook vượt mặt. Hồi năm,&nbsp;Marissa Mayer, một trong những kỹ sư h&agrave;ng đầu của Google được mời về giữ vị tr&iacute; Gi&aacute;m đốc điều h&agrave;nh của Yahoo để gi&uacute;p cải c&aacute;ch c&ocirc;ng ty, tuy nhi&ecirc;n c&aacute;c nỗ lực của b&agrave; kh&ocirc;ng th&agrave;nh c&ocirc;ng, thậm ch&iacute; c&ograve;n&nbsp;<a href="http://www.techsignin.com/cong-nghe/10-sai-lam-ceo-yahoo-marissa-mayer/" target="_blank">dẫn đến sự bất m&atilde;n của nh&acirc;n vi&ecirc;n</a>.</p>

<p>Verizon mua Yahoo được xem l&agrave; nhằm cạnh tranh với Facebook v&agrave; Google trong lĩnh vực quảng c&aacute;o di động, h&atilde;ng c&oacute; kế hoạch t&iacute;ch hợp c&ocirc;ng nghệ quảng c&aacute;o của c&ocirc;ng ty dịch vụ Internet AOL v&agrave;o c&aacute;c dịch vụ của Yahoo, v&agrave; lượng 1 tỷ người d&ugrave;ng của Yahoo được xem l&agrave; một nền tảng rất tốt cho nh&agrave; mạng n&agrave;y.</p>
',N'Dấu chấm hết của Yahoo sau 21 năm: Verizon thâu tóm giá 4,8 tỷ USD',N'Gã khổng lồ một thời của Internet mới đây đã đi đến cuối con đường của mình khi Verizon đã đạt thỏa thuận mua lại các dịch vụ cốt lõi với giá 4,8 tỷ USD.',N'publish',N'dau-cham-het-cua-yahoo-sau-21-nam-verizon-thau-tom-gia-48-ty-usd',{ts '2016-08-01 05:45:00.000'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
96,NULL,{ts '2016-08-01 05:46:45.113'},N'Image upload',N'yahoo-ban-minh',NULL,N'inherit',N'4c6dd9b9-c120-43df-8b26-ce2fd82c13d8yahoo-ban-minh',{ts '2016-08-01 05:46:45.113'},0,N'4c6dd9b9-c120-43df-8b26-ce2fd82c13d8yahoo-ban-minh.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
97,1,{ts '2016-08-02 09:42:53.303'},N'<p>Didi Chuxing vừa ch&iacute;nh thức ho&agrave;n th&agrave;nh thương vụ mua lại mảng kinh doanh dịch vụ vận tải của Uber tại thị trường Trung Quốc. Sự kết hợp n&agrave;y tạo ra một c&ocirc;ng ty c&oacute; tổng gi&aacute; trị l&ecirc;n đến 35 tỷ USD.</p>

<p>Th&ocirc;ng tin n&agrave;y được đăng tải đầu ti&ecirc;n bởi Bloomberg v&agrave; Recode v&agrave; sau đ&oacute; được ch&iacute;nh Travis Kalanick, CEO của Uber x&aacute;c nhận trong một b&agrave;i viết. Hiện tại, Didi cũng đang đầu tư 1 tỷ USD v&agrave;o Uber gi&uacute;p startup n&agrave;y n&acirc;ng tổng gi&aacute; trị l&ecirc;n 68 tỷ USD.</p>

<p>Sau khi thương vụ ho&agrave;n th&agrave;nh, Uber sẽ nắm giữ 5,89% t&agrave;i sản của c&ocirc;ng ty mới s&aacute;p nhập, con số n&agrave;y của Didi l&agrave; 17,7%.</p>

<p>Trong một b&agrave;i đăng tr&ecirc;n Facebook, Kalanick cho biết: &ldquo;L&agrave; doanh nh&acirc;n, t&ocirc;i đ&atilde; học được rằng muốn th&agrave;nh c&ocirc;ng cần phải lắng nghe bằng l&iacute; tr&iacute; v&agrave; h&agrave;nh động theo bản năng. Uber c&ugrave;ng Didi Chuxing đang đầu tư h&agrave;ng tỷ USD v&agrave;o Trung Quốc v&agrave; cả hai c&ocirc;ng ty vẫn chưa thể chuyển h&oacute;a th&agrave;nh lợi nhuận. Lợi nhuận ch&iacute;nh l&agrave; c&aacute;ch duy nhất để x&acirc;y dựng v&agrave; duy tr&igrave; một doanh nghiệp ph&aacute;t triển bền vững&rdquo;.</p>

<p><img alt="Didi Chuxing thâu tóm hoàn toàn Uber tại Trung Quốc" src="http://www.techsignin.com/wp-content/uploads/2016/08/didi-chuxing-thau-tom-uber-trung-quoc-2-462x640.jpg" style="height:auto; margin:0px auto 20px; width:462px" /></p>

<p>Uber cảm thấy việc ph&aacute;t triển ở Trung Quốc kh&aacute; kh&oacute; khăn do sự thống trị của Didi. C&ocirc;ng ty n&agrave;y gần đ&acirc;y g&acirc;y được sự ch&uacute; &yacute; của giới kinh doanh to&agrave;n cầu khi được&nbsp;<a href="http://www.techsignin.com/cong-nghe/apple-dau-tu-1-ty-usd-didi-chuxing-uber/" target="_blank">Apple đầu tư 1 tỷ USD</a>&nbsp;v&agrave; sau đ&oacute; được bổ sung với tổng số tiền hơn 7 tỷ USD.</p>

<p>Thỏa thuận n&agrave;y được xem l&agrave; một nước đi kh&ocirc;n ngoan của Uber khi c&ocirc;ng ty n&agrave;y đ&atilde; đầu tư 2 tỷ USD v&agrave;o Trung Quốc nhưng chưa thu được kết quả n&agrave;o.</p>
',N'Didi Chuxing thâu tóm hoàn toàn Uber tại Trung Quốc',N'CEO của Uber mới đây đã chính thức xác nhận bán mảng kinh doanh tại thị trường Trung Quốc cho đối thủ bản địa Didi Chuxing.',N'publish',N'didi-chuxing-thau-tom-hoan-toan-uber-tai-trung-quoc',{ts '2016-08-02 09:42:00.000'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
98,NULL,{ts '2016-08-02 09:43:08.947'},N'Image upload',N'didi-chuxing-thau-tom-uber-trung-quoc',NULL,N'inherit',N'7ee354dd-fd0d-41c4-a5cf-1068a0803e71didi-chuxing-thau-tom-uber-trung-quoc',{ts '2016-08-02 09:43:08.947'},0,N'7ee354dd-fd0d-41c4-a5cf-1068a0803e71didi-chuxing-thau-tom-uber-trung-quoc.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
99,1,{ts '2016-08-02 09:49:14.647'},N'<p>Những mẫu điện thoại cho người gi&agrave; trong danh s&aacute;ch dưới rất dễ sử dụng, m&agrave;n h&igrave;nh v&agrave; ph&iacute;m bấm to gi&uacute;p&nbsp;những&nbsp;&ocirc;ng b&agrave; lớn tuổi c&oacute; thể bấm tốt. C&aacute;c sản phẩm n&agrave;y c&oacute; thiết kế đơn giản, nhỏ gọn, đủ chức năng nghe gọi, đ&agrave;i FM, đ&egrave;n pin&hellip; với gi&aacute; giao động từ 500.000VNĐ đến 1,5 triệu.</p>

<h2><strong>Những mẫu điện thoại cho người gi&agrave; đang c&oacute; tr&ecirc;n thị trường</strong></h2>

<h3><strong>1. Viettel X6216: gi&aacute;&nbsp;470.000 VNĐ</strong></h3>

<p>Viettel X6216 l&agrave; chiếc điện thoại cho người gi&agrave; được mạng viễn th&ocirc;ng qu&acirc;n đội Viettel b&aacute;n ra, m&aacute;y d&ugrave;ng b&agrave;n ph&iacute;m T9 với thiết kế ph&iacute;m to,&nbsp;m&agrave;n h&igrave;nh m&agrave;u k&iacute;ch thước 1.77 inch, với c&aacute;c biểu tượng hiển thị với k&iacute;ch thước&nbsp;lớn, ph&ugrave; hợp với người lớn tuổi mắt k&eacute;m.</p>

<p>&nbsp;</p>
<br />
<img alt="Những điện thoại cho người già có tiêu chí tốt, bền, dễ dùng" src="http://www.techsignin.com/wp-content/uploads/2016/07/dien-thoai-cho-nguoi-gia-techsignin-6.jpg" style="height:auto; width:450px" />
<p>Viettel X6216 l&agrave; mẫu điện thoại cho người gi&agrave; được y&ecirc;u th&iacute;ch hiện nay</p>

<p>Điểm nhấn Viettel X6216 l&agrave; ph&iacute;m gọi khẩn cấp SOS nằm sau m&aacute;y. Khi bấm ph&iacute;m SOS, m&aacute;y sẽ tự động&nbsp;gửi tin SMS v&agrave; gọi đến 5 số điện thoại (được c&agrave;i trước đ&oacute;)&nbsp;li&ecirc;n tục cho đến khi bắt m&aacute;y th&igrave;&nbsp;mới dừng lại. Loa ngo&agrave;i cũng sẽ tự động k&iacute;ch hoạt để người lớn tuổi c&oacute; thể nghe r&otilde; hơn.</p>

<p>M&aacute;y c&ograve;n t&iacute;ch hợp nhiều t&iacute;nh năng hữu &iacute;ch như đọc số bằng giọng n&oacute;i,&nbsp;c&agrave;i nhiều ph&iacute;m tắt hỗ trợ li&ecirc;n lạc nhanh, đ&egrave;n LED d&ugrave;ng cho đ&ecirc;m tối, nghe đ&agrave;i FM kh&ocirc;ng d&ugrave;ng cần tai nghe&hellip; Vi&ecirc;n pin của m&aacute;y c&oacute; dung lượng 800mAh, đủ sức duy tr&igrave; thời gian chờ 200 giờ, đ&agrave;m thoại li&ecirc;n tục 4 giờ, Viettel X6216 cũng hỗ trợ 2 SIM 2 s&oacute;ng v&agrave; thẻ nhớ mở rộng 8GB.</p>

<h3><strong>2. Avio Flybee G1: Gi&aacute;&nbsp;470.000 VNĐ</strong></h3>

<p>Mẫu điện thoại cho người gi&agrave; Avio Flybee G1&nbsp;kh&aacute;&nbsp;gọn nhẹ, m&aacute;y cũng được thiết kế chữ k&iacute;ch thước lớn, hỗ trợ nghe đ&agrave;i FM với loa ngo&agrave;i c&ocirc;ng suất mạnh</p>

<p><img alt="Những điện thoại cho người già có tiêu chí tốt, bền, dễ dùng" src="http://www.techsignin.com/wp-content/uploads/2016/07/dien-thoai-cho-nguoi-gia-techsignin-5.jpg" style="height:auto; margin:0px auto 20px; width:400px" /></p>

<p>Avio Flybee G1 c&ograve;n c&oacute; thời lượng pin lớn đến 1.400mAh gi&uacute;p m&aacute;y duy tr&igrave; li&ecirc;n tục trong v&ograve;ng 7 ng&agrave;y. M&aacute;y hỗ trợ thẻ nhớ 8GB, 2 SIM, 2 s&oacute;ng, c&oacute; m&agrave;n h&igrave;nh IPS LCD k&iacute;ch thước 2 inch. B&ecirc;n cạnh chức năng th&ocirc;ng dụng, m&aacute;y cũng c&oacute; n&uacute;t&nbsp;SOS gi&uacute;p gọi khẩn cấp ở cạnh.</p>

<h3><strong>3. Philips Xenium X2566: gi&aacute;&nbsp;1.130.000 VNĐ</strong></h3>

<p>Philips Xenium X2566 l&agrave; chiếc điện thoại ph&ugrave; hợp với người lớn tuổi khi sở hữu m&agrave;n h&igrave;nh 2,4 inch, giao diện đơn giản, b&agrave;n ph&iacute;m cao su mềm nổi với số to v&agrave; r&otilde;&nbsp;gi&uacute;p dễ thao t&aacute;c.&nbsp;Loa ngo&agrave;i của m&aacute;y cho&nbsp;&acirc;m thanh trong&nbsp;v&agrave;&nbsp;lớn, m&aacute;y c&oacute; thể đọc từng số khi bấm.</p>

<p><img alt="Những điện thoại cho người già có tiêu chí tốt, bền, dễ dùng" src="http://www.techsignin.com/wp-content/uploads/2016/07/dien-thoai-cho-nguoi-gia-techsignin-4.jpg" style="height:auto; margin:0px auto 20px; width:660px" /></p>

<p>Về cấu h&igrave;nh, Philips X2566 trang bị pin dung lượng đến 1.630 mAh&nbsp;gi&uacute;p cho&nbsp;thời gian chờ tới 50 ng&agrave;y, đ&agrave;m thoại li&ecirc;n tục trong 25 giờ, m&aacute;y cũng hỗ trợ 2 SIM 2 s&oacute;ng. B&ecirc;n cạnh&nbsp;đ&oacute; m&aacute;y c&ograve;n hỗ trợ chụp ảnh, quay video, xem phim từ thẻ nhớ, đọc s&aacute;ch điện tử, nghe đ&agrave;i FM kh&ocirc;ng cần tai nghe v&agrave; n&uacute;t SOS cho ph&eacute;p gọi khẩn cấp.</p>

<h3><strong>4. Philips Xenium E311: gi&aacute; 1.290.000 VNĐ</strong></h3>

<p>Tuy l&agrave; điện thoại cho người gi&agrave;, Philips Xenium E311 c&oacute; thiết kế trẻ, ấn tượng bởi 2&nbsp;m&agrave;u xanh l&aacute; v&agrave; đen, k&iacute;ch thước nhỏ gọn gi&uacute;p dễ cầm. M&aacute;y trang bị m&agrave;n h&igrave;nh c&ugrave;ng b&agrave;n ph&iacute;m k&iacute;ch thước lớn.</p>

<p>Ở mặt sau&nbsp;Philips Xenium E311 trang bị n&uacute;t SOS v&agrave; camera ngo&agrave;i gi&uacute;p chụp ảnh, pin theo m&aacute;y c&oacute; dung lượng pin 1.530 mAh gi&uacute;p cho thời gian chờ gần 2 th&aacute;ng, đ&agrave;m thoại tr&ecirc;n 20 giờ ngay cả khi mở loa ngo&agrave;i. M&aacute;y hỗ trợ nghe MP3, đ&agrave;i FM kh&ocirc;ng cần tai nghe v&agrave; 2 SIM 2 s&oacute;ng, Philips c&ograve;n&nbsp;c&oacute;&nbsp;phụ kiện dock sạc pin treo tr&ecirc;n tường.</p>

<p><img alt="Những điện thoại cho người già có tiêu chí tốt, bền, dễ dùng" src="http://www.techsignin.com/wp-content/uploads/2016/07/dien-thoai-cho-nguoi-gia-techsignin-3.jpg" style="height:auto; margin:0px auto 20px; width:300px" /></p>

<h3><strong>5. Philips E310: Gi&aacute; 1.290.000 VNĐ</strong></h3>

<p>Philips E310 c&oacute; thiết kế ph&iacute;m to, chữ lớn, đ&egrave;n nền&nbsp;gi&uacute;p&nbsp;cho người lớn tuổi sử dụng trong đ&ecirc;m. M&agrave;n h&igrave;nh của&nbsp;m&aacute;y lớn, ph&ocirc;ng chữ to, r&otilde; r&agrave;ng v&agrave; trang bị camera sau 0.3 MP.</p>

<p><img alt="Những điện thoại cho người già có tiêu chí tốt, bền, dễ dùng" src="http://www.techsignin.com/wp-content/uploads/2016/07/dien-thoai-cho-nguoi-gia-techsignin-2.jpg" style="height:auto; margin:0px auto 20px; width:369px" /></p>

<p>Những t&iacute;nh năng cần thiết&nbsp;với điện thoại d&agrave;nh cho người lớn tuổi cũng c&oacute; mặt E310.&nbsp;Cụ thể l&agrave; ph&iacute;m SOS ở mặt lưng&nbsp;gi&uacute;p gọi, nhắn tin nhanh, n&uacute;t mở nhanh đ&egrave;n pin, kh&oacute;a m&aacute;y&hellip;</p>

<p>M&aacute;y hỗ trợ nghe radio qua loa ngo&agrave;i, hai SIM hai s&oacute;ng, khe thẻ nhớ microSD tối đa 16 GB. Pin đi k&egrave;m 1.630 mAh&nbsp;gi&uacute;p&nbsp;Philips E310&nbsp;c&oacute; thể chờ tới 50 ng&agrave;y hoặc 25 tiếng thoại li&ecirc;n tục.</p>

<p><img alt="Những điện thoại cho người già có tiêu chí tốt, bền, dễ dùng" src="http://www.techsignin.com/wp-content/uploads/2016/07/dien-thoai-cho-nguoi-gia-techsignin.jpg" style="height:auto; margin:0px auto 20px; width:500px" /></p>
',N'Những điện thoại cho người già có tiêu chí tốt, bền, dễ dùng',N'Trừ trẻ em, những người lớn tuổi trong gia đình nên có một chiếc điện thoại, bài viết tổng hợp những điện thoại cho người già theo tiêu chí tốt, bền và dễ dùng.',N'publish',N'nhung-dien-thoai-cho-nguoi-gia-co-tieu-chi-tot-ben-de-dung',{ts '2016-08-02 09:49:00.000'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
100,NULL,{ts '2016-08-02 09:49:37.763'},N'Image upload',N'dien-thoai-cho-nguoi-gia-techsignin-3',NULL,N'inherit',N'70b8c26d-f2fa-4a92-96ea-218fb7766a56dien-thoai-cho-nguoi-gia-techsignin-3',{ts '2016-08-02 09:49:37.763'},0,N'70b8c26d-f2fa-4a92-96ea-218fb7766a56dien-thoai-cho-nguoi-gia-techsignin-3.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
101,1,{ts '2016-08-02 10:02:23.027'},N'<p><img alt="Người nhà Samsung thừa nhận thiếu kinh nghiệm về phát triển phần mềm" src="http://www.techsignin.com/wp-content/uploads/2015/12/nguoi-nha-samsung-thua-nhan-thieu-kinh-nghiem-ve-phat-trien-phan-mem.jpg" style="margin:0px auto 20px; width:700px" /></p>

<p>Nguồn tin thận cận đ&atilde; tiết lộ điều n&agrave;y với Reuters rằng sau nhiều năm trời b&aacute;n smartphone, Samsung vẫn chưa hề c&oacute; kinh nghiệm trong việc tạo ra những ứng dụng v&agrave; dịch vụ chuy&ecirc;n biệt, ch&iacute;nh x&aacute;c hơn th&igrave; l&agrave; hai dịch vụ tin nhắn ChatOn v&agrave; stream nhạc Milk Music&nbsp;&ndash;&nbsp;đều ra mắt nhanh ch&oacute;ng rồi lại bị ngưng hoạt động chỉ sau một thời gian ngắn.</p>

<p>Theo Reuters, thậm ch&iacute; c&ograve;n phải thu&ecirc; cả đội ngũ thiết kế ri&ecirc;ng ở Anh để tạo ra giao diện người d&ugrave;ng tr&ecirc;n c&aacute;c thiết bị Galaxy, trong khi&nbsp;với tiềm lực đầu tư của m&igrave;nh th&igrave; Samsung qu&aacute; dễ d&agrave;ng tự ph&aacute;t triển những thứ n&agrave;y.</p>

<p>Nhưng x&eacute;t tr&ecirc;n b&igrave;nh diện thế giới, Samsung kh&ocirc;ng phải l&agrave; &ocirc;ng lớn duy nhất tự ph&aacute;t triển rồi nhanh ch&oacute;ng từ bỏ những dự &aacute;n, dịch vụ của m&igrave;nh. Trước đ&acirc;y cả Google v&agrave; Microsoft đều gặp kh&ocirc;ng &iacute;t vấn đề với một v&agrave;i dịch vụ của&nbsp;m&igrave;nh&nbsp;như mạng x&atilde; hội Google+ ph&aacute;t triển chậm chạp, k&eacute;m hấp dẫn người d&ugrave;ng d&ugrave; được Google Search chống lưng, hay nền tảng Windows Phone vẫn m&atilde;i dậm ch&acirc;n tại chỗ v&agrave; kh&ocirc;ng l&ocirc;i k&eacute;o được người d&ugrave;ng như mong muốn.</p>

<p>Quyết định cho ngừng hai dịch vụ ChatOn v&agrave; Milk Music của Samsung được xem quyết định đ&uacute;ng đắn v&agrave; dũng cảm bởi ch&uacute;ng cũng chẳng được đầu tư ph&aacute;t triển đủ tốt để hấp dẫn được người d&ugrave;ng.&nbsp;Samsung vẫn c&ograve;n nhiều sản phẩm để chứng minh được khả năng của h&atilde;ng, đồng thời việc huy động chất x&aacute;m từ b&ecirc;n ngo&agrave;i phần n&agrave;o cũng l&agrave; một lợi điểm để c&ocirc;ng ty kh&ocirc;ng sa lầy v&agrave;o những triết l&yacute; thiết kế đ&atilde; lỗi thời.</p>
',N'Người nhà Samsung thừa nhận thiếu kinh nghiệm về phát triển phần mềm',N'Reuters mới đây dẫn lời nguồn tin nặc danh đến từ tập đoàn Samsung rằng công ty thừa nhận việc thiếu kinh nghiệm trong phát triển phần mềm.',N'publish',N'nguoi-nha-samsung-thua-nhan-thieu-kinh-nghiem-ve-phat-trien-phan-mem',{ts '2016-08-02 10:02:00.000'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
102,NULL,{ts '2016-08-02 10:02:31.187'},N'Image upload',N'nguoi-nha-samsung-thua-nhan-thieu-kinh-nghiem-ve-phat-trien-phan-mem',NULL,N'inherit',N'b8d412a4-e1af-480d-9d43-b42783ea01e2nguoi-nha-samsung-thua-nhan-thieu-kinh-nghiem-ve-phat-trien-phan-mem',{ts '2016-08-02 10:02:31.187'},0,N'b8d412a4-e1af-480d-9d43-b42783ea01e2nguoi-nha-samsung-thua-nhan-thieu-kinh-nghiem-ve-phat-trien-phan-mem.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
103,1,{ts '2016-08-02 16:10:47.687'},N'<img alt="Tỷ phú Michael Bloomberg: hãy dậy sớm, đi ngủ muộn và tắm ít thôi!" src="http://www.techsignin.com/wp-content/uploads/2016/08/ty-phu-michael-bloomberg.jpg" style="height:auto; width:640px" />
<p>Tỷ ph&uacute; Michael Bloomberg</p>

<h3><strong>Michael&nbsp;Bloomberg: Từ b&atilde;i đỗ xe đến ch&iacute;nh trường Mỹ</strong></h3>

<p>Michael&nbsp;Bloomberg&nbsp;sinh năm 1942 tại Medford, Massachusetts &ndash; thị trấn nhỏ cạnh Boston trong một gia đ&igrave;nh b&igrave;nh d&acirc;n. &Ocirc;ng sớm được tiếp x&uacute;c với s&aacute;ch vở th&ocirc;ng qua cửa h&agrave;ng s&aacute;ch nơi cha &ocirc;ng l&agrave;m việc.</p>

<p>Bloomberg theo học tại Đại học Johns Hopkins v&agrave; l&agrave;m việc như một nh&acirc;n vi&ecirc;n tại b&atilde;i đậu xe để trả tiền học ph&iacute;. Đến năm 1964, &ocirc;ng tốt nghiệp cử nh&acirc;n ng&agrave;nh kỹ thuật điện,&nbsp;rồi&nbsp;tiếp tục nhận được bằng Thạc sỹ Quản trị Kinh doanh (MBA) từ Trường Harvard danh tiếng.</p>

<p>Sau những năm th&aacute;ng miệt m&agrave;i vừa học vừa l&agrave;m, năm 1973 với h&agrave;nh trang l&agrave; những bằng cấp loại ưu, Michael Bloomberg bắt đầu đến phố Wall &ndash; trung t&acirc;m t&agrave;i ch&iacute;nh của nước Mỹ l&agrave;m việc cho c&ocirc;ng ty Solomo Brothers. Ban đầu &ocirc;ng chỉ l&agrave;m c&ocirc;ng việc c&oacute; phần nh&agrave;m ch&aacute;n l&agrave; d&agrave;nh nhiều giờ để kiểm k&ecirc; sổ s&aacute;ch của ng&acirc;n h&agrave;ng. Sau đ&oacute; &ocirc;ng được phụ tr&aacute;ch mảng kinh doanh chứng kho&aacute;n tại đ&acirc;y.</p>

<p>Đến năm 1978, &ocirc;ng chịu tr&aacute;ch nhiệm vận h&agrave;nh mảng&nbsp;c&ocirc;ng nghệ&nbsp;th&ocirc;ng tin của c&ocirc;ng ty. &Ocirc;ng ở lại Salomon hơn 3 năm cho đến khi c&ocirc;ng ty s&aacute;t nhập với c&ocirc;ng ty thương mại h&agrave;ng h&oacute;a Phibro năm 1981. Bloomberg bị sa thải với khoản trợ cấp nghỉ việc 10 triệu USD.</p>

<p>Rời khỏi Salomon, Bloomberg quyết định &aacute;p dụng những g&igrave; &ocirc;ng học được v&agrave;o th&agrave;nh lập một c&ocirc;ng ty với t&ecirc;n gọi aInnovative Market Solution. C&ocirc;ng ty được lập ra với mục đ&iacute;ch cung cấp th&ocirc;ng tin, số liệu cho c&aacute;c nh&agrave; đầu tư tr&ecirc;n thị trường chứng kho&aacute;n. Năm 1982, c&ocirc;ng ty c&oacute; đơn h&agrave;ng đầu ti&ecirc;n trị gi&aacute; 30 triệu USD với 22 thiết bị đầu cuối MarketMaster.</p>

<p>C&ocirc;ng ty được đổi t&ecirc;n th&agrave;nh Bloomberg LP v&agrave; trở n&ecirc;n phổ biến rộng r&atilde;i trong suốt những năm 80, năm 1989 c&ocirc;ng ty c&oacute; gi&aacute; trị thị trường 2 tỷ USD. Bloomberg đồng thời trở th&agrave;nh thương hiệu truyền th&ocirc;ng đ&igrave;nh đ&aacute;m nhất l&uacute;c bấy giờ bao gồm Bloomberg News v&agrave; Bloomberg TV.</p>

<p>Tuy nhi&ecirc;n, Micheal Bloomberg đ&atilde; nhường lại vị tr&iacute; Gi&aacute;m đốc điều h&agrave;nh c&ocirc;ng ty cho Lex Fenwick để theo đuổi sự nghiệp ch&iacute;nh trị của m&igrave;nh. Năm 2001, Bloomberg tham gia tranh cử chức Thị trưởng th&agrave;nh phố New York với tư c&aacute;ch l&agrave; th&agrave;nh vi&ecirc;n Đảng Cộng h&ograve;a d&ugrave; trước đ&oacute; &ocirc;ng đ&atilde; c&oacute; thời gian đứng trong h&agrave;ng ngũ Đảng D&acirc;n chủ.</p>

<p>Từ khi l&ecirc;n nắm quyền, Bloomberg đ&atilde; l&agrave;m nhiều việc để đưa th&agrave;nh phố New York trở lại nhịp sống vốn c&oacute;. &Ocirc;ng cũng từ chối khoản lương d&agrave;nh cho thị trưởng m&agrave; chỉ nhận tượng trưng 1 USD mỗi năm, Bloomberg đ&atilde; c&oacute; 3 nhiệm kỳ th&agrave;nh c&ocirc;ng khi giữ chức thị trưởng th&agrave;nh phố New York.</p>

<p>Micheal Bloomberg l&agrave; h&igrave;nh mẫu l&yacute; tưởng của c&aacute;c ch&iacute;nh trị gia tr&ecirc;n khắp thế giới, đồng s&aacute;ng lập một li&ecirc;n minh của hơn 200 thị trưởng tr&ecirc;n to&agrave;n nước Mỹ. Ngo&agrave;i ra, &ocirc;ng c&ograve;n l&agrave; người s&aacute;ng lập v&agrave; th&agrave;nh vi&ecirc;n t&iacute;ch cực của nhiều tổ chức gi&aacute;o dục, văn h&oacute;a v&agrave; từ thiện lớn tr&ecirc;n thế giới.</p>

<h3><strong>B&iacute; quyết tạo n&ecirc;n th&agrave;nh c&ocirc;ng = Chăm chỉ + kh&ocirc;ng bao giờ bỏ cuộc</strong></h3>

<p>Khi chia sẻ về b&iacute; quyết th&agrave;nh c&ocirc;ng của m&igrave;nh trong một chương tr&igrave;nh truyền h&igrave;nh, Bloomberg n&oacute;i một c&acirc;u đơn giản: C&aacute;c bạn h&atilde;y dậy sớm, đi ngủ muộn hơn, ăn trưa tại b&agrave;n l&agrave;m việc v&agrave; đừng đi tắm qu&aacute; nhiều. H&atilde;y tận dụng tất cả thời gian m&agrave; bạn c&oacute; để l&agrave;m việc v&agrave; l&agrave;m việc chăm chỉ hơn nữa.</p>

<p>&ldquo;T&ocirc;i lu&ocirc;n cố gắng l&agrave; người đầu ti&ecirc;n đến c&ocirc;ng ty v&agrave;o buổi s&aacute;ng v&agrave; l&agrave; người cuối c&ugrave;ng ra về mỗi buổi tối. T&ocirc;i kh&ocirc;ng đi nghỉ nhiều, hạn chế rời khỏi b&agrave;n l&agrave;m việc để đi tắm hay ăn trưa&rdquo; &ndash; Bloomberg cho biết</p>

<p>Với &ocirc;ng, b&agrave;n l&agrave;m việc l&agrave; nơi cần d&agrave;nh nhiều thời gian v&agrave; d&ugrave; mọi người c&oacute; xem điều đ&oacute; đi&ecirc;n rồ tới mức n&agrave;o, Bloomberg vẫn giữ quan điểm của m&igrave;nh. &ldquo;Bạn kh&ocirc;ng thể điều khiển may mắn của m&igrave;nh hay bạn th&ocirc;ng minh ra sao, nhưng c&oacute; thể kiểm so&aacute;t l&agrave;m việc của m&igrave;nh. Đ&oacute; l&agrave; điều kiện ti&ecirc;n quyết nếu muốn th&agrave;nh c&ocirc;ng&rdquo;.</p>

<p>C&oacute; lẽ đ&acirc;y cũng ch&iacute;nh l&agrave; l&yacute; do m&agrave; Bloomberg LP cung cấp đồ ăn miễn ph&iacute; tại nơi l&agrave;m việc cho nh&acirc;n vi&ecirc;n để khuyến kh&iacute;ch mọi người h&ograve;a nhập với nhau hơn v&agrave; tất nhi&ecirc;n họ sẽ &iacute;t rời khỏi b&agrave;n l&agrave;m việc để đi ăn trưa hơn.</p>

<p>Bloomberg LP kh&ocirc;ng c&oacute; một ch&iacute;nh s&aacute;ch cụ thể n&agrave;o quy định về việc sử dụng ph&ograve;ng tắm v&agrave; nh&agrave; vệ sinh. Tuy nhi&ecirc;n, theo tiết lộ của một số nh&acirc;n vi&ecirc;n th&igrave; nh&agrave; vệ sinh tại Manhattan của c&ocirc;ng ty n&agrave;y được thiết kế để nh&acirc;n vi&ecirc;n&hellip; &ldquo;kh&ocirc;ng thể n&aacute;n lại l&acirc;u&rdquo; do kh&ocirc;ng gian chật hẹp v&agrave; tiếng ồn xung quanh.</p>

<p>&ldquo;Mọi người đều c&oacute; những cơ hội kh&aacute;c nhau v&agrave; c&aacute;c kỹ năng ri&ecirc;ng, kết hợp với một phần may mắn trong cuộc sống. Theo kinh nghiệm của t&ocirc;i th&igrave; c&agrave;ng l&agrave;m việc chăm chỉ, c&agrave;ng tạo ra nhiều may mắn cho ch&iacute;nh m&igrave;nh&rdquo; &ndash; Bloomberg chia sẻ.</p>

<p>Ngo&agrave;i ra, tỷ ph&uacute; 74 tuổi cũng cho biết, t&acirc;m l&yacute; sẵn s&agrave;ng chấp nhận rủi ro v&agrave; t&iacute;nh bền bỉ sẽ kh&ocirc;ng thể thiếu để đạt th&agrave;nh c&ocirc;ng. &ldquo;Một người th&agrave;nh đạt vẫn phải li&ecirc;n tục học hỏi v&agrave; đừng qu&aacute; tham lam, phải biết cho đi sau khi đ&atilde; nhận về&rdquo;.</p>
',N'Tỷ phú Michael Bloomberg: hãy dậy sớm, đi ngủ muộn và tắm ít thôi!',N'Ít người biết Michael Bloomberg – tỷ phú giàu thứ 8 thế giới, cựu thị trưởng thành phố New York, ông trùm đế chế truyền thông Bloomberg LP – có xuất phát điểm là một nhân viên trông xe.',N'publish',N'ty-phu-michael-bloomberg-hay-day-som-di-ngu-muon-va-tam-it-thoi',{ts '2016-08-02 16:10:00.000'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
104,NULL,{ts '2016-08-02 16:11:07.633'},N'Image upload',N'ty-phu-michael-bloomberg',NULL,N'inherit',N'bb130d55-ae0c-4a03-969b-96891f4daabfty-phu-michael-bloomberg',{ts '2016-08-02 16:11:07.633'},0,N'bb130d55-ae0c-4a03-969b-96891f4daabfty-phu-michael-bloomberg.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
105,1,{ts '2016-08-02 16:12:57.460'},N'<p>Những c&ocirc;ng ty, cửa h&agrave;ng mới v&agrave; c&aacute;c doanh nghiệp đang cung cấp dịch vụ của m&igrave;nh bằng việc x&acirc;y dựng một nền tảng nằm tr&ecirc;n di động v&agrave; hệ điều h&agrave;nh. Sau sự kiện, Mashable v&agrave; Lax đ&atilde; c&ugrave;ng tr&ograve; chuyện để thảo luận về việc &ocirc;ng (Lax) cảm thấy tương lai của thiết kế số trong kỷ nguy&ecirc;n Facebook v&agrave; c&aacute;c nền tảng kh&aacute;c đang hoạt động như một người g&aacute;c cửa cho thẩm mỹ.</p>
<img alt="Giám đốc thiết kế sản phẩm Facebook: Website có thể là ngành kinh doanh đang dần chết" src="http://www.techsignin.com/wp-content/uploads/2016/06/techsignin-facebook-thiet-ke-website-dang-dan-chet-3.jpg" style="height:auto; width:1200px" />
<p>Từ phải sang: Jon Lax &ndash; gi&aacute;m đốc thiết kế sản phẩm của Facebook; Jon Wiley &ndash; gi&aacute;m đốc thiết kế nh&uacute;ng tại Google; Dantley Davis &ndash; Gi&aacute;m đốc thiết kế của Netflix.</p>

<p><em>C&acirc;u n&agrave;y như dạng c&acirc;u hỏi con g&agrave; v&agrave; quả trứng, nhưng liệu kỷ nguy&ecirc;n m&agrave; platform đang được c&aacute;c c&ocirc;ng ty chi phối hay bởi y&ecirc;u cầu từ ph&iacute;a người d&ugrave;ng?</em></p>

<p>Thiết bị di động v&agrave; c&aacute;c sản phẩm cộng sinh với n&oacute; mới ch&iacute;nh l&agrave; thứ điều khiển. Ch&uacute;ng t&ocirc;i c&oacute; thể đưa cho người d&ugrave;ng những thiết bị t&iacute;nh to&aacute;n v&agrave; với phần lớn thế giới th&igrave;&nbsp;đ&oacute; l&agrave;&nbsp;chiếc m&aacute;y t&iacute;nh họ đang d&ugrave;ng.</p>

<p>N&oacute; cũng như việc ch&uacute;ng ta đ&atilde; l&agrave;m một cuộc dịch chuyển c&ocirc;ng nghệ v&agrave;o thập ni&ecirc;n 80 khi đưa c&aacute;c m&aacute;y mainframes trở th&agrave;nh m&aacute;y t&iacute;nh c&aacute; nh&acirc;n (PC) v&agrave; từ PC sang laptops, đ&acirc;y chỉ l&agrave; cuộc diễu h&agrave;nh của tiến tr&igrave;nh c&ocirc;ng nghệ.</p>

<p>Trong thế giới di động, c&oacute; 2 nền tảng đang chiếm ưu thế: Android v&agrave; iOS, b&ecirc;n trong đ&oacute; l&agrave; nơi m&agrave; hệ sinh th&aacute;i n&agrave;y tồn tại, t&ocirc;i nghĩ tất cả c&aacute;c nguồn lực đ&atilde; l&agrave;m việc với nhau. Điều thực sự th&uacute; vị l&agrave; Apple chỉ tin rằng trải nghiệm tự nhi&ecirc;n l&agrave; tốt hơn trải nghiệm giao diện web di động &ndash; điều đ&oacute; thực sự đ&atilde; đưa đến sự th&agrave;nh c&ocirc;ng của ứng dụng (apps).</p>

<p>T&ocirc;i nghĩ rằng ch&uacute;ng ta đang đi đến một giai đoạn mới, nơi những con bot c&oacute; thực sự th&uacute; vị. N&oacute; kh&ocirc;ng phải l&agrave; ứng dụng bạn tải về như hiện tại, t&ocirc;i nghĩ c&aacute;c con bot thực l&agrave; quyến rũ, n&oacute; c&oacute; thể l&agrave; thế hệ tiếp theo của c&aacute;i ch&uacute;ng ta nghĩ về ứng dụng.</p>

<p><em>&Ocirc;ng đ&atilde; đề cập l&agrave; thấy mọi người chỉ d&ugrave;ng khoảng 10 ứng dụng tr&ecirc;n smartphone, điều n&agrave;y dường như với t&ocirc;i l&agrave; thực tế.</em></p>

<p>Thường th&igrave; số 7 l&agrave; con số kỳ ảo, bạn sẽ chỉ d&agrave;nh nhiều thời gian cho chừng 7 ứng dụng, dĩ nhi&ecirc;n số 7 ứng dụng n&agrave;y lại kh&aacute;c đối với mỗi người. Về to&agrave;n cầu, Facebook c&oacute; khả năng lớn l&agrave; 1&nbsp;trong 7 ứng dụng đ&oacute;, b&ecirc;n cạnh đ&oacute; c&oacute; Instagram, WhatsApp, Messenger v&agrave; c&aacute;c loại kh&aacute;c.</p>

<p>Nếu l&agrave; một c&ocirc;ng ty v&agrave; bạn đang x&acirc;y dựng app, bạn thực sự n&ecirc;n hỏi bản th&acirc;n l&agrave;: l&agrave;m thế n&agrave;o t&ocirc;i c&oacute; thể trở th&agrave;nh 1&nbsp;trong con số 7 ứng dụng quan trọng đ&oacute;. Về mặt thống k&ecirc;, đang c&oacute; gần 1 triệu ứng dụng tr&ecirc;n kho, v&agrave; hầu hết ch&uacute;ng kh&ocirc;ng thể trở th&agrave;nh số trong top 7 của bạn.</p>

<p><em>&Ocirc;ng c&oacute; nghĩ những con bot sẽ đưa 7 ứng dụng đ&oacute; trong khoảng 100 ứng dụng một lần?</em></p>

<p>T&ocirc;i nghĩ vậy, những nền tảng n&agrave;y đang trở th&agrave;nh hệ sinh th&aacute;i rất khỏe mạnh, v&agrave; ch&uacute;ng sẽ cung cấp cơ hội mới m&agrave; ch&uacute;ng ta hiện kh&ocirc;ng c&oacute;.</p>
<img alt="Giám đốc thiết kế sản phẩm Facebook: Website có thể là ngành kinh doanh đang dần chết" src="http://www.techsignin.com/wp-content/uploads/2016/06/techsignin-facebook-thiet-ke-website-dang-dan-chet-2.jpg" style="height:auto; width:1200px" />
<p>Jon Lax</p>

<p><em><strong>Đối với c&aacute;c nh&agrave; thiết kế, liệu sự k&eacute;m đa dạng trong thiết kế trực tuyến sẽ tốt hơn?</strong></em></p>

<p>Khi ch&uacute;ng t&ocirc;i hoạt động b&ecirc;n trong iOS v&agrave; Android, những hệ sinh th&aacute;i đ&oacute; đ&atilde; c&oacute; quy luật thiết kế &aacute;p đặt cho ch&uacute;ng t&ocirc;i. Nếu t&ocirc;i d&ugrave;ng thiết kế vật liệu của Google (material design), n&oacute; bắt buộc khi bạn chạm, một n&uacute;t sẽ trồi l&ecirc;n để tiếp x&uacute;c với ng&oacute;n tay bạn v&agrave; l&uacute;n xuống khi bạn nhấn, v&agrave; họ giải th&iacute;ch &ldquo;điều n&agrave;y l&agrave; c&aacute;ch m&agrave; hệ thống n&ecirc;n như thế&rdquo;.</p>

<p>C&oacute; kh&aacute; nhiều mẫu thiết kế quyết định như vậy bằng việc x&acirc;y dựng tr&ecirc;n di động, ch&uacute;ng đ&atilde; nằm ngo&agrave;i sự kiểm so&aacute;t của bạn. V&agrave; n&oacute; l&agrave; điều tốt, v&igrave; nếu mọi nh&agrave; thiết kế đều phải bận t&acirc;m về việc c&aacute;i n&uacute;t sẽ hoạt động, n&oacute; sẽ tốn rất nhiều năng lượng cho điều kh&ocirc;ng qu&aacute; gi&aacute; trị.</p>

<p>C&ograve;n đối với mọi người, với mỗi ứng dụng, họ chỉ cần&nbsp;t&igrave;m hiểu&nbsp;c&aacute;ch n&oacute; hoạt động ra sao.</p>

<p>Cuối c&ugrave;ng, điều tốt l&agrave; c&oacute; kh&aacute; nhiều thiết kế đ&atilde; trở th&agrave;nh ti&ecirc;u chuẩn. Nhưng điều n&agrave;y đồng nghĩa với việc nghề thiết kế đang thay đổi, những g&igrave; họ cần tập trung v&agrave;o l&agrave; l&agrave;m thế n&agrave;o để mọi thứ hoạt động v&agrave; &iacute;t quan t&acirc;m hơn cho việc tr&ocirc;ng n&oacute; như thế n&agrave;y. Điều n&agrave;y sẽ gi&uacute;p bạn tạo ra sản phẩm c&oacute; thể mở rộng để h&agrave;ng tỷ người d&ugrave;ng.</p>

<p>Điều đ&oacute; kh&aacute;c biệt với những g&igrave; ch&uacute;ng t&ocirc;i đ&atilde; từng l&agrave;m v&agrave;o giữa những năm 2000. Ch&uacute;ng t&ocirc;i đ&atilde; thử mọi thứ &ndash; đ&acirc;y l&agrave; kỷ nguy&ecirc;n của Myspace &ndash; v&agrave; ch&uacute;ng t&ocirc;i cảm thấy như muốn đi&ecirc;n l&ecirc;n. T&ocirc;i nghĩ rằng ch&uacute;ng t&ocirc;i đ&atilde; đi qua giai đoạt đ&oacute; v&agrave; t&ocirc;i cho rằng ch&uacute;ng t&ocirc;i đang đi v&agrave;o giai đoạn c&ocirc;ng nghệ thực tế ảo. Sẽ c&oacute; nhiều thứ ch&uacute;ng t&ocirc;i phải thử, v&agrave; cũng chưa chắc l&agrave; ch&uacute;ng t&ocirc;i sẽ h&agrave;i l&ograve;ng với n&oacute;.</p>

<p>Khi tiến đến web v&agrave; di động, ch&uacute;ng t&ocirc;i đ&atilde; bước qua n&oacute; v&agrave; đang ở giai&nbsp;đoạn&nbsp;mọi thứ đang được ti&ecirc;u chuẩn h&oacute;a, v&agrave; n&oacute; tạo ra những trải nghiệm thực sự.</p>

<p><em><strong>Facebook hiện đang l&agrave; một khu vực chứa rất nhiều hoạt động, từ chuyển tải tin tức tới x&atilde; hội, liệu c&oacute; một c&ocirc;ng ty n&agrave;o đ&oacute; đ&aacute;nh mất sự ri&ecirc;ng tư bởi v&igrave; bị cuốn v&agrave;o nền tảng mạng x&atilde; hội v&agrave; c&aacute;c hoạt động của n&oacute;?</strong></em></p>

<p>T&ocirc;i sẽ kh&ocirc;ng trực tiếp trả lời c&acirc;u hỏi n&agrave;y bởi n&oacute; c&oacute; nội dung g&acirc;y tranh c&atilde;i. Điều t&ocirc;i nghĩ l&agrave; xu hướng của di động đ&atilde; cơ bản thay đổi sự năng động của việc l&agrave;m thế n&agrave;o th&ocirc;ng tin được ph&acirc;n phối. Điều dễ nhận thấy l&agrave; mọi người th&iacute;ch feeds v&agrave; n&oacute; đ&atilde; l&agrave;m việc tốt. Đ&oacute; l&agrave; những g&igrave; ch&uacute;ng ta đang được trải nghiệm. Những nh&agrave; xuất bản c&oacute; thể rất th&agrave;nh c&ocirc;ng b&ecirc;n trong c&aacute;c nền tảng&nbsp;như vậy.</p>

<p><strong><em>Nhiều c&ocirc;ng ty đ&atilde; gắn chặt với Facebook v&agrave; sử dụng n&oacute; để ph&acirc;n phối dịch vụ của họ. &Ocirc;ng nghĩ như thế n&agrave;o về vị tr&iacute; của m&igrave;nh khi chịu tr&aacute;ch nhiệm về thiết kế nền tảng?</em></strong></p>

<p>T&ocirc;i nghĩ tr&aacute;ch nhiệm ch&iacute;nh của ch&uacute;ng t&ocirc;i l&agrave; cho cộng đồng. Ch&uacute;ng t&ocirc;i muốn tạo thứ mọi người tr&ecirc;n thế giới muốn sử dụng. Khi trở th&agrave;nh kinh doanh, ch&uacute;ng t&ocirc;i nghĩ m&igrave;nh c&oacute; tr&aacute;ch nhiệm phải gi&uacute;p kết nối doanh nghiệp với người d&ugrave;ng.</p>

<p>Thực tế l&agrave; trong giai đoạn chuyển dịch sang di động, nếu tất cả hoạt động m&agrave; t&ocirc;i đ&atilde; đề cập trở th&agrave;nh hiện thực, một trong những th&aacute;ch thức ở hiện tại, đặc biệt cho doanh nghiệp nhỏ l&agrave; việc họ sẽ kh&ocirc;ng bao giờ c&oacute; thể tạo một ứng dụng di động thực thụ.</p>

<p>Về kỹ thuật, điều đ&oacute; rất phức tạp. Thậm ch&iacute; nếu họ c&oacute; thể, cơ hội để ứng dụng của họ nằm trong top 7 ứng dụng được d&ugrave;ng nhiều nhất của người d&ugrave;ng l&agrave; kh&ocirc;ng khả thi, nhưng họ lại cần c&oacute; để thực hiện hoạt động kinh doanh với kh&aacute;ch h&agrave;ng của m&igrave;nh.</p>

<p>T&ocirc;i nghĩ tr&aacute;ch nhiệm nơi m&igrave;nh l&agrave; c&oacute; thể&nbsp;tạo&nbsp;kết nối giữa doanh nghiệp v&agrave; mọi người. N&oacute; dễ d&agrave;ng hơn khi bạn c&oacute; một fanpage tr&ecirc;n Facebook, x&acirc;y dựng tập kh&aacute;ch h&agrave;ng để thực sự l&agrave;m kinh doanh, đ&oacute; l&agrave; tr&aacute;ch nhiệm ch&uacute;ng t&ocirc;i phải l&agrave;m</p>

<p><img alt="Giám đốc thiết kế sản phẩm Facebook: Website có thể là ngành kinh doanh đang dần chết" src="http://www.techsignin.com/wp-content/uploads/2016/06/techsignin-facebook-thiet-ke-website-dang-dan-chet-4.jpg" style="height:auto; margin:0px auto 20px; width:1200px" /></p>

<p><em>&Ocirc;ng nghĩ sao về xu hướng những trang web xấu x&iacute;? Liệu sự xấu x&iacute; c&oacute; phải l&agrave; c&aacute;ch để l&agrave;m loạn với c&aacute;i mới, sự sắp xếp của Internet?</em></p>

<p>C&oacute; một sự hợp l&yacute; trong thẩm mỹ chung &ndash; đ&oacute; l&agrave; c&aacute;c trang web tr&ocirc;ng c&oacute; vẻ rất giống nhau. T&ocirc;i thực sự nghĩ rằng đ&oacute; c&oacute; thể l&agrave; điều tốt cho mọi người, bởi sự giống nhau tạo sự dễ d&agrave;ng để di chuyển từ site n&agrave;y sang site kh&aacute;c để c&oacute; được thứ bạn cần. Bạn kh&ocirc;ng cần phải t&igrave;m hiểu lại khi chuyển sang một trang web kh&aacute;c.</p>

<p>Điều xấu x&iacute; l&agrave; thế hệ trẻ hiện nay đang tạo ra c&aacute;c trang web&nbsp;ho&agrave;i cổ như kiểu&nbsp;ph&iacute;a t&acirc;y hoang d&atilde;, với thẩm mỹ đ&atilde; lỗi thời m&agrave; đến cả họ cũng chưa bao giờ trải&nbsp;nghiệm qua.</p>

<p><strong><em>Trong c&aacute;c nền tảng như Facebook, Twitter đang thay đổi định hướng th&igrave; ch&uacute;ng vẫn tr&ocirc;ng kh&aacute; đơn giản, c&ograve;n website lại tr&ocirc;ng rối rắm hơn. Tại sao lại thế?</em></strong></p>

<p>Hầu hềt trang web đều bắt nguồn từ ph&ograve;ng marketing v&agrave; brand, nơi hay cho rằng sự kh&aacute;c biệt l&agrave; rất gi&aacute; trị. Khi bạn n&oacute;i về sản phẩm, về cơ bản ch&uacute;ng ta d&ugrave;ng n&oacute; để ho&agrave;n th&agrave;nh những điều trong cuộc sống th&igrave; ch&uacute;ng c&oacute; t&iacute;nh vụ lợi hơn.</p>

<p>Bạn c&oacute; thể nghĩ v&agrave; thiết kế n&oacute; hơi kh&aacute;c một ch&uacute;t, song điều quan trọng nhất m&agrave; tất cả nh&agrave; thiết kế cần l&agrave; đưa ra mẫu thiết kế giải quyết được vấn đề cho mọi người. Bạn c&oacute; thể l&agrave;m với gu thẩm mỹ kh&aacute;c nhau, nhưng nếu kh&ocirc;ng giải quyết được vấn đề, đặc biệt l&agrave; với thiết kế số th&igrave; đ&oacute; chỉ l&agrave; bạn đ&atilde; tạo ra t&aacute;c phẩm nghệ thuật.</p>

<p>C&oacute; một khoản kh&ocirc;ng gian trong thế giới nghệ thuật, nhưng n&oacute; kh&aacute;c biệt với việc cố x&acirc;y dựng sản phẩm c&oacute; sự mở rộng. Điều t&ocirc;i lo lắng l&agrave; nhiều bạn b&egrave; l&agrave;m c&ocirc;ng việc thiết kế của m&igrave;nh đang cố tập trung v&agrave;o x&acirc;y dựng c&aacute;c trang web v&agrave; t&ocirc;i kh&ocirc;ng chắc điều đ&oacute; sẽ l&agrave;m tăng trưởng cho doanh nghiệp nữa.</p>

<p><strong><em>Vậy &ocirc;ng c&oacute; lời khuy&ecirc;n n&agrave;o cho những nh&agrave; thiết kế?</em></strong></p>

<p>Nếu bạn thấy những người đang l&agrave;m c&aacute;c c&ocirc;ng việc th&uacute; vị, họ c&oacute; xu hướng x&acirc;y dựng b&ecirc;n trong nền tảng như Facebook, v&agrave; t&igrave;m những c&aacute;ch th&uacute; vị b&ecirc;n trong đ&oacute;. V&iacute; dụ như với ph&oacute;ng vi&ecirc;n th&igrave; Instant Article l&agrave; một c&aacute;ch tốt để c&acirc;u chuyện&nbsp;được&nbsp;truyền tải đến mọi người. C&oacute; nhiều điều th&uacute; vị đang được thực hiện&nbsp;nhờ&nbsp;video trực tiếp, c&aacute;ch thức để mọi người đưa c&acirc;u chuyện thực tế đến với mọi người.</p>

<p>T&ocirc;i nghĩ c&oacute; sự s&aacute;ng tạo lớn c&oacute; thể mở ra từ những t&iacute;nh năng đ&oacute;, n&oacute; chỉ l&agrave; một h&igrave;nh thức kh&aacute;c của sự s&aacute;ng tạo, hơn&nbsp;việc&nbsp;đặt một điểm ảnh tr&ecirc;n m&agrave;n h&igrave;nh v&agrave; lựa chọn ph&ocirc;ng chữ ho&agrave;n hảo nhất.</p>

<p>T&ocirc;i thấy rất giống việc khi ch&uacute;ng ta n&oacute;i với nh&agrave; thiết kế in ấn rằng họ cần l&agrave;m việc n&agrave;y tr&ecirc;n web để tạo ra website. Khi đ&oacute; kỹ năng v&agrave; kỷ thuật của họ sẽ phải thay đổi, v&agrave; sẽ c&oacute; rất nhiều sự phản đối.</p>

<p><em><strong>Vậy liệu website sẽ trở th&agrave;nh cửa h&agrave;ng?&nbsp;</strong></em></p>

<p>Một trong những điều về website, n&oacute; l&agrave; một hệ thống lớn v&agrave; sẽ mất một thời gian v&agrave; năng lượng để c&oacute; thể được nh&igrave;n nhận đ&uacute;ng v&agrave; chuyển dịch, nhưng khi bạn nh&igrave;n v&agrave;o dữ liệu, bạn chắc chắn c&oacute; thể thấy việc di chuyển đến điện thoại di động sẽ vẫn tiếp tục .</p>

<p>Nhưng những điều n&agrave;y sẽ kh&ocirc;ng bao giờ mất. Cũng như việc người ta vẫn ghi &acirc;m bằng đĩa &nbsp;vinyl vậy.</p>
',N'Website có thể là ngành kinh doanh đang dần chết',N'Sau ưu thế của địa chỉ web (URLs), chúng ta đang tiến vào kỷ nguyên của nền tảng (Platform) nơi những thiết kế đa dạng đang trở nên không cần thiết,',N'publish',N'website-co-the-la-nganh-kinh-doanh-dang-dan-chet',{ts '2016-08-02 16:12:00.000'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
106,NULL,{ts '2016-08-02 16:13:13.620'},N'Image upload',N'techsignin-facebook-thiet-ke-website-dang-dan-chet-2',NULL,N'inherit',N'cf759a72-3053-44c4-bf06-2047fcc52055techsignin-facebook-thiet-ke-website-dang-dan-chet-2',{ts '2016-08-02 16:13:13.620'},0,N'cf759a72-3053-44c4-bf06-2047fcc52055techsignin-facebook-thiet-ke-website-dang-dan-chet-2.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
107,1,{ts '2016-08-03 10:56:45.267'},N'<p>Kẻ phản diện tr&ecirc;n m&agrave;n bạc bước tới trước c&aacute;nh cửa c&oacute; hệ thống bảo mật y&ecirc;u cầu phải qu&eacute;t mắt để mở. Hắn ta từ từ l&ocirc;i từ trong t&uacute;i ra một con mắt lấy của nạn nh&acirc;n v&agrave; đưa v&agrave;o hệ thống qu&eacute;t - &ldquo;Access Granted&rdquo; v&agrave; hắn ngang nhi&ecirc;n bước qua c&aacute;nh cửa đ&oacute;.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/maxresdefault-1470238775140/samsunggalaxynote7baomatbangmongmatvaycothemonobangmatnguoidachetkhong.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Điều đ&oacute; chỉ c&oacute; ở tr&ecirc;n phim th&ocirc;i ư? Kh&ocirc;ng bạn ạ, điều đ&oacute; l&agrave; c&oacute; thật v&agrave; với t&igrave;nh h&igrave;nh Samsung Galaxy Note7 ra mắt hệ thống qu&eacute;t mống mắt để mở kh&oacute;a, ta sẽ kh&ocirc;ng thiếu những t&igrave;nh huống dở kh&oacute;c dở cười khi vạch mắt g&atilde; người y&ecirc;u đang ngủ ra để mở kh&oacute;a điện thoại đọc tin nhắn.</p>

<p>Trước hết bạn phải hiểu qu&eacute;t mống mắt l&agrave; g&igrave;.</p>

<p>H&atilde;y nhớ, v&otilde;ng mạc v&agrave; mống mắt l&agrave; hai kh&aacute;i niệm kh&aacute;c nhau ho&agrave;n to&agrave;n.</p>

<p><strong>V&otilde;ng mạc</strong>&nbsp;l&agrave; một m&ocirc; mỏng gồm c&aacute;c tế b&agrave;o thần kinh nằm tại phần ph&iacute;a sau của mắt. Ch&uacute;ng c&oacute; một cấu tr&uacute;c phức tạp gồm c&aacute;c mao dẫn m&aacute;u l&ecirc;n v&otilde;ng mạc, ch&iacute;nh ch&uacute;ng l&agrave; l&yacute; do khiến cho v&otilde;ng mạc của mỗi c&aacute; nh&acirc;n l&agrave; duy nhất. Mạng lưới ấy phức tạp đến mức một cặp song sinh cũng kh&ocirc;ng c&oacute; cấu tr&uacute;c v&otilde;ng mạc giống nhau. V&otilde;ng mạc của một người sẽ giữ nguy&ecirc;n từ l&uacute;c sinh ra cho đến l&uacute;c chết, nhưng ch&uacute;ng c&oacute; thể bị thay đổi do mắc c&aacute;c bệnh như tiểu đường, tăng nh&atilde;n &aacute;p &hellip;</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/retina-300x300-1470238802397/samsunggalaxynote7baomatbangmongmatvaycothemonobangmatnguoidachetkhong.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>C&ograve;n&nbsp;<strong>mống mắt</strong>, đ&oacute; l&agrave; một cấu tr&uacute;c mỏng, tr&ograve;n nằm ph&iacute;a trước của mắt, đảm nhiệm việc điều khiển k&iacute;ch cỡ của con ngươi, điều tiết lượng &aacute;nh s&aacute;ng đi v&agrave;o trong v&otilde;ng mạc. Cụm từ &ldquo;m&agrave;u mắt&rdquo; ch&iacute;nh l&agrave; chỉ m&agrave;u của mống mắt. C&ocirc;ng nghệ nhận diện mống mắt được sử dụng thường xuy&ecirc;n trong x&aacute;c định sinh trắc bởi một c&ocirc;ng nghệ to&aacute;n học nhận định khu&ocirc;n mẫu mống mắt mỗi c&aacute; nh&acirc;n, bởi lẽ mống mắt c&oacute; cho m&igrave;nh những dấu hiệu nhận biết ngẫu nhi&ecirc;n v&agrave; phức tạp, hơn nữa c&oacute; thể x&aacute;c định được từ một khoảng c&aacute;ch xa.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/iris-2-300x285-1470238802396/samsunggalaxynote7baomatbangmongmatvaycothemonobangmatnguoidachetkhong.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Với kh&aacute;i niệm về v&otilde;ng mạc v&agrave; mống mắt, ta đ&atilde; c&oacute; thể hiểu tại sao người ta sử dụng c&ocirc;ng nghệ bảo mật bằng c&aacute;ch qu&eacute;t mống mắt thay v&igrave; qu&eacute;t v&otilde;ng mạc:</p>

<p>- Độ ch&iacute;nh x&aacute;c của qu&eacute;t v&otilde;ng mạc c&oacute; thể bị ảnh hưởng bởi bệnh tật, nhưng khu&ocirc;n h&igrave;nh của mống mắt th&igrave; sẽ kh&ocirc;ng bị ảnh hưởng.</p>

<p>- Việc qu&eacute;t mống mắt đơn giản như việc chụp một tấm ảnh vậy, qu&eacute;t v&otilde;ng mạc cần nhiều hơn những c&ocirc;ng cụ nh&igrave;n xuy&ecirc;n thấu được cấu tr&uacute;c mắt.</p>

<p>- Việc qu&eacute;t mống mắt bị cho l&agrave; h&agrave;nh vi x&acirc;m phạm đến th&acirc;n thể con người.</p>

<p>Đ&atilde; trang bị th&ecirc;m cho m&igrave;nh những kiến thức về hai kĩ năng qu&eacute;t mắt, nhưng c&acirc;u hỏi về việc ta c&oacute; thể sử dụng con mắt của một người đ&atilde; chết để mở hệ thống bảo mật vẫn c&ograve;n đ&oacute;.</p>

<p>Nh&agrave; nghi&ecirc;n cứu sinh trắc học Adam Czajka đ&atilde; tiến h&agrave;nh những thử nghiệm để ngăn chặn việc &ldquo;<em>sử dụng con mắt của một người đ&atilde; chết để qua mặt hệ thống an ninh</em>&rdquo;. V&agrave; khi m&agrave; người ta đang nghi&ecirc;n cứu t&igrave;m ra c&aacute;ch ngăn chặn việc n&agrave;y xảy ra, th&igrave; hẳn việc đ&oacute; l&agrave; ho&agrave;n to&agrave;n khả thi.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/avengers1-266x300-1470239305111/samsunggalaxynote7baomatbangmongmatvaycothemonobangmatnguoidachetkhong.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Hiện tại, anh Czajka đang tiến h&agrave;nh nghi&ecirc;n cứu để ph&aacute;t hiện ra &ldquo;sức sống&rdquo; của một tr&ograve;ng mắt tại Đại học Notre Dame, Đại học C&ocirc;ng nghệ Warsaw đang cố gắng t&igrave;m ra một c&ocirc;ng nghệ qu&eacute;t mống mắt bảo đảm hơn để m&aacute;y qu&eacute;t kh&ocirc;ng c&ograve;n bị đ&aacute;nh lừa nữa.</p>

<p>Với việc thử nghiệm bằng mắt người chết, anh đ&atilde; l&agrave;m phiền l&ograve;ng nhiều người vốn tin rằng con mắt đ&atilde; chết th&igrave; kh&ocirc;ng thể sử dụng được trong việc x&aacute;c minh mống mắt. C&aacute;c nghi&ecirc;n cứu của anh Czajka cho thấy rằng nhiều giờ sau khi chết, mống mắt vẫn ho&agrave;n to&agrave;n sử dụng được để vượt qua hệ thống an ninh.</p>

<p>Một hệ thống qu&eacute;t mống mắt th&ocirc;ng thường sẽ sử dụng &aacute;nh s&aacute;ng nh&igrave;n thấy được v&agrave; &aacute;nh s&aacute;ng gần-hồng ngoại để soi v&agrave;o h&agrave;ng trăm điểm kh&aacute;c nhau trong mỗi mống mắt của con người, rồi dựa v&agrave;o những kết quả c&oacute; được để x&aacute;c định danh t&iacute;nh, nhằm khớp với mẫu mắt đ&atilde; được đăng k&yacute; trước đ&oacute;.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/mjc5mdm4nw-1470239297526/samsunggalaxynote7baomatbangmongmatvaycothemonobangmatnguoidachetkhong.jpeg" style="margin:0px" />
<p>&nbsp;</p>

<p>C&ocirc;ng nghệ n&agrave;y được sử dụng rộng r&atilde;i v&igrave; những lợi thế m&agrave; ch&uacute;ng mang lại, khiến ch&uacute;ng hơn hẳn việc so s&aacute;nh v&acirc;n tay: qu&eacute;t mống mắt được thực hiện nhanh ch&oacute;ng, kh&ocirc;ng cần người phải thử động chạm tới bất k&igrave; thứ g&igrave;. Hơn nữa, mắt l&agrave; một bộ phận thường xuy&ecirc;n được bảo vệ cẩn thận, c&ograve;n v&acirc;n tay c&oacute; thể bị hỏng do nhiều l&yacute; do kh&aacute;c nhau.</p>

<p>Qu&eacute;t được h&igrave;nh ảnh của mắt l&agrave; một chuyện, nhưng để nhận diện ra rằng con mắt ấy c&oacute; đang &ldquo;c&ograve;n sống&rdquo; kh&ocirc;ng mới thực sự l&agrave; vấn đề. Để th&uacute;c đẩy những cải tiến trong lĩnh vực n&agrave;y, anh Czajka đ&atilde; gi&uacute;p đỡ trong việc tổ chức một cuộc thi về x&aacute;c định &ldquo;sự sống&rdquo; trong một mống mắt, cuộc thi được diễn ra tại Hội nghị Sinh trắc học Quốc tế vừa diễn ra v&agrave;o th&aacute;ng 6 vừa rồi.</p>

<p>Thử th&aacute;ch rất đơn giản v&agrave; cũng rất cơ bản: ph&acirc;n biệt một mống mắt thật với một mống mắt được in ra tr&ecirc;n giấy hay được in tr&ecirc;n một k&iacute;nh mắt &aacute;p tr&ograve;ng. &ldquo;<em>Chỉ cần một mẫu mống mắt được in ra cũng đủ để đ&aacute;nh lừa h&agrave;ng t&aacute; thiết bị đại tr&agrave; thường thấy ch&uacute;ng t&ocirc;i c&oacute; trong ph&ograve;ng th&iacute; nghiệm rồi</em>&rdquo;, anh Czajka trả lời phỏng vấn.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/article-1385959-0c01309f00000578-870-468x203-1470239388761/samsunggalaxynote7baomatbangmongmatvaycothemonobangmatnguoidachetkhong.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Để nhận diện được bản in so với bản thật, những phương ph&aacute;p thường thấy l&agrave; t&igrave;m ra những sự phản chiếu của những khu vực ẩm của mắt, sử dụng c&ocirc;ng nghệ d&ograve; nhiệt để x&aacute;c định mắt n&agrave;o c&oacute; độ ấm hay t&igrave;m ra những điểm ma trận cực nhỏ chỉ c&oacute; tr&ecirc;n một sản phẩm được in ra bằng m&aacute;y.</p>

<p>Kết quả của cuộc thi vẫn chưa được c&ocirc;ng bố, nhưng anh Czajka n&oacute;i rằng đ&atilde; c&oacute; một sự tiến bộ r&otilde; rệt so với cuộc thi năm 2013, khi đ&oacute; thuật to&aacute;n đ&atilde; loại bỏ tới 29% số lượng mắt thật v&agrave; để lọt 6% bản in mống mắt. &ldquo;<em>T&ocirc;i cảm thấy thật vui sướng v&igrave; lĩnh vực n&agrave;y đang dần ph&aacute;t triển hơn</em>&rdquo;, anh Czajka lạc quan n&oacute;i.</p>

<p>Với việc nhiều người tin rằng một con mắt người chết sẽ ho&agrave;n to&agrave;n kh&ocirc;ng sử dụng được trong việc vượt qua hệ thống an ninh, anh Czajka đ&atilde; tiến h&agrave;nh thử nghiệm với một đồng nghiệp tại trường y thuộc Đại học Warsaw, Piotr Maciejewicz, người đ&atilde; gi&uacute;p đỡ anh trong việc chụp ảnh mắt người chết. Tổng cộng 3 bộ ảnh được chụp để thử nghiệm: mắt 5 tiếng sau khi chết, tiếp theo l&agrave; 16 v&agrave; 27 tiếng. Tất cả được mang ra thử xem ch&uacute;ng c&ograve;n khớp với th&ocirc;ng số đ&atilde; được đưa v&agrave;o trước đ&oacute;.</p>

<p>&nbsp;</p>
<img alt="Các mẫu mắt người đã chết được mang ra thử nghiêm và kết quả là chúng hoàn toàn có thể sử dụng để quét được." src="http://genknews.genkcdn.vn/k:2016/mjc5mdm4ng-1470239337151/samsunggalaxynote7baomatbangmongmatvaycothemonobangmatnguoidachetkhong.jpeg" style="margin:0px" /><br />
C&aacute;c mẫu mắt người đ&atilde; chết được mang ra thử nghi&ecirc;m v&agrave; kết quả l&agrave; ch&uacute;ng ho&agrave;n to&agrave;n c&oacute; thể sử dụng để qu&eacute;t được.
<p>&nbsp;</p>

<p>V&agrave; kết quả thật đ&aacute;ng ngạc nhi&ecirc;n: to&agrave;n bộ ảnh của 5 giờ sau khi chết được hệ thống qu&eacute;t chấp nhận dễ d&agrave;ng, v&agrave; nhiều trường hợp ảnh của 27 giờ sau khi chết cũng vẫn sử dụng được.&nbsp;<em>&ldquo;Ch&uacute;ng t&ocirc;i chắc chắn rằng mống mắt vẫn c&oacute; thể được sử dụng l&agrave;m c&ocirc;ng cụ x&aacute;c định sinh trắc (n&oacute;i c&aacute;ch kh&aacute;c l&agrave; vượt qua hệ thống an ninh) v&agrave;i ng&agrave;y sau khi chủ nh&acirc;n đ&ocirc;i mắt đ&oacute; qua đời</em>&rdquo;, anh Czajka n&oacute;i. &ldquo;<em>Đ&oacute; l&agrave; l&yacute; do tại sao việc x&aacute;c định được &lsquo;sự sống&rsquo; của một mống mắt l&agrave; cực k&igrave; quan trọng</em>&rdquo;.</p>

<p>Bạn nghe thấy v&agrave; cũng nh&igrave;n v&agrave; đọc r&otilde; rồi đ&oacute;. Trước khi giải quyết được vấn đề n&agrave;y, bạn h&atilde;y cố gắng giữ con mắt (v&agrave; cả t&iacute;nh mạng m&igrave;nh) cẩn thận.</p>
',N'Samsung Galaxy Note7 bảo mật bằng mống mắt',N'Liệu ta có phải lo lắng "mất" gì khác ngoài khả năng bị "mượn đỡ một ngón tay" khi sử dụng bảo mật vân tay?
',N'publish',N'samsung-galaxy-note7-bao-mat-bang-mong-mat',{ts '2016-08-03 10:56:00.000'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
108,NULL,{ts '2016-08-03 11:17:53.053'},N'Image upload',N'phpzvtqv4',N'image',N'inherit',N'4d816333-20ff-400c-bb73-5ab5d9d9434aphpzvtqv4',{ts '2016-08-03 11:17:53.053'},0,N'4d816333-20ff-400c-bb73-5ab5d9d9434aphpzvtqv4.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
109,1,{ts '2016-08-03 21:27:35.443'},N'<p><strong>1. Đồng bộ với PC</strong></p>

<p>H&atilde;y c&agrave;i đặt Google Drive cho Mac hoặc PC tại&nbsp;<a href="https://www.google.com/drive/download/" target="_blank">đ&acirc;y&nbsp;</a>để truy cập c&aacute;c t&agrave;i liệu từ m&aacute;y t&iacute;nh của bạn (bạn cũng c&oacute; thể chọn ri&ecirc;ng c&aacute;c file muốn đồng bộ). Với Google Drive tr&ecirc;n PC, bạn c&oacute; thể truy cập t&agrave;i liệu khi kh&ocirc;ng c&oacute; mạng hay th&ecirc;m t&agrave;i liệu soạn thảo khi offline; Drive sẽ tự động đồng bộ ngay l&ecirc;n cloud khi c&oacute; mạng trở lại.</p>

<p><strong>2. Bật t&iacute;nh năng offline của Drive</strong></p>

<p>Google Drive c&oacute; thể hoạt động khi offline với điều kiện bạn đ&atilde; k&iacute;ch hoạt t&iacute;nh năng n&agrave;y. H&atilde;y v&agrave;o Setting ở n&uacute;t b&aacute;nh răng g&oacute;c phải m&agrave;n h&igrave;nh, ở tab General t&iacute;ch v&agrave;o phần Sync&hellip;offline (Đồng bộ h&oacute;a c&aacute;c tệp...) l&agrave; xong. Google sau đ&oacute; sẽ tải hết c&aacute;c file Doc, Sheet v&agrave; Drawing về m&aacute;y t&iacute;nh của bạn (nếu đ&atilde; c&agrave;i sẵn Google Drive cho Mac/PC ở tr&ecirc;n). Bạn kh&ocirc;ng thể xem video hay ảnh khi offline nhưng c&oacute; thể xem, chỉnh sửa v&agrave; tạo file theo format Google Drive như Sheet, Doc,... th&ocirc;ng thường.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/hd2-1470124715504/9thuthuatbienbanthanhcaothugoogledrive.png" style="height:345px; margin:0px; width:600px" />
<p>&nbsp;</p>

<p><strong>3. T&igrave;m từ trong file PDF v&agrave; ảnh</strong></p>

<p>Bạn c&oacute; biết rằng Google Drive cũng c&oacute; khả năng scan v&agrave; t&igrave;m chữ trong file PDF v&agrave; thậm ch&iacute; cả file ảnh? Chỉ cần up thử một bức ảnh một đoạn chữ r&otilde; r&agrave;ng chụp từ file PDF rồi search thử, bạn sẽ thấy bất ngờ bởi khả năng scan chữ tr&ecirc;n ảnh của Google Drive. Bạn thậm ch&iacute; c&oacute; thể mở v&agrave; chỉnh sửa (sau khi convert từ ảnh/PDF sang dạng text) c&aacute;c file n&agrave;y bằng c&aacute;ch click chuột phải v&agrave;o file ảnh hoặc PDF, chọn Open with (Mở bằng) &gt; Google Docs (Google T&agrave;i liệu) như dưới đ&acirc;y. Xem th&ecirc;m chi tiết hướng dẫn từ Google ở&nbsp;<a href="https://support.google.com/drive/answer/176692" target="_blank">đ&acirc;y</a>.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/hd-1470124187469/9thuthuatbienbanthanhcaothugoogledrive.png" style="height:261px; margin:0px; width:600px" />
<p>&nbsp;</p>

<p>Tuy kết quả t&igrave;m kiếm c&ograve;n phụ thuộc một ch&uacute;t v&agrave;o độ r&otilde; của bức ảnh chụp hay file PDF nhưng chắc chắn đ&acirc;y l&agrave; một lựa chọn rất hữu &iacute;ch cho những ai lưu trữ nhiều file t&agrave;i liệu l&agrave; ảnh chụp hay PDF v&agrave; muốn chuyển ch&uacute;ng th&agrave;nh dạng text một c&aacute;ch nhanh ch&oacute;ng.</p>

<p><strong>4. T&igrave;m file dễ d&agrave;ng hơn</strong></p>

<p>Đ&uacute;ng với kỳ vọng từ một g&atilde; khổng lồ t&igrave;m kiếm, Drive được trang bị c&aacute;c t&iacute;nh năng search tiện &iacute;ch như click v&agrave;o thanh search để t&igrave;m theo định dạng file, ng&agrave;y th&aacute;ng hay người đ&atilde; share cho bạn.</p>

<p>G&otilde;&nbsp;<em>&ldquo;owner:người-gửi@gmail.com&rdquo;</em>&nbsp;để t&igrave;m tất cả c&aacute;c file được share bởi ai đ&oacute;;&nbsp;<em>&ldquo;before:năm-th&aacute;ng-ng&agrave;y&rdquo;</em>&nbsp;hay&nbsp;<em>&ldquo;after:năm-th&aacute;ng-ng&agrave;y&rdquo;&nbsp;</em>(năm để theo dạng &ldquo;2016&rdquo;) để giới hạn t&igrave;m kiếm của bạn trước hay sau ng&agrave;y n&agrave;o đ&oacute;. H&atilde;y th&ecirc;m&nbsp;<em>&ldquo;title:cụm-từ&rdquo;</em>&nbsp;để search theo t&ecirc;n file v&agrave; loại ra c&aacute;c kết quả chứa cụm từ đ&oacute; trong c&aacute;c phần kh&aacute;c của file.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/hd3-1470124824786/9thuthuatbienbanthanhcaothugoogledrive.png" style="height:403px; margin:0px; width:600px" />
<p>&nbsp;</p>

<p><strong>5. Scan ảnh trong nh&aacute;y mắt</strong></p>

<p>Nếu bạn đ&atilde; c&agrave;i app&nbsp;<a href="https://play.google.com/store/apps/details?id=com.google.android.apps.docs" target="_blank">Google Drive tr&ecirc;n Android</a>&nbsp;th&igrave; bạn c&oacute; thể sử dụng điện thoại như một chiếc m&aacute;y scan (t&iacute;nh năng n&agrave;y chưa c&oacute; tr&ecirc;n iOS). Từ m&agrave;n h&igrave;nh ch&iacute;nh ứng dụng, h&atilde;y chọn n&uacute;t khởi tạo file (icon dấu cộng đỏ ở g&oacute;c dưới b&ecirc;n phải) &gt; Scan (Qu&eacute;t) như dưới đ&acirc;y:</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/hd4-1470125509914/9thuthuatbienbanthanhcaothugoogledrive.png" style="height:1067px; margin:0px; width:600px" />
<p>&nbsp;</p>

<p><strong>6. T&igrave;m lại c&aacute;c phi&ecirc;n bản cũ của file</strong></p>

<p>Drive lu&ocirc;n lưu lại phi&ecirc;n bản cũ của c&aacute;c file bạn đ&atilde; chỉnh sửa để đề ph&ograve;ng khi bạn muốn lấy lại (đặc biệt hữu &iacute;ch nếu bạn chia sẻ chung file với nhiều người). H&atilde;y mở file cần d&ograve; lại, chọn Manage versions (Quản l&yacute; phi&ecirc;n bản). Một hộp thoại liệt k&ecirc; chi tiết c&aacute;c phi&ecirc;n bản c&ugrave;ng ng&agrave;y th&aacute;ng chỉnh sửa sẽ cho ph&eacute;p bạn x&oacute;a hoặc tải về c&aacute;c phi&ecirc;n bản n&agrave;y rồi giữ c&aacute;c phi&ecirc;n bản cũ theo mặc định 30 ng&agrave;y.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/hd5-1470125816974/9thuthuatbienbanthanhcaothugoogledrive.png" style="margin:0px" />
<p>&nbsp;</p>

<p><strong>7. Soạn thảo văn bản bằng giọng n&oacute;i</strong></p>

<p>Tuy g&otilde; chữ vẫn l&agrave; c&aacute;ch soạn văn bản phổ biến nhất hiện nay nhưng bạn cũng c&oacute; thể sử dụng giọng n&oacute;i để soạn thảo nhanh hơn. Khi v&agrave;o một file n&agrave;o đ&oacute;, h&atilde;y chọn Tools (C&ocirc;ng cụ) &gt; Voice typing (Nhập bằng giọng n&oacute;i) rồi click v&agrave;o biểu tượng microphone.</p>

<p>Với c&aacute;c từ được hệ thống &ldquo;nghe&rdquo; được v&agrave; viết ra chưa ch&iacute;nh x&aacute;c, bạn h&atilde;y bấm chuột phải v&agrave;o từ để xem c&aacute;c lựa chọn thay thế (từ tương đương). Tuy vậy, bạn cũng kh&ocirc;ng cần lo phải chỉnh sửa nhiều bởi Google c&oacute; khả năng nghe tiếng Việt (v&agrave; nhiều thứ tiếng kh&aacute;c) rất ch&iacute;nh x&aacute;c, nhất l&agrave; nếu bạn ph&aacute;t &acirc;m to, r&otilde; r&agrave;ng th&igrave; Voice typing sẽ nghe được hết.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/hd6-1470126095655/9thuthuatbienbanthanhcaothugoogledrive.png" style="height:233px; margin:0px; width:600px" />
<p>&nbsp;</p>

<p>Chỉnh sửa từ nghe được bằng gợi &yacute; ch&iacute;nh x&aacute;c:</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/hd7-1470126400103/9thuthuatbienbanthanhcaothugoogledrive.png" style="margin:0px" />
<p>&nbsp;</p>

<p><strong>8. T&igrave;m những file ngốn dung lượng nhất trong Drive</strong></p>

<p>Nếu Drive của bạn đang tiến gần đến mức giới hạn cho ph&eacute;p m&agrave; bạn chưa muốn n&acirc;ng cấp l&ecirc;n ngay th&igrave; h&atilde;y t&igrave;m những file lớn kh&ocirc;ng cần thiết để x&oacute;a bớt đi. Bạn chỉ cần v&agrave;o Drive tr&ecirc;n web, r&ecirc; chuột ở vị tr&iacute; b&aacute;o dung lượng rồi bấm n&uacute;t xanh nhỏ cạnh chữ Drive như dưới đ&acirc;y hoặc v&agrave;o thẳng<a href="https://drive.google.com/drive/u/0/quota" target="_blank">link n&agrave;y&nbsp;</a>để xem danh s&aacute;ch c&aacute;c file ngốn dung lượng nhất xếp theo thứ tự giảm dần. Bấm lại v&agrave;o n&uacute;t Quota used (Hạn ngạch dung lượng đ&atilde; sử dụng) để xem c&aacute;c file nhỏ nhất.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/hd9-1470126753789/9thuthuatbienbanthanhcaothugoogledrive.png" style="height:343px; margin:0px; width:600px" />
<p>&nbsp;</p>

<p><strong>9. Ch&egrave;n link file trong Drive của bạn</strong></p>

<p>C&oacute; thể bạn đ&atilde; kh&aacute; quen với việc th&ecirc;m link dẫn đến c&aacute;c site kh&aacute;c v&agrave;o file doc của bạn, thế nhưng kh&ocirc;ng phải ai cũng biết t&iacute;nh năng th&ecirc;m link dẫn đến c&aacute;c file kh&aacute;c trong Drive của bạn &ndash; cực kỳ hữu dụng cho việc nghi&ecirc;n cứu một chủ đề qua nhiều t&agrave;i liệu kh&aacute;c nhau. H&atilde;y chọn Insert (Ch&egrave;n), paste link như b&igrave;nh thường hoặc g&otilde; 1-2 cụm từ để t&igrave;m kiếm c&aacute;c t&agrave;i liệu li&ecirc;n quan trong Google Drive của bạn. Bạn cũng c&oacute; thể copy link của bất cứ file Drive n&agrave;o rồi paste n&oacute; v&agrave;o phần dẫn link.</p>
',N'9 thủ thuật biến bạn thành cao thủ Google Drive',N'Google Drive được tích hợp rất nhiều tính năng thú vị giúp tăng hiệu suất cho công việc của bạn. Dưới đây là 9 tính năng đặc biệt có thể bạn chưa biết đến để tận dụng tối đa công cụ làm việc tuyệt vời này.
',N'publish',N'9-thu-thuat-bien-ban-thanh-cao-thu-google-drive',{ts '2016-08-03 21:27:00.000'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
110,NULL,{ts '2016-08-03 21:29:49.887'},N'Image upload',N'HowItWorks_Google',N'image',N'inherit',N'eae88bd6-5de9-4e3b-bdb2-76e870237ebfhowitworksgoogle',{ts '2016-08-03 21:29:49.887'},0,N'eae88bd6-5de9-4e3b-bdb2-76e870237ebfhowitworksgoogle.png',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
111,1,{ts '2016-08-03 22:06:57.057'},N'<p>Lần đầu ti&ecirc;n trong lịch sử con người, Viện Nghi&ecirc;n cứu IBM tại Zurich vừa chế tạo th&agrave;nh c&ocirc;ng một neuron nh&acirc;n tạo, nhỏ ở mức nano v&agrave; c&oacute; thể chuyển đổi trạng th&aacute;i ngẫu nhi&ecirc;n. Lần đầu ti&ecirc;n nhưng kh&ocirc;ng chỉ một neuron được chế tạo th&agrave;nh c&ocirc;ng, IBM đ&atilde; c&oacute; được trong tay m&igrave;nh 500 neuron như vậy v&agrave; sắp tới, họ sẽ sử dụng ch&uacute;ng để chế tạo một bộ n&atilde;o nh&acirc;n tạo m&ocirc; phỏng lại bộ n&atilde;o con người.</p>

<p>&nbsp;</p>
<img alt="
Neuron nhân tạo của IBM.
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/artificial-neurons-illustration-980x691-1470220366039/landautientronglichsuibmchetaothanhcongneuronnhantaobuoctienvidaicualoainguoi.jpg" style="margin:0px" />
<p>Neuron nh&acirc;n tạo của IBM.</p>

<p>&nbsp;</p>

<p>Đột ph&aacute; n&agrave;y l&agrave; cực k&igrave; quan trọng bởi một neuron c&oacute; thể chuyển đổi trạng th&aacute;i n&agrave;y dựa v&agrave;o những vật liệu đ&atilde; được nghi&ecirc;n cứu kĩ c&agrave;ng, c&oacute; thể giảm ch&uacute;ng xuống mức nano, hơn nữa ch&uacute;ng c&oacute; thể truyền dẫn xung điện với vận tốc cao nhưng đ&ograve;i hỏi rất &iacute;t năng lượng. Ch&uacute;ng c&ograve;n c&oacute; khả năng ngẫu nhi&ecirc;n (ch&uacute;ng lu&ocirc;n tạo ra những kết quả kh&aacute;c biệt v&agrave; ngẫu nhi&ecirc;n, như c&aacute;c neuron sinh học vậy) v&agrave; điều n&agrave;y l&agrave; cực k&igrave; quan trọng.</p>

<p>Như đ&atilde; n&oacute;i, neuron nh&acirc;n tạo n&agrave;y cũng giống với neuron sinh học: ch&uacute;ng c&oacute; đầu v&agrave;o (sợi nh&aacute;nh - dendrite), m&agrave;ng neuron (m&agrave;ng lipid), th&acirc;n neuron (soma), nh&acirc;n (nucleus) v&agrave; đầu ra (sợi trục - axon).</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:2016/neuron-1470220735604-crop-1470220764086/landautientronglichsuibmchetaothanhcongneuronnhantaobuoctienvidaicualoainguoi.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Điểm kh&aacute;c biệt ch&iacute;nh nằm tại m&agrave;ng của neuron. Trong một neuron thực, đ&oacute; sẽ l&agrave; một m&agrave;ng lipid, đ&oacute;ng vai tr&ograve; của cả điện trở lẫn chất dẫn điện; ch&uacute;ng ngăn xung điện cho tới khi đủ điện năng để truyền đi, rồi sau đ&oacute; d&ograve;ng điện sẽ theo c&aacute;c đầu ra l&agrave; sợi trục tới những neuron kh&aacute;c, v&agrave; cứ thế tiếp diễn.</p>

<p>Với neuron nh&acirc;n tạo của IBM, m&agrave;ng được thay thế bằng một hợp chất của&nbsp;<a href="https://vi.wikipedia.org/wiki/Gecmani" target="_blank">gecmani</a>-<a href="https://vi.wikipedia.org/wiki/Antimon" target="_blank">antimon</a>-<a href="https://vi.wikipedia.org/wiki/Telua" target="_blank">telua</a>(viết tắt l&agrave; GST), bản th&acirc;n hợp chất n&agrave;y l&agrave; một vật liệu chuyển trạng th&aacute;i. Vậy n&ecirc;n n&oacute; c&oacute; thể tồn tại được cả ở hai trạng th&aacute;i (kết tinh v&agrave; kh&ocirc;ng kết tinh/v&ocirc; định h&igrave;nh) v&agrave; dễ d&agrave;ng chuyển đổi giữa hai trạng th&aacute;i đ&oacute;. Trạng th&aacute;i kết tinh sẽ khiến m&agrave;ng neuron nh&acirc;n tạo c&oacute; thể dẫn điện v&agrave; trạng th&aacute;i v&ocirc; định h&igrave;nh sẽ khiến m&agrave;ng trở n&ecirc;n c&aacute;ch điện.</p>

<p>Với neuron nh&acirc;n tạo của IBM, GST sẽ bắt đầu chu kỳ &ldquo;sống&rdquo; của n&oacute; với trạng th&aacute;i v&ocirc; định h&igrave;nh. Sẽ c&oacute; d&ograve;ng điện đi v&agrave;o qua c&aacute;c sợi nh&aacute;nh, GST sẽ dần dần kết tinh, đến một mức nhất định n&oacute; sẽ c&oacute; t&iacute;nh dẫn điện. V&agrave; cứ như vậy, d&ograve;ng điện chạy qua c&aacute;c m&agrave;ng. Sau một qu&atilde;ng nghỉ, GST sẽ &ldquo;reset&rdquo;, trở về trạng th&aacute;i v&ocirc; định h&igrave;nh c&aacute;ch điện ban đầu v&agrave; qu&aacute; tr&igrave;nh ấy sẽ lại xoay v&ograve;ng một lần nữa.</p>

<p>Neuron sinh học c&oacute; t&iacute;nh ngẫu nhi&ecirc;n (stochastic) v&agrave; IBM n&oacute;i rằng neuron nh&acirc;n tạo của họ cũng c&oacute; được những h&agrave;nh vi phản ứng ngẫu nhi&ecirc;n như một neuron thực thụ vậy: mỗi lần GST &ldquo;reset&rdquo;, trạng th&aacute;i v&ocirc; định h&igrave;nh của m&agrave;ng neuron nh&acirc;n tạo sẽ kh&aacute;c đi đ&ocirc;i ch&uacute;t v&agrave; bởi vậy, việc m&agrave;ng kết tinh cũng sẽ kh&aacute;c đi theo.</p>

<p>&nbsp;</p>
<img alt="
Một mẫu thử của con chip sẽ được sử dụng để gắn vào bảng mạch, mỗi một hình vuông nhỏ là một neuron nhân tạo.
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/28351591461-1984c54322-o-1470220366036/landautientronglichsuibmchetaothanhcongneuronnhantaobuoctienvidaicualoainguoi.jpg" style="margin:0px" />
<p>Một mẫu thử của con chip sẽ được sử dụng để gắn v&agrave;o bảng mạch, mỗi một h&igrave;nh vu&ocirc;ng nhỏ l&agrave; một neuron nh&acirc;n tạo.</p>

<p>&nbsp;</p>

<p><strong>Họ đ&atilde; tạo được ra neuron nh&acirc;n tạo rồi, giờ th&igrave; sao?</strong></p>

<p>C&oacute; hai điểm mấu chốt đ&aacute;ng n&oacute;i.</p>

<p>Thứ nhất, neuron nh&acirc;n tạo được tạo n&ecirc;n bởi những vật liệu được nghi&ecirc;n cứu v&agrave; thấu hiểu kĩ c&agrave;ng, c&oacute; tuổi thọ l&acirc;u đời (h&agrave;ng ngh&igrave;n tỉ lần chuyển giao giữa hai trạng th&aacute;i), c&oacute; thể l&agrave;m gọn lại th&agrave;nh ở mức nano.</p>

<p>Thứ hai, đ&acirc;y l&agrave; neuron chuyển đổi trạng th&aacute;i m&agrave; con người tạo được ra gần giống nhất với hoạt động của một neuron sinh học, điều n&agrave;y c&oacute; thể dẫn tới một hệ thống m&aacute;y t&iacute;nh khổng lồ c&oacute; thể tự ph&acirc;n t&iacute;ch th&ocirc;ng tin v&agrave; đưa ra quyết định, giống như c&aacute;ch m&agrave; con người suy nghĩ vậy.</p>

<p>V&agrave; rất c&oacute; thể l&agrave; thứ ba, con người đang gần hơn nhiều bước tới việc tạo ra được hệ thống Skynet, một tr&iacute; tuệ nh&acirc;n tạo đ&atilde; từng được coi l&agrave; l&aacute; chắn ho&agrave;n hảo của con người, cho tới khi ch&iacute;nh con người kh&ocirc;ng ho&agrave;n hảo lại l&agrave; lỗ thủng của hệ thống đ&oacute;.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/skynet-thumb-1470220960497/landautientronglichsuibmchetaothanhcongneuronnhantaobuoctienvidaicualoainguoi.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Cho tới giờ, IBM đ&atilde; tạo ra được một mạng lưới gồm 500 neuron nh&acirc;n tạo. Kh&ocirc;ng c&oacute; l&yacute; do g&igrave; để IBM dừng lại tại thời điểm n&agrave;y, chỉ với việc tạo ra neuron nh&acirc;n tạo như vậy. Họ đang tiến h&agrave;nh việc đưa h&agrave;ng ngh&igrave;n neuron nh&acirc;n tạo n&agrave;y v&agrave;o trong một con chip duy nhất. Vấn đề tồn tại b&acirc;y giờ l&agrave; viết ra một chương tr&igrave;nh, một phần mềm c&oacute; thể sử dụng được con chip neuron nh&acirc;n tạo ấy.</p>

<p>C&oacute; thể rằng, trong một v&agrave;i hay một v&agrave;i chục năm nữa, Ng&agrave;y Ph&aacute;n X&eacute;t kh&ocirc;ng phải l&agrave; sản phẩm giả tưởng m&agrave; thực sự, đ&oacute; l&agrave; điềm b&aacute;o trước cho thảm họa diệt vong của lo&agrave;i người.</p>

<p>Nhưng trước hết, vẫn ch&uacute;c mừng th&agrave;nh tựu của IBM trong việc tạo ra được những neuron nh&acirc;n tạo hoạt động được như neuron sinh học đ&atilde;!</p>
',N'Lần đầu tiên trong lịch sử IBM chế tạo thành công neuron nhân tạo',N'Đây là bước đột phá của loài người, nhưng liệu nó có đi kèm với thảm họa diệt vong khi mà một trí tuệ nhân tạo có bộ não như con người ra đời?
',N'publish',N'lan-dau-tien-trong-lich-su-ibm-che-tao-thanh-cong-neuron-nhan-tao',{ts '2016-08-03 22:06:00.000'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
112,NULL,{ts '2016-08-03 22:08:25.753'},N'Image upload',N'28351591461_1984c54322_o',N'image',N'inherit',N'82f2da83-38cc-4c97-a786-86bf4d00bf1c283515914611984c54322o',{ts '2016-08-03 22:08:25.753'},0,N'82f2da83-38cc-4c97-a786-86bf4d00bf1c283515914611984c54322o.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
116,1,{ts '2016-08-04 12:37:04.433'},N'Chi tiết li&ecirc;n hệ',N'Liên hệ',N'Liên hệ ở đây',N'publish',N'contact',{ts '2016-08-13 11:50:26.080'},0,NULL,NULL,N'page',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
119,NULL,{ts '2016-08-04 13:26:55.077'},N'fsdfsd',N'Liên hệ',N'Updated',NULL,N'contact-1',{ts '2016-08-04 13:26:55.077'},0,NULL,600,N'nav_menu_item',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
120,1,{ts '2016-08-12 21:20:47.577'},N'<p>Ph&aacute;t biểu tại buổi ra mắt, &Ocirc;ng Kim Cheolgi &ndash; Tổng Gi&aacute;m Đốc C&ocirc;ng ty Điện tử Samsung Vina &ndash; cho biết: &ldquo;Th&ocirc;ng qua việc thấu hiểu nhu cầu của người d&ugrave;ng, Samsung lu&ocirc;n trung th&agrave;nh với việc kế thừa v&agrave; ph&aacute;t triển c&ocirc;ng nghệ để mang đến giải ph&aacute;p trong việc n&acirc;ng cao cuộc sống th&ocirc;ng qua thiết bị di động. Ch&uacute;ng t&ocirc;i đi ti&ecirc;n phong trong thị trường phablet với chế t&aacute;c tinh xảo gồm m&agrave;n h&igrave;nh lớn hơn v&agrave; b&uacute;t S-pen, khởi đầu từ Galaxy Note. Samsung Galaxy Note7 gi&uacute;p Samsung giữ vị tr&iacute; ti&ecirc;n phong trong c&aacute;c sản phẩm phablet, qua việc đem lại nhiều hơn những g&igrave; người d&ugrave;ng c&oacute; thể l&agrave;m được tr&ecirc;n điện thoại, vượt xa suy nghĩ của họ. Đ&acirc;y l&agrave; một thiết bị tuyệt vời nhằm phục vụ cả nhu cầu l&agrave;m việc v&agrave; giải tr&iacute;. Ch&uacute;ng t&ocirc;i đấu tranh v&igrave; sự tiến bộ. Samsung Galaxy Note7 l&agrave; biểu tượng cốt l&otilde;i cho tinh thần ti&ecirc;n phong Samsung.&rdquo;</p>

<h2><strong>Galaxy Note7: chống nước, bảo mật mống mắt, b&uacute;t S Pen cải tiến</strong></h2>

<p><a href="http://www.techsignin.com/wp-content/uploads/2016/08/samsung-galaxy-note7-ra-mat-chinh-thuc-66.jpg"><img alt="Samsung Galaxy Note7 ra mắt chính thức: 19 triệu, chống nước, bảo mật mống mắt" src="http://www.techsignin.com/wp-content/uploads/2016/08/samsung-galaxy-note7-ra-mat-chinh-thuc-66.jpg" style="border-style:initial; border-width:0px; height:auto; margin:0px auto 20px; width:800px" /></a>Sau lần ra mắt c&aacute;ch đ&acirc;y hơn 1 tuần tại Mỹ, Samsung Vina cho biết lượng đặt h&agrave;ng trước của&nbsp;<strong>Galaxy Note7</strong>&nbsp;theo thống k&ecirc; sơ bộ t&iacute;nh đến thời điểm hiện nay tăng hơn 300% so với lượng đặt h&agrave;ng trước của Galaxy Note5 đ&atilde; từng tạo n&ecirc;n kỷ lục kinh doanh trước đ&acirc;y.</p>

<p>Galaxy Note7 cũng được ghi nhận l&agrave; sản phẩm đầu ti&ecirc;n hỗ trợ đến 2 lớp bảo mật l&agrave; v&acirc;n tay v&agrave; mới nhất l&agrave; mống mắt, qua đ&oacute; gi&uacute;p tăng cường sự tiện dụng, gi&uacute;p c&acirc;n bằng tốt giữa khả năng l&agrave;m việc v&agrave; giải tr&iacute;. Smartphone n&agrave;y được thiết kế kh&aacute;ng nước v&agrave; bụi cho cả th&acirc;n m&aacute;y lẫn b&uacute;t S Pen đạt chuẩn IP68 &ndash; chuẩn cao nhất hiện nay.</p>

<p>Camera tr&ecirc;n Galaxy Note7 sử dụng c&ocirc;ng nghệ cảm biến ảnh k&eacute;p Dual Pixel, khẩu độ lớn v&agrave; tự động lấy n&eacute;t nhanh, gi&uacute;p dễ d&agrave;ng tạo n&ecirc;n những bức ảnh sắc n&eacute;t v&agrave; đẹp ngay cả trong m&ocirc;i trường thiếu s&aacute;ng. B&uacute;t S Pen tr&ecirc;n Galaxy Note7 được n&acirc;ng cấp với cảm ứng nhạy chuẩn v&agrave; n&eacute;t mảnh hơn, gi&uacute;p bạn hiện thực h&oacute;a &yacute; tưởng v&agrave;o cuộc sống với c&aacute;c t&iacute;nh năng th&ocirc;ng minh như Ghi ch&uacute; nhanh tr&ecirc;n m&agrave;n h&igrave;nh kh&oacute;a &amp; M&agrave;n h&igrave;nh lu&ocirc;n hiển thị, Lựa chọn th&ocirc;ng minh cho ảnh động GIF, hiệu ứng k&egrave;m chức năng Air Command mới như Dịch thuật (Translate) v&agrave; Ph&oacute;ng to (Magnify)&hellip;</p>

<p><a href="http://www.techsignin.com/wp-content/uploads/2016/08/samsung-galaxy-note7-ra-mat-chinh-thuc-35.jpg"><img alt="Samsung Galaxy Note7 ra mắt chính thức: 19 triệu, chống nước, bảo mật mống mắt" src="http://www.techsignin.com/wp-content/uploads/2016/08/samsung-galaxy-note7-ra-mat-chinh-thuc-35.jpg" style="border-style:initial; border-width:0px; height:auto; margin:0px auto 20px; width:800px" /></a><a href="http://www.techsignin.com/wp-content/uploads/2016/08/samsung-galaxy-note7-ra-mat-chinh-thuc-41.jpg"><img alt="Samsung Galaxy Note7 ra mắt chính thức: 19 triệu, chống nước, bảo mật mống mắt" src="http://www.techsignin.com/wp-content/uploads/2016/08/samsung-galaxy-note7-ra-mat-chinh-thuc-41.jpg" style="border-style:initial; border-width:0px; height:auto; margin:0px auto 20px; width:800px" /></a></p>

<p>C&ugrave;ng với việc ra mắt Galaxy Note7 tại Việt Nam, Samsung tiếp tục khẳng định chiến lược Phone+ của m&igrave;nh khi giới thiệu phi&ecirc;n bản k&iacute;nh thực tế ảo Gear VR mới c&ugrave;ng camera Gear 360, v&ograve;ng tay thể thao th&ocirc;ng minh Gear Fit2 nhằm bổ sung hệ sinh th&aacute;i Galaxy ho&agrave;n thiện.</p>

<h3><strong>Samsung Gear VR mới: thấu k&iacute;nh lớn, m&agrave;u mới v&agrave; cổng USB Type-C</strong></h3>

<p><a href="http://www.techsignin.com/wp-content/uploads/2016/08/samsung-galaxy-note7-ra-mat-chinh-thuc-62.jpg"><img alt="Samsung Galaxy Note7 ra mắt chính thức: 19 triệu, chống nước, bảo mật mống mắt" src="http://www.techsignin.com/wp-content/uploads/2016/08/samsung-galaxy-note7-ra-mat-chinh-thuc-62.jpg" style="border-style:initial; border-width:0px; height:auto; margin:0px auto 20px; width:800px" /></a></p>

<p>K&iacute;nh thực tế ảo&nbsp;<strong>Gear VR</strong>&nbsp;phi&ecirc;n bản mới sở hữu khớp kết nối cổng USB Type-C v&agrave; Micro USB, tương th&iacute;ch với Galaxy S6, Galaxy S6 edge, Galaxy Note5, Galaxy S6 edge+, Galaxy S7, Galaxy S7 edge v&agrave; Galaxy Note7. Sản phẩm c&oacute; m&agrave;u xanh đen sang trọng bao phủ to&agrave;n bộ thiết bị.</p>

<p>B&ecirc;n cạnh touchpad, phi&ecirc;n bản mới cũng trang bị bổ sung n&uacute;t bấm Home gi&uacute;p người d&ugrave;ng điều khiển c&oacute; thể trở về trạng th&aacute;i ban đầu của Oculus Home. Gear VR mới cũng được trang bị thấu k&iacute;nh lớn hơn với&nbsp;<em>đường k&iacute;nh tăng l&ecirc;n 42 mm</em>, n&acirc;ng v&ugrave;ng nh&igrave;n l&ecirc;n đến 101 độ, tạo cảm gi&aacute;c tự nhi&ecirc;n v&agrave; thật hơn.</p>

<p><a href="http://www.techsignin.com/wp-content/uploads/2016/08/samsung-galaxy-note7-ra-mat-chinh-thuc-64.jpg"><img alt="Samsung Galaxy Note7 ra mắt chính thức: 19 triệu, chống nước, bảo mật mống mắt" src="http://www.techsignin.com/wp-content/uploads/2016/08/samsung-galaxy-note7-ra-mat-chinh-thuc-64.jpg" style="border-style:initial; border-width:0px; height:auto; margin:0px auto 20px; width:800px" /></a></p>

<p>Với tr&igrave;nh duyệt web Gear VR, người d&ugrave;ng c&oacute; thể truy cập đến hơn 300 ứng dụng VR, trong đ&oacute; c&oacute; hơn 100 tr&ograve; chơi, c&ugrave;ng với số lượng video, c&aacute;c ứng dụng học tập v&agrave; c&aacute;c trải nghiệm nhập vai đa dạng. Kho ứng dụng Samsung Picks bao gồm danh s&aacute;ch 15 ứng dụng được khuy&ecirc;n d&ugrave;ng cho những ai muốn t&igrave;m kiếm v&agrave; thử nghiệm những điều mới mẻ.</p>

<h3><strong>Gear Fit2: v&ograve;ng tay t&iacute;ch hợp GPS gi&uacute;p tập thể thao, lưu trữ nhạc</strong></h3>

<p>Samsung Gear Fit2 sở hữu m&agrave;n h&igrave;nh cong Super AMOLED &ocirc;m trọn cổ tay, độ cong m&agrave;n h&igrave;nh l&agrave; 47.65R, trong khi đ&oacute; thế hệ trước l&agrave; 57.45R. Bằng c&aacute;ch giảm độ cong, Gear Fit2 c&oacute; thiết kế nhỏ gọn v&agrave; &ocirc;m trọn cổ tay để bạn c&oacute; thể sử dụng thoải m&aacute;i mỗi ng&agrave;y.</p>

<p><a href="http://www.techsignin.com/wp-content/uploads/2016/08/samsung-galaxy-note7-ra-mat-chinh-thuc-69.jpg"><img alt="Samsung Galaxy Note7 ra mắt chính thức: 19 triệu, chống nước, bảo mật mống mắt" src="http://www.techsignin.com/wp-content/uploads/2016/08/samsung-galaxy-note7-ra-mat-chinh-thuc-69.jpg" style="border-style:initial; border-width:0px; height:auto; margin:0px auto 20px; width:800px" /></a></p>

<p>Gear Fit2 c&oacute; khả năng đo lường v&agrave; cung cấp ch&iacute;nh x&aacute;c những th&ocirc;ng tin về hoạt động thể thao của người d&ugrave;ng nhờ v&agrave;o GPS t&iacute;ch hợp sẵn c&ugrave;ng cảm biến đo nhịp tim (HRM). Thiết bị c&ograve;n c&oacute; thể nhận diện 15 hoạt động kh&aacute;c nhau, bao gồm c&aacute;c b&agrave;i tập với m&aacute;y đạp xe hay những phương ph&aacute;p phổ biến như Pilates, Lunges, Crunches, Squats.</p>

<p>B&ecirc;n cạnh đ&oacute;, điểm kh&aacute;c biệt lớn l&agrave; v&ograve;ng tay th&ocirc;ng minh n&agrave;y c&oacute; khả năng lưu trữ 500 b&agrave;i h&aacute;t, được chuyển trực tiếp th&ocirc;ng qua ứng dụng Samsung Gear. Thiết bị kết hợp với ứng dụng S Health c&oacute; t&iacute;nh năng mới &ldquo;Step Challenges&rdquo; v&agrave; &ldquo;Step Leaderboard&rdquo;, cho ph&eacute;p thiết lập mục ti&ecirc;u luyện tập với bạn b&egrave;, tăng động lực luyện tập mỗi ng&agrave;y v&agrave; gi&uacute;p người d&ugrave;ng l&agrave;m việc t&iacute;ch cực hơn.</p>

<p><a href="http://www.techsignin.com/wp-content/uploads/2016/08/samsung-galaxy-note7-ra-mat-chinh-thuc-75.jpg"><img alt="Samsung Galaxy Note7 ra mắt chính thức: 19 triệu, chống nước, bảo mật mống mắt" src="http://www.techsignin.com/wp-content/uploads/2016/08/samsung-galaxy-note7-ra-mat-chinh-thuc-75.jpg" style="border-style:initial; border-width:0px; height:auto; margin:0px auto 20px; width:800px" /></a><a href="http://www.techsignin.com/wp-content/uploads/2016/08/samsung-galaxy-note7-ra-mat-chinh-thuc-68.jpg"><img alt="Samsung Galaxy Note7 ra mắt chính thức: 19 triệu, chống nước, bảo mật mống mắt" src="http://www.techsignin.com/wp-content/uploads/2016/08/samsung-galaxy-note7-ra-mat-chinh-thuc-68.jpg" style="border-style:initial; border-width:0px; height:auto; margin:0px auto 20px; width:800px" /></a></p>

<p>Gear Fit2 cũng được t&iacute;ch hợp c&ocirc;ng nghệ kh&aacute;ng nước v&agrave; bụi cao nhất hiện nay IP68. Thiết bị tương th&iacute;ch với smartphone chạy hệ điều h&agrave;nh Android 4.4 trở l&ecirc;n y&ecirc;u cầu tối thiểu 1,5 GB RAM, với hai lựa chọn về m&agrave;u sắc l&agrave; Đen v&agrave; Hồng.</p>

<h3><strong>Gi&aacute; cả v&agrave; ng&agrave;y b&aacute;n ch&iacute;nh ch&iacute;nh thức</strong></h3>

<p><a href="http://www.techsignin.com/wp-content/uploads/2016/08/samsung-galaxy-note7-ra-mat-chinh-thuc-43.jpg"><img alt="Samsung Galaxy Note7 ra mắt chính thức: 19 triệu, chống nước, bảo mật mống mắt" src="http://www.techsignin.com/wp-content/uploads/2016/08/samsung-galaxy-note7-ra-mat-chinh-thuc-43.jpg" style="border-style:initial; border-width:0px; height:auto; margin:0px auto 20px; width:800px" /></a></p>

<p>Samsung Galaxy Note7 gồm 3 phi&ecirc;n bản: V&agrave;ng &Aacute;nh Kim, Đen Thạch Anh, Bạc Titan; sẽ được b&aacute;n rộng r&atilde;i tại c&aacute;c cửa h&agrave;ng tr&ecirc;n to&agrave;n quốc&nbsp;<em>từ ng&agrave;y 09/09/2016</em>, với gi&aacute; b&aacute;n lẻ đề nghị:&nbsp;<strong>18.990.000 đồng.</strong></p>

<p>Phi&ecirc;n bản k&iacute;nh thực tế ảo Gear VR mới v&agrave; v&ograve;ng tay thể thao th&ocirc;ng minh Gear Fit2 c&oacute; gi&aacute; b&aacute;n lẻ đề nghị lần lượt l&agrave;&nbsp;<strong>2.190.000 đồng</strong>&nbsp;v&agrave;&nbsp;<strong>3.990.000 đồng</strong></p>

<p>Ri&ecirc;ng đối với những đơn đặt h&agrave;ng đến hết ng&agrave;y 11/08/2016, người ti&ecirc;u d&ugrave;ng Việt Nam sẽ được hưởng đặc quyền sở hữu Galaxy Note7 đầu ti&ecirc;n tr&ecirc;n thế giới v&agrave;o ng&agrave;y 19/08/2016.</p>

<h3><strong>Mua Galaxy Note7 được ưu đ&atilde;i đặc quyền Samsung Elite, Worry-Free</strong></h3>

<p>Samsung cũng giới thiệu Dịch vụ cao cấp Samsung Elite d&agrave;nh cho c&aacute;c kh&aacute;ch h&agrave;ng của Galaxy Note7 gồm:</p>

<ul>
	<li>Miễn ph&iacute; ph&ograve;ng chờ Hạng thương gia tại s&acirc;n bay Nội B&agrave;i v&agrave; T&acirc;n Sơn Nhất đến 4 lần/năm m&agrave; kh&ocirc;ng cần gọi điện thoại đặt chỗ trước.</li>
	<li>Ng&agrave;y thứ Bảy tuyệt vời: người d&ugrave;ng sở hữu Galaxy Note7 cơ hội thưởng thức b&aacute;nh, nước tại hệ thống Coffee Bean &amp; Tea Leaf v&agrave; xem phim miễn ph&iacute; tại hệ thống rạp CGV mỗi cuối tuần.</li>
	<li>Ưu đ&atilde;i Galaxy Game Pack: c&oacute; trị gi&aacute; l&ecirc;n đến hơn 300 USD (dưới h&igrave;nh thức quy đổi th&agrave;nh ph&iacute; mua vật phẩm Game).</li>
</ul>

<p>Samsung cũng d&agrave;nh ri&ecirc;ng cho người sở hữu Galaxy Note7 dịch vụ chăm s&oacute;c Worry-Free. Theo đ&oacute;, người d&ugrave;ng sẽ được tổng đ&agrave;i tư vấn ri&ecirc;ng miễn ph&iacute; với đội ngũ tư vấn vi&ecirc;n 24/7. Tổng đ&agrave;i sẽ gi&uacute;p li&ecirc;n hệ với trung t&acirc;m bảo h&agrave;nh Samsung gần nhất để cử kỹ thuật vi&ecirc;n đến tận nơi để mang thiết bị về trung t&acirc;m.</p>

<p><a href="http://www.techsignin.com/wp-content/uploads/2016/08/samsung-galaxy-note7-ra-mat-chinh-thuc-115.jpg"><img alt="Samsung Galaxy Note7 ra mắt chính thức: 19 triệu, chống nước, bảo mật mống mắt" src="http://www.techsignin.com/wp-content/uploads/2016/08/samsung-galaxy-note7-ra-mat-chinh-thuc-59.jpg" style="border-style:initial; border-width:0px; height:auto; margin:0px auto 20px; width:800px" /><img alt="Samsung Galaxy Note7 ra mắt chính thức: 19 triệu, chống nước, bảo mật mống mắt" src="http://www.techsignin.com/wp-content/uploads/2016/08/samsung-galaxy-note7-ra-mat-chinh-thuc-115.jpg" style="border-style:initial; border-width:0px; height:auto; margin:0px auto 20px; width:800px" /></a></p>

<p>Khi ho&agrave;n tất qu&aacute; tr&igrave;nh kiểm tra sửa chữa, kỹ thuật vi&ecirc;n sẽ li&ecirc;n hệ lại với kh&aacute;ch h&agrave;ng để giao lại m&aacute;y Galaxy Note7. Trong thời gian chờ đợi, người d&ugrave;ng sẽ được hỗ trợ một m&aacute;y Galaxy để sử dụng tạm thời. Dịch vụ n&agrave;y sẽ được triển khai tại 10 th&agrave;nh phố lớn gồm TP. Hồ Ch&iacute; Minh, H&agrave; Nội, Đ&agrave; Nẵng, Cần Thơ, Hải Ph&ograve;ng, Thanh H&oacute;a, Bi&ecirc;n H&ograve;a, Vinh, Nha Trang v&agrave; Th&aacute;i Nguy&ecirc;n.</p>

<p>Ngo&agrave;i ra, người sở hữu Galaxy Note7 c&ograve;n được chăm s&oacute;c đặc biệt với &ldquo;Đặc quyền 1 đổi 1&rdquo; gồm c&aacute;c ưu đ&atilde;i đối với việc sửa chữa v&agrave; thay thế thiết bị khi c&oacute; sự cố ngo&agrave;i &yacute; muốn. Th&ocirc;ng tin chi tiết về g&oacute;i bảo hiểm cao cấp n&agrave;y c&oacute; thể li&ecirc;n hệ đường d&acirc;y n&oacute;ng miễn ph&iacute; 19006727 .</p>

<h3><strong>Th&ocirc;ng số kỹ thuật Samsung Galaxy Note7</strong></h3>

<table style="width:580px">
	<tbody>
		<tr>
			<td><strong>　</strong></td>
			<td><strong>Galaxy Note7</strong></td>
		</tr>
		<tr>
			<td><strong>Hệ điều h&agrave;nh</strong></td>
			<td>Android 6.0.1 (Marshmallow)</td>
		</tr>
		<tr>
			<td><strong>Mạng</strong></td>
			<td>LTE Cat.12 / LTE Cat.10 / LTE Cat.9</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước</strong></td>
			<td>153,5 x 73,9 x 7,9mm, 169g</td>
		</tr>
		<tr>
			<td><strong>Vi xử l&yacute;</strong></td>
			<td>Octa core (2.3GHz Quad + 1.6GHz Quad),<br />
			64 bit, 14 nm process</td>
		</tr>
		<tr>
			<td><strong>Bộ nhớ</strong></td>
			<td>4GB RAM (LPDDR4), 64GB (UFS 2.0)</td>
		</tr>
		<tr>
			<td><strong>Hiển thị</strong></td>
			<td>5,7 inch Quad HD Dual edge Super AMOLED<br />
			2560 x 1440 (518ppi)</td>
		</tr>
		<tr>
			<td><strong>Camera</strong></td>
			<td>Sau: Dual Pixel 12MP OIS (F1.7), Trước: 5MP (F1.7)</td>
		</tr>
		<tr>
			<td><strong>Pin</strong></td>
			<td>3,500 mAh, Sạc nhanh kh&ocirc;ng d&acirc;y v&agrave; c&oacute; d&acirc;y<br />
			Sạc kh&ocirc;ng d&acirc;y chuẩn WPC v&agrave; PMA</td>
		</tr>
		<tr>
			<td><strong>Thanh to&aacute;n</strong></td>
			<td>NFC, MST</td>
		</tr>
		<tr>
			<td><strong>Kết nối</strong></td>
			<td>Wi-Fi 802.11 a/b/g/n/ac (2.4/5GHz), MIMO(2&times;2) 620Mbps,<br />
			Bluetooth v 4.2 LE, ANT+, USB Type-C, NFC<br />
			Định vị (GPS, Glonass, Beidou)</td>
		</tr>
		<tr>
			<td><strong>Cảm biến</strong></td>
			<td>Cảm biến đo kh&iacute; &aacute;p, cảm biến v&acirc;n tay, Con quay hồi chuyển, cảm biến địa từ, cảm biến Hall, cảm biến HR, cảm biến mống mắt, cảm biến tiệm cận, cảm biến RGB nhẹ</td>
		</tr>
		<tr>
			<td><strong>Audio</strong></td>
			<td>MP3, M4A, 3GA, AAC, OGG, OGA, WAV, WMA, AMR.<br />
			AWB, FLAC, MID, MIDI, XMF, MXMF, IMY, RTTTL, RTX, OTA</td>
		</tr>
		<tr>
			<td><strong>Video</strong></td>
			<td>MP4, M4V, 3GP, 3G2, WMV, ASF, AVI , FLV, MKV, WEBM</td>
		</tr>
	</tbody>
</table>

<h3><strong>Th&ocirc;ng số kỹ thuật của&nbsp;</strong><strong>Samsung Gear Fit2</strong></h3>

<table style="width:580px">
	<tbody>
		<tr>
			<td><strong>Hệ điều h&agrave;nh</strong></td>
			<td>Tizen</td>
		</tr>
		<tr>
			<td><strong>Bộ vi xử l&yacute;</strong></td>
			<td>Dual Core (1 GHz)</td>
		</tr>
		<tr>
			<td><strong>Bộ nhớ</strong></td>
			<td>&nbsp;512MB (RAM) / 4GB Bộ nhớ trong</td>
		</tr>
		<tr>
			<td><strong>M&agrave;n h&igrave;nh</strong></td>
			<td>1.5 inch, Curved Touch Super AMOLED 216 x 432</td>
		</tr>
		<tr>
			<td><strong>Pin</strong></td>
			<td>200mAh (l&ecirc;n đến 5 ng&agrave;y sử dụng)</td>
		</tr>
		<tr>
			<td><strong>Kết nối</strong></td>
			<td>Bluetooth&reg; v 4.2</td>
		</tr>
		<tr>
			<td><strong>Cảm biến</strong></td>
			<td>Accelerometer, Gyro, HRM, Built-in GPS, Barometer</td>
		</tr>
		<tr>
			<td><strong>Chỉ số kh&aacute;ng nước/ bụi</strong></td>
			<td>IP 68</td>
		</tr>
	</tbody>
</table>

<h3><strong>Th&ocirc;ng số kỹ thuật k&iacute;nh thực tế ảo Samsung Gear VR</strong></h3>

<table style="width:580px">
	<tbody>
		<tr>
			<td><strong>K&iacute;ch thước</strong></td>
			<td>207.8 x 122.5 x 98.6 mm</td>
		</tr>
		<tr>
			<td><strong>Trọng lượng</strong></td>
			<td>345g (312g khi kh&ocirc;ng c&oacute; nắp bảo vệ)</td>
		</tr>
		<tr>
			<td><strong>Cảm biến</strong></td>
			<td>Gia tốc kế, con quay hồi chuyển, tiệm cận</td>
		</tr>
		<tr>
			<td><strong>G&oacute;c nh&igrave;n</strong></td>
			<td>101 độ</td>
		</tr>
		<tr>
			<td><strong>M&agrave;u sắc</strong></td>
			<td>Xanh Đen</td>
		</tr>
		<tr>
			<td><strong>Cổng kết nối</strong></td>
			<td>Cổng USB Type-C v&agrave; Micro USB đi k&egrave;m với đầu chuyển đổi Micro USB tương th&iacute;ch với Galaxy S6, Galaxy S6 edge, Galaxy Note5, Galaxy S6 edge+, Galaxy S7 v&agrave; Galaxy S7 edge v&agrave; Galaxy Note7</td>
		</tr>
	</tbody>
</table>
',N'Samsung Galaxy Note7 ra mắt: 19 triệu, chống nước, bảo mật mống mắt',N'Chiều nay 10/8, Công ty điện tử Samsung Vina đã chính thức giới thiệu smartphone Galaxy Note7 tại Việt Nam',N'publish',N'samsung-galaxy-note7-ra-mat-chinh-thuc-19-trieu-chong-nuoc-bao-mat-mong-mat',{ts '2016-08-12 21:20:00.000'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
121,NULL,{ts '2016-08-12 21:21:43.090'},N'Image upload',N'samsung-galaxy-note7-ra-mat-chinh-thuc-43',N'image',N'inherit',N'69c23595-0ac9-4dfc-b2fc-9eb25d2a019asamsung-galaxy-note7-ra-mat-chinh-thuc-43',{ts '2016-08-12 21:21:43.090'},0,N'69c23595-0ac9-4dfc-b2fc-9eb25d2a019asamsung-galaxy-note7-ra-mat-chinh-thuc-43.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
122,NULL,{ts '2016-08-12 21:36:14.543'},N'Add Category Tin tức to menu  Secondary Menu',N'Tin tức',N'Updated',NULL,N'tin-tuc-1',{ts '2016-08-12 21:36:14.560'},0,NULL,200,N'nav_menu_item',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
123,NULL,{ts '2016-08-12 21:36:14.543'},N'Add Category Tản mạn to menu  Secondary Menu',N'Tản mạn',N'Updated',NULL,N'tan-man-1',{ts '2016-08-12 21:36:14.620'},0,NULL,300,N'nav_menu_item',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
124,NULL,{ts '2016-08-12 21:36:14.543'},N'Add Category Internet to menu  Secondary Menu',N'Internet',N'Updated',NULL,N'internet-1',{ts '2016-08-12 21:36:14.857'},0,NULL,400,N'nav_menu_item',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
125,NULL,{ts '2016-08-12 21:36:14.543'},N'Add Category Video to menu  Secondary Menu',N'Video',N'Updated',NULL,N'video',{ts '2016-08-12 21:36:15.043'},0,NULL,500,N'nav_menu_item',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
126,NULL,{ts '2016-08-12 21:36:36.800'},N'Add custom link to menu  ',N'Trang chủ',N'Updated',NULL,N'trang-chu-1',{ts '2016-08-12 21:36:36.800'},0,NULL,100,N'nav_menu_item',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
133,1,{ts '2016-08-13 23:23:14.507'},N'<p>Nh&igrave;n chung BlackBerry DTEK50 (c&ograve;n c&oacute; t&ecirc;n Blackberry Neon) c&oacute; kiểu d&aacute;ng tương đồng với Alcatel Idol 4, m&aacute;y khả mỏng với đường viền chạy quanh th&acirc;n được c&aacute;ch điệu khoảng lớn khoảng nhỏ chứ kh&ocirc;ng đều nhau như đa phần c&aacute;c smartphone. Ngo&agrave;i đường viền kim loại, DTEK50 c&oacute; hai đường cắt bằng nhựa ở cạnh tr&ecirc;n v&agrave; dưới.</p>

<p>Khung m&agrave;n h&igrave;nh v&agrave; mặt sau được bo vu&ocirc;ng v&agrave; tạo cảm gi&aacute;c nổi hơn so với cạnh th&acirc;n, đặc biệt ở cạnh tr&ecirc;n v&agrave; cạnh dưới, nơi BlackBerry xử l&yacute; nhiều lỗ cho loa ngo&agrave;i. Mặt sau m&aacute;y được l&agrave;m bằng nhựa xử l&yacute; v&acirc;n nổi, với logo BlackBerry nằm ở giữa, camera sau c&ugrave;ng đ&egrave;n Flash LED k&eacute;p nằm ở cạnh tr&ecirc;n b&ecirc;n ph&iacute;a tr&aacute;i.</p>

<p>BlackBerry DTEK50 bố tr&iacute; n&uacute;t nguồn ở cạnh b&ecirc;n tr&aacute;i (ph&iacute;a mặt trước), n&uacute;t tăng giảm &acirc;m lượng ở cạnh phải, đặt biệt ở cạnh n&agrave;y m&aacute;y c&ograve;n c&oacute; n&uacute;t t&ugrave;y biến h&igrave;nh tr&ograve;n v&agrave; khay SIM/thẻ nhớ nằm cạnh. Hộp của DTEK50 c&oacute; d&ograve;ng chữ Secure Smartphone, ngụ &yacute; đ&acirc;y l&agrave; smartphone c&oacute; độ bảo mật cao. V&agrave; để minh chứng, c&oacute; một ứng dụng t&ecirc;n DTEK by BlackBerry d&ugrave;ng để kiểm tra v&agrave; th&ocirc;ng b&aacute;o t&igrave;nh trạng bảo mật của smartphone n&agrave;y.</p>

<h2><strong>H&igrave;nh ảnh thực tế BlackBerry DTEK50 (Neon)</strong></h2>
<img alt="Ảnh thực tế BlackBerry DTEK50 (Neon): mỏng, nhẹ, đẹp" src="http://www.techsignin.com/wp-content/uploads/2016/08/techsignin-anh-tren-tay-blackberry-dtek50-22.jpg" style="height:auto; width:1000px" />
<p>Hộp của BlackBerry DTEK50</p>
<br />
<img alt="Ảnh thực tế BlackBerry DTEK50 (Neon): mỏng, nhẹ, đẹp" src="http://www.techsignin.com/wp-content/uploads/2016/08/techsignin-anh-tren-tay-blackberry-dtek50-23.jpg" style="height:auto; width:1000px" />
<p>Mặt sau của hộp</p>
<br />
<img alt="Ảnh thực tế BlackBerry DTEK50 (Neon): mỏng, nhẹ, đẹp" src="http://www.techsignin.com/wp-content/uploads/2016/08/techsignin-anh-tren-tay-blackberry-dtek50-24.jpg" style="height:auto; width:1000px" />
<p>Trọn bộ phụ kiện, ri&ecirc;ng m&aacute;y c&oacute; miếng d&aacute;n h&igrave;nh chiếc khi&ecirc;n kh&aacute; ấn tượng</p>
<br />
<img alt="Ảnh thực tế BlackBerry DTEK50 (Neon): mỏng, nhẹ, đẹp" src="http://www.techsignin.com/wp-content/uploads/2016/08/techsignin-anh-tren-tay-blackberry-dtek50-25.jpg" style="height:auto; width:1000px" />
<p>Củ sạc của m&aacute;y</p>
<br />
<img alt="Ảnh thực tế BlackBerry DTEK50 (Neon): mỏng, nhẹ, đẹp" src="http://www.techsignin.com/wp-content/uploads/2016/08/techsignin-anh-tren-tay-blackberry-dtek50-27.jpg" style="height:auto; width:1000px" />
<p>D&acirc;y c&aacute;p microUSB</p>
<br />
<img alt="Ảnh thực tế BlackBerry DTEK50 (Neon): mỏng, nhẹ, đẹp" src="http://www.techsignin.com/wp-content/uploads/2016/08/techsignin-anh-tren-tay-blackberry-dtek50-28.jpg" style="height:auto; width:1000px" />
<p>Tai nghe</p>

<p><img alt="Ảnh thực tế BlackBerry DTEK50 (Neon): mỏng, nhẹ, đẹp" src="http://www.techsignin.com/wp-content/uploads/2016/08/techsignin-anh-tren-tay-blackberry-dtek50-30.jpg" style="height:auto; margin:0px auto 20px; width:1000px" /></p>
<img alt="Ảnh thực tế BlackBerry DTEK50 (Neon): mỏng, nhẹ, đẹp" src="http://www.techsignin.com/wp-content/uploads/2016/08/techsignin-anh-tren-tay-blackberry-dtek50-32.jpg" style="height:auto; width:1000px" />
<p>Mở m&aacute;y l&ecirc;n kết nối mạng, lần đầu m&aacute;y đ&atilde; b&aacute;o tải về cập nhật phần mềm.</p>
<br />
<img alt="Ảnh thực tế BlackBerry DTEK50 (Neon): mỏng, nhẹ, đẹp" src="http://www.techsignin.com/wp-content/uploads/2016/08/techsignin-anh-tren-tay-blackberry-dtek50-37.jpg" style="height:auto; width:1000px" />
<p>Mặt sau m&aacute;y</p>
<br />
<img alt="Ảnh thực tế BlackBerry DTEK50 (Neon): mỏng, nhẹ, đẹp" src="http://www.techsignin.com/wp-content/uploads/2016/08/techsignin-anh-tren-tay-blackberry-dtek50-38.jpg" style="height:auto; width:1000px" />
<p>Cạnh tr&aacute;i chỉ c&oacute; n&uacute;t nguồn</p>
<br />
<img alt="Ảnh thực tế BlackBerry DTEK50 (Neon): mỏng, nhẹ, đẹp" src="http://www.techsignin.com/wp-content/uploads/2016/08/techsignin-anh-tren-tay-blackberry-dtek50-41.jpg" style="height:auto; width:1000px" />
<p>Cạnh phải l&agrave; n&uacute;t tăng giảm &acirc;m lượng, n&uacute;t chức năng t&ugrave;y chỉnh v&agrave; khay cắm SIM/thẻ nhớ</p>
<br />
<img alt="Ảnh thực tế BlackBerry DTEK50 (Neon): mỏng, nhẹ, đẹp" src="http://www.techsignin.com/wp-content/uploads/2016/08/techsignin-anh-tren-tay-blackberry-dtek50-42.jpg" style="height:auto; width:1000px" />
<p>Cạnh dưới c&oacute; jack microUSB cho sạc, truyền dữ liệu</p>
<br />
<img alt="Ảnh thực tế BlackBerry DTEK50 (Neon): mỏng, nhẹ, đẹp" src="http://www.techsignin.com/wp-content/uploads/2016/08/techsignin-anh-tren-tay-blackberry-dtek50-45.jpg" style="height:auto; width:1000px" />
<p>Cạnh tr&ecirc;n c&oacute; jack 3.5mm</p>
<br />
<img alt="Ảnh thực tế BlackBerry DTEK50 (Neon): mỏng, nhẹ, đẹp" src="http://www.techsignin.com/wp-content/uploads/2016/08/techsignin-anh-tren-tay-blackberry-dtek50-46.jpg" style="height:auto; width:1000px" />
<p>Mặt trước v&agrave; sau m&aacute;y được l&agrave;m hơi nổi hơn th&acirc;n, cạnh tr&ecirc;n v&agrave; dưới c&oacute; lỗ loa</p>
<br />
<img alt="Ảnh thực tế BlackBerry DTEK50 (Neon): mỏng, nhẹ, đẹp" src="http://www.techsignin.com/wp-content/uploads/2016/08/techsignin-anh-tren-tay-blackberry-dtek50-47.jpg" style="height:auto; width:1000px" />
<p>Camera của BlackBerry DTEk50 cho ảnh độ ph&acirc;n giải 13MP</p>

<p><img alt="Ảnh thực tế BlackBerry DTEK50 (Neon): mỏng, nhẹ, đẹp" src="http://www.techsignin.com/wp-content/uploads/2016/08/techsignin-anh-tren-tay-blackberry-dtek50-48.jpg" style="height:auto; margin:0px auto 20px; width:1000px" /></p>
<img alt="Ảnh thực tế BlackBerry DTEK50 (Neon): mỏng, nhẹ, đẹp" src="http://www.techsignin.com/wp-content/uploads/2016/08/techsignin-anh-tren-tay-blackberry-dtek50-49.jpg" style="height:auto; width:1000px" />
<p>Khay cắm SIM v&agrave; thẻ nhớ được bố tr&iacute; kh&aacute; lạ</p>
<br />
<img alt="Ảnh thực tế BlackBerry DTEK50 (Neon): mỏng, nhẹ, đẹp" src="http://www.techsignin.com/wp-content/uploads/2016/08/techsignin-anh-tren-tay-blackberry-dtek50-50.jpg" style="height:auto; width:1000px" />
<p>Tiến h&agrave;nh c&aacute;c bước c&agrave;i đặt</p>
<br />
<img alt="Ảnh thực tế BlackBerry DTEK50 (Neon): mỏng, nhẹ, đẹp" src="http://www.techsignin.com/wp-content/uploads/2016/08/techsignin-anh-tren-tay-blackberry-dtek50-51.jpg" style="height:auto; width:1000px" />
<p>Một số t&iacute;nh năng mới m&agrave; BlackBerry trang bị cho DTEK50</p>

<p><img alt="Ảnh thực tế BlackBerry DTEK50 (Neon): mỏng, nhẹ, đẹp" src="http://www.techsignin.com/wp-content/uploads/2016/08/techsignin-anh-tren-tay-blackberry-dtek50-52.jpg" style="height:auto; margin:0px auto 20px; width:1000px" /><img alt="Ảnh thực tế BlackBerry DTEK50 (Neon): mỏng, nhẹ, đẹp" src="http://www.techsignin.com/wp-content/uploads/2016/08/techsignin-anh-tren-tay-blackberry-dtek50-53.jpg" style="height:auto; margin:0px auto 20px; width:1000px" /></p>

<p>&nbsp;</p>
',N'Ảnh thực tế BlackBerry DTEK50: mỏng, nhẹ, đẹp',N'Mới đây chiếc BlackBerry DTEK50 đã được Gurumobi.vn nhập về và đang bán ra với giá 8 triệu đồng. DTEK50 có kiểu dáng khá mỏng, hoạt động mượt mà.',N'publish',N'anh-thuc-te-blackberry-dtek50-mong-nhe-dep',{ts '2016-08-13 23:23:00.000'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
134,NULL,{ts '2016-08-13 23:23:48.633'},N'Image upload',N'techsignin-anh-tren-tay-blackberry-dtek50-22',N'image',N'inherit',N'55963e6b-f46f-4f5e-b1b2-d9dff578bc6atechsignin-anh-tren-tay-blackberry-dtek50-22',{ts '2016-08-13 23:23:48.633'},0,N'55963e6b-f46f-4f5e-b1b2-d9dff578bc6atechsignin-anh-tren-tay-blackberry-dtek50-22.jpeg',NULL,N'attachment',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
135,1,{ts '2016-08-14 18:51:54.233'},N'<p>Nếu đang khởi nghiệp kinh doanh ri&ecirc;ng bằng đồng vốn c&aacute; nh&acirc;n, chắc chắn bạn sẽ hiểu được gi&aacute; trị của từng đồng tiền tiết kiệm được.</p>

<p>Ai cũng hiểu tầm quan trọng của c&aacute;c hoạt động marketing đối với mỗi c&ocirc;ng ty. Nếu bạn đang ph&acirc;n v&acirc;n giữa h&agrave;ng trăm c&ocirc;ng cụ marketing tr&ecirc;n thị trường hiện nay th&igrave; h&atilde;y tham khảo danh s&aacute;ch c&aacute;c sản phẩm tốt nhất dưới đ&acirc;y.</p>

<p><strong>1. Quản l&yacute; c&aacute;c k&ecirc;nh truyền th&ocirc;ng x&atilde; hội bằng Buffer hoặc Hootsuite</strong></p>

<p><a href="https://buffer.com/" target="_blank">Buffer&nbsp;</a>l&agrave; c&ocirc;ng cụ quản l&yacute; đắc lực cho c&aacute;c k&ecirc;nh truyền th&ocirc;ng x&atilde; hội như Facebook, Twitter, Instagram,&hellip; Buffer c&oacute; khả năng kết nối nhiều t&agrave;i khoản mạng x&atilde; hội v&agrave;o một bảng điều khiển duy nhất, gi&uacute;p bạn kh&ocirc;ng phải lăn lộn đăng b&agrave;i khắp nơi nữa. Một số t&iacute;nh năng th&uacute; vị kh&aacute;c bao gồm schedule (l&ecirc;n lịch trước) b&agrave;i đăng, tạo c&aacute;c chiến dịch cũng như ph&acirc;n t&iacute;ch độ hiệu quả c&aacute;c post của bạn. G&oacute;i miễn ph&iacute; của Buffer đ&atilde; l&agrave; kh&aacute; đủ cho c&aacute;c startup.</p>

<p>&nbsp;</p>
<img alt="
Bảng điều khiển của Buffer
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/buffer-app-dashboard-01-1470818267776/12congcumarketingmienphimoistartupnenbiet.png" style="margin:0px" />
<p>Bảng điều khiển của Buffer</p>

<p>&nbsp;</p>

<p>Tương tự như vậy,&nbsp;<a href="https://hootsuite.com/" target="_blank">Hootsuite&nbsp;</a>cũng l&agrave; một c&ocirc;ng cụ tuyệt vời gi&uacute;p bạn quản l&yacute; c&aacute;c t&agrave;i khoản mạng x&atilde; hội. Điểm mạnh của Hootsuite l&agrave; cho ph&eacute;p bạn nhanh ch&oacute;ng đăng tải c&aacute;c b&agrave;i viết cũng như phản hồi tr&ecirc;n c&aacute;c t&agrave;i khoản mạng x&atilde; hội kh&aacute;c nhau ngay tr&ecirc;n một bảng điều khiển duy nhất.</p>

<p><strong>2. Thiết kế logo với &ldquo;chợ&rdquo; logo miễn ph&iacute; của Spaces</strong></p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/piktochart-1470819446576/12congcumarketingmienphimoistartupnenbiet.png" style="margin:0px" />
<p>&nbsp;</p>

<p>Branding l&agrave; một trong những bước bắt buộc trong c&aacute;c hoạt động marketing của doanh nghiệp, v&agrave; logo l&agrave; phần quan trọng h&agrave;ng đầu trong bước n&agrave;y.</p>

<p>Với&nbsp;<a href="https://gospaces.com/tools/logo-maker" target="_blank">Spaces</a>, bạn c&oacute; thể dễ d&agrave;ng lựa chọn h&igrave;nh d&aacute;ng v&agrave; c&aacute;c icon xuất hiện trong logo trong kho h&igrave;nh miễn ph&iacute; sẵn c&oacute; m&agrave; kh&ocirc;ng cần phải qu&aacute; nhiều tiền v&agrave;o thu&ecirc; một designer chuyển thể c&aacute;c &yacute; tưởng của bạn th&agrave;nh h&igrave;nh vẽ nữa.</p>

<p><strong>3. Thiết kế ấn phẩm truyền th&ocirc;ng dễ d&agrave;ng với Canva</strong></p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/canva-1470818593378/12congcumarketingmienphimoistartupnenbiet.png" style="margin:0px" />
<p>&nbsp;</p>

<p>Ấn phẩm truyền th&ocirc;ng đẹp mắt đang ng&agrave;y c&agrave;ng trở n&ecirc;n quan trọng hơn trong marketing. Từ những h&igrave;nh ảnh minh họa b&agrave;i viết cho đến những infographic n&acirc;ng cao &yacute; thức người d&ugrave;ng, những catalogue sản phẩm cho đến poster quảng b&aacute; đều cần tới b&agrave;n tay của những người biết thiết kế. Thế nhưng nếu bạn chưa c&oacute; đủ vốn hay khả năng thu&ecirc; được một designer ri&ecirc;ng th&igrave; sao? Hiện nay c&oacute; rất nhiều c&ocirc;ng cụ design miễn ph&iacute; tr&ecirc;n thị trường, thế nhưng tốt v&agrave; dễ sử dụng h&agrave;ng đầu phải kể đến&nbsp;<a href="https://www.canva.com/" target="_blank">Canva</a>. Với kho h&igrave;nh ảnh mẫu phong ph&uacute; cực nhiều poster, banner Facebook hay brochure, ảnh minh họa v&agrave; cho ph&eacute;p người d&ugrave;ng sử dụng kiểu k&eacute;o thả chữ v&agrave;o, Canva xứng đ&aacute;ng l&agrave; người bạn th&acirc;n của tất cả c&aacute;c marketer.</p>

<p><strong>4. Sử dụng Piktochart để tạo infographic nhanh ch&oacute;ng</strong></p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/piktochart-1470818615803/12congcumarketingmienphimoistartupnenbiet.png" style="margin:0px" />
<p>&nbsp;</p>

<p>Infographic cũng l&agrave; một phương ph&aacute;p tuyệt vời trong content marketing, v&agrave; điều cản trở c&aacute;c marketer nhiều nhất từ trước đến nay ch&iacute;nh l&agrave; thiếu người c&oacute; khả năng thiết kế. Vấn đề đ&oacute; nay kh&ocirc;ng c&ograve;n nữa với&nbsp;<a href="https://piktochart.com/" target="_blank">Piktochart</a>. Kho infographic mẫu của Piktochart c&oacute; rất nhiều infographic c&aacute;c loại cho bạn lựa chọn, từ loại về tiểu sử cuộc đời cho đến loại về hướng dẫn hay n&ecirc;u thống k&ecirc; cho người xem được tr&igrave;nh b&agrave;y một c&aacute;ch hết sức s&aacute;ng tạo. Bạn chỉ cần k&eacute;o thả th&ecirc;m c&aacute;c yếu tố m&igrave;nh cần rồi save ảnh về m&aacute;y l&agrave; xong.</p>

<p><strong>5. Tổ chức th&ocirc;ng tin bằng Evernote v&agrave; Mindmeister</strong></p>

<p>Việc tổ chức, sắp xếp th&ocirc;ng tin cho c&aacute;c chiến dịch marketing l&agrave; hết sức quan trọng. Bạn c&oacute; thể nảy ra &yacute; tưởng v&agrave;o bất cứ l&uacute;c n&agrave;o trong ng&agrave;y v&agrave; chắc chắn cần một nơi hệ thống lại tất cả.<a href="https://evernote.com/?var=1" target="_blank">Evernote&nbsp;</a>l&agrave; c&ocirc;ng cụ ghi ch&uacute; đ&atilde; qu&aacute; phổ biến, cho ph&eacute;p bạn kh&ocirc;ng chỉ ghi ch&eacute;p, scan từ notebook m&agrave; c&ograve;n cho save cả những b&agrave;i b&aacute;o, thư mục quan t&acirc;m về đọc offline.</p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/mindmeister-181534-full-1470818796229/12congcumarketingmienphimoistartupnenbiet.jpg" style="margin:0px" />
<p>&nbsp;</p>

<p>Trong khi đ&oacute;,&nbsp;<a href="https://www.mindmeister.com/" target="_blank">Mindmeister&nbsp;</a>l&agrave; c&ocirc;ng cụ vẽ bản đồ tư duy đắc lực cho ph&eacute;p bạn chia sẻ cả với c&aacute;c cộng sự nữa. Việc c&ugrave;ng nhau brainstorm &yacute; tưởng cho c&aacute;c chiến dịch marketing sẽ trở n&ecirc;n đơn giản hơn rất nhiều.</p>

<p><strong>6. Lấy phản hồi kh&aacute;ch h&agrave;ng bằng SurveyMonkey</strong></p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/monkey-1470819710409/12congcumarketingmienphimoistartupnenbiet.png" style="margin:0px" />
<p>&nbsp;</p>

<p><a href="https://www.surveymonkey.com/" target="_blank">SurveyMonkey&nbsp;</a>l&agrave; một trong số c&aacute;c c&ocirc;ng cụ khảo s&aacute;t online miễn ph&iacute; tốt nhất. Khảo s&aacute;t kh&aacute;ch h&agrave;ng l&agrave; hoạt động hữu &iacute;ch gi&uacute;p c&aacute;c marketer lấy insight, cảm nhạn của người d&ugrave;ng v&agrave; kh&aacute;m ph&aacute; c&aacute;c xu hướng sử dụng đương thời. Chỉ mất v&agrave;i ph&uacute;t bạn đ&atilde; c&oacute; thể thiết kế c&aacute;c n&ecirc;n một mẫu khảo s&aacute;t chuy&ecirc;n nghiệp. SurveyMonkey cũng cho ph&eacute;p bạn ph&acirc;n t&iacute;ch kết quả một c&aacute;ch chi tiết.</p>

<p><strong>7. Email marketing qua Mailchimp</strong></p>

<p>&nbsp;</p>
<img alt="
Theo dõi hiệu quả các chiến dịch qua MailChimp
" src="http://genknews.genkcdn.vn/k:2016/lists-dashboard-e1308345162787-1470819491704/12congcumarketingmienphimoistartupnenbiet.jpg" style="margin:0px" />
<p>Theo d&otilde;i hiệu quả c&aacute;c chiến dịch qua MailChimp</p>

<p>&nbsp;</p>

<p>Email marketing nay đ&atilde; trở th&agrave;nh một k&ecirc;nh kh&ocirc;ng thể thiếu với c&aacute;c doanh nghiệp. X&acirc;y dựng h&igrave;nh ảnh tr&ecirc;n c&aacute;c mạng x&atilde; hội như Facebook, Youtube, Instagram,&hellip; l&agrave; quan trọng nhưng cũng đi k&egrave;m với những hạn chế của c&aacute;c nền tảng n&agrave;y l&agrave; kh&oacute; đưa kh&aacute;ch h&agrave;ng v&agrave;o &ldquo;sales funnel&rdquo; v&agrave; theo d&otilde;i qu&aacute; tr&igrave;nh mua sắm của họ.</p>

<p>Tr&aacute;i lại, email lại cho ph&eacute;p bạn kiểm so&aacute;t chặt chẽ hơn sự tương t&aacute;c giữa thương hiệu v&agrave; kh&aacute;ch h&agrave;ng cũng như &ldquo;nu&ocirc;i&rdquo; kh&aacute;ch h&agrave;ng từ giai đoạn bắt đầu tiếp cận thương hiệu cho đến khi quyết định mua sản phẩm.&nbsp;<a href="http://mailchimp.com/" target="_blank">Mailchimp&nbsp;</a>l&agrave; c&ocirc;ng cụ email marketing miễn ph&iacute; cho ph&eacute;p bạn dễ d&agrave;ng đo lường c&aacute;c chiến dịch truyền th&ocirc;ng qua mail.</p>

<p><strong>18. Growth hacking bằng Sniply</strong></p>

<p>L&agrave; một marketer c&oacute; lẽ bạn kh&ocirc;ng c&ograve;n qu&aacute; xa lạ với thuật ngữ &ldquo;growth hacking&rdquo; &ndash; c&aacute;c chiến lược tăng lượng người d&ugrave;ng tức th&igrave; một c&aacute;ch s&aacute;ng tạo v&agrave; &iacute;t tốn k&eacute;m.</p>

<p>Một trong những thủ thuật growth hacking hiệu quả l&agrave; share lại c&aacute;c post từ những chuy&ecirc;n gia nổi tiếng trong ng&agrave;nh để x&acirc;y dựng sự tin tưởng cho người d&ugrave;ng, Thế nhưng những nội dung bạn share lại thường nằm ở c&aacute;c website kh&aacute;c m&agrave; bạn kh&ocirc;ng c&oacute; quyền kiểm so&aacute;t n&ecirc;n thường người đọc sẽ &ldquo;ng&oacute; lơ&rdquo; lu&ocirc;n website/page của bạn khi được dẫn sang nguồn kh&aacute;c. Hiểu điều n&agrave;y,&nbsp;<a href="http://snip.ly/" target="_blank">Sniply&nbsp;</a>cho ph&eacute;p bạn gắn n&uacute;t k&ecirc;u gọi h&agrave;nh động (Call to action) v&agrave;o bất cứ nội dung g&igrave; bạn chia sẻ. N&oacute; gi&uacute;p bạn gắn một n&uacute;t quay lại/k&ecirc;u gọi h&agrave;nh động v&agrave;o một hộp thoại b&ecirc;n g&oacute;c tr&aacute;i m&agrave;n h&igrave;nh để người đọc c&oacute; thể quay trở lại website của bạn.</p>

<p>&nbsp;</p>
<img alt="
Ví dụ về sử dụng Sniply để kêu gọi khách hàng quay lại trang
" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/screen-shot-2015-01-21-at-21-41-00-1024x626-1470820665801/12congcumarketingmienphimoistartupnenbiet.png" style="margin:0px" />
<p>V&iacute; dụ về sử dụng Sniply để k&ecirc;u gọi kh&aacute;ch h&agrave;ng quay lại trang</p>

<p>&nbsp;</p>

<p><strong>9. Lấy nội dung từ c&aacute;c website bằng Scraper</strong></p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/scaper-1470820884879/12congcumarketingmienphimoistartupnenbiet.png" style="margin:0px" />
<p>&nbsp;</p>

<p><a href="https://data-miner.io/" target="_blank">Scraper&nbsp;</a>(Data Miner) l&agrave; một tiện &iacute;ch Chrome cho ph&eacute;p lấy hết dữ liệu tr&ecirc;n một website n&agrave;o đ&oacute; rồi xuất n&oacute; ra file Excel để tiện theo d&otilde;i. Đ&acirc;y l&agrave; một c&aacute;ch tuyệt vời để lấy th&ocirc;ng tin kh&aacute;ch h&agrave;ng từ c&aacute;c đối thủ. Một khi đ&atilde; c&oacute; được những danh s&aacute;ch kh&aacute;ch h&agrave;ng đ&aacute;ng gi&aacute; n&agrave;y, bạn c&oacute; thể sử dụng cold email hay cold call để thu phục họ.</p>

<p><strong>10. T&igrave;m kiếm th&ocirc;ng tin ch&iacute;nh x&aacute;c bằng Rapportive</strong></p>

<p>&nbsp;</p>
<img alt="" src="http://genknews.genkcdn.vn/k:thumb_w/640/2016/scaper-1470820946485/12congcumarketingmienphimoistartupnenbiet.png" style="margin:0px" />
<p>&nbsp;</p>

<p>Sẽ thế n&agrave;o nếu bạn nhận được email từ một kh&aacute;ch h&agrave;ng tiềm năng v&agrave; muốn biết th&ecirc;m th&ocirc;ng tin chi tiết của họ?&nbsp;<a href="http://rapportive.com/" target="_blank">Rapportive&nbsp;</a>sẽ gi&uacute;p bạn dựa v&agrave;o email để tra ra ngay ảnh ch&acirc;n dung, nơi sống, nghề nghiệp, c&ocirc;ng ty, hồ sơ c&aacute; nh&acirc;n tr&ecirc;n LinkedIn,&hellip;v&agrave; hiển thị tất cả ngay tr&ecirc;n giao diện Gmail, rất tuyệt phải kh&ocirc;ng?</p>
',N'12 công cụ marketing miễn phí mọi startup nên biết',N'Nếu bạn đang phân vân giữa hàng trăm công cụ marketing trên thị trường hiện nay thì hãy tham khảo danh sách các sản phẩm tốt nhất dưới đây.',N'publish',N'12-cong-cu-marketing-mien-phi-moi-startup-nen-biet',{ts '2016-08-14 18:51:00.000'},0,NULL,NULL,N'post',N'Open',0);
GO
INSERT INTO [Posts] ([PostID],[UserID],[Created],[Content],[Title],[Excerpt],[Status],[Name],[Modified],[Parent],[GUID],[Order],[Type],[CommentStatus],[CommentCount]) VALUES (
136,NULL,{ts '2016-08-14 18:55:41.380'},N'Image upload',N'quy-luat-bat-bien-trong-marketing',N'image',N'inherit',N'74780e5d-e404-427e-b5d6-518162245793quy-luat-bat-bien-trong-marketing',{ts '2016-08-14 18:55:41.380'},0,N'74780e5d-e404-427e-b5d6-518162245793quy-luat-bat-bien-trong-marketing.jpeg',NULL,N'attachment',N'Open',0);
GO
SET IDENTITY_INSERT [Posts] OFF;
GO
SET IDENTITY_INSERT [PostMeta] ON;
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
1,10,N'_item_menu_type',N'category');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
2,10,N'_item_menu_cat_parent',N'1');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
3,11,N'_item_menu_type',N'category');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
4,11,N'_item_menu_cat_parent',N'2');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
5,12,N'_item_menu_type',N'category');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
6,12,N'_item_menu_cat_parent',N'3');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
7,13,N'_item_menu_type',N'category');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
8,13,N'_item_menu_cat_parent',N'4');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
9,14,N'_item_menu_type',N'category');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
10,14,N'_item_menu_cat_parent',N'5');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
11,15,N'_item_menu_type',N'category');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
12,15,N'_item_menu_cat_parent',N'6');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
13,16,N'_item_menu_type',N'category');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
14,16,N'_item_menu_cat_parent',N'7');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
15,17,N'_item_menu_type',N'category');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
16,17,N'_item_menu_cat_parent',N'8');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
17,18,N'_item_menu_type',N'category');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
18,18,N'_item_menu_cat_parent',N'9');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
27,23,N'_item_menu_type',N'custom');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
28,23,N'_item_menu_url',N'/');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
30,64,N'_thumbnail_id',N'49');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
32,66,N'_thumbnail_id',N'52');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
33,67,N'_thumbnail_id',N'47');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
34,68,N'_thumbnail_id',N'35');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
36,69,N'_thumbnail_id',N'57');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
38,65,N'_thumbnail_id',N'50');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
39,70,N'_thumbnail_id',N'37');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
40,71,N'_thumbnail_id',N'26');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
41,72,N'_thumbnail_id',N'28');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
42,73,N'_thumbnail_id',N'46');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
43,74,N'_thumbnail_id',N'33');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
44,75,N'_thumbnail_id',N'38');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
45,76,N'_thumbnail_id',N'57');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
46,77,N'_thumbnail_id',N'59');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
48,78,N'_thumbnail_id',N'24');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
49,79,N'_thumbnail_id',N'52');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
50,80,N'_thumbnail_id',N'55');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
51,81,N'_thumbnail_id',N'56');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
52,82,N'_thumbnail_id',N'42');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
53,83,N'_thumbnail_id',N'31');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
54,84,N'_thumbnail_id',N'38');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
55,85,N'_thumbnail_id',N'36');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
57,86,N'_thumbnail_id',N'87');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
61,88,N'_thumbnail_id',N'89');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
64,91,N'_thumbnail_id',N'92');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
65,93,N'_thumbnail_id',N'94');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
67,95,N'_thumbnail_id',N'96');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
68,97,N'_thumbnail_id',N'98');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
69,99,N'_thumbnail_id',N'100');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
70,101,N'_thumbnail_id',N'102');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
71,103,N'_thumbnail_id',N'104');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
85,76,N'CountView',N'2');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
118,99,N'CountView',N'1');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
130,109,N'_thumbnail_id',N'110');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
294,119,N'_item_menu_type',N'page');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
295,119,N'_item_menu_post_parent',N'116');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
303,78,N'CountView',N'1');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
304,78,N'CountView',N'1');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
364,78,N'CountView',N'15');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
384,74,N'CountView',N'7');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
432,101,N'CountView',N'13');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
497,77,N'CountView',N'5');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
547,73,N'CountView',N'14');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
563,79,N'CountView',N'17');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
576,81,N'CountView',N'8');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
591,122,N'_item_menu_type',N'category');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
592,122,N'_item_menu_cat_parent',N'1');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
593,123,N'_item_menu_type',N'category');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
594,123,N'_item_menu_cat_parent',N'6');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
595,124,N'_item_menu_type',N'category');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
596,124,N'_item_menu_cat_parent',N'9');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
597,125,N'_item_menu_type',N'category');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
598,125,N'_item_menu_cat_parent',N'23');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
599,126,N'_item_menu_type',N'custom');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
600,126,N'_item_menu_url',N'/');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
601,66,N'CountView',N'3');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
602,71,N'CountView',N'6');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
608,84,N'CountView',N'26');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
612,103,N'CountView',N'22');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
619,120,N'CountView',N'10');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
620,67,N'CountView',N'5');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
623,91,N'CountView',N'51');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
624,86,N'CountView',N'25');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
626,88,N'CountView',N'23');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
628,82,N'CountView',N'38');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
629,80,N'CountView',N'15');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
630,93,N'CountView',N'4');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
632,85,N'CountView',N'22');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
633,83,N'CountView',N'26');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
636,72,N'CountView',N'4');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
637,NULL,N'page_template',N'default');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
641,NULL,N'page_template',N'default');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
642,NULL,N'page_template',N'default');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
644,116,N'page_template',N'contact');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
648,107,N'CountView',N'15');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
653,133,N'_thumbnail_id',N'134');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
654,120,N'_thumbnail_id',N'121');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
655,111,N'_thumbnail_id',N'112');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
656,107,N'_thumbnail_id',N'26');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
657,105,N'_thumbnail_id',N'106');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
658,135,N'_thumbnail_id',N'136');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
663,97,N'CountView',N'2');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
664,105,N'CountView',N'82');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
665,111,N'CountView',N'53');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
683,NULL,N'_sticky',N'sticky');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
684,NULL,N'_keyword',N'fds');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
685,NULL,N'_description',N'fdsfdsfdsfsfds');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
686,95,N'CountView',N'3');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
687,109,N'CountView',N'21');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
689,135,N'CountView',N'5');
GO
INSERT INTO [PostMeta] ([PostMetaID],[PostID],[PMetaKey],[PMetaValue]) VALUES (
690,133,N'CountView',N'4');
GO
SET IDENTITY_INSERT [PostMeta] OFF;
GO
SET IDENTITY_INSERT [Options] ON;
GO
INSERT INTO [Options] ([OptionID],[OptionName],[OptionValue],[Autoload]) VALUES (
1,N'current_theme',N'blog',NULL);
GO
INSERT INTO [Options] ([OptionID],[OptionName],[OptionValue],[Autoload]) VALUES (
2,N'blogname',N'News',NULL);
GO
INSERT INTO [Options] ([OptionID],[OptionName],[OptionValue],[Autoload]) VALUES (
3,N'blogdescription',N'Technology Blog',NULL);
GO
INSERT INTO [Options] ([OptionID],[OptionName],[OptionValue],[Autoload]) VALUES (
4,N'admin_email',N'thanhnhuan@gmail.com',NULL);
GO
INSERT INTO [Options] ([OptionID],[OptionName],[OptionValue],[Autoload]) VALUES (
5,N'users_can_register',N'on',NULL);
GO
INSERT INTO [Options] ([OptionID],[OptionName],[OptionValue],[Autoload]) VALUES (
6,N'default_category',N'',NULL);
GO
INSERT INTO [Options] ([OptionID],[OptionName],[OptionValue],[Autoload]) VALUES (
7,N'mailserver_url',N'smtp.gmail.com',NULL);
GO
INSERT INTO [Options] ([OptionID],[OptionName],[OptionValue],[Autoload]) VALUES (
8,N'mailserver_login',N'namlongqn@gmail.com',NULL);
GO
INSERT INTO [Options] ([OptionID],[OptionName],[OptionValue],[Autoload]) VALUES (
9,N'mailserver_port',N'465',NULL);
GO
INSERT INTO [Options] ([OptionID],[OptionName],[OptionValue],[Autoload]) VALUES (
10,N'mailserver_pass',N'12346Abc_nl',NULL);
GO
INSERT INTO [Options] ([OptionID],[OptionName],[OptionValue],[Autoload]) VALUES (
11,N'default_email_category',N'',NULL);
GO
INSERT INTO [Options] ([OptionID],[OptionName],[OptionValue],[Autoload]) VALUES (
12,N'posts_per_page',N'20',NULL);
GO
INSERT INTO [Options] ([OptionID],[OptionName],[OptionValue],[Autoload]) VALUES (
13,N'thumbnail_size_w',N'150',NULL);
GO
INSERT INTO [Options] ([OptionID],[OptionName],[OptionValue],[Autoload]) VALUES (
14,N'thumbnail_size_h',N'150',NULL);
GO
INSERT INTO [Options] ([OptionID],[OptionName],[OptionValue],[Autoload]) VALUES (
15,N'thumbnail_crop',N'0',NULL);
GO
INSERT INTO [Options] ([OptionID],[OptionName],[OptionValue],[Autoload]) VALUES (
16,N'medium_size_w',N'350',NULL);
GO
INSERT INTO [Options] ([OptionID],[OptionName],[OptionValue],[Autoload]) VALUES (
17,N'medium_size_h',N'350',NULL);
GO
INSERT INTO [Options] ([OptionID],[OptionName],[OptionValue],[Autoload]) VALUES (
18,N'large_size_w',N'1024',NULL);
GO
INSERT INTO [Options] ([OptionID],[OptionName],[OptionValue],[Autoload]) VALUES (
19,N'large_size_h',N'768',NULL);
GO
SET IDENTITY_INSERT [Options] OFF;
GO
SET IDENTITY_INSERT [Comments] ON;
GO
INSERT INTO [Comments] ([CommentID],[PostID],[AuthorName],[AuthorEmail],[AuthorUrl],[AuthorIP],[DateCreated],[CommentContent],[Approved],[Agent],[CommentType],[CommentParent],[UserID]) VALUES (
2,79,N'Thanh Nhuan',N'thanhnhuan@gmail.com',NULL,N'127.0.0.1',{ts '2016-08-12 21:29:00.000'},N'Hello world!',N'1',N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.82 Safari/537.36',N'post',0,1);
GO
SET IDENTITY_INSERT [Comments] OFF;
GO
SET IDENTITY_INSERT [CommentMeta] OFF;
GO
SET IDENTITY_INSERT [Category] ON;
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
1,N'Tin tức',N'tin-tuc',N'category',N'',0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
2,N'Điện thoại',N'dien-thoai',N'category',N'',1,6);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
3,N'Laptop',N'laptop',N'category',N'',1,0);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
4,N'PC',N'pc',N'category',N'',1,4);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
5,N'Máy tính bảng',N'may-tinh-bang',N'category',N'',1,0);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
6,N'Tản mạn',N'tan-man',N'category',N'',0,5);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
7,N'Ý tưởng',N'y-tuong',N'category',N'',6,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
8,N'Sản phẩm',N'san-pham',N'category',N'',6,2);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
9,N'Internet',N'internet',N'category',N'',0,20);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
10,N'Media',N'media',N'category',N'',9,0);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
11,N'Digital Marketing',N'digital-marketing',N'category',N'',9,0);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
22,N'Primary Menu',N'primary-menu',N'nav-menu',N'Menu',0,11);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
23,N'Video',N'video',N'category',N'',0,2);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
24,N'du lịch',N'du-lich',N'tag',N'',0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
25,N'giá rẻ',N'gia-re',N'tag',N'',0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
26,N'Google',N'google',N'tag',N'',0,2);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
27,N'máy bay',N'may-bay',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
28,N'Cyanogen',N'cyanogen',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
29,N'Obi Worldphone',N'obi-worldphone',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
30,N'Qualcomm',N'qualcomm',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
32,N'cuộc chiến',N'cuoc-chien',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
33,N'hợp tác',N'hop-tac',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
34,N'Kaspersky Lab',N'kaspersky-lab',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
35,N'ransomware',N'ransomware',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
36,N'game',N'game',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
37,N'hữu ích',N'huu-ich',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
38,N'Pokemon GO',N'pokemon-go',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
39,N'sai lầm',N'sai-lam',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
40,N'Verizon',N'verizon',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
41,N'Yahoo',N'yahoo',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
42,N'sáp nhập',N'sap-nhap',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
43,N'thương vụ',N'thuong-vu',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
44,N'Trung Quốc',N'trung-quoc',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
45,N'Uber',N'uber',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
46,N'gọi điện',N'goi-dien',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
47,N'khẩn cấp',N'khan-cap',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
48,N'điện thoại phổ thông',N'dien-thoai-pho-thong',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
49,N'đơn giản',N'don-gian',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
50,N'Michael Bloomberg',N'michael-bloomberg',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
51,N'truyền thông',N'truyen-thong',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
52,N'tỷ phú',N'ty-phu',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
53,N'Facebook',N'facebook',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
54,N'xu hướng',N'xu-huong',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
55,N'thủ thuật',N'thu-thuat',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
56,N'Google drive',N'google-drive',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
57,N'google voice',N'google-voice',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
58,N'công cụ',N'cong-cu',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
59,N'hiệu suất ứng dụng Drive',N'hieu-suat-ung-dung-drive',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
60,N'bảo mật mống mắt',N'bao-mat-mong-mat',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
61,N'Galaxy Note7',N'galaxy-note7',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
62,N'thông số kỹ thuật',N'thong-so-ky-thuat',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
63,N'USB Type-C',N'usb-type-c',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
64,N'Secondary Menu',N'secondary-menu',N'nav-menu',N'Menu',0,5);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
76,N'Android 6',N'android-6',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
77,N'ảnh thực tế',N'anh-thuc-te',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
78,N'BlackBerry DTEK50',N'blackberry-dtek50',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
79,N'BlackBerry Neon',N'blackberry-neon',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
80,N'mạng xã hội',N'mang-xa-hoi',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
81,N'Truyền thông xã hội',N'truyen-thong-xa-hoi',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
82,N'chiến dịch marketing',N'chien-dich-marketing',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
83,N'công cụ marketing',N'cong-cu-marketing',N'tag',NULL,0,1);
GO
INSERT INTO [Category] ([CategoryID],[CategoryName],[Slug],[CategoryType],[Description],[CategoryParent],[Count]) VALUES (
84,N'khởi nghiệp kinh doanh',N'khoi-nghiep-kinh-doanh',N'tag',NULL,0,1);
GO
SET IDENTITY_INSERT [Category] OFF;
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
1,70);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
2,69);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
2,77);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
2,83);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
2,84);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
2,107);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
2,120);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
4,72);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
4,74);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
4,85);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
4,109);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
6,66);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
6,67);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
6,71);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
6,73);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
6,78);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
7,78);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
8,66);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
8,67);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
9,64);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
9,65);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
9,68);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
9,79);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
9,80);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
9,81);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
9,82);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
9,86);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
9,88);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
9,91);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
9,93);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
9,95);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
9,97);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
9,99);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
9,101);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
9,103);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
9,105);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
9,111);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
9,133);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
9,135);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
22,10);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
22,11);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
22,12);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
22,13);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
22,14);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
22,15);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
22,16);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
22,17);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
22,18);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
22,23);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
22,119);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
23,75);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
23,76);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
24,86);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
25,86);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
26,86);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
26,105);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
27,86);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
28,88);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
29,88);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
30,88);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
32,91);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
33,91);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
34,91);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
35,91);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
36,93);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
37,93);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
38,93);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
39,95);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
40,95);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
41,95);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
42,97);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
43,97);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
44,97);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
45,97);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
46,99);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
47,99);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
48,99);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
49,99);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
50,103);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
51,103);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
52,103);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
53,105);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
54,105);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
55,109);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
56,109);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
57,109);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
58,109);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
59,109);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
60,120);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
61,120);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
62,120);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
63,120);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
64,122);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
64,123);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
64,124);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
64,125);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
64,126);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
76,133);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
77,133);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
78,133);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
79,133);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
80,135);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
81,135);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
82,135);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
83,135);
GO
INSERT INTO [CategoryRelationships] ([CategoryID],[PostID]) VALUES (
84,135);
GO
ALTER TABLE [Roles] ADD CONSTRAINT [PK__Roles__0000000000000253] PRIMARY KEY ([RoleID]);
GO
ALTER TABLE [Users] ADD CONSTRAINT [PK__Users__00000000000001F8] PRIMARY KEY ([UserID]);
GO
ALTER TABLE [UserMeta] ADD CONSTRAINT [PK__UserMeta__0000000000000206] PRIMARY KEY ([UserMetaID]);
GO
ALTER TABLE [Posts] ADD CONSTRAINT [PK_Posts] PRIMARY KEY ([PostID]);
GO
ALTER TABLE [PostMeta] ADD CONSTRAINT [PK__PostMeta__00000000000001A0] PRIMARY KEY ([PostMetaID]);
GO
ALTER TABLE [Options] ADD CONSTRAINT [PK__Options__000000000000021A] PRIMARY KEY ([OptionID]);
GO
ALTER TABLE [Comments] ADD CONSTRAINT [PK__Comments__00000000000001C9] PRIMARY KEY ([CommentID]);
GO
ALTER TABLE [CommentMeta] ADD CONSTRAINT [PK__CommentMeta__00000000000001DD] PRIMARY KEY ([CommentMetaID]);
GO
ALTER TABLE [Category] ADD CONSTRAINT [PK_Terms] PRIMARY KEY ([CategoryID]);
GO
ALTER TABLE [CategoryRelationships] ADD CONSTRAINT [Key8] PRIMARY KEY ([CategoryID],[PostID]);
GO
CREATE INDEX [IX_Relationship15] ON [UserMeta] ([UserID] ASC);
GO
CREATE INDEX [IX_Relationship19] ON [Posts] ([UserID] ASC);
GO
CREATE INDEX [IX_Relationship14] ON [PostMeta] ([PostID] ASC);
GO
CREATE INDEX [IX_Relationship1] ON [Comments] ([UserID] ASC);
GO
CREATE INDEX [IX_Relationship17] ON [Comments] ([PostID] ASC);
GO
CREATE INDEX [IX_Relationship16] ON [CommentMeta] ([CommentID] ASC);
GO
ALTER TABLE [Users] ADD CONSTRAINT [FK_Users_Roles] FOREIGN KEY ([RoleID]) REFERENCES [Roles]([RoleID]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [UserMeta] ADD CONSTRAINT [FK_Users_UserMeta] FOREIGN KEY ([UserID]) REFERENCES [Users]([UserID]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [Posts] ADD CONSTRAINT [FK_Users_Posts] FOREIGN KEY ([UserID]) REFERENCES [Users]([UserID]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [PostMeta] ADD CONSTRAINT [FK_Posts_PostMeta] FOREIGN KEY ([PostID]) REFERENCES [Posts]([PostID]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [Comments] ADD CONSTRAINT [FK_Comments_Posts] FOREIGN KEY ([PostID]) REFERENCES [Posts]([PostID]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [Comments] ADD CONSTRAINT [FK_Comments_Users] FOREIGN KEY ([UserID]) REFERENCES [Users]([UserID]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [CommentMeta] ADD CONSTRAINT [FK_Comments_CommentMeta] FOREIGN KEY ([CommentID]) REFERENCES [Comments]([CommentID]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [CategoryRelationships] ADD CONSTRAINT [PK_FK_Category_Post] FOREIGN KEY ([CategoryID]) REFERENCES [Category]([CategoryID]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [CategoryRelationships] ADD CONSTRAINT [PK_FK_Post_Category] FOREIGN KEY ([PostID]) REFERENCES [Posts]([PostID]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

