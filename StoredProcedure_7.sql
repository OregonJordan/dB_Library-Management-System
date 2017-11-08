/* Stored Procedure 7:
For each book authored (or co-authored) by "Stephen King",
 retrieve the title and the number of copies owned by the library branch whose name is "Central".
 */
USE Library_Management_System
GO
CREATE PROCEDURE dbo.LMS_BranchTitleCount_ByAuthor @AuthorName varchar(50), @BranchName varchar(50)
AS
SELECT DISTINCT(a.Title), c.No_Of_Copies
	FROM tbl_Book a
	INNER JOIN tbl_BookAuthors b ON b.Bookid = a.Bookid
	INNER JOIN tbl_Book_Copies c ON c.Bookid = a.Bookid
	INNER JOIN tbl_Library_Branch e ON e.Branchid = c.Branchid
	WHERE b.AuthorName = @AuthorName
	AND e.BranchName = @BranchName
GO
;
EXECUTE dbo.LMS_BranchTitleCount_ByAuthor @AuthorName = 'Stephen King', @BranchName = 'Central'
;

						
