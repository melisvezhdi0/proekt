CREATE DATABASE PersonalOrganizer
 
CREATE TABLE [User]
(
ID INT PRIMARY KEY NOT NULL IDENTITY,
UserName VARCHAR(15) NOT NULL,
Email VARCHAR(20) UNIQUE NOT NULL,
[Password] NVARCHAR(15) NOT NULL,
)
 
CREATE TABLE Tasks 
(
ID INT PRIMARY KEY NOT NULL IDENTITY,
UserID INT NOT NULL,
Title NVARCHAR(50),
CategoryID INT,
[Description] NVARCHAR(50),
StartDate DATE,
EndDate DATE,
[Priority] NVARCHAR(10),
[Status] NVARCHAR(15),
FOREIGN KEY (UserID) REFERENCES [User](ID),
FOREIGN KEY (CategoryID) REFERENCES Categories(ID)
)
 
CREATE TABLE [Events]
(
ID INT PRIMARY KEY NOT NULL IDENTITY,
UserID INT NOT NULL,
CategoryID INT,
Title NVARCHAR(50),
[Description] NVARCHAR(50),
EventDate DATETIME,
[Location] NVARCHAR(50),
FOREIGN KEY (UserID) REFERENCES [User](ID),
FOREIGN KEY (CategoryID) REFERENCES Categories(ID)
)
 
CREATE TABLE Notes
(
ID INT PRIMARY KEY NOT NULL IDENTITY,
UserID INT NOT NULL,
CategoryID INT,
Title NVARCHAR(50),
Content NVARCHAR(50),
FOREIGN KEY (UserID) REFERENCES [User](ID),
FOREIGN KEY (CategoryID) REFERENCES Categories(ID)
)

CREATE TABLE Categories
(
ID INT PRIMARY KEY NOT NULL IDENTITY,
UserID INT NOT NULL,
[Name] NVARCHAR(20) NOT NULL,
ParentID INT,
FOREIGN KEY (UserID) REFERENCES [User](ID),
FOREIGN KEY (ParentID) REFERENCES Categories(ID)
)

CREATE TABLE Reminders
(
ID INT PRIMARY KEY NOT NULL IDENTITY,
TaskID INT NOT NULL,
EventID INT NOT NULL,
ReminderTime DATETIME NOT NULL,
FOREIGN KEY (TaskID) REFERENCES Tasks(ID),
FOREIGN KEY (EventID) REFERENCES [Events](ID)
)


 INSERT INTO [User] (UserName, Email, [Password]) VALUES
('Bursan', 'BursiPPMG@gmail.com' , 'Buhsan0607')

INSERT INTO Categories (UserID, [Name], ParentID) VALUES
(1, '������', NULL),
(1, '�������', 1),
(1, '�����', 1),
(1, '�����', NULL),
(1, '������', 4),
(1, '�������', 4),
(1, '������� ����������', NULL),
(1, '���������', 7),
(1, '������', NULL),
(1, '�����',9)

INSERT INTO Tasks (UserID, CategoryID, Title, [Description], StartDate, EndDate, [Priority], [Status]) VALUES
(1, 2, '������� ������ X', '������ �� ������� ������� �� �����', '2025-04-01', '2025-04-05', '�����', '����������'),
(1, 3, '����� � �������', '��������� �� ��� �������', '2025-04-02 10:00:00', '2025-04-02 11:00:00', '������', ' ���������� '),
(1, 5, '��������� �� �����', '������� ������������� �������', '2025-04-10', NULL, ' ������ ', ' ���������� '),
(1, 6, '������� �� ������', '���, ����, ��������', '2025-04-05', '2025-04-07', ' ����� ', ' ���������� '),
(1, 7, '������� ����', '�� ������� ������ � �� ����� ����������', NULL, '2025-04-03', ' ����� ', ' ���������� '),
(1, 8, '����������� ��������', '���������� �� ������ � �����', '2025-06-01', '2025-06-10', ' ����� ', ' ���������� '),
(1, 9, '���� ���� ����� �� ��������', '���������� �� ��� ������', NULL, '2025-04-15', '�����', ' ���������� '),
(1, 10, '������� ��� ������ �����', '�������� ���������� � �������', '2025-04-01', '2025-04-30', ' �����', '����������'),
(1, 4, '����� �� �� �������', '���������� � ��������', NULL, NULL, ' ������ ', '�������� '),
(1, 1, '���������� �����������', '����: ������ ��������', '2025-04-20', '2025-04-25', ' ����� ', ' ���������� ');


INSERT INTO Notes (UserID, CategoryID, Title, Content) VALUES
(1, 4, '���� �� ��� ������', '���� �� ������ �� ������� ������ �������'),
(1, 5, '������������ �������', '������ �� ���� ������ ��������� � ��������'),
(1, 7, '������ �� ����������', '�����, ����, ������, ������'),
(1, 9, '����������� �������', '��������� ����� ����� ����� �� ��������'),
(1, 10, '������ ����', '������� 50 ��������� �� ���� �� ������'),
(1, 1, '������� �� �������', '��������� �������� ����: ...'),
(1, 2, '���� �� ������� ������', '���������� �� ������� ����������'),
(1, 3, '����� �� ���������', '���� ��������� �� �����'),
(1, 6, '��������� ����', '��������� 10% �� ��������� ����� �����'),
(1, 8, '�������', '����������� �� ������ - ����������� � ������');


INSERT INTO [Events] (UserID, CategoryID, Title, [Description], EventDate, [Location]) VALUES
(1, 3, '������� �����', '��������� �� ������ �� ���������� ������', '2025-04-10 14:00:00', '���� 302'),
(1, 5, '������� ��� ���������', '���������� � ������������', '2025-04-12 10:00:00', '������������ �������'),
(1, 7, '������ ��� �� �����', '������������ �� ��������', '2025-04-20 19:00:00', '��������� �� ����'),
(1, 8, '�������� �� �����', '�������� � ��������', '2025-07-15 08:00:00', '�������'),
(1, 10, '�������', '������� � �������� �������', '2025-05-05 07:00:00', '��������� ����'),
(1, 2, '������� �� ������������', '������ � ��������', '2025-04-25 09:00:00', '����� �����'),
(1, 6, '�������� �������', '��� �� ����������� ������� �� �������', '2025-06-10 18:00:00', '������'),
(1, 4, '�������� �������', '��������� �� �������', '2025-05-10 15:00:00', '���������� �������'),
(1, 9, '������������ �����������', '������� �� �������� � ������� ���', '2025-06-20 10:00:00', '��� ������'),
(1, 1, '������������ ��������', '�������� �� ���� ������', '2025-04-30 09:00:00', '����������� ���� 1');


INSERT INTO Reminders (TaskID, EventID, ReminderTime) VALUES
(1, 1,'2025-04-04 09:00:00'),
(2, 2,'2025-04-02 09:30:00'),
(3,3 ,'2025-04-10 08:30:00'),
(4,5 ,'2025-04-06 20:00:00'),
(5,10 ,'2025-04-03 08:00:00'),
(6, 7,'2025-05-30 14:00:00'),
(7,6 ,'2025-04-14 18:30:00'),
(8, 9,'2025-04-01 07:00:00'),
(9, 4,'2025-06-05 10:00:00'),
(10,8 ,'2025-04-29 08:00:00');
