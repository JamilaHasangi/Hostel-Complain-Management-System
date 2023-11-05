-- single column index
CREATE INDEX index_email_address  ON user (email);

-- composite
CREATE INDEX index_email_mobile ON user (email, contact);
CREATE UNIQUE INDEX index_name ON table_name (column_name);
CREATE NONCLUSTERED INDEX index_name ON table_name (column_name);