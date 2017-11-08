/* Stored Procedure 5:
For each library branch, retrieve the branch name and the total number of books (Currently)
 loaned out from that branch.
  */
USE Library_Management_System
GO
CREATE PROCEDURE dbo.LMS_Branch_BooksCheckedoutCount @DueDate varchar(30)
AS
SELECT DISTINCT(a.BranchName), COUNT(DISTINCT b.Bookid) AS 'Total: Books Checked Out'
	FROM tbl_Library_Branch a
	INNER JOIN tbl_Book_Loans b ON a.Branchid = b.Branchid
	WHERE b.DueDate >= @DueDate
	GROUP BY a.BranchName
	ORDER BY [Total: Books Checked Out]
GO
;
EXECUTE dbo.LMS_Branch_BooksCheckedoutCount @DueDate = '11/07/2017'
;
