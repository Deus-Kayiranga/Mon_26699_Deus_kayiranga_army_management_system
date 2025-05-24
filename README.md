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

- Git & GitHub

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



