create database if not exists airlinereservation;
use airlinereservation;

create table if not exists Uuser (
UuserId int  primary key not null auto_increment,
username varchar(20) not null,
CNP bigint(13) NULL,
firstName varchar(20) not null,
lastName varchar(20) not null,
age int ,
check (age>=18),
phoneNr bigint(12) not null,
email varchar(20),
Adress varchar(30) not null,
city varchar(20) not null,
country varchar(20) not null,
tip int not null
check(tip in (0,1,2)),
password varchar(20) not null
check(char_length(password)>=8)

);
create table if not exists bagaj(
bagajeId int not null auto_increment primary key,
UuserId int not null,
cod varchar(6) null,
`greutate(kg)` int(6) null

);
create table if not exists Reservation(
ReservationId int not null auto_increment primary key,
UuserId int not null,
departure_date date not null,
arrival_date date not null,
scheduleId int not null
);
create table if not exists contbancar(
contId varchar(24)  primary key,
UuserId int not null
);
create table if not exists payment(
paymentId int not null auto_increment primary key,
pay_status boolean not null
);
create table if not exists reservation_payment(
paymentId int not null,
ReservationId int not null
);
create table IF NOT EXISTS Airport(
airportId int not null auto_increment primary key,
nume varchar(40),
locatie varchar(50)
);
create table if not exists Rent_a_car(
RentId int not null auto_increment primary key,
telefon bigint(11) not null,
nume_companie varchar(20)
);
create table IF NOT EXISTS taxi_cab(
taxiId int not null auto_increment primary key,
nume_companie varchar(20),
telefon bigint(10) not null
);
create table if not exists parking(
parkingId int not null auto_increment primary key,
price_per_day int not null,
from_date date not null,
to_date date not null,
from_hour int not null,
to_hour int not null
);
create table if not exists AirportServices(
AirportServicesId int not null auto_increment primary key,
telefon int(10) not null,
parkingId int not null,
taxiId int not null ,
airportId int not null,
RentId int not null
);
create table if not exists Airport_Schedule(
scheduleId int not null auto_increment primary key,
decolareActual DATETIME not null,
sosireActual DATETIME not null,
decolareDestinatie DATETIME not null,
sosireDestinatie DATETIME not null,
airportId int not null
);

create table if not exists companieAeriana(
companieAerianaId int not null auto_increment primary key,
nume varchar(20) not null,
telefon bigint(10) not null,
adresa varchar(50),
email varchar(30) not null
);


create table if not exists Destinatie(
destinatiiId int not null auto_increment primary key,
denumire varchar(30)
);
create table if not exists Avion(
nume varchar(30) not null,
idAvion int not null auto_increment primary key,
model varchar(30) not null,
capacitate int not null
);

create table if not exists FlightCost(
costId int not null auto_increment primary key,
`price(lei)` int not null,
companieAerianaId  int not null 
);

create table if not exists Dest_Comp_Avion
(legId int not null auto_increment primary key,
companieAerianaId int not null,
idAvion int not null,
destinatiiId int not null,
scheduleId int not null
);
alter table Dest_Comp_Avion add foreign key(companieAerianaId) references companieAeriana(companieAerianaId);
alter table Dest_Comp_Avion add foreign key(idAvion) references Avion(idAvion);
alter table Dest_Comp_Avion add foreign key(destinatiiId) references Destinatie(destinatiiId);
alter table Dest_Comp_Avion add foreign key(scheduleId) references airport_schedule(scheduleId);
alter table contbancar add foreign key (UuserId) references Uuser(UuserId) ;
alter table bagaj add foreign key(UuserId) references Uuser(UuserId) ;
alter table Reservation add foreign key(UuserId) references Uuser(UuserId) ;
alter table reservation_payment add foreign key(ReservationId) references Reservation(ReservationId),
add foreign key (paymentId) references payment(paymentId) ;
#1
alter table Airportservices add foreign key (RentId) references Rent_a_car(RentId) ;
alter table Airportservices add foreign key(taxiId) references taxi_cab(taxiId) ;
alter table Airportservices add foreign key(parkingId) references parking(parkingId) ;
alter table Airportservices  add foreign key(airportId) references Airport(airportId) ;
alter table Reservation add foreign key(scheduleId) references airport_Schedule(scheduleId) ;
alter table Airport_Schedule add foreign key(airportId) references Airport(airportId)  ;

#2
alter table FlightCost add foreign key(companieAerianaId) references companieAeriana(companieAerianaId);

-- 0 admin ,1 angajat,2 client 
INSERT INTO `Uuser` (`username`,`CNP`, `firstName`, `lastName`, `age`, `phoneNr`, `email`,
`Adress`, `city`, `country`,`tip`,`password`) VALUES ('Admin', '2990519125743','Admin',
'Admin', '42','0745123456','admin@localhost', 'Cluj-Napoca', 'Cluj-Napoca', 'Romania',0,'adminstrongpass');
INSERT INTO `Uuser`(`username`,`CNP`,`firstName`,`lastName`,`age`,`phoneNr`,`email`,
`Adress`, `city`, `country`,`tip`,`password`)VALUES ('Angajat','1840804260040','Popescu',
'Ion','35','0766567345','popescu@yahoo.com','Cluj-Napoca','Cluj-Napoca','Romania',1,'astaeparolamea');
INSERT INTO `Uuser` (`username`,`CNP`, `firstName`, `lastName`, `age`, `phoneNr`, `email`,
`Adress`, `city`, `country`,`tip`,`password`) VALUES ('Angajat', '1730503267895','Marinescu',
'Vasile', '39','0733567849','marinescu@gmail.com', 'Alba-Iulia', 'Alba-Iulia', 'Romania',1,'parola123');
INSERT INTO `Uuser` (`username`,`CNP`, `firstName`, `lastName`, `age`, `phoneNr`, `email`,
`Adress`, `city`, `country`,`tip`,`password`) VALUES ('Angajat', '1880925493321','Dragan',
'Dinu', '27','0756443542','dinu@gmail.com', 'Targu-Mures', 'Targu-Mures', 'Romania',1,'parolacontuluimeu');
INSERT INTO `Uuser` (`username`,`CNP`, `firstName`, `lastName`, `age`, `phoneNr`, `email`,
`Adress`, `city`, `country`,`tip`,`password`) VALUES ('Client', '1990203456789','Calinescu',
'Alin', '20','0732789967','alin@gmail.com', 'Brasov', 'Brasov', 'Romania',2,'25hfdgsjd');
INSERT INTO `Uuser` (`username`,`CNP`, `firstName`, `lastName`, `age`, `phoneNr`, `email`,
`Adress`, `city`, `country`,`tip`,`password`) VALUES('alinar1','2890703290034','Roman','Alina','30','0743567234','alliinaa@yahoo.com','Piatra-Neamt','Piatra-Neamt','Romania',2,'PPPPP888'),
('alexee','1871228665600','Stratan', 'Alexei', '32','0754321123','alexestr@gmail.com','Constanta','Constanta','Romania',2,'alexstratan'),
('ffanca','2820707567789','Fezniu', 'Anca', '37','0788543678','ancaa@gmail.com','Sibiu','Sibiu','Romania',2,'parolaeanca'),
('daniela9','2900921678900','Morariu', 'Daniela', '29','0793675647','daniela9@yahoo.com','Iasi','Iasi','Romania',2,'parolaparolaparola'),
('stanpp','1830807894567','Stan', 'Paul', '36','0765645342','stanstan@yahoo.com','Bacau','Bacau','Romania',2,'pppaarrroolllaa'),
('steff47','1737474831234','Stefan', 'Adrian', '47','0765432345','steffan7@yahoo.com','Timisoara','Timisoara','Romania',2,'stefanstef47'),
('ana7','2770730234145','Lupsa', 'Ana', '37','0765435623','ana37@yahoo.com','Suceava','Suceava','Romania',2,'anaanaana'),
('alexandrra','2741019326685','Leu', 'Alexandra', '47','0756293543','aleleu@yahoo.com','Craiova','Craiova','Romania',2,'aleleuleuparola'),
('apostolll','1770919399205','Apostol', 'Gavriil','55','0754345265','apostol@yahoo.com','Alexandria','Alexandria','Romania',2,'qwertyuuoo');



insert into `Airport`(`airportId`,`nume`,`locatie`) values (1,'Aeroportul International Avram Iancu','Traian Vuia, Nr. 149, 400397 Cluj-Napoca, Romania');


insert into `Destinatie`(`destinatiiId` ,`denumire`) values
(1,'Antalya'),(2,'Atena'),(3,'Barcelona'),(4,'Bologna'),
(5,'Bucuresti'),(6,'Dubai'),(7,'Dublin'),(8,'Frankfurt'),
(9,'Istanbul'),(10,'Kiev'),(11,'Larnaca'),(12,'Lisabona'),
(13,'Londra'),(14,'Milano'),(15,'Moscova'),(16,'Munchen'),
(17,'Nijnevartovsk'),(18,'Paris'),(19,'Roma'),(20,'Sharm el-Sheikh'),
(21,'Soci'),(22,'St.Petersburg'),(23,'Surgut'),(24,'Tel Aviv'),
(25,'Torino'),(26,'Venetia'),(27,'Verona'),(28,'Viena'),
(29,'Warsaw');

INSERT INTO `Avion`(`idAvion`,`nume`,`model`,`capacitate`) VALUES
(1,'Airbus','A 319',132),
(2,'Airbus','A 318',117),
(3,'Airbus','A 320-200',150),
(4,'ATR','42-500',48),
(5,'ATR','72-500',68),
(6,'Boeing','737-300',148),
(7,'Boeing','737-400',168),
(8,'Boeing',' 737-500',138),
(9,'Boeing',' 737-700',116),
(10,'Boeing','737-800',189),
(11,'Bombardier','Q400',78),
(12,'Fokker','F70',85),
(13,'Turbolet','L-140',19),
(14,'EMBRAER','E-195',106);

INSERT INTO `Rent_a_car`(`Rentid`, `telefon`, `nume_companie`) VALUES
(1, 0747288200,'PHP'),
(2, 0264274046,'SIXT'),
(3, 0264450711,'Rodna'),
(4,0264274165,'Hertz'),
(5, 0264590588,'Autonom');

insert into `taxi_cab`(`taxiId`,`nume_companie`,`telefon`) values
(1, 'Diesel', 0744646663),
(2, 'Pritax',0264942),
(3, 'Nova', 0264949),
(4, 'VIP',0762249949);

insert into  `companieAeriana`(`companieAerianaId`, `nume`,`telefon`,`adresa`,`email` ) values
(1,'Tarom', 0264432669,'Piata Mihai Viteazu, nr. 11','agcluj@tarom.ro'), -- 29 dest 12 avioane
(2,'Lufthansa', '0216550719','Aleea Alexandru 9A, Bucuresti, 011821', 'www.lufthansa.com'),
(3,'Wizz Air', '0264307562','UHU Systems Kft,Komali u.1,Budapesta,1223, Ungaria', 'clj.tkt@menziesaviation.com'),
(4,'Blue Air', '0374281841','Technology Park,aripa A1,sect. 1,Bucuresti,Romania', 'http://www.blueairweb.com/ '),
(5,'Turkish Airlines', '0264307664','Traian Vuia, Nr. 149,Cluj-Napoca', 'cljcustomer@thy.com'),
(6,'Cargo Air','5928144500','1 Brussels Blvd, 1540 Sofia Airport Bulgaria','sales@cargoair.bg')
;



INSERT INTO `Airport_Schedule`(`scheduleId`,`decolareActual`,`sosireActual`,`decolareDestinatie`,`sosireDestinatie`,`airportId`)values
(1,'2019-08-12 14:30:00' , '2019-08-12 16:30:00','2019-08-19 17:20:00', '2019-08-19 19:20:00', 1),
(2,'2019-08-13 20:00:00','2019-08-13 21:50:00','2019-08-22 22:50:00','2019-08-22 00:40:00',1),
(3, '2019-08-14 20:15:00','2019-08-14 22:45', '2019-08-23 00:40','2019-08-23 03:10',1),
(4,'2019-08-15 10:15','2019-08-15 11:40','2019-08-20 07:45','2019-08-20 09:15',1),
(5,'2019-08-17 12:40','2019-08-17 13:50','2019-08-24 14:50','2019-08-24 16:30',1),
(6,'2019-08-18 07:00','2019-08-18 08:30','2019-08-25 09:30','2019-08-25 12:50',1),
(7,'2019-08-18 21:40','2019-08-18 23:05','2019-08-20 19:20','2019-08-20 20:40',1),
(8,'2019-08-19 17:55','2019-08-19 18:45','2019-08-25 14:30','2019-08-25 17:20',1),
(9,'2019-08-20 14:45','2019-08-20 15:35','2019-08-23 11:20','2019-08-23 14:10',1),
(10,'2019-07-03 14:45','2019-07-03 15:35','2019-08-23 11:20','2019-08-23 14:10',1),
(11,'2019-09-20 14:45','2019-09-20 15:35','2019-09-23 11:20','2019-09-23 14:10',1),
(12,'2019-10-20 14:45','2019-10-20 15:35','2019-10-23 11:20','2019-10-23 14:10',1);


insert into  `Dest_Comp_Avion` values 
(1,1,1,1,1),(2,1,2,2,2),(3,1,3,3,3),(4,1,4,4,1),
(5,2,5,5,2),(6,2,6,6,3),(7,2,7,7,1),(8,2,8,8,2),
(9,3,9,9,3),(10,3,10,10,2),(11,3,11,11,1),(12,3,12,12,3),
(13,4,1,13,1),(14,4,2,14,2),(15,4,3,15,3),(16,4,4,16,1),
(17,5,5,17,2),(18,5,6,18,1),(19,5,7,19,3),(20,5,8,20,2),
(21,6,9,21,3),(22,6,10,22,1),(23,6,11,23,2),(24,6,12,24,3),
(25,1,5,25,3),(26,2,9,26,2),(27,3,1,27,1),(28,4,4,28,3),(29,5,6,29,2),(30,6,7,1,1),
(31,6,12,29,1),(32,5,2,28,2),(33,4,11,27,3),(34,3,10,26,1),
(35,3,6,25,2),(36,2,7,24,1),(37,1,8,23,3),(38,4,9,22,2),
(39,6,5,21,3),(40,5,4,20,1),(41,3,3,19,2),(42,4,2,18,3),
(43,4,10,17,1),(44,3,11,16,3),(45,2,12,14,2),(46,1,1,15,1),
(47,2,9,13,2),(48,6,8,12,3),(49,4,7,11,1),(50,5,6,10,2),
(51,4,2,9,2),(52,6,3,8,1),(53,1,4,7,2),(54,5,5,6,3),
(55,1,1,5,3),(56,2,10,4,1),(57,3,11,3,2),(58,4,8,2,3),(59,5,2,1,1),(60,6,4,29,1);

insert into `Reservation`(`UuserId`,`departure_date`,`arrival_date`,`scheduleId`)values
(1,'2019-08-12','2019-08-12',1),
(1,'2019-08-19','2019-08-19',1),
(2,'2019-08-13','2019-08-13',2),
(2,'2019-08-22','2019-08-23',2),
(3,'2019-08-14','2019-08-14',3),
(3,'2019-08-22','2019-08-22',3),
(4,'2019-08-15','2019-08-15',4),
(4,'2019-08-20','2019-08-20',4),
(5,'2019-08-17','2019-08-17',5),
(5,'2019-08-24','2019-08-24',5),
(6,'2019-08-18','2019-08-18',6),
(6,'2019-08-25','2019-08-25',6),
(7,'2019-08-18','2019-08-18',7),
(7,'2019-08-20','2019-08-20',7)
;

insert into `payment`(`paymentId`,`pay_status`)values
(1,1),(2,1),(3,1),(4,0),(5,1),(6,1),(7,0);

insert into `parking`(`price_per_day`,`from_date`,`to_date`,`from_hour`,`to_hour`)values
(20,'2019-08-12','2019-08-19',14,20),
(20,'2019-08-13','2019-08-23',21,1),
(20,'2019-08-14','2019-08-23',20,4),
(20,'2019-08-15','2019-08-20',10,10),
(20,'2019-08-17','2019-08-24',12,5),
(20,'2019-08-18','2019-08-25',7,13),
(20,'2019-08-18','2019-08-20',21,20)
;
insert into `contbancar`(`contId`,`UuserId`) values
('RO02INGB0001008214498950',1),
('RO28BRDE450SV21000004500',2),
('RO30BTRLRONCRT0V05650502',3),
('RO76BRDE450SV43872614500',4),
('RO05BRDE450SV07295334500',5),
('RO63BRDE450SV57339384500',6),
('RO23RNCB0108002198610001',7)
;

insert into `bagaj`(`UuserId`,`cod`,`greutate(kg)`)values
(1,'302fv1','5'),(2,'2456gh','10'),(3,'wffsf6','7'),(4,'asd673','2'),
(5,'345ghj','1'),(6,'5678yu','8'),(7,'89hjgh','4'),(8,'56789j','9'),
(9,'wertyu','5'),(10,'ddfg67','10'),(11,'123456','7'),(12,'asd234','5'),(13,'fgh789','3');

insert into flightcost values 
(1,200,1),(2,400,2),(3,350,3),(4,335,4),(5,600,5),(6,100,6);

#GRANT ALL PRIVILEGES ON airlinereservation.* TO 'airlinereservation'@'localhost' IDENTIFIED BY 'parola';
#FLUSH PRIVILEGES;
