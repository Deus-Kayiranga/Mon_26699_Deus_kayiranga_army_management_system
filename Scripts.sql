-- USERS TABLE
CREATE TABLE Users (
    user_id NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    password VARCHAR2(100) NOT NULL,
    role VARCHAR2(20) CHECK (role IN ('Admin', 'Officer')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- UNITS TABLE
CREATE TABLE Units (
    unit_id NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    base_location VARCHAR2(100),
    commander VARCHAR2(50)
);

-- SOLDIERS TABLE
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

-- TRAINING TABLE
CREATE TABLE Training (
    training_id NUMBER PRIMARY KEY,
    soldier_id NUMBER,
    title VARCHAR2(100),
    start_date DATE,
    end_date DATE,
    status VARCHAR2(20) CHECK (status IN ('Planned', 'Ongoing', 'Completed')),
    FOREIGN KEY (soldier_id) REFERENCES Soldiers(soldier_id)
);

-- MISSIONS TABLE
CREATE TABLE Missions (
    mission_id NUMBER PRIMARY KEY,
    title VARCHAR2(100),
    objective VARCHAR2(255),
    location VARCHAR2(100),
    start_date DATE,
    end_date DATE
);

-- SOLDIER_MISSIONS (Junction Table)
CREATE TABLE Soldier_Missions (
    id NUMBER PRIMARY KEY,
    soldier_id NUMBER,
    mission_id NUMBER,
    FOREIGN KEY (soldier_id) REFERENCES Soldiers(soldier_id),
    FOREIGN KEY (mission_id) REFERENCES Missions(mission_id)
);

-- INVENTORY TABLE
CREATE TABLE Inventory (
    item_id NUMBER PRIMARY KEY,
    unit_id NUMBER,
    name VARCHAR2(100),
    quantity NUMBER CHECK (quantity >= 0),
    status VARCHAR2(20) CHECK (status IN ('Available', 'Issued')),
    FOREIGN KEY (unit_id) REFERENCES Units(unit_id)
);

-- HOLIDAYS TABLE
CREATE TABLE Holidays (
    holiday_date DATE PRIMARY KEY,
    description VARCHAR2(100)
);

-- AUDIT LOG TABLE
CREATE TABLE mission_audit (
    audit_id NUMBER GENERATED ALWAYS AS IDENTITY,
    username VARCHAR2(100),
    action_type VARCHAR2(10),
    action_date DATE
);


//Sample Data Insertions


INSERT INTO Users VALUES (1, 'Commander Kayiranga', 'admin@army.gov', 'admin123', 'Admin', DEFAULT);
INSERT INTO Users VALUES (2, 'Officer Jane', 'jane@army.gov', 'jane456', 'Officer', DEFAULT);

INSERT INTO Units VALUES (101, 'Alpha Unit', 'Base A', 'Captain John');

INSERT INTO Soldiers VALUES (201, 'James Owen', 'Sergeant', TO_DATE('1990-06-15','YYYY-MM-DD'), 1, 101);

INSERT INTO Training VALUES (301, 201, 'Combat Tactics', TO_DATE('2024-03-01','YYYY-MM-DD'), TO_DATE('2024-03-15','YYYY-MM-DD'), 'Completed');

INSERT INTO Missions VALUES (401, 'Border Patrol', 'Monitor sector 4B', 'Sector 4B', TO_DATE('2024-04-01','YYYY-MM-DD'), TO_DATE('2024-04-05','YYYY-MM-DD'));

INSERT INTO Soldier_Missions VALUES (501, 201, 401);

INSERT INTO Inventory VALUES (601, 101, 'Night Vision Goggles', 10, 'Available');


//Triggers

-- Prevent INSERT/UPDATE/DELETE on weekends or holidays
CREATE OR REPLACE TRIGGER prevent_weekend_entry
BEFORE INSERT OR UPDATE OR DELETE ON Missions
BEGIN
    IF TO_CHAR(SYSDATE, 'DY') IN ('SAT', 'SUN') OR SYSDATE IN (SELECT holiday_date FROM Holidays) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Operation not allowed on weekends or holidays');
    END IF;
END;
/

-- Mission Audit Logging
CREATE OR REPLACE TRIGGER log_mission_actions
AFTER INSERT OR DELETE ON Missions
FOR EACH ROW
BEGIN
    INSERT INTO mission_audit (username, action_type, action_date)
    VALUES (USER, 'INSERT', SYSDATE);
END;
/


// Procedures & Functions

-- Procedure to assign a soldier to a mission
CREATE OR REPLACE PROCEDURE assign_soldier_to_mission (
    p_soldier_id NUMBER,
    p_mission_id NUMBER
) AS
BEGIN
    INSERT INTO Soldier_Missions (id, soldier_id, mission_id)
    VALUES (soldier_mission_seq.NEXTVAL, p_soldier_id, p_mission_id);
    COMMIT;
END;
/

-- Function to count trainings for a soldier
CREATE OR REPLACE FUNCTION get_training_count(p_soldier_id NUMBER)
RETURN NUMBER IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM Training WHERE soldier_id = p_soldier_id;
    RETURN v_count;
END;
/
