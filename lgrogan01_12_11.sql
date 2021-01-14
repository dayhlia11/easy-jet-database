-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 12, 2020 at 03:17 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lgrogan01`
--

-- --------------------------------------------------------

--
-- Table structure for table `EZJ_Aircraft`
--

CREATE TABLE `EZJ_Aircraft` (
  `AircraftID` int(11) NOT NULL,
  `AircraftModel` varchar(255) NOT NULL,
  `AircraftSeatCount` int(11) NOT NULL,
  `AircraftRegCode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EZJ_Aircraft`
--

INSERT INTO `EZJ_Aircraft` (`AircraftID`, `AircraftModel`, `AircraftSeatCount`, `AircraftRegCode`) VALUES
(1, 'Boeing 737', 186, 'EI-LRB');

-- --------------------------------------------------------

--
-- Table structure for table `EZJ_Airport`
--

CREATE TABLE `EZJ_Airport` (
  `AirportID` int(11) NOT NULL,
  `AirportShortcode` varchar(255) NOT NULL,
  `AirportName` varchar(255) NOT NULL,
  `AirportCity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EZJ_Airport`
--

INSERT INTO `EZJ_Airport` (`AirportID`, `AirportShortcode`, `AirportName`, `AirportCity`) VALUES
(1, 'DUB', 'Dublin Airport', 1),
(3, 'BFS', 'Belfast International Airport', 3),
(4, 'AMS', 'Amsterdam Airport Schiphol', 4),
(5, 'LPL', 'Liverpool John Lennon Airport', 5),
(6, 'IBZ', 'Ibiza Airport', 6),
(7, 'LGW', 'Gatwick Airport', 7),
(8, 'LTN', 'London Luton Airport', 7);

-- --------------------------------------------------------

--
-- Table structure for table `EZJ_Booker`
--

CREATE TABLE `EZJ_Booker` (
  `BookerID` int(11) NOT NULL,
  `BookerTitleID` int(11) NOT NULL,
  `BookerFirstName` varchar(255) NOT NULL,
  `BookerLastName` varchar(255) NOT NULL,
  `BookerEmail` varchar(255) NOT NULL,
  `BookerAddressID` int(11) NOT NULL,
  `PlusMemberYN` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EZJ_Booker`
--

INSERT INTO `EZJ_Booker` (`BookerID`, `BookerTitleID`, `BookerFirstName`, `BookerLastName`, `BookerEmail`, `BookerAddressID`, `PlusMemberYN`) VALUES
(4, 1, 'Zig', 'Zag', 'zigzag@gmail.com', 2, 1),
(5, 3, 'Party', 'Hard', 'partyhard@hotmail.com', 3, 0),
(6, 6, 'Albert', 'Einstein', 'relativityrules@gmail.com', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `EZJ_Booking`
--

CREATE TABLE `EZJ_Booking` (
  `BookingID` int(11) NOT NULL,
  `BookingRefCode` varchar(255) NOT NULL,
  `BookerID` int(11) NOT NULL,
  `BookingDate` date NOT NULL,
  `BookingTime` time NOT NULL,
  `BookingTotalPrice` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EZJ_Booking`
--

INSERT INTO `EZJ_Booking` (`BookingID`, `BookingRefCode`, `BookerID`, `BookingDate`, `BookingTime`, `BookingTotalPrice`) VALUES
(4, 'zigzagandco', 4, '2020-11-03', '10:47:02', '52.00'),
(5, 'partygang123', 5, '2020-11-05', '15:01:29', '200.00');

-- --------------------------------------------------------

--
-- Table structure for table `EZJ_BookingLineItem`
--

CREATE TABLE `EZJ_BookingLineItem` (
  `BookingLineItemID` int(11) NOT NULL,
  `LineItemName` varchar(255) NOT NULL,
  `LineItemDesc` varchar(255) NOT NULL,
  `LineItemCost` decimal(12,2) NOT NULL,
  `Booking` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EZJ_BookingLineItem`
--

INSERT INTO `EZJ_BookingLineItem` (`BookingLineItemID`, `LineItemName`, `LineItemDesc`, `LineItemCost`, `Booking`) VALUES
(5, 'Adult Std Ticket', 'Standard One Way Adult', '25.99', 4),
(6, 'Adult Std Ticket', 'Standard One Way Adult', '25.99', 4),
(7, 'Child Std Ticket', 'Standard Ticket Child', '13.99', 4);

-- --------------------------------------------------------

--
-- Table structure for table `EZJ_Charge`
--

CREATE TABLE `EZJ_Charge` (
  `ChargeID` int(11) NOT NULL,
  `ChargeType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `EZJ_City`
--

CREATE TABLE `EZJ_City` (
  `CityID` int(11) NOT NULL,
  `CityName` varchar(11) NOT NULL,
  `CountryID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EZJ_City`
--

INSERT INTO `EZJ_City` (`CityID`, `CityName`, `CountryID`) VALUES
(1, 'Dublin', 1),
(3, 'Belfast', 3),
(4, 'Amsterdam', 4),
(5, 'Liverpool', 5),
(6, 'Ibiza', 7),
(7, 'London', 5);

-- --------------------------------------------------------

--
-- Table structure for table `EZJ_Country`
--

CREATE TABLE `EZJ_Country` (
  `CountryID` int(11) NOT NULL,
  `CountryName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EZJ_Country`
--

INSERT INTO `EZJ_Country` (`CountryID`, `CountryName`) VALUES
(1, 'Republic of Ireland'),
(3, 'Northern Ireland'),
(4, 'The Netherlands'),
(5, 'England'),
(7, 'Spain');

-- --------------------------------------------------------

--
-- Table structure for table `EZJ_Flight`
--

CREATE TABLE `EZJ_Flight` (
  `FlightID` int(11) NOT NULL,
  `FlightReferenceNumber` varchar(255) NOT NULL,
  `RouteID` int(11) NOT NULL,
  `FlightDepDate` date NOT NULL,
  `FlightDepTime` time NOT NULL,
  `FlightArrDate` date NOT NULL,
  `FlightArrTime` time NOT NULL,
  `AircraftID` int(11) NOT NULL,
  `FlightPrice` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EZJ_Flight`
--

INSERT INTO `EZJ_Flight` (`FlightID`, `FlightReferenceNumber`, `RouteID`, `FlightDepDate`, `FlightDepTime`, `FlightArrDate`, `FlightArrTime`, `AircraftID`, `FlightPrice`) VALUES
(1, 'EI105 ', 5, '2020-11-11', '12:23:00', '2020-11-12', '10:09:00', 1, 200),
(2, 'EI137', 6, '2020-10-31', '20:00:00', '2020-12-17', '04:00:00', 1, 200),
(3, 'EZY6771', 3, '2020-11-03', '17:20:52', '2020-11-03', '19:55:52', 1, 300),
(4, 'EZY6691', 7, '2020-12-30', '13:03:12', '2020-12-30', '20:03:12', 1, 200);

-- --------------------------------------------------------

--
-- Table structure for table `EZJ_Luggage`
--

CREATE TABLE `EZJ_Luggage` (
  `LuggageID` int(11) NOT NULL,
  `LuggageType` varchar(255) NOT NULL,
  `LuggageWeight` double NOT NULL,
  `LuggageDimensions` varchar(255) NOT NULL,
  `LuggageDescription` varchar(2550) NOT NULL,
  `LuggagePrice` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EZJ_Luggage`
--

INSERT INTO `EZJ_Luggage` (`LuggageID`, `LuggageType`, `LuggageWeight`, `LuggageDimensions`, `LuggageDescription`, `LuggagePrice`) VALUES
(1, 'Small Hand Luggage', 5, '40x40', 'Small carry on luggage heavier than 5kg', 0),
(2, 'Large Hand Luggage', 10, '60x60', 'Large carry on luggage heavier than 10 kg', 5),
(3, 'Large Hold Luggage', 26, '', 'Large hold luggage weighing 26 kg or under', 39.24),
(4, 'Small Hold Luggage', 15, '', 'Small hold luggage weighing 15 kg or under', 23.24),
(5, 'Medium Hold Luggage', 23, '', 'Medium hold luggage weighing 23 kg or under', 27.24);

-- --------------------------------------------------------

--
-- Table structure for table `EZJ_Passenger`
--

CREATE TABLE `EZJ_Passenger` (
  `PassengerID` int(11) NOT NULL,
  `PassengerBookingID` int(11) NOT NULL,
  `PassengerTitleID` int(11) NOT NULL,
  `PassengerFirstName` varchar(255) NOT NULL,
  `PassengerLastName` varchar(255) NOT NULL,
  `PassengerTypeID` int(11) NOT NULL,
  `PassengerFlightID` int(11) NOT NULL,
  `PassengerSeatID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EZJ_Passenger`
--

INSERT INTO `EZJ_Passenger` (`PassengerID`, `PassengerBookingID`, `PassengerTitleID`, `PassengerFirstName`, `PassengerLastName`, `PassengerTypeID`, `PassengerFlightID`, `PassengerSeatID`) VALUES
(5, 4, 1, 'Squiggly', 'Wiggles', 2, 3, 2),
(6, 4, 1, 'Zig', 'Zag', 1, 3, 3),
(7, 4, 2, 'Swirly', 'Wirly', 1, 3, 3),
(8, 5, 4, 'Party', 'Hard', 1, 4, 1),
(9, 5, 1, 'Dance', 'Allnite', 1, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `EZJ_PassengerLuggage`
--

CREATE TABLE `EZJ_PassengerLuggage` (
  `PassengerLuggageID` int(11) NOT NULL,
  `PassengerID` int(11) NOT NULL,
  `LuggageID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EZJ_PassengerLuggage`
--

INSERT INTO `EZJ_PassengerLuggage` (`PassengerLuggageID`, `PassengerID`, `LuggageID`) VALUES
(1, 6, 1),
(2, 7, 3),
(3, 8, 5);

-- --------------------------------------------------------

--
-- Table structure for table `EZJ_PassengerSpecialReq`
--

CREATE TABLE `EZJ_PassengerSpecialReq` (
  `PassengerSpecialRepIQ` int(11) NOT NULL,
  `PassengerID` int(11) NOT NULL,
  `SpecialReqID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `EZJ_PassengerType`
--

CREATE TABLE `EZJ_PassengerType` (
  `PassengerTypeID` int(11) NOT NULL,
  `PassengerTypeName` varchar(255) NOT NULL,
  `PassengerTypeDesc` varchar(2550) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EZJ_PassengerType`
--

INSERT INTO `EZJ_PassengerType` (`PassengerTypeID`, `PassengerTypeName`, `PassengerTypeDesc`) VALUES
(1, 'Adult', 'Passenger aged 16-70 years'),
(2, 'Child', 'Passenger aged 4-15 years'),
(3, 'Infant', 'Passenger aged 0-3 years'),
(4, 'Senior', 'Passenger aged 70+ years');

-- --------------------------------------------------------

--
-- Table structure for table `EZJ_Payment`
--

CREATE TABLE `EZJ_Payment` (
  `CardID` int(11) NOT NULL,
  `CardName` varbinary(255) NOT NULL,
  `CardNumber` varbinary(255) NOT NULL,
  `CardProvider` varchar(255) NOT NULL,
  `CCV` varbinary(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EZJ_Payment`
--

INSERT INTO `EZJ_Payment` (`CardID`, `CardName`, `CardNumber`, `CardProvider`, `CCV`) VALUES
(2, 0x675bdac9bb5531d52e988f20de95c075, 0x66c6b0fcfb611fd189cf8723d1a1008a30883ad8d8f370949105dfe87facc389, 'Visa', 0x41c4d2dfced9a73f01ab5f06075981ef),
(3, 0xea51b34a948b98884a1ad848acdc65c1, 0x73022c445e6ae7dde8b39340a778e520, 'Visa', 0xbe0fb8613ab6f466edaa3b4b0a9f29fe);

-- --------------------------------------------------------

--
-- Table structure for table `EZJ_Route`
--

CREATE TABLE `EZJ_Route` (
  `RouteID` int(11) NOT NULL,
  `DepartureAirport` int(11) NOT NULL,
  `ArrivalAirport` int(11) NOT NULL,
  `RouteName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EZJ_Route`
--

INSERT INTO `EZJ_Route` (`RouteID`, `DepartureAirport`, `ArrivalAirport`, `RouteName`) VALUES
(3, 3, 4, 'BFS to AMS'),
(4, 4, 3, 'AMS to BFS'),
(5, 1, 5, 'DUB to LPL'),
(6, 5, 1, 'LPL to DUB'),
(7, 3, 6, 'BFS to IBZ'),
(8, 6, 3, 'IBZ to BFS');

-- --------------------------------------------------------

--
-- Table structure for table `EZJ_Seat`
--

CREATE TABLE `EZJ_Seat` (
  `SeatID` int(11) NOT NULL,
  `SeatLocation` varchar(255) NOT NULL,
  `SeatTypeID` int(11) NOT NULL,
  `FlightID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EZJ_Seat`
--

INSERT INTO `EZJ_Seat` (`SeatID`, `SeatLocation`, `SeatTypeID`, `FlightID`) VALUES
(1, '1A', 2, 3),
(2, '1B', 2, 3),
(3, '1C', 2, 3),
(4, '2A', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `EZJ_SeatType`
--

CREATE TABLE `EZJ_SeatType` (
  `SeatTypeID` int(11) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `SeatPrice` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EZJ_SeatType`
--

INSERT INTO `EZJ_SeatType` (`SeatTypeID`, `Type`, `SeatPrice`) VALUES
(1, 'Front Standard', '5.99'),
(2, 'Front Extra Leg Room', '20.99'),
(3, 'Up Front', '13.49'),
(4, 'Back Extra Legroom', '15.49'),
(5, 'Back Standard', '3.99');

-- --------------------------------------------------------

--
-- Table structure for table `EZJ_SpecialReq`
--

CREATE TABLE `EZJ_SpecialReq` (
  `SpecialRepID` int(11) NOT NULL,
  `SpecialRepDesc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EZJ_SpecialReq`
--

INSERT INTO `EZJ_SpecialReq` (`SpecialRepID`, `SpecialRepDesc`) VALUES
(1, 'Sight Impaired'),
(2, 'Hearing Impaired');

-- --------------------------------------------------------

--
-- Table structure for table `EZJ_Title`
--

CREATE TABLE `EZJ_Title` (
  `TitleID` int(11) NOT NULL,
  `TitleType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EZJ_Title`
--

INSERT INTO `EZJ_Title` (`TitleID`, `TitleType`) VALUES
(1, 'Mr'),
(2, 'Mrs'),
(3, 'Ms'),
(4, 'Miss'),
(5, 'Dr'),
(6, 'Prof');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `EZJ_Aircraft`
--
ALTER TABLE `EZJ_Aircraft`
  ADD PRIMARY KEY (`AircraftID`);

--
-- Indexes for table `EZJ_Airport`
--
ALTER TABLE `EZJ_Airport`
  ADD PRIMARY KEY (`AirportID`),
  ADD KEY `FK_City` (`AirportCity`);

--
-- Indexes for table `EZJ_Booker`
--
ALTER TABLE `EZJ_Booker`
  ADD PRIMARY KEY (`BookerID`),
  ADD KEY `FK_BookerTitleID` (`BookerTitleID`);

--
-- Indexes for table `EZJ_Booking`
--
ALTER TABLE `EZJ_Booking`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `FK_BookerID` (`BookerID`);

--
-- Indexes for table `EZJ_BookingLineItem`
--
ALTER TABLE `EZJ_BookingLineItem`
  ADD PRIMARY KEY (`BookingLineItemID`),
  ADD KEY `FK_BookingLineItem` (`Booking`);

--
-- Indexes for table `EZJ_Charge`
--
ALTER TABLE `EZJ_Charge`
  ADD PRIMARY KEY (`ChargeID`);

--
-- Indexes for table `EZJ_City`
--
ALTER TABLE `EZJ_City`
  ADD PRIMARY KEY (`CityID`),
  ADD KEY `FK_CityCountry` (`CountryID`);

--
-- Indexes for table `EZJ_Country`
--
ALTER TABLE `EZJ_Country`
  ADD PRIMARY KEY (`CountryID`);

--
-- Indexes for table `EZJ_Flight`
--
ALTER TABLE `EZJ_Flight`
  ADD PRIMARY KEY (`FlightID`),
  ADD KEY `FK_RouteID` (`RouteID`),
  ADD KEY `FK_AircraftID` (`AircraftID`);

--
-- Indexes for table `EZJ_Luggage`
--
ALTER TABLE `EZJ_Luggage`
  ADD PRIMARY KEY (`LuggageID`);

--
-- Indexes for table `EZJ_Passenger`
--
ALTER TABLE `EZJ_Passenger`
  ADD PRIMARY KEY (`PassengerID`),
  ADD KEY `FK_BookingID` (`PassengerBookingID`),
  ADD KEY `FK_FlightID` (`PassengerFlightID`),
  ADD KEY `FK_TitleID` (`PassengerTitleID`),
  ADD KEY `FK_PassengerTypeID` (`PassengerTypeID`),
  ADD KEY `SK_PassengerSeat` (`PassengerSeatID`);

--
-- Indexes for table `EZJ_PassengerLuggage`
--
ALTER TABLE `EZJ_PassengerLuggage`
  ADD PRIMARY KEY (`PassengerLuggageID`),
  ADD KEY `FK_PassengerLuggageID` (`PassengerID`),
  ADD KEY `FK_LuggagePassengerID` (`LuggageID`);

--
-- Indexes for table `EZJ_PassengerSpecialReq`
--
ALTER TABLE `EZJ_PassengerSpecialReq`
  ADD PRIMARY KEY (`PassengerSpecialRepIQ`);

--
-- Indexes for table `EZJ_PassengerType`
--
ALTER TABLE `EZJ_PassengerType`
  ADD PRIMARY KEY (`PassengerTypeID`);

--
-- Indexes for table `EZJ_Payment`
--
ALTER TABLE `EZJ_Payment`
  ADD PRIMARY KEY (`CardID`);

--
-- Indexes for table `EZJ_Route`
--
ALTER TABLE `EZJ_Route`
  ADD PRIMARY KEY (`RouteID`),
  ADD KEY `FK_ArrivAirportID` (`ArrivalAirport`),
  ADD KEY `FK_DeptAirportID` (`DepartureAirport`);

--
-- Indexes for table `EZJ_Seat`
--
ALTER TABLE `EZJ_Seat`
  ADD PRIMARY KEY (`SeatID`),
  ADD KEY `FK_SeatType` (`SeatTypeID`),
  ADD KEY `FK_SeatFlightID` (`FlightID`);

--
-- Indexes for table `EZJ_SeatType`
--
ALTER TABLE `EZJ_SeatType`
  ADD PRIMARY KEY (`SeatTypeID`);

--
-- Indexes for table `EZJ_SpecialReq`
--
ALTER TABLE `EZJ_SpecialReq`
  ADD PRIMARY KEY (`SpecialRepID`);

--
-- Indexes for table `EZJ_Title`
--
ALTER TABLE `EZJ_Title`
  ADD PRIMARY KEY (`TitleID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `EZJ_Aircraft`
--
ALTER TABLE `EZJ_Aircraft`
  MODIFY `AircraftID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `EZJ_Airport`
--
ALTER TABLE `EZJ_Airport`
  MODIFY `AirportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `EZJ_Booker`
--
ALTER TABLE `EZJ_Booker`
  MODIFY `BookerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `EZJ_Booking`
--
ALTER TABLE `EZJ_Booking`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `EZJ_BookingLineItem`
--
ALTER TABLE `EZJ_BookingLineItem`
  MODIFY `BookingLineItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `EZJ_Charge`
--
ALTER TABLE `EZJ_Charge`
  MODIFY `ChargeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `EZJ_City`
--
ALTER TABLE `EZJ_City`
  MODIFY `CityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `EZJ_Country`
--
ALTER TABLE `EZJ_Country`
  MODIFY `CountryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `EZJ_Flight`
--
ALTER TABLE `EZJ_Flight`
  MODIFY `FlightID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `EZJ_Luggage`
--
ALTER TABLE `EZJ_Luggage`
  MODIFY `LuggageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `EZJ_Passenger`
--
ALTER TABLE `EZJ_Passenger`
  MODIFY `PassengerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `EZJ_PassengerLuggage`
--
ALTER TABLE `EZJ_PassengerLuggage`
  MODIFY `PassengerLuggageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `EZJ_PassengerSpecialReq`
--
ALTER TABLE `EZJ_PassengerSpecialReq`
  MODIFY `PassengerSpecialRepIQ` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `EZJ_PassengerType`
--
ALTER TABLE `EZJ_PassengerType`
  MODIFY `PassengerTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `EZJ_Payment`
--
ALTER TABLE `EZJ_Payment`
  MODIFY `CardID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `EZJ_Route`
--
ALTER TABLE `EZJ_Route`
  MODIFY `RouteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `EZJ_Seat`
--
ALTER TABLE `EZJ_Seat`
  MODIFY `SeatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `EZJ_SeatType`
--
ALTER TABLE `EZJ_SeatType`
  MODIFY `SeatTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `EZJ_SpecialReq`
--
ALTER TABLE `EZJ_SpecialReq`
  MODIFY `SpecialRepID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `EZJ_Title`
--
ALTER TABLE `EZJ_Title`
  MODIFY `TitleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `EZJ_Airport`
--
ALTER TABLE `EZJ_Airport`
  ADD CONSTRAINT `FK_City` FOREIGN KEY (`AirportCity`) REFERENCES `EZJ_City` (`CityID`);

--
-- Constraints for table `EZJ_Booker`
--
ALTER TABLE `EZJ_Booker`
  ADD CONSTRAINT `FK_BookerTitleID` FOREIGN KEY (`BookerTitleID`) REFERENCES `EZJ_Title` (`TitleID`);

--
-- Constraints for table `EZJ_Booking`
--
ALTER TABLE `EZJ_Booking`
  ADD CONSTRAINT `FK_BookerID` FOREIGN KEY (`BookerID`) REFERENCES `EZJ_Booker` (`BookerID`);

--
-- Constraints for table `EZJ_BookingLineItem`
--
ALTER TABLE `EZJ_BookingLineItem`
  ADD CONSTRAINT `FK_BookingLineItem` FOREIGN KEY (`Booking`) REFERENCES `EZJ_Booking` (`BookingID`);

--
-- Constraints for table `EZJ_City`
--
ALTER TABLE `EZJ_City`
  ADD CONSTRAINT `FK_CityCountry` FOREIGN KEY (`CountryID`) REFERENCES `EZJ_Country` (`CountryID`);

--
-- Constraints for table `EZJ_Flight`
--
ALTER TABLE `EZJ_Flight`
  ADD CONSTRAINT `FK_AircraftID` FOREIGN KEY (`AircraftID`) REFERENCES `EZJ_Aircraft` (`AircraftID`),
  ADD CONSTRAINT `FK_RouteID` FOREIGN KEY (`RouteID`) REFERENCES `EZJ_Route` (`RouteID`);

--
-- Constraints for table `EZJ_Passenger`
--
ALTER TABLE `EZJ_Passenger`
  ADD CONSTRAINT `FK_BookingID` FOREIGN KEY (`PassengerBookingID`) REFERENCES `EZJ_Booking` (`BookingID`),
  ADD CONSTRAINT `FK_FlightID` FOREIGN KEY (`PassengerFlightID`) REFERENCES `EZJ_Flight` (`FlightID`),
  ADD CONSTRAINT `FK_PassengerTypeID` FOREIGN KEY (`PassengerTypeID`) REFERENCES `EZJ_PassengerType` (`PassengerTypeID`),
  ADD CONSTRAINT `FK_TitleID` FOREIGN KEY (`PassengerTitleID`) REFERENCES `EZJ_Title` (`TitleID`),
  ADD CONSTRAINT `SK_PassengerSeat` FOREIGN KEY (`PassengerSeatID`) REFERENCES `EZJ_Seat` (`SeatID`);

--
-- Constraints for table `EZJ_PassengerLuggage`
--
ALTER TABLE `EZJ_PassengerLuggage`
  ADD CONSTRAINT `FK_LuggagePassengerID` FOREIGN KEY (`LuggageID`) REFERENCES `EZJ_Luggage` (`LuggageID`),
  ADD CONSTRAINT `FK_PassengerLuggageID` FOREIGN KEY (`PassengerID`) REFERENCES `EZJ_Passenger` (`PassengerID`);

--
-- Constraints for table `EZJ_Route`
--
ALTER TABLE `EZJ_Route`
  ADD CONSTRAINT `FK_ArrivAirportID` FOREIGN KEY (`ArrivalAirport`) REFERENCES `EZJ_Airport` (`AirportID`),
  ADD CONSTRAINT `FK_DeptAirportID` FOREIGN KEY (`DepartureAirport`) REFERENCES `EZJ_Airport` (`AirportID`);

--
-- Constraints for table `EZJ_Seat`
--
ALTER TABLE `EZJ_Seat`
  ADD CONSTRAINT `FK_SeatFlightID` FOREIGN KEY (`FlightID`) REFERENCES `EZJ_Flight` (`FlightID`),
  ADD CONSTRAINT `FK_SeatType` FOREIGN KEY (`SeatTypeID`) REFERENCES `EZJ_SeatType` (`SeatTypeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
