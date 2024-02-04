
-- SQL Script for Updating Sales Reports Table

-- Start transaction for data integrity
BEGIN TRY
    BEGIN TRANSACTION;

    -- Check if the report to be updated exists
    IF NOT EXISTS (SELECT 1 FROM sales_reports WHERE report_id = 101)
        THROW 50002, 'Report with specified ID does not exist', 1;

    -- Update the report name and last_modified date where report_id = 101
    UPDATE sales_reports
    SET 
        report_name = 'Annual_Sales_Summary_2024.csv',
        last_modified = CURRENT_TIMESTAMP
    WHERE 
        report_id = 101;

    -- Additional condition: Update status for reports not modified in the last year
    UPDATE sales_reports
    SET 
        report_status = 'Archived'
    WHERE 
        last_modified < DATEADD(year, -1, CURRENT_TIMESTAMP);

    -- Insert a log entry for the primary update
    INSERT INTO update_log (table_name, operation, affected_record_id, timestamp)
    VALUES ('sales_reports', 'UPDATE', 101, CURRENT_TIMESTAMP);

    -- Insert a log entry for the status update operation
    INSERT INTO update_log (table_name, operation, description, timestamp)
    VALUES ('sales_reports', 'BULK UPDATE', 'Archived old reports', CURRENT_TIMESTAMP);

    -- Commit the transaction
    COMMIT TRANSACTION;
    PRINT 'Update and logging completed successfully.';
END TRY
BEGIN CATCH
    -- Rollback transaction in case of an error
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    -- Error handling
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
    DECLARE @ErrorState INT = ERROR_STATE();

    RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
END CATCH

-- End of the script
