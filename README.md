# Disaster Database Project

## Project Overview
This database project supports **SDG 11.5**, which aims to reduce the impacts of disasters. It stores data about disasters like typhoons, floods, and earthquakes, including:

- Affected barangays
- Human impact (deaths, injuries, affected people)
- Damaged assets and estimated economic losses

This system helps LGUs quickly identify high-risk areas, track disaster impacts, and plan effective disaster response.

---

## Features

- **Disaster Event Management**: Track hazard type, location, severity, and duration of disasters.
- **Human Impact Tracking**: Record the number of deaths, injuries, and affected people.
- **Damage Assessment**: Track damaged assets and calculate total economic losses.
- **Data Integrity**: Triggers prevent invalid data (e.g., EndDate before StartDate).
- **Views for Quick Analysis**:
  - `view_disaster_summary`: Combines hazard type, barangay, and event details.
  - `view_total_losses_per_event`: Calculates total losses per disaster event.
- **Stored Procedures**: Transactional inserts to ensure consistent data.

---

## Database Components

- **DDL Scripts**: Create tables, constraints, and triggers.
- **DML Scripts**: Insert sample data and test transactions.
- **Views**: For summary and total losses per disaster.
- **Stored Procedures**: For safe, transactional inserts.

---

## Getting Started

### Requirements
- MySQL 8.0+ (or compatible)
- Optional: **VS Code** or any SQL editor

### Setup
1. Clone the repository:
```bash
git clone https://github.com/Jyrowen/DisasterManagementDB-sdg11-dbms.git
