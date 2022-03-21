CREATE TABLE Author(
    authorID int,
    authorName varchar(20),
    PRIMARY KEY (authorID)
);

CREATE TABLE Book
(
    bookID   int,
    bookName varchar(20),
    authorID int,
    amount   numeric(7, 2),
    rating   int,
    bookType varchar(25),
    PRIMARY KEY (bookID),
    CONSTRAINT book_authorID_fkey FOREIGN KEY (authorID) REFERENCES Author (authorID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT check_note CHECK ( Book.rating >= 1 AND Book.rating <= 10),
    CONSTRAINT check_amount CHECK ( amount > 0 ),
    CONSTRAINT check_bookType CHECK ( bookType IN ('Fiction-adulte', 'Non-fiction-adulte', 'Fiction-jeunesse',
                                                   'Non-fiction-jeunesse'))
);

ALTER TABLE Author ADD author_sum_rating int default 0;

CREATE TRIGGER update_author_sum AFTER UPDATE OF rating ON Book FOR EACH ROW EXECUTE PROCEDURE update_author_rating();

CREATE FUNCTION update_author_rating() RETURNS trigger AS
    $BODY$
    BEGIN
        UPDATE Author SET author_sum_rating = (SELECT SUM(rating) FROM Book WHERE Author.authorID = Book.authorID) WHERE Book.authorID = Author.authorID;
    end;
$BODY$ language plpgsql
