/* Stored Procedure 1:
How many copies of the book titled "The Lost Tribe" 
are owned by the library branch whose name is "Sharpstown"?
*/
USE Library_Management_System
GO
CREATE PROCEDURE dbo.LMS_BookTitle_BranchName @BookTitle varchar(30), @BranchName varchar(50)
AS
SELECT b.Title, c.BranchName, a.No_Of_Copies
	FROM tbl_Book_copies a
	INNER JOIN tbl_Book b ON a.Bookid = b.Bookid
	INNER JOIN tbl_Library_Branch c ON a.Branchid = c.Branchid
	WHERE b.Title = @BookTitle AND c.BranchName = @BranchName
GO
;
EXECUTE dbo.LMS_BookTitle_BranchName @BookTitle = 'The Lost Tribe', @BranchName  = 'Sharpstown'
;
