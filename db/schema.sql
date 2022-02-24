CREATE TABLE athletes (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) not null,
    identified_gender CHAR(1),
    dob DATE NOT NULL
);

INSERT INTO athletes (id, name, identified_gender, dob) VALUES
    (1, 'Andrew', 'm', '1975-12-01'),
    (2, 'Ayana', 'f', '1988-06-11'),
    (3, 'Hayden', 'm', '1996-07-24'),
    (4, 'August', 'm', '1999-09-09');

CREATE TABLE schema_migrations (
    migration varchar(255),
    migrated_at time,
    PRIMARY KEY (migration)
);

INSERT INTO schema_migrations (migration, migrated_at) VALUES
    ('20220214173000-create-athletes.sql', '2022-02-14 17:30:00');

INSERT INTO schema_migrations (migration, migrated_at) VALUES
    ('20220214175003-create-migrations.sql', '2022-02-14 17:50:03');

ALTER TABLE athletes RENAME COLUMN identified_gender TO gender;

INSERT INTO schema_migrations (migration, migrated_at) VALUES
    ('20220214175816-update-athletes.sql', '2022-02-14 17:58:16');