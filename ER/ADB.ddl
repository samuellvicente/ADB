CREATE TABLE Person (
  GovID       number(19) GENERATED AS IDENTITY, 
  Name        varchar2(255) NOT NULL, 
  PhoneNumber varchar2(255) NOT NULL UNIQUE, 
  Email       varchar2(255) NOT NULL, 
  Address     varchar2(255) NOT NULL, 
  Birthday    date NOT NULL, 
  Nationality varchar2(255) NOT NULL, 
  PRIMARY KEY (GovID));
CREATE TABLE Costumer (
  CostumerID  number(19) GENERATED AS IDENTITY, 
  PersonGovID number(19) NOT NULL, 
  PRIMARY KEY (CostumerID));
CREATE TABLE Employee (
  EmployeeID  number(19) GENERATED AS IDENTITY, 
  PersonGovID number(19) NOT NULL, 
  Bonus       number(3, 5) CHECK(Bonus>=0), 
  SickDays    number(10) CHECK(SickDays<10), 
  PRIMARY KEY (EmployeeID));
CREATE TABLE Account (
  AccountID          number(19) GENERATED AS IDENTITY, 
  CostumerCostumerID number(19) NOT NULL, 
  Amount             number(19, 2) NOT NULL CHECK(Amount>=0), 
  BeginDate          date NOT NULL, 
  EndDate            date, 
  PRIMARY KEY (AccountID));
CREATE TABLE Branch (
  BranchId number(19) GENERATED AS IDENTITY, 
  Address  varchar2(255), 
  PRIMARY KEY (BranchId));
CREATE TABLE "Role History" (
  HistoryID          number(19) GENERATED AS IDENTITY, 
  BeginDate          date NOT NULL, 
  EndDate            date, 
  RoleRoleID         number(19) NOT NULL, 
  EmployeeEmployeeID number(19) NOT NULL, 
  BranchBranchId     number(19) NOT NULL, 
  PRIMARY KEY (HistoryID));
CREATE TABLE Role (
  RoleID      number(19) GENERATED AS IDENTITY, 
  BaseSalary  number(10) NOT NULL CHECK(BaseSalary>0), 
  Name        varchar2(255) NOT NULL, 
  Description varchar2(255) NOT NULL, 
  PRIMARY KEY (RoleID));
CREATE TABLE Loan (
  LoanID           number(19) GENERATED AS IDENTITY, 
  Amount           number(19, 2) NOT NULL CHECK(Amount>0), 
  InterestRate     number(3, 5) NOT NULL, 
  DateOfCompletion date NOT NULL, 
  DateOfCreation   date NOT NULL, 
  BranchBranchId   number(19) NOT NULL, 
  PRIMARY KEY (LoanID));
CREATE TABLE Payment (
  PaymentID               number(19) GENERATED AS IDENTITY, 
  "Date"                  date NOT NULL, 
  Amount                  number(19, 2) NOT NULL CHECK(Amount>0), 
  LoanLoanID              number(19) NOT NULL, 
  CurrentAccountAccountID number(19), 
  PRIMARY KEY (PaymentID));
CREATE TABLE Savings (
  AccountAccountID number(19) NOT NULL, 
  InterestRate     number(3, 5) NOT NULL CHECK(InterestRate>0), 
  TypeOfInterest   varchar2(255) NOT NULL, 
  DurationYears    number(10) NOT NULL CHECK(DurationYears>0), 
  PRIMARY KEY (AccountAccountID));
CREATE TABLE Deposit (
  DepositID        number(19) GENERATED AS IDENTITY, 
  "Date"           date NOT NULL, 
  Amount           number(19, 2) NOT NULL CHECK(Amount>0), 
  AccountAccountID number(19) NOT NULL, 
  PRIMARY KEY (DepositID));
CREATE TABLE Tranfer (
  TransferID        number(19) GENERATED AS IDENTITY, 
  "Date"            date NOT NULL, 
  Amount            number(19, 2) NOT NULL CHECK(Amount>0), 
  AccountAccountID  number(19) NOT NULL, 
  AccountAccountID2 number(19) NOT NULL, 
  PRIMARY KEY (TransferID));
CREATE TABLE Withdraw (
  WithdrawID              number(19) GENERATED AS IDENTITY, 
  "Date"                  date NOT NULL, 
  Amount                  number(19, 2) NOT NULL CHECK(Amount>0), 
  CurrentAccountAccountID number(19), 
  PRIMARY KEY (WithdrawID));
CREATE TABLE "Current" (
  AccountAccountID number(19) NOT NULL, 
  Name             varchar2(255) NOT NULL, 
  MaximumWithdraw  number(10), 
  PRIMARY KEY (AccountAccountID));
ALTER TABLE Costumer ADD CONSTRAINT FKCostumer923053 FOREIGN KEY (PersonGovID) REFERENCES Person (GovID);
ALTER TABLE Employee ADD CONSTRAINT FKEmployee249023 FOREIGN KEY (PersonGovID) REFERENCES Person (GovID);
ALTER TABLE Account ADD CONSTRAINT FKAccount895601 FOREIGN KEY (CostumerCostumerID) REFERENCES Costumer (CostumerID);
ALTER TABLE "Role History" ADD CONSTRAINT "FKRole Histo464446" FOREIGN KEY (RoleRoleID) REFERENCES Role (RoleID);
ALTER TABLE "Role History" ADD CONSTRAINT "FKRole Histo595436" FOREIGN KEY (EmployeeEmployeeID) REFERENCES Employee (EmployeeID);
ALTER TABLE "Role History" ADD CONSTRAINT "FKRole Histo940425" FOREIGN KEY (BranchBranchId) REFERENCES Branch (BranchId);
ALTER TABLE Loan ADD CONSTRAINT FKLoan357293 FOREIGN KEY (BranchBranchId) REFERENCES Branch (BranchId);
ALTER TABLE Savings ADD CONSTRAINT FKSavings131477 FOREIGN KEY (AccountAccountID) REFERENCES Account (AccountID);
ALTER TABLE Payment ADD CONSTRAINT FKPayment955503 FOREIGN KEY (LoanLoanID) REFERENCES Loan (LoanID);
ALTER TABLE Deposit ADD CONSTRAINT FKDeposit626030 FOREIGN KEY (AccountAccountID) REFERENCES Account (AccountID);
ALTER TABLE Tranfer ADD CONSTRAINT FKTranfer816388 FOREIGN KEY (AccountAccountID) REFERENCES Account (AccountID);
ALTER TABLE Tranfer ADD CONSTRAINT FKTranfer299653 FOREIGN KEY (AccountAccountID2) REFERENCES Account (AccountID);
ALTER TABLE Payment ADD CONSTRAINT FKPayment131080 FOREIGN KEY (CurrentAccountAccountID) REFERENCES "Current" (AccountAccountID);
ALTER TABLE Withdraw ADD CONSTRAINT FKWithdraw268777 FOREIGN KEY (CurrentAccountAccountID) REFERENCES "Current" (AccountAccountID);
ALTER TABLE "Current" ADD CONSTRAINT FKCurrent140607 FOREIGN KEY (AccountAccountID) REFERENCES Account (AccountID);
