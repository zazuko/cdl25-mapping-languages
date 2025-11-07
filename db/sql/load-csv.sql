CREATE TABLE stops AS
    SELECT * FROM read_csv('input/*.csv') WHERE stopPoint = true AND status = 'VALIDATED'

-- VIEWs are a good way to do pre-processing before the mapping. For example to do segmentation, calculate values, etc.
-- CREATE VIEW foo AS
--    SELECT a, b, c, d FROM bar WHERE baz = true;