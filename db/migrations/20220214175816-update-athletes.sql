ALTER TABLE athletes RENAME COLUMN identified_gender TO gender;

INSERT INTO schema_migrations (migration, migrated_at) VALUES
('20220214175816-update-athletes.sql', '2022-02-14 17:58:16');