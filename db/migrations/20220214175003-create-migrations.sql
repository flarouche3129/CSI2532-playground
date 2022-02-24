CREATE TABLE schema_migrations (
    migration varchar(255),
    migrated_at time,
    PRIMARY KEY (migration)
);

INSERT INTO schema_migrations (migration, migrated_at) VALUES
    ('20220214173000-create-athletes.sql', '2022-02-14 17:30:00');

INSERT INTO schema_migrations (migration, migrated_at) VALUES
    ('20220214175003-create-migrations.sql', '2022-02-14 17:50:03');