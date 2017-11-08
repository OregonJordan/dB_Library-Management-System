/* Stored Procedure 2:
How many copies of the book titled "The Lost Tribe"
 are owned by each library branch?
 */
USE Library_Management_System
GO
CREATE PROCEDURE dbo.LMS_BookTitleCopyPerBranch @BookTitle varchar(30)
AS
SELECT b.Title, c.BranchName, a.No_Of_Copies
	FROM tbl_Book_copies a
	INNER JOIN tbl_Book b ON a.Bookid = b.Bookid
	INNER JOIN tbl_Library_Branch c ON a.Branchid = c.Branchid
	WHERE b.Title = @BookTitle
GO
;
EXECUTE dbo.LMS_BookTitleCopyPerBranch @BookTitle = 'The Lost Tribe'
;
