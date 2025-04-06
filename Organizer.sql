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
(1, 'Работа', NULL),
(1, 'Проекти', 1),
(1, 'Срещи', 1),
(1, 'Лични', NULL),
(1, 'Здраве', 4),
(1, 'Финанси', 4),
(1, 'Домашни задължения', NULL),
(1, 'Пътувания', 7),
(1, 'Хобита', NULL),
(1, 'Спорт',9)

INSERT INTO Tasks (UserID, CategoryID, Title, [Description], StartDate, EndDate, [Priority], [Status]) VALUES
(1, 2, 'Завърши проект X', 'Трябва да завърша доклада до петък', '2025-04-01', '2025-04-05', 'висок', 'незавършен'),
(1, 3, 'Среща с клиента', 'Обсъждане на нов договор', '2025-04-02 10:00:00', '2025-04-02 11:00:00', 'среден', ' незавършен '),
(1, 5, 'Посещение на лекар', 'Редовен профилактичен преглед', '2025-04-10', NULL, ' среден ', ' незавършен '),
(1, 6, 'Плащане на сметки', 'Ток, вода, интернет', '2025-04-05', '2025-04-07', ' висок ', ' незавършен '),
(1, 7, 'Изчисти хола', 'Да подредя стаята и да измия прозорците', NULL, '2025-04-03', ' нисък ', ' незавършен '),
(1, 8, 'Организирай пътуване', 'Резервация на билети и хотел', '2025-06-01', '2025-06-10', ' висок ', ' незавършен '),
(1, 9, 'Купи нови четки за рисуване', 'Подготовка за нов проект', NULL, '2025-04-15', 'нисък', ' незавършен '),
(1, 10, 'Започни нов фитнес режим', 'Планирай тренировки и хранене', '2025-04-01', '2025-04-30', ' висок', 'незавършен'),
(1, 4, 'Обади се на приятел', 'Наваксване с новините', NULL, NULL, ' среден ', 'завършен '),
(1, 1, 'Подгответе презентация', 'Тема: Бизнес иновации', '2025-04-20', '2025-04-25', ' висок ', ' незавършен ');


INSERT INTO Notes (UserID, CategoryID, Title, Content) VALUES
(1, 4, 'Идеи за нов бизнес', 'Може би трябва да направя онлайн магазин'),
(1, 5, 'Здравословни рецепти', 'Опитай да ядеш повече зеленчуци и протеини'),
(1, 7, 'Списък за пазаруване', 'Мляко, хляб, сирене, домати'),
(1, 9, 'Рисувателни техники', 'Използвай мокър върху мокър за акварели'),
(1, 10, 'Фитнес цели', 'Направи 50 набирания до края на месеца'),
(1, 1, 'Бележки от срещата', 'Обсъдихме следните теми: ...'),
(1, 2, 'Идеи за следващ проект', 'Разработка на мобилно приложение'),
(1, 3, 'Точка за обсъждане', 'Нови стратегии за екипа'),
(1, 6, 'Финансови цели', 'Спестявай 10% от заплатата всеки месец'),
(1, 8, 'Пътепис', 'Пътешествие до Италия - впечатления и снимки');


INSERT INTO [Events] (UserID, CategoryID, Title, [Description], EventDate, [Location]) VALUES
(1, 3, 'Годишна среща', 'Обсъждане на целите за следващата година', '2025-04-10 14:00:00', 'Офис 302'),
(1, 5, 'Преглед при зъболекар', 'Почистване и профилактика', '2025-04-12 10:00:00', 'Зъболекарски кабинет'),
(1, 7, 'Рожден ден на Мария', 'Организиране на изненада', '2025-04-20 19:00:00', 'Ресторант Ла Вита'),
(1, 8, 'Пътуване до Париж', 'Ваканция с приятели', '2025-07-15 08:00:00', 'Франция'),
(1, 10, 'Маратон', 'Участие в градския маратон', '2025-05-05 07:00:00', 'Централен парк'),
(1, 2, 'Семинар за предприемачи', 'Лекции и дискусии', '2025-04-25 09:00:00', 'Хотел София'),
(1, 6, 'Финансов уебинар', 'Как да управляваме личните си финанси', '2025-06-10 18:00:00', 'Онлайн'),
(1, 4, 'Културно събитие', 'Посещение на изложба', '2025-05-10 15:00:00', 'Национална галерия'),
(1, 9, 'Художествена работилница', 'Техники за рисуване с маслени бои', '2025-06-20 10:00:00', 'Арт студио'),
(1, 1, 'Корпоративно обучение', 'Развитие на меки умения', '2025-04-30 09:00:00', 'Конферентна зала 1');


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
