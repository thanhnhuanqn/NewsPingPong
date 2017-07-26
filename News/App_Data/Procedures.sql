
DROP PROCEDURE proc_GetCategoryName;

CREATE PROCEDURE proc_GetCategoryName(@slug nvarchar(255) = null)
AS
BEGIN
	SELECT c.CategoryID, c.CategoryName, c.Slug, c.CategoryType
	FROM Category c
	WHERE c.Slug = @slug
END;

EXEC proc_GetCategoryName 'video';



DROP PROCEDURE proc_GetPostsByCategory;

CREATE PROCEDURE proc_GetPostsByCategory(@slug nvarchar(255) = NULL, @take int = 10, @current_post nvarchar(255) = NULL)
AS
BEGIN
	if (@current_post IS NULL)
	BEGIN
		SELECT TOP (@take * 1) p.*
		FROM Posts p, Category c, CategoryRelationships r
		WHERE p.PostID = r.PostID AND c.CategoryID = r.CategoryID
		AND c.Slug = @slug AND p.Type = 'post' AND p.Status = 'publish'
		AND p.Modified <= GETDATE()
		ORDER BY p.PostID DESC
	END
	else
	BEGIN
		SELECT TOP (@take * 1) p.*
		FROM Posts p, Category c, CategoryRelationships r
		WHERE p.PostID = r.PostID AND c.CategoryID = r.CategoryID
		AND c.Slug = @slug AND p.Type = 'post' AND p.Status = 'publish'
		AND p.Modified <= GETDATE() AND p.Name != @current_post
		ORDER BY p.PostID DESC
	END;
END;

EXEC proc_GetPostsByCategory 'internet', 10, 'flux-startup-tach-khoi-google-de-phat-trien-hon';


DROP PROCEDURE proc_GetPostsHot;

CREATE PROCEDURE proc_GetPostsHot(@slug nvarchar(255) = NULL, @take int = 10)
AS
BEGIN
	SELECT TOP (@take * 1) p.PostID, p.Title, p.Excerpt
	FROM Posts p, Category c, CategoryRelationships r
	WHERE p.PostID = r.PostID AND c.CategoryID = r.CategoryID
		AND c.Slug = @slug AND p.Type = 'post' AND p.Status = 'publish'
		AND p.Modified <= GETDATE()
	ORDER BY p.PostID DESC
END;

EXEC proc_GetPostsHot 'internet', 10;

DROP PROCEDURE proc_GetAllRecent;

CREATE PROCEDURE proc_GetAllRecent(@take int = 10)
AS
BEGIN
	SELECT TOP (@take * 1) p.PostID, p.Name, p.Title, p.Created, p.CommentCount
	FROM Posts p
	WHERE p.Type = 'post' AND p.Status = 'publish'
		AND p.Modified <= GETDATE()
	ORDER BY p.PostID DESC
END;

EXEC proc_GetAllRecent 10;

--==================================================
DROP PROCEDURE proc_GetPost;

CREATE PROCEDURE proc_GetPost(@slug nvarchar(255) = NULL)
AS
BEGIN
	SELECT TOP 1 p.PostID, p.Name, p.Title, p.Content, p.Created, p.CommentCount, p.UserID
	FROM Posts p
	WHERE p.Type = 'post' 
		AND p.Status = 'publish'
		AND p.Modified <= GETDATE()	
		AND p.Name = @slug
END;

EXEC proc_GetPost 'danh-gia-obi-worldphone-mv1-hieu-nang-tam-thiet-ke-gay-to-mo';



DROP PROCEDURE proc_GetCategoryByPostName;

CREATE PROCEDURE proc_GetCategoryByPostName(@slug nvarchar(255), @typeCategory nvarchar(100) = null)
AS
BEGIN
	if (@typeCategory IS NULL)
	BEGIN
		SELECT top 1 c.*
		FROM Posts p, Category c, CategoryRelationships r
		WHERE p.PostID = r.PostID AND c.CategoryID = r.CategoryID
		AND p.Name = @slug AND p.Type = 'post' AND p.Status = 'publish'
		AND p.Modified <= GETDATE()	AND c.CategoryType = 'category'
	END;
	else
	BEGIN
		SELECT c.*
		FROM Posts p, Category c, CategoryRelationships r
		WHERE p.PostID = r.PostID AND c.CategoryID = r.CategoryID
		AND p.Name = @slug AND p.Type = 'post' AND p.Status = 'publish'
		AND p.Modified <= GETDATE()	AND c.CategoryType = @typeCategory
	END;
END;

EXEC proc_GetCategoryByPostName 'danh-gia-obi-worldphone-mv1-hieu-nang-tam-thiet-ke-gay-to-mo', 'category';



--===========================================
DROP PROCEDURE proc_GetTopView;

CREATE PROCEDURE proc_GetTopView(@key varchar(255), @take int)
AS
BEGIN
	SELECT top (1 * @take) p.PostID, Title, Name, Created, CommentCount,  CONVERT(INT, CONVERT(VARCHAR(MAX),PMetaValue)) AS CountView
	FROM posts p, postmeta pm
	WHERE p.PostID = pm.PostID 
		AND p.Status = 'publish'
		AND p.Created <= getdate()
		AND pm.PMetaKey = @key
		AND pm.PMetaValue IS NOT NULL		
	ORDER BY CountView DESC

END;

EXEC proc_GetTopView 'CountView'

--===========================================
drop procedure proc_PostType

create procedure proc_PostType(@status nvarchar(100), @type varchar(100) = 'post')
as
if (@type IS NULL)
BEGIN
select count(*) as CountPost
from posts p
where p.Type = @type
END
ELSE
BEGIN
	select count(*) as CountPost
	from posts p
	where p.Type = @type and P.Status = @status
END

exec proc_PostType 'publish', 'post'

--===========================================
drop procedure proc_GetTagsByPost

CREATE PROCEDURE proc_GetTagsByPost(@post_name nvarchar(255) = NULL)
AS
BEGIN
	select c.CategoryName, c.Slug
	from category c, categoryrelationships r, posts p
	where c.CategoryID = r.CategoryID
	and p.PostID = r.PostID
	and p.Name = @post_name
	and c.CategoryType = 'tag'
END;

exec proc_GetTagsByPost 'samsung-galaxy-note7-ra-mat-19-trieu-chong-nuoc-bao-mat-mong-mat'