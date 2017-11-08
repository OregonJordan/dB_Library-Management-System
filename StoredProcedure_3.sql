/* Stored Procedure 3:
Retrieve the names of all borrowers
 who do not have any books checked out.
 */
USE Library_Management_System
GO
CREATE PROCEDURE dbo.LMS_NoItemsOutCheck @DueDate varchar(30)
AS
SELECT DISTINCT(a.Name)
	FROM tbl_Borrower a
	INNER JOIN tbl_Book_Loans b ON a.CardNo = b.CardNo
	WHERE b.DueDate !> @DueDate AND b.DueDate != @DueDate
GO
;
EXECUTE dbo.LMS_NoItemsOutCheck @DueDate = '11/30/2017'
;


						
