CREATE TABLE Author(
    authorID int,
    authorName varchar(20),
    PRIMARY KEY (authorID)
);

CREATE TABLE Book (
    bookID int,
    bookName varchar(20),
    authorID int,
    amount numeric(7,2),
    rating int,
    bookType varchar(25),
    PRIMARY KEY (bookID),
    CONSTRAINT book_authorID_fkey FOREIGN KEY (authorID) REFERENCES Author(authorID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT check_note CHECK ( Book.rating >=1 AND Book.rating <= 10),
    CONSTRAINT check_amount CHECK ( amount > 0 ),
    CONSTRAINT check_bookType CHECK ( bookType IN ('Fiction-adulte', 'Non-fiction-adulte', 'Fiction-jeunesse', 'Non-fiction-jeunesse'))
);