--- Use this template for your se2222 project
-- Before submission be sure that your file is named like [your_ID].sql
-- You will get minus 20% of total score for each day after due date
-- Name:...
-- ID:...

-- 1. Create and use a schema for your project named SE2222_[your_ID]
CREATE SCHEMA SE2222_20070006020;
USE SE2222_20070006020;
-- 1. Definitions:
-- All table definitions of your project including any constraints
-- Before each table creation give a short explanation of the table

-- Ex:
-- A1 table holds A values
CREATE TABLE A1(
A INT PRIMARY KEY);
-- 2. Insertions(Data manipulation):
-- For each table, add enough number of rows to make your queries in step three to produce meaningful result sets.

-- Ex:
INSERT INTO A1(A) VALUES(1);
-- 3. Queries:
-- Write 5 queries with explanations 
-- Write 5 queries. Your queries should do a task that is meaningful in your selected context (project topic). 
-- At least one that joins two or more tables
-- At least one that include group functions
-- At least one with one or more sub-query(es)
-- At least one update
-- At least one delete
-- At least one include arithmetic functions
-- At least one uses alias

-- Ex:
-- Finding all records in A1 table
SELECT * FROM A1;

 SET sql_safe_updates=0;
 SET FOREIGN_KEY_CHECKS=0;


-- 1. Definitions
CREATE TABLE teamGroup(
groupName char(1) not null,
teamName varchar(25),
finalPosition decimal(1),
numberOfWins decimal(1),
numberOfDefeats decimal(1),
numberOfDraws decimal(1),
primary key(groupName)
);

CREATE TABLE Team(
teamName varchar(25) not null,
teamValue decimal(4,1),
averageAge numeric(3,1),
numberOfPlayers numeric(2,0),
goalScored decimal(2),
concededGoal decimal(2),
groupName char(1),
teamHeLed varchar(25),
primary key(teamName),
foreign key(groupName) references teamGroup(groupName)
);

CREATE TABLE Coach(
teamHeLed varchar(25) not null,
coachName varchar(25),
nationality varchar(25),
age numeric(2,0),
experience decimal(2),
teamName varchar(25),
primary key(teamHeLed),
foreign key(teamName) references Team(teamName)
);

CREATE TABLE Stadium(
stadiumName varchar(25) not null,
capacity decimal(6),
city varchar(25),
primary key(stadiumName)
);

CREATE TABLE Matches(
matchCode varchar(10) not null,
typeOfMatch varchar(25),
homeTeam varchar(25),
awayTeam varchar(25),
score decimal(1),
refereeName varchar(25),
matchDate date,
stadiumName varchar(25),
primary key(matchCode),
foreign key (stadiumName) references Stadium(stadiumName)
);

CREATE TABLE Referee(
refereeID decimal(5) not null,
refereeName varchar(25),
nationality varchar(25),
age decimal(2),
yellowCards decimal(2),
redCards decimal(2),
penalties decimal(2),
primary key(refereeID)
);



CREATE TABLE Player(
playerName varchar(40) not null,
position varchar(3),
numberOfGoals decimal(2),
team varchar(25),
nationality varchar(25),
age decimal(2),
marketValue decimal(3),
teamName varchar(25),
primary key(playerName),
foreign key(teamName) references Team(teamName)
);

CREATE TABLE Channels(
channelName varchar(25) not null,
nation varchar(25),
languages varchar(25),
matchCode varchar(10),
primary key(channelName),
foreign key(matchCode) references Matches(matchCode)
);

CREATE TABLE play(
teamName varchar(25),
matchCode varchar(10),
primary key(teamName,matchCode),
foreign key(teamName) references Team(teamName),
foreign key(matchCode) references Matches(matchCode)
);

CREATE TABLE place(
matchCode varchar(10),
stadiumName varchar(25),
primary key(matchCode,stadiumName),
foreign key(matchCode) references Matches(matchCode),
foreign key(stadiumName) references Stadium(stadiumName)
);

CREATE TABLE broadcast(
channelName varchar(25),
matchCode varchar(10),
primary key(channelName,matchCode),
foreign key(channelName) references Channels(channelName),
foreign key(matchCode) references Matches(matchCode)
);

CREATE TABLE manage(
matchCode varchar(10),
refereeID decimal(5),
primary key(matchCode,refereeID),
foreign key(matchCode) references Matches(matchCode),
foreign key(refereeID) references Referee(refereeID)
);

CREATE TABLE team_member(
playerName varchar(25),
teamName varchar(25),
primary key(playerName,teamName),
foreign key(playerName) references Player(playerName),
foreign key(teamName) references Team(teamName)
);

CREATE TABLE group_member(
groupName char(1),
teamName varchar(25),
primary key(groupName,teamName),
foreign key(groupName) references teamGroup(groupName),
foreign key(teamName) references Team(teamName)
);

CREATE TABLE team_coach(
teamHeLed varchar(25),
teamName varchar(25),
primary key(teamHeLed,teamName),
foreign key(teamHeLed) references Coach(teamHeLed),
foreign key(teamName) references Team(teamName)
);

-- 2. INSERTIONS
-- teamGroup insertion
INSERT INTO teamGroup(groupName,teamName,finalPosition,numberOfWins,numberOfDefeats,numberOfDraws)
VALUES('A',"QATAR",4,0,3,0);
INSERT INTO teamGroup(groupName,teamName,finalPosition,numberOfWins,numberOfDefeats,numberOfDraws)
VALUES('B',"USA",2,1,2,0);
INSERT INTO teamGroup(groupName,teamName,finalPosition,numberOfWins,numberOfDefeats,numberOfDraws)
VALUES('C',"ARGENTINA",1,2,0,1);
INSERT INTO teamGroup(groupName,teamName,finalPosition,numberOfWins,numberOfDefeats,numberOfDraws)
VALUES('D',"AUSTRALIA",2,2,0,1);
INSERT INTO teamGroup(groupName,teamName,finalPosition,numberOfWins,numberOfDefeats,numberOfDraws)
VALUES('E',"GERMANY",3,1,1,1);
INSERT INTO teamGroup(groupName,teamName,finalPosition,numberOfWins,numberOfDefeats,numberOfDraws)
VALUES('F',"MOROCCO",1,2,1,0);
INSERT INTO teamGroup(groupName,teamName,finalPosition,numberOfWins,numberOfDefeats,numberOfDraws)
VALUES('G',"CAMEROON",3,1,1,1);
INSERT INTO teamGroup(groupName,teamName,finalPosition,numberOfWins,numberOfDefeats,numberOfDraws)
VALUES('H',"GHANA",4,1,0,2);

-- Coach insertion
INSERT INTO Coach(teamHeLed,coachName,nationality,age,experience,teamName)
VALUES('QATAR','Félix Sánchez','Spanish','47','27','QATAR');
INSERT INTO Coach(teamHeLed,coachName,nationality,age,experience,teamName)
VALUES('USA','Jürgen Klinsmann','German','58','19','USA');
INSERT INTO Coach(teamHeLed,coachName,nationality,age,experience,teamName)
VALUES('ARGENTINA','Lionel Scaloni','Argentine ','44','5','ARGENTINA');
INSERT INTO Coach(teamHeLed,coachName,nationality,age,experience,teamName)
VALUES('AUSTRALIA','Graham Arnold','Australian ','59','34','AUSTRALIA');
INSERT INTO Coach(teamHeLed,coachName,nationality,age,experience,teamName)
VALUES('GERMANY','Hans-Dieter Flick','German','58','27','GERMANY');
INSERT INTO Coach(teamHeLed,coachName,nationality,age,experience,teamName)
VALUES('MOROCCO','Walid Regragui','Moroccan','47','9','MOROCCO');
INSERT INTO Coach(teamHeLed,coachName,nationality,age,experience,teamName)
VALUES('CAMEROON','Rigobert Song','Cameroonian','46','7','CAMEROON');
INSERT INTO Coach(teamHeLed,coachName,nationality,age,experience,teamName)
VALUES('GHANA','Otto Addo','Ghanaian','47','13','GHANA');

-- Team insertion
INSERT INTO Team(teamName,teamValue,averageAge,numberOfPlayers,goalScored,concededGoal,groupName)
VALUES('QATAR',6.3,24.6,23,1,7,'A');
INSERT INTO Team(teamName,teamValue,averageAge,numberOfPlayers,goalScored,concededGoal,groupName)
VALUES('USA',77.6,24.7,22,3,5,'B');
INSERT INTO Team(teamName,teamValue,averageAge,numberOfPlayers,goalScored,concededGoal,groupName)
VALUES('ARGENTINA',848.5,26.9,33,15,8,'C');
INSERT INTO Team(teamName,teamValue,averageAge,numberOfPlayers,goalScored,concededGoal,groupName)
VALUES('AUSTRALIA',41.9,26.0,25,4,6,'D');
INSERT INTO Team(teamName,teamValue,averageAge,numberOfPlayers,goalScored,concededGoal,groupName)
VALUES('GERMANY',545.5,26.7,21,6,5,'E');
INSERT INTO Team(teamName,teamValue,averageAge,numberOfPlayers,goalScored,concededGoal,groupName)
VALUES('MOROCCO',310.1,25.3,30,6,3,'F');
INSERT INTO Team(teamName,teamValue,averageAge,numberOfPlayers,goalScored,concededGoal,groupName)
VALUES('CAMEROON',127.5,24.7,24,4,3,'G');
INSERT INTO Team(teamName,teamValue,averageAge,numberOfPlayers,goalScored,concededGoal,groupName)
VALUES('GHANA',241.2,25.7,26,5,7,'H');

-- Stadium insertion
INSERT INTO Stadium(stadiumName,capacity,city)
VALUES('Lusail Stadium',88966,'Lusial');
INSERT INTO Stadium(stadiumName,capacity,city)
VALUES('Khalifa Stadium',45857,'Al Rayyan');
INSERT INTO Stadium(stadiumName,capacity,city)
VALUES('Stadium 974',44089,'Doha');
INSERT INTO Stadium(stadiumName,capacity,city)
VALUES('Al Bayt Stadium',68895,'Al Khor');
INSERT INTO Stadium(stadiumName,capacity,city)
VALUES('Education City Stadium',44667,'Al Rayyan');

-- Matches insertion
INSERT INTO Matches(matchCode,typeOfMatch,homeTeam,awayTeam,score,refereeName,matchDate,stadiumName)
VALUES('ARGVFRA','FINAL','ARGENTINA','FRANCE',1,'S.Marciniak','2022-12-18','Lusail Stadium');
INSERT INTO Matches(matchCode,typeOfMatch,homeTeam,awayTeam,score,refereeName,matchDate,stadiumName)
VALUES('CROVBRA','QUARTER-FINAL','CROATIA','BRAZIL',1,'M.Oliver','2022-12-09','Education City Stadium');
INSERT INTO Matches(matchCode,typeOfMatch,homeTeam,awayTeam,score,refereeName,matchDate,stadiumName)
VALUES('ARGVKSA','GROUP','ARGENTINA','SAUDI ARABIA',2,'S.Vincic','2022-11-22','Lusail Stadium');
INSERT INTO Matches(matchCode,typeOfMatch,homeTeam,awayTeam,score,refereeName,matchDate,stadiumName)
VALUES('GERVJAP','GROUP','GERMANY','JAPAN',2,'I.Cisneros','2022-11-23','Khalifa Stadium');
INSERT INTO Matches(matchCode,typeOfMatch,homeTeam,awayTeam,score,refereeName,matchDate,stadiumName)
VALUES('PORVSWI','ROUND-OF-16','PORTUGAL','SWITZERLAND',1,'C.Ramos','2022-12-06','Lusail Stadium');

-- Referee insertion
INSERT INTO Referee(refereeID,refereeName,nationality,age,yellowCards,redCards,penalties)
VALUES(6985,'S.Marciniak','Polish',42,13,0,1);
INSERT INTO Referee(refereeID,refereeName,nationality,age,yellowCards,redCards,penalties)
VALUES(8593,'M.Oliver','English',38,18,0,2);
INSERT INTO Referee(refereeID,refereeName,nationality,age,yellowCards,redCards,penalties)
VALUES(74626,'S.vincic','Slovenian',43,8,0,0);
INSERT INTO Referee(refereeID,refereeName,nationality,age,yellowCards,redCards,penalties)
VALUES(94024,'I.Cisneros','Salvadoran',32,3,0,0);
INSERT INTO Referee(refereeID,refereeName,nationality,age,yellowCards,redCards,penalties)
VALUES(58936,'C.Ramos','Mexican',40,8,0,1);

-- Player insertion
INSERT INTO Player(playerName,position,numberOfGoals,team,nationality,age,marketValue,teamName)
VALUES('Lionel Messi','RW',7,'Paris Saint-Germain','Argentine',35,45,'ARGENTINA');
INSERT INTO Player(playerName,position,numberOfGoals,team,nationality,age,marketValue,teamName)
VALUES('Thomas Müller','SS',0,'Bayern Munich','GERMAN',33,18,'GERMANY');
INSERT INTO Player(playerName,position,numberOfGoals,team,nationality,age,marketValue,teamName)
VALUES('Romain Saiss','CB',0,'Besiktas','Moroccan',33,6,'MOROCCO');
INSERT INTO Player(playerName,position,numberOfGoals,team,nationality,age,marketValue,teamName)
VALUES('Vincent Aboubakar','CF',4,'Besiktas','Cameroonian',31,5,'CAMEROON');
INSERT INTO Player(playerName,position,numberOfGoals,team,nationality,age,marketValue,teamName)
VALUES('Christian Pulisic','RW',1,'Chelsea','American',24,32,'USA');

-- Channels insertion
INSERT INTO Channels(channelName,nation,languages,matchCode)
VALUES('TRT','Turkey','Turkish','ARGVFRA');
INSERT INTO Channels(channelName,nation,languages,matchCode)
VALUES('Fuji TV','Japan','Japanese','GERVJAP');
INSERT INTO Channels(channelName,nation,languages,matchCode)
VALUES('RTP','Portugal','Portuguese','PORVSWI');
INSERT INTO Channels(channelName,nation,languages,matchCode)
VALUES('TVP','Argentina','Spanish','ARGVKSA');
INSERT INTO Channels(channelName,nation,languages,matchCode)
VALUES('HRT','Croatia','Croatian','CROVBRA');

-- play insertion
INSERT INTO play VALUES('ARGENTINA','ARGVKSA');
INSERT INTO play VALUES('GERMANY','GERVJAP');
INSERT INTO play VALUES('QATAR','PORVSWI');
INSERT INTO play VALUES('MOROCCO','CROVBRA');
INSERT INTO play VALUES('ARGENTINA','ARGVFRA');

-- place insertion
INSERT INTO place VALUES('ARGVFRA','Lusail Stadium');
INSERT INTO place VALUES('CROVBRA','Education City Stadium');
INSERT INTO place VALUES('ARGVKSA','Lusail Stadium');
INSERT INTO place VALUES('GERVJAP','Khalifa Stadium');
INSERT INTO place VALUES('PORVSWI','Lusail Stadium');

-- broadcast insertion
INSERT INTO broadcast VALUES('TRT','ARGVFRA');
INSERT INTO broadcast VALUES('Fuji TV','GERVJAP');
INSERT INTO broadcast VALUES('RTP','PORVSWI');
INSERT INTO broadcast VALUES('TVP','ARGVKSA');
INSERT INTO broadcast VALUES('HRT','CROVBRA');

-- manage insertion
INSERT INTO manage VALUES('ARGVFRA',6985);
INSERT INTO manage VALUES('CROVBRA',8593);
INSERT INTO manage VALUES('ARGVKSA',74626);
INSERT INTO manage VALUES('GERVJAP',94024);
INSERT INTO manage VALUES('PORVSWI',58936);

-- team_member insertion
INSERT INTO team_member VALUES('Lionel Messi','ARGENTINA');
INSERT INTO team_member VALUES('Thomas Müller','GERMANY');
INSERT INTO team_member VALUES('Romain Saiss','MOROCCO');
INSERT INTO team_member VALUES('Vincent Aboubakar','CAMEROON');
INSERT INTO team_member VALUES('Christian Pulisic','USA');

-- group_member insertion
INSERT INTO group_member VALUES('A','QATAR');
INSERT INTO group_member VALUES('B','USA');
INSERT INTO group_member VALUES('C','ARGENTINA');
INSERT INTO group_member VALUES('D','AUSTRALIA');
INSERT INTO group_member VALUES('E','GERMANY');

-- team_coach insertion
INSERT INTO team_coach VALUES('ARGENTINA','ARGENTINA');
INSERT INTO team_coach VALUES('GERMANY','GERMANY');
INSERT INTO team_coach VALUES('MOROCCO','MOROCCO');
INSERT INTO team_coach VALUES('CAMEROON','CAMEROON');
INSERT INTO team_coach VALUES('USA','USA');

-- 3. Queries

-- Display team name, average age and value of the team in table team whose team value smaller than average age in group A.
SELECT teamName as 'Team Name', averageAge as 'Average Age', teamValue as 'Team Value' FROM Team 
WHERE teamValue<(SELECT averageAge FROM Team WHERE groupName = 'A' ) ;

-- Calculate sum of the number of wins of each position
SELECT finalPosition as 'Final Position', sum(numberOfWins) as 'Sum Of Wins' FROM teamGroup 
GROUP BY finalPosition ORDER BY finalPosition; 

-- Add the L(Large) end of the city name if stadium's capacity more than 50000
UPDATE Stadium SET city = CONCAT(city,' L') WHERE capacity > 50000;

-- delete player whose monthly sale greater than 2 million euro.
DELETE from Player where marketValue/12>2;

-- Display stats of the teams with group name
SELECT t.groupName, t.teamName as 'Team Name', t.goalScored as 'Goal Scored', t.concededGoal as 'Conceded Goal', tg.numberofWins as 'Win', tg.numberOfDefeats as 'Defeat', tg.numberOfDraws as 'Draw',tg.finalPosition as 'Position'
FROM team t LEFT JOIN teamGroup tg ON t.groupName = tg.groupName 
ORDER BY groupName;