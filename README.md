# SalesReportUpdater
The SQL Script for Updating Sales Reports Table first checks for the existence of a specific report by ID and updates its name and last modified date. It then archives reports that haven't been modified in the past year and logs all changes in an update log table, with robust error handling.
