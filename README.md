## Project Overview
This database project supports **SDG 11.5**, which aims to reduce the impacts of disasters. It stores data about disasters such as typhoons, floods, and earthquakes, including:

- Affected barangays  
- Human impact (deaths, injuries, affected people)  
- Damaged assets and estimated economic losses  

This system helps LGUs quickly identify high-risk areas, track disaster impacts, and plan effective disaster response.

---

## Features

- **Disaster Event Management**  
  Tracks hazard type, affected location, severity level, and duration of disaster events.

- **Human Impact Tracking**  
  Records the number of deaths, injuries, and affected individuals per disaster event.

- **Damage Assessment**  
  Stores damaged assets and computes estimated economic losses.

- **Data Integrity and Validation**  
  Ensures data accuracy and consistency through constraints and triggers:
  - Prevents invalid disaster timelines (e.g., `EndDate` earlier than `StartDate`)
  - Enforces valid numeric ranges for casualties and losses
  - Maintains referential integrity using primary and foreign keys

- **Views for Quick Analysis**
  - `view_disaster_summary`  
    Provides a consolidated view of hazard type, barangay, and disaster event details.
  - `view_total_losses_per_event`  
    Calculates and displays the total economic losses per disaster event.

- **Stored Procedures**  
  Uses transactional stored procedures to safely insert related records and ensure ACID compliance.

---

## Core DBMS Concepts Applied

This project applies essential Database Management System (DBMS) concepts covered throughout the course.

- **Data Definition Language (DDL)**  
  Used to define tables, relationships, constraints, indexes, and triggers.

- **Data Manipulation Language (DML)**  
  Used for inserting, updating, and testing disaster-related data.

- **Normalization (3NF / BCNF)**  
  Tables are normalized to reduce redundancy and prevent update, insertion, and deletion anomalies.

- **Constraints and Triggers**  
  CHECK constraints and triggers enforce business rules and maintain data validity.

- **Views (DQL)**  
  Views simplify complex queries and support efficient disaster data reporting.

- **Transactions and ACID Properties**  
  Stored procedures implement `BEGIN TRANSACTION`, `COMMIT`, and `ROLLBACK` to ensure data consistency and reliability.

---

## Database Components

- **DDL Scripts:**  Define the database schema, tables, constraints, and triggers.

- **DML Scripts:**  Insert sample data and test transactional behavior.

- **Views:**  Provide summarized disaster information and total economic loss reports.

- **Stored Procedures:**  Handle safe, consistent, and transactional data insertion.

---

## File/Folder Structure
```
MojoJay_and_The_Four_Sanggres_SDG11_PROJECT
├── .gitignore
├── 1_SQL_SCRIPTS/
│   ├── 1.1_DDL_Schema.sql                        # CREATE TABLEs, Keys, Constraints
│   ├── 1.2_DML_TestData.sql                      # INSERT statements for 50+ records
│   ├── 1.3_StoredLogic.sql                       # Procedures, Functions, Triggers
│   └── 1.4_DCL_Users.sql                         # CREATE USER, GRANT statements
├── 2_DEMO_INTERFACE/
│   └── [CLI code files for interacting with the disaster database]
├── 3_DOCUMENTATION/
│   ├── SDAD_MojoJay_and_The_Four_Sanggres.pdf    # Main report
│   ├── ERD_Final.pdf                             # Conceptual and Logical ERD
│   └── Transaction_Flowchart.png                 # UML Activity Diagram for FR3
└── README.md                                     # Mandatory instructions and project overview
```

---
## Getting Started

### Requirements
- MySQL 8.0 or later  
- Optional: VS Code or any SQL editor

### Setup
1. Clone the repository:
```bash
git clone https://github.com/Jyrowen/DisasterManagementDB-sdg11-dbms.git
```
2. Open your MySQL client or your preferred SQL editor (e.g., VS Code).
3. Run the SQL scripts in the following order:
   - **1_SQL_SCRIPTS/1.1_DDL_Schema.sql** – Create tables, keys, and constraints
   - **1_SQL_SCRIPTS/1.2_DML_TestData.sql** – Insert sample data (50+ records)
   - **1_SQL_SCRIPTS/1.3_StoredLogic.sql** – Procedures, functions, and triggers
   - **1_SQL_SCRIPTS/1.4_DCL_Users.sql** – Create users and grant permissions
4. Launch the CLI interface located in **2_DEMO_INTERFACE/** to interact with the disaster database.
  
---


## Usage Instructions

Once the database and CLI interface are set up:

1. **Add a disaster record**  
   - Use the CLI command to insert a new disaster with its details (type, location, severity, duration).  

2. **Update or delete records**  
   - Modify casualty numbers, affected barangays, or remove incorrect entries through CLI commands.  

3. **Query reports and views**  
   - Use `view_disaster_summary` to see a consolidated view of all disaster events.  
   - Use `view_total_losses_per_event` to get total economic losses per disaster.  

4. **Use stored procedures for transactional inserts**  
   - Ensure related records (human impact, assets damaged) are added safely and consistently using the provided procedures.


---
## Contributors

This project was developed collaboratively as part of the **DBMS for Sustainable Development** final requirement.

- **Jay-Roween Bumatay** – Core DBMS concepts, functional and non-functional requirements, stored procedures, transaction flowchart, GitHub management
- **Ayessa Apple Galpo** – Project overview, UN SDG alignment, data requirements, ER diagrams, presentation materials
- **Trishia May Lacasa** – ER diagrams, transaction flowchart, system testing and results
- **Kate Ashley Quizon** – Problem statement, schema normalization analysis, DBMS concepts, SQL database implementation
- **Rica Mae Yaranon** – Problem statement, data requirements, project conclusion, presentation materials
