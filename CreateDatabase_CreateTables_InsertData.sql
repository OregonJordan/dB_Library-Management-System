CREATE DATABASE Library_Management_System
GO
;
USE Library_Management_System
GO
;
/* ----------------CREATING TABLES-------------*/
Create Table tbl_Publisher (								
	Name VARCHAR(50) PRIMARY KEY NOT NULL,
	[Address] VARCHAR(50) NOT NULL,
	Phone VARCHAR(30) NOT NULL
);

Create Table tbl_Book (								
	Bookid INT PRIMARY KEY NOT NULL IDENTITY(1000,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_Name REFERENCES tbl_Publisher(Name) ON UPDATE CASCADE ON DELETE CASCADE
);

Create Table tbl_BookAuthors (								
	Bookid INT NOT NULL CONSTRAINT fk_Bookid REFERENCES tbl_Book(Bookid) ON UPDATE CASCADE ON DELETE CASCADE,----FK to Bookid ON tbl_Book
	AuthorName VARCHAR(50) NOT NULL
);

Create Table tbl_Borrower (								
	CardNo INT PRIMARY KEY NOT NULL IDENTITY(2000,1),
	Name VARCHAR(50) NOT NULL,
	[Address] VARCHAR(50) NOT NULL,
	Phone VARCHAR(25) NOT NULL
);

Create Table tbl_Library_Branch (								
	Branchid INT PRIMARY KEY NOT NULL IDENTITY(3000,1),
	BranchName VARCHAR(50) NOT NULL,
	[Address] VARCHAR(50) NOT NULL
);

Create Table tbl_Book_Loans (								
	Bookid INT NOT NULL,
	Branchid INT NOT NULL CONSTRAINT fk_Branchid REFERENCES tbl_Library_Branch(Branchid) ON UPDATE CASCADE ON DELETE CASCADE,----FK to Branchid ON tbl_Library_Branch
	CardNo INT NOT NULL CONSTRAINT fk_Borrower REFERENCES tbl_Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut VARCHAR(25) NOT NULL,
	DueDate VARCHAR(25) NOT NULL
);

Create Table tbl_Book_Copies (								
	Bookid INT NOT NULL,
	Branchid INT NOT NULL, 
	No_Of_Copies INT NOT NULL
);

/* ----------------INSERTING DATA INTO TABLES-------------*/
INSERT INTO tbl_Publisher
	(Name,[Address], Phone)
	VALUES
	('Western Publishers','123 NW Western Ave. OR. 97007', '503-343-2466'),
	('RoundHouse Publishing','Freemont St. WI. 98908', '686-555-2146'),
	('ClearWater Printing.inc','1 New York NY, 99093', '679-232-4444'),
	('Poke Paperworks','Tmowoko Japan, 1341 St. Suite 1', '446-111-4334')
;

INSERT INTO tbl_Book
	(Title, PublisherName)
	VALUES
	('The Lost Tribe','Western Publishers'),
	('Don Quixote','RoundHouse Publishing'),
	('In Search of Lost Time','ClearWater Printing.inc'),
	('Ulysses','Poke Paperworks'),
	('The Odyssey','Western Publishers'),
	('War and Peace','RoundHouse Publishing'),
	('Moby Dick','ClearWater Printing.inc'),
	('The Divine Comedy','Poke Paperworks'),
	('Hamlet','Western Publishers'),
	('The Adventures of Huckleberry Finn','RoundHouse Publishing'),
	('The Great Gatsby','ClearWater Printing.inc'),
	('The Iliad','Poke Paperworks'),
	('One Hundred Years of Solitude','Western Publishers'),
	('Madame Bovary','RoundHouse Publishing'),
	('Crime and Punishment','ClearWater Printing.inc'),
	('The Brothers Karamazov','Poke Paperworks'),
	('Pride and Prejudice','Western Publishers'),
	('Wuthering Heights','RoundHouse Publishing'),
	('The Sound and the Fury','ClearWater Printing.inc'),
	('Lolita','Poke Paperworks'),
	('Misery','Poke Paperworks'),
	('The Shining','Poke Paperworks')
;

INSERT INTO tbl_BookAuthors
	(Bookid, AuthorName)
	VALUES
	(1000,'Mark Lee'),
	(1001,'Miguel de Cervantes'),
	(1002,'Marcel Proust'),
	(1003,'James Joyce'),
	(1004,'Homer'),
	(1005,'Leo Tolstoy'),
	(1006,'Herman Melville'),
	(1007,'Dante Alighieri'),
	(1008,'William Shakespeare'),
	(1009,'Mark Twain'),
	(1010,'F. Scott Fitzgerald'),
	(1011,'Homer'),
	(1012,'Gabriel Garcia Marquez'),
	(1013,'Gustave Flaubert'),
	(1014,'Fyodor Dostoyevsky'),
	(1015,'Fyodor Dostoyevsky'),
	(1016,'Jane Austen'),
	(1017,'Emily Brontë'),
	(1018,'William Faulkner'),
	(1019,'Vladimir Nabokov'),
	(1020,'Stephen King'),
	(1021,'Stephen King')
;

INSERT INTO tbl_Borrower
	(Name, [Address], Phone)
	VALUES
	('Jordan H','1144 sw Bowsers st. OR. 97007','352-346-6856'),
	('Betsy Rodgers','74 Western ave. WI. 89732','456-346-3785'),
	('Cliff Hanger','PO Box 7, VA. 82422','467-484-1345'),
	('Teddy Man','2462 N Plains st. NY. 82482','999-353-1346'),
	('Bob Boy','5555 5th ave. WA. 92744','575-246-3463'),
	('Sassy Class','NW Pie lane. CA. 24266','444-677-2462'),
	('Lilly	Clover','Yellow Book 12 Suite 3, WA. 98980','363-235-2647'),
	('Steve Zapos','134 Olympic Ave. 3rd floor suite 10, MI. 23476','686-346-7648')
;

INSERT INTO tbl_Library_Branch
	(BranchName, [Address])
	VALUES
	('Sharpstown','23 willow brook HI. 98232'),
	('Central','55 Middle Hights Wyoming 84848'),
	('South Hills Community Library','1200 SW Hillsdale CA. 78344'),
	('Central Valley Library District 12','91 Oliver st. WA. 24525'),
	('King County Public Library','PO Box 1234 Seattle, WA. 92884'),
	('Lower Peninsula River Way Library','911 Underwater 12ft, AK. 42525')
;

INSERT INTO tbl_Book_Copies
	(Bookid, Branchid, No_Of_Copies)
	VALUES
	(1000,3000,'3'),
	(1001,3000,'4'),
	(1002,3000,'2'),
	(1003,3000,'4'),
	(1004,3000,'17'),
	(1005,3000,'4'),
	(1006,3000,'5'),
	(1007,3000,'4'),
	(1008,3000,'5'),
	(1009,3000,'7'),
	(1010,3000,'8'),
	(1011,3000,'6'),
	(1012,3000,'3'),
	(1013,3000,'3'),
	(1014,3000,'6'),
	(1015,3000,'7'),
	(1016,3000,'1'),
	(1017,3000,'5'),
	(1018,3000,'6'),
	(1019,3000,'7'),
	(1020,3000,'9'),
	(1021,3000,'2'),

	(1000,3001,'3'),
	(1001,3001,'4'),
	(1002,3001,'2'),
	(1003,3001,'4'),
	(1004,3001,'17'),
	(1005,3001,'4'),
	(1006,3001,'5'),
	(1007,3001,'4'),
	(1008,3001,'5'),
	(1009,3001,'7'),
	(1010,3001,'8'),
	(1011,3001,'6'),
	(1012,3001,'3'),
	(1013,3001,'3'),
	(1014,3001,'6'),
	(1015,3001,'7'),
	(1016,3001,'1'),
	(1017,3001,'5'),
	(1018,3001,'6'),
	(1019,3001,'7'),
	(1020,3001,'9'),
	(1021,3001,'2'),

	(1000,3002,'3'),
	(1001,3002,'4'),
	(1002,3002,'2'),
	(1003,3002,'4'),
	(1004,3002,'17'),
	(1005,3002,'4'),
	(1006,3002,'5'),
	(1007,3002,'4'),
	(1008,3002,'5'),
	(1009,3002,'7'),
	(1010,3002,'8'),
	(1011,3002,'6'),
	(1012,3002,'3'),
	(1013,3002,'3'),
	(1014,3002,'6'),
	(1015,3002,'7'),
	(1016,3002,'1'),
	(1017,3002,'5'),
	(1018,3002,'6'),
	(1019,3002,'7'),
	(1020,3002,'9'),
	(1021,3002,'2'),

	(1000,3003,'3'),
	(1001,3003,'4'),
	(1002,3003,'2'),
	(1003,3003,'4'),
	(1004,3003,'17'),
	(1005,3003,'4'),
	(1006,3003,'5'),
	(1007,3003,'4'),
	(1008,3003,'5'),
	(1009,3003,'7'),
	(1010,3003,'8'),
	(1011,3003,'6'),
	(1012,3003,'3'),
	(1013,3003,'3'),
	(1014,3003,'6'),
	(1015,3003,'7'),
	(1016,3003,'1'),
	(1017,3003,'5'),
	(1018,3003,'6'),
	(1019,3003,'7'),
	(1020,3003,'9'),
	(1021,3003,'2'),

	(1000,3004,'3'),
	(1001,3004,'4'),
	(1002,3004,'2'),
	(1003,3004,'4'),
	(1004,3004,'17'),
	(1005,3004,'4'),
	(1006,3004,'5'),
	(1007,3004,'4'),
	(1008,3004,'5'),
	(1009,3004,'7'),
	(1010,3004,'8'),
	(1011,3004,'6'),
	(1012,3004,'3'),
	(1013,3004,'3'),
	(1014,3004,'6'),
	(1015,3004,'7'),
	(1016,3004,'1'),
	(1017,3004,'5'),
	(1018,3004,'6'),
	(1019,3004,'7'),
	(1020,3004,'9'),
	(1021,3004,'2'),

	(1000,3005,'3'),
	(1001,3005,'4'),
	(1002,3005,'2'),
	(1003,3005,'4'),
	(1004,3005,'17'),
	(1005,3005,'4'),
	(1006,3005,'5'),
	(1007,3005,'4'),
	(1008,3005,'5'),
	(1009,3005,'7'),
	(1010,3005,'8'),
	(1011,3005,'6'),
	(1012,3005,'3'),
	(1013,3005,'3'),
	(1014,3005,'6'),
	(1015,3005,'7'),
	(1016,3005,'1'),
	(1017,3005,'5'),
	(1018,3005,'6'),
	(1019,3005,'7'),
	(1020,3005,'9'),
	(1021,3005,'2')
;
			
INSERT INTO tbl_Book_Loans
	(Bookid, Branchid, CardNo, DateOut, DueDate)
	VALUES
	(1021,3000,2000,'11/07/2017','11/14/2017'),
	(1020,3000,2000,'11/07/2017','11/14/2017'),
	(1019,3000,2000,'11/07/2017','11/14/2017'),
	(1018,3000,2000,'11/07/2017','11/14/2017'),
	(1017,3000,2000,'11/07/2017','11/14/2017'),
	(1016,3000,2000,'11/07/2017','11/14/2017'),

	(1015,3001,2001,'11/06/2017','11/13/2017'),
	(1014,3001,2001,'11/06/2017','11/13/2017'),
	(1013,3001,2001,'11/06/2017','11/13/2017'),
	(1012,3001,2001,'11/06/2017','11/13/2017'),
	(1011,3001,2001,'11/06/2017','11/13/2017'),
	(1010,3001,2001,'11/06/2017','11/13/2017'),

	(1009,3002,2002,'11/05/2017','11/12/2017'),
	(1008,3002,2002,'11/05/2017','11/12/2017'),

	(1007,3003,2003,'11/04/2017','11/11/2017'),
	(1006,3004,2003,'11/04/2017','11/11/2017'),
	(1021,3003,2003,'11/04/2017','11/11/2017'),

	(1000,3005,2004,'11/03/2017','11/10/2017'),
	(1001,3005,2004,'11/03/2017','11/10/2017'),
	(1003,3005,2004,'11/03/2017','11/10/2017'),

	(1013,3004,2005,'11/06/2017','11/13/2017'),
	(1012,3004,2005,'11/06/2017','11/13/2017'),
	(1019,3004,2005,'11/06/2017','11/13/2017'),
	(1021,3004,2005,'11/06/2017','11/13/2017'),

	(1016,3002,2006,'11/05/2017','11/12/2017'),
	(1013,3002,2006,'11/05/2017','11/12/2017'),

	(1001,3001,2007,'11/01/2017','11/08/2017'),
	(1003,3001,2007,'11/01/2017','11/08/2017'),
	(1019,3003,2007,'11/01/2017','11/08/2017'),
	(1021,3004,2007,'11/01/2017','11/08/2017'),
	
	(1000,3001,2001,'10/31/2017','11/07/2017'),
	(1001,3001,2001,'10/31/2017','11/07/2017'),
	(1002,3002,2002,'10/30/2017','11/06/2017'),
	(1003,3002,2002,'10/30/2017','11/06/2017'),
	(1004,3003,2003,'10/29/2017','11/05/2017'),
	(1005,3004,2003,'10/29/2017','11/05/2017'),
	(1006,3003,2003,'10/29/2017','11/05/2017'),
	(1007,3005,2004,'11/08/2017','11/15/2017'),
	(1008,3005,2004,'11/08/2017','11/15/2017'),
	(1009,3005,2004,'11/08/2017','11/15/2017'),
	(1010,3004,2005,'11/09/2017','11/16/2017'),
	(1011,3004,2005,'11/09/2017','11/16/2017'),
	(1012,3004,2005,'11/09/2017','11/16/2017'),
	(1013,3004,2005,'11/09/2017','11/16/2017'),
	(1014,3002,2006,'11/10/2017','11/17/2017'),
	(1015,3002,2006,'11/10/2017','11/17/2017'),
	(1016,3005,2006,'11/10/2017','11/17/2017'),
	(1017,3005,2007,'11/11/2017','11/18/2017'),
	(1018,3005,2007,'11/11/2017','11/18/2017'),
	(1019,3005,2007,'11/11/2017','11/18/2017')
;
