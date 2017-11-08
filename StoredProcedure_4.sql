/* Stored Procedure 4:
For each book that is loaned out from the "Sharpstown" branch
 and whose DueDate is today (Use 11/14/2017 for this example), retrieve
  the book title, the borrower's name, and the borrower's address.
 */
USE Library_Management_System
GO
CREATE PROCEDURE dbo.LMS_BorrowerInfo_DueDateToday @DueDate varchar(30), @BranchName varchar(50)
AS
SELECT c.Title, a.Name, a.[Address]
	FROM tbl_Borrower a
	INNER JOIN tbl_Book_Loans b ON a.CardNo = b.CardNo
	INNER JOIN tbl_Book c ON b.Bookid = c.Bookid
	INNER JOIN tbl_Library_Branch e ON b.Branchid = e.Branchid
	WHERE b.DueDate = @DueDate  AND e.BranchName = @BranchName
GO
;
EXECUTE dbo.LMS_BorrowerInfo_DueDateToday @DueDate = '11/14/2017', @BranchName = 'Sharpstown'
;
