# SalesReportUpdater
Overview
SalesReportUpdater is a specialized SQL script repository for managing and updating sales report data in a database. It includes scripts for updating report names, modifying last modified dates, and archiving old reports. Designed with robust error handling and detailed logging, these scripts ensure data integrity and provide a clear audit trail.

Features
Report Update: Script to update the name and last modified date of specific sales reports.
Auto-Archiving: Automatically archives reports that have not been modified in the past year.
Error Handling: Comprehensive error handling to ensure data integrity during script execution.
Audit Logging: Detailed logging of all updates in a separate update_log table for audit purposes.
How to Use
Clone the Repository: git clone https://github.com/Keil-L/SalesReportUpdater.git
Database Setup: Ensure your SQL database is set up with sales_reports and update_log tables.
Execute Scripts: Run the SQL scripts against your database. Modify the scripts as needed to match your database schema.
Requirements
SQL Server or any SQL database system.
Database tables: sales_reports and update_log (refer to the scripts for schema details).
Contribution
Contributions to improve SalesReportUpdater are welcome. Please fork the repository and submit a pull request with your enhancements.

License
This project is licensed under the MIT License.

Contact
For any queries or feedback, please open an issue in the repository or contact keil.lynch@keillynchda.com.


