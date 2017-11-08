/* Stored Procedure 6:
Retrieve the names, addresses, and number of books checked out
 for all borrowers who have more than five books checked out.
 */
USE Library_Management_System
GO
CREATE PROCEDURE dbo.LMS_BorrowerInfo_TotalBooksCheckedOut  @DueDate varchar(30), @BookCount INT
AS
SELECT DISTINCT(a.Name), a.[Address], COUNT(b.Bookid) AS '# Of Books Checked Out'
	FROM tbl_Borrower a
	INNER JOIN tbl_Book_Loans b ON b.CardNo = a.CardNo
	WHERE b.DueDate >= @DueDate
	GROUP BY a.Name, a.[Address]
	HAVING COUNT(b.Bookid) > @BookCount
	ORDER BY [# Of Books Checked Out]
GO
;
EXECUTE dbo.LMS_BorrowerInfo_TotalBooksCheckedOut @DueDate = '11/07/2017', @BookCount = 5
;
