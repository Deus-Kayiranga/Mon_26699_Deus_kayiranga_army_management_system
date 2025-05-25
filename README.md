# 🏠 Army Management System 📚

## 🌟 Introduction

The Army Management System is a database-driven solution developed to streamline military operations including personnel tracking, unit assignments, mission planning, training coordination, and inventory management. This system was created as part of the Capstone Project for the Software Engineering program at Adventist University of Central Africa.

Its core objective is to replace manual data handling with a secure, centralized platform that ensures data consistency, operational transparency, and improved administrative efficiency across different army departments.

## 	📝 Overview

The Army Management System is a database-driven project designed to manage soldier registration, unit assignments, training schedules, mission planning, and inventory tracking. It was developed in partial fulfillment of the Capstone Project for the Software Engineering program at AUCA.

---

## 🚀Technologies Used

- Oracle 21c Database

- SQL*Plus / SQL Developer

- PL/SQL (Procedures, Functions, Triggers)

- GitHub

- draw.io (for ER and BPMN diagrams)


# 📍 Entities and Relationships

**The system contains the following major entities:**

**💡 Users**- Administrative users managing the system.

**💡 Soldiers**- Personnel enlisted in the military.

**💡 Units**- Operational groups soldiers are assigned to.

**💡 Trainning**- Tracks trainning sessions per soldier.

**💡 Missions**- Deployment operations soldiers take part in.

**💡 Inventory**- Items issued to units.

**💡 Soldier_missions**- A junction table for the many to many relationship between soldiers and missions.



## 🚀 PHASE 1 — Database Design and Problem Analysis

**Problem:**  Disconnected, manual management of soldiers, missions, training records, and inventory within a military institution.

**Context:** Applied to a centralized Army Command for digital transformation.

**Users:** Military administrators, commanders, and system officers.

**Goals:** Automate personnel tracking, mission assignments, inventory visibility, and ensure data consistency.

## 🛠 Problem Definition

"Military organizations often rely on disconnected paper-based systems to manage soldiers, units, training, missions, and inventory. This lack of integration leads to delays, errors, and inefficiencies in command operations."

Without a centralized digital system, military administration faces:

🧭 Disorganized soldier and unit records

📂 Limited mission tracking and accountability

📉 Inventory mismanagement and resource duplication

🔐 Minimal access control and security auditing



## 📍 Context

🪖 Military bases handle thousands of soldiers across multiple units.

📜 Operations depend on accurate records and timely deployment.

📊 Manual tracking is prone to error and cannot scale.

💻 There's a growing need for digitized and secure army databases.



## 👥 Target Users

🧑‍✈️ Commanders / Officers – To assign and monitor soldier activities

🧑‍💼 Admins – To register users and maintain system access

🧑‍🎓 Developers (You) – To build, test, and document the database system



## 🎯 Project Goals

🧩 Digitize and centralize military personnel records

🎯 Enable mission and training tracking per soldier

🛠 Improve inventory visibility by unit

 🔐 Enforce user roles and secure access control

 📈 Support reporting and auditing of operations



 # 🔄 Phase II: Business Process Modeling (MIS)

 **Objective:** Visualize the flow of military operations (such as soldier registration, mission assignment, and inventory management) using BPMN to clarify roles, interactions, and decision points.
 
## 📍 What This Phase Covers

This phase focuses on visualizing how key military departments — such as Personnel, Operations, and Logistics — interact with the system. Using Business Process Model and Notation (BPMN), the workflow illustrates how
data flows from one user role to another and where decisions are made. This aligns with MIS principles by improving transparency, command coordination, and system accountability.

## 📏 Scope of Definition

### 🎭 Actor Responsibilities

| Actor             | Responsibilities                                                                 |
|------------------|------------------------------------------------------------------------------------|
| 🧑‍✈️ Commander       | Registers soldiers, assigns units, approves missions and training              |
| 🧑‍🏫 Training Officer | Schedules training, monitors completion status                                 |
| 🧑‍🔧 Logistics Officer| Manages inventory, issues equipment to units                                  |
| 🖥️ System Functions  | Validates input, links records, enforces role-based access                    |

---

### 🏊‍♂ Swimlanes and Their Purpose

| Swimlane             | Role / Component           | Key Actions                                                                 |
|----------------------|----------------------------|------------------------------------------------------------------------------|
| 🧑‍✈️ Commander           | User Role                    | Registers soldiers, views unit rosters, assigns missions                    |
| 🧑‍🏫 Training             | Training Management Module    | Schedules sessions, tracks completion, reports results                      |
| 🧑‍🔧 Inventory            | Logistics Subsystem           | Adds items, updates stock levels, tracks unit issuance                     |
| 🎯 Mission Assignment    | Operations Logic Module       | Links soldiers to missions, enforces availability rules                     |
| 🗂️ Personnel Record Store| Data Storage Layer            | Holds soldier info, training history, mission logs                          |
| 🔐 System Security       | Access Control Subsystem      | Validates user roles and permissions                                        |



## 📸 BPMN Diagram Screenshot

**Army management system BPMN Diagram**

![Screenshot 2025-05-24 172719](https://github.com/user-attachments/assets/da9be2a4-7058-4115-a0af-b707b32a70e5)

🔍 Diagram Explanation

➤ Process Flow Overview:

The process starts with soldier registration and continues through:

   Assign to Unit

   Equipment Assignment & Logging

   Check Equipment Availability

   Plan Deployment

   Conduct Training

   Execute Mission
   

↩ Arrows branching and looping reflect repeatable or conditional activities like checking equipment status before mission deployment.


## ➤ Key Interactions:

   Personnel ↔ Equipment: Once a soldier is assigned, equipment is issued.

   Equipment ↔ Deployment: Only available equipment allows mission planning to proceed.

   Training ↔ Mission Execution: Training is required before final deployment.

## ➤ Decision Points:

   ✅ Equipment Check: Is gear available before planning?

   🔁 Loop: If not, training and logs are revisited or restarted.


## 🧩 MIS Alignment

   📊 Decision Support: Clear visibility into soldier readiness and equipment status.

   🔄 Operational Streamlining: Minimizes manual checks.

   📥 Data Capture: Each step updates logs used for command reporting.



  ###  📂 Phase III: Logical Model Design (ER Diagram)

In this phase, we transitioned from workflow modeling to building a normalized logical data model. This model reflects the needs identified in the problem statement (Phase I) and the flows modeled in the BPMN diagram (Phase II).

## 📍 What This Phase Covers

### ✅ Task	Description

Definition of entities	Soldier, Unit, Training, Mission, Inventory, Users, Soldier_Missions

Attributes and keys	Each entity includes PKs and FKs with suitable data types and constraints

Relationship and constraint modeling	1:1, 1:N, M:N links modeled and enforced

Normalization	Achieved 3NF by eliminating redundancy and transitive dependencies

Real-world readiness	Handles mission reassignment, equipment status, and multi-training records

## 🔷 ER Model Overview

Entity	Key Attributes	Data Types / Constraints	PK / FK

🧑‍💻 User	user_id, name, email, password, role	role CHECK ('Admin', 'Officer'), email UNIQUE, NOT NULL	PK: user_id

🪖 Soldier	soldier_id, name, rank, birthdate, unit_id, created_by	birthdate DATE, rank VARCHAR2, all NOT NULL	PK: soldier_id, FK: unit_id

🪧 Unit	unit_id, name, base_location, commander	name NOT NULL	PK: unit_id

🎯 Mission	mission_id, title, objective, location, start_date, end_date	start_date, end_date DATE	PK: mission_id

🎓 Training	training_id, soldier_id, title, start_date, end_date, status	status CHECK ('Planned', 'Ongoing', 'Completed')	PK: training_id, FK: soldier_id

📦 Inventory	item_id, unit_id, name, quantity, status	status CHECK ('Available', 'Issued')	PK: item_id, FK: unit_id

🔗 Soldier_Mission	id, soldier_id, mission_id	Junction table for M:N relationship	PK: id, FKs: soldier_id, mission_id

### 🔗 Relationships & Constraints

Relationship	Type	Constraint Description

User → Soldier	1:N	Each soldier record created by a system user

Unit → Soldier	1:N	One unit can contain many soldiers

Soldier → Training	1:N	A soldier can undergo multiple trainings

Soldier ↔ Mission	M:N	Managed via Soldier_Mission linking table

Unit → Inventory	1:N	Each inventory item belongs to a single unit

## ✅ Key Constraints

Constraint Type	Applied Fields	Description

NOT NULL	PKs, email, rank, name	Enforces required data presence

UNIQUE	email, name	Prevents duplicate entries

CHECK	role, status, quantity	Limits values to predefined sets

DEFAULT	status, created_at	Auto-fill default values for new records

## 🧹 Normalization

Normal Form	Description

1NF	All attributes atomic; no repeating groups

2NF	Non-key attributes fully dependent on primary key

3NF	No transitive dependencies; each field depends only on the PK

### 📐 Handling Data Scenarios

Real-World Scenario	Implementation in the Model


## 🆕 New soldier joins	Insert into Soldier table with link to User and Unit

**🛡 Inventory assigned to unit**

Insert into Inventory with unit_id FK


**🎯 Soldier assigned to mission	Insert**

into Soldier_Mission with soldier_id and mission_id

**📚 Training assigned**

Insert into Training table → set status to 'Planned'

## 📅 Prevent assignments on holidays	Controlled using triggers in Phase VII (Holiday table + validation)

## 📸 ER Diagram Screenshot

![ChatGPT Image May 24, 2025, 06_32_07 PM](https://github.com/user-attachments/assets/4a5b186a-8ca3-42fd-949a-ebe7dac48274)





# 💾 Phase IV: Database (Pluggable Database) Creation and Naming

## 📍 What This Phase Covers:

## 🧱 1. Database Creation (Container Setup)

**Before creating a pluggable database, we start by connecting as SYSDBA to the CDB root container and check existing containers.**

```sql

sqlplus / as sysdba

```

**Check existing pluggable databases**

```sql

SHOW PDBS;
```

**Result:**

```sql

    CON_ID CON_NAME                       OPEN MODE  RESTRICTED
---------- ------------------------------ ---------- ----------
         2 PDB$SEED                       READ ONLY  NO
         3 ORCLPDB                        MOUNTED

```

**✅ You can confirm you're working inside CDB$ROOT using:**

```sql

SHOW CON_NAME;

```

## 📸 Screenshot Requirement showing pdb:

![WhatsApp Image 2025-05-24 at 12 47 59_2c23a2fb](https://github.com/user-attachments/assets/9de4e5b2-0fc6-41eb-bed6-e90bf4ad4ec2)


## 📊 Oracle Enterprise Manager (OEM) Configuration

After setting up the database, we opened Oracle Enterprise Manager (OEM) to monitor and manage our PDB.

   Accessed at: https://localhost:8443/em

   OEM shows:

   Active containers (CDB$ROOT, ORCLPDB, and our new PDB)

   Memory usage and container activity

   Uptime, resource allocation, and storage graphs
   

## 📸 Screenshot Requirement:


![WhatsApp Image 2025-05-25 at 00 03 25_c9a09f0a](https://github.com/user-attachments/assets/2deae454-24d4-4f0a-89ee-7b12b430cb04)


# 🏗 Phase V: Table Implementation & Data Insertion

## 📍 What This Phase Covers

Phase 5 is all about turning your logical design into real, working database tables in Oracle SQL and making sure they work properly by inserting sample data.

## 🧱 5.1 Table Creation

## 1. 👥 Users Table

```sql
CREATE TABLE Users (
    user_id NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE,
    password VARCHAR2(100) NOT NULL,
    role VARCHAR2(20) CHECK (role IN ('Admin', 'Officer'))
);
```
 
The Users table stores all registered system users — specifically those with administrative or officer responsibilities.

## Units table

```sql
CREATE TABLE Units (
    unit_id NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    base_location VARCHAR2(100),
    commander VARCHAR2(50)
);
```

## SOLDIERS TABLE

```
CREATE TABLE Soldiers (
    soldier_id NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    rank VARCHAR2(30) NOT NULL,
    birthdate DATE NOT NULL,
    created_by NUMBER,
    unit_id NUMBER,
    FOREIGN KEY (created_by) REFERENCES Users(user_id),
    FOREIGN KEY (unit_id) REFERENCES Units(unit_id)
);
```

## TRAINING TABLE

```
CREATE TABLE Training (
    training_id NUMBER PRIMARY KEY,
    soldier_id NUMBER,
    title VARCHAR2(100),
    start_date DATE,
    end_date DATE,
    status VARCHAR2(20) CHECK (status IN ('Planned', 'Ongoing', 'Completed')),
    FOREIGN KEY (soldier_id) REFERENCES Soldiers(soldier_id)
);
```

## MISSIONS TABLE

```
CREATE TABLE Missions (
    mission_id NUMBER PRIMARY KEY,
    title VARCHAR2(100),
    objective VARCHAR2(255),
    location VARCHAR2(100),
    start_date DATE,
    end_date DATE
);
```

## SOLDIER_MISSIONS (Junction Table)

```
CREATE TABLE Soldier_Missions (
    id NUMBER PRIMARY KEY,
    soldier_id NUMBER,
    mission_id NUMBER,
    FOREIGN KEY (soldier_id) REFERENCES Soldiers(soldier_id),
    FOREIGN KEY (mission_id) REFERENCES Missions(mission_id)
);
```

## INVENTORY TABLE

```
CREATE TABLE Inventory (
    item_id NUMBER PRIMARY KEY,
    unit_id NUMBER,
    name VARCHAR2(100),
    quantity NUMBER CHECK (quantity >= 0),
    status VARCHAR2(20) CHECK (status IN ('Available', 'Issued')),
    FOREIGN KEY (unit_id) REFERENCES Units(unit_id)
);
```

## HOLIDAYS TABLE

```
CREATE TABLE Holidays (
    holiday_date DATE PRIMARY KEY,
    description VARCHAR2(100)
);
```

## AUDIT LOG TABLE

```
CREATE TABLE mission_audit (
    audit_id NUMBER GENERATED ALWAYS AS IDENTITY,
    username VARCHAR2(100),
    action_type VARCHAR2(10),
    action_date DATE
);
```


 ## 🧾 Sample Inserted Data (from script)

Here are some realistic data entries we added:


1.👤 Users Table

```
INSERT INTO Users VALUES (1, 'Commander Kayiranga', 'admin@army.gov', 'admin123', 'Admin', DEFAULT);
INSERT INTO Users VALUES (2, 'Officer Jane', 'jane@army.gov', 'jane456', 'Officer', DEFAULT);

INSERT INTO Units VALUES (101, 'Alpha Unit', 'Base A', 'Captain John');

INSERT INTO Soldiers VALUES (201, 'James Owen', 'Sergeant', TO_DATE('1990-06-15','YYYY-MM-DD'), 1, 101);

INSERT INTO Training VALUES (301, 201, 'Combat Tactics', TO_DATE('2024-03-01','YYYY-MM-DD'), TO_DATE('2024-03-15','YYYY-MM-DD'), 'Completed');

INSERT INTO Missions VALUES (401, 'Border Patrol', 'Monitor sector 4B', 'Sector 4B', TO_DATE('2024-04-01','YYYY-MM-DD'), TO_DATE('2024-04-05','YYYY-MM-DD'));

INSERT INTO Soldier_Missions VALUES (501, 201, 401);

INSERT INTO Inventory VALUES (601, 101, 'Night Vision Goggles', 10, 'Available');
```
