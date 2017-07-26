--=================================
DROP VIEW view_GetAllCategory;

CREATE VIEW view_GetAllCategory
AS
SELECT * 
FROM Category
WHERE CategoryType='category'

SELECT * FROM view_GetAllCategory;

--=================================
DROP VIEW view_GetAllTag;

CREATE VIEW view_GetAllTag
AS
SELECT * 
FROM Category
WHERE CategoryType='tag'

SELECT * FROM view_GetAllTag;
--=================================
DROP VIEW view_GetAllPost;

CREATE VIEW view_GetAllPost
AS
SELECT * 
FROM Posts
WHERE type = 'post'


SELECT * FROM view_GetAllPost;
--=================================

DROP VIEW view_GetAllPostPublish;

CREATE VIEW view_GetAllPostPublish
AS
SELECT * 
FROM Posts
WHERE status = 'publish'
AND created <= getdate()
AND type='post'


SELECT * FROM view_GetAllPostPublish;
--=================================

DROP VIEW view_GetAllImage;

CREATE VIEW view_GetAllImage
AS
SELECT * 
FROM Posts
WHERE type='attachment'


SELECT * FROM view_GetAllImage;
--=================================

DROP VIEW view_GetAllMenuItem;

CREATE VIEW view_GetAllMenuItem
AS
SELECT * 
FROM Posts
WHERE type='nav_menu_item'


SELECT * FROM view_GetAllMenuItem;
--=================================

DROP VIEW view_GetAllPage;

CREATE VIEW view_GetAllPage
AS
SELECT * 
FROM Posts
WHERE type='page'


SELECT * FROM view_GetAllPage;
--=================================
drop View view_GetAllTagHavePost

create View view_GetAllTagHavePost
as
select distinct c.CategoryID, c.CategoryName, c.Slug, c.Count
from posts p, categoryrelationships r, category c
where p.PostID = r.PostID
and c.CategoryID = r.CategoryID
and c.CategoryType = 'tag'
