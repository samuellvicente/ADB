CREATE TABLE Person (
  GovID       number(19) NOT NULL, 
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
  Bonus       number(10, 5) NOT NULL CHECK(Bonus>=0), 
  SickDays    number(10) NOT NULL CHECK(SickDays<10), 
  PRIMARY KEY (EmployeeID));
CREATE TABLE Account (
  AccountID          number(19) GENERATED AS IDENTITY, 
  CostumerCostumerID number(19) NOT NULL, 
  BranchBranchId     number(19) NOT NULL, 
  Amount             number(19, 2) NOT NULL CHECK(Amount>=0), 
  BeginDate          date NOT NULL, 
  EndDate            date, 
  PRIMARY KEY (AccountID));
CREATE TABLE Branch (
  BranchId number(19) GENERATED AS IDENTITY, 
  Address  varchar2(255) NOT NULL, 
  PRIMARY KEY (BranchId));
CREATE TABLE RoleHistory (
  HistoryID          number(19) GENERATED AS IDENTITY, 
  RoleRoleID         number(19) NOT NULL, 
  EmployeeEmployeeID number(19) NOT NULL, 
  BranchBranchId     number(19) NOT NULL, 
  BeginDate          date NOT NULL, 
  EndDate            date, 
  PRIMARY KEY (HistoryID));
CREATE TABLE Role (
  RoleID     number(19) GENERATED AS IDENTITY, 
  BaseSalary number(10) NOT NULL CHECK(BaseSalary>0), 
  Name       varchar2(255) NOT NULL, 
  PRIMARY KEY (RoleID));
CREATE TABLE Loan (
  LoanID                         number(19) GENERATED AS IDENTITY, 
  BranchBranchId                 number(19) NOT NULL, 
  CurrentAccountAccountAccountID number(19) NOT NULL, 
  Amount                         number(19, 2) NOT NULL CHECK(Amount>0), 
  InterestRate                   number(10, 5) NOT NULL, 
  DateOfCreation                 date NOT NULL, 
  DateOfCompletion               date NOT NULL, 
  PRIMARY KEY (LoanID));
CREATE TABLE Payment (
  PaymentID               number(19) GENERATED AS IDENTITY, 
  LoanLoanID              number(19) NOT NULL, 
  CurrentAccountAccountID number(19) NOT NULL, 
  PaymentDate             date NOT NULL, 
  Amount                  number(19, 2) NOT NULL CHECK(Amount>0), 
  PRIMARY KEY (PaymentID));
CREATE TABLE SavingsAccount (
  AccountAccountID number(19) NOT NULL, 
  InterestRate     number(10, 5) NOT NULL CHECK(InterestRate>0), 
  DurationYears    number(10) NOT NULL CHECK(DurationYears>0), 
  PRIMARY KEY (AccountAccountID));
CREATE TABLE Deposit (
  DepositID        number(19) GENERATED AS IDENTITY, 
  AccountAccountID number(19) NOT NULL, 
  DepositDate      date NOT NULL, 
  Amount           number(19, 2) NOT NULL CHECK(Amount>0), 
  PRIMARY KEY (DepositID));
CREATE TABLE Transfer (
  TransferID           number(19) GENERATED AS IDENTITY, 
  AccountAccountIDFrom number(19) NOT NULL, 
  AccountAccountIDTo   number(19) NOT NULL, 
  TransferDate         date NOT NULL, 
  Amount               number(19, 2) NOT NULL CHECK(Amount>0), 
  PRIMARY KEY (TransferID));
CREATE TABLE Withdraw (
  WithdrawID              number(19) GENERATED AS IDENTITY, 
  CurrentAccountAccountID number(19) NOT NULL, 
  WithdrawDate            date NOT NULL, 
  Amount                  number(19, 2) NOT NULL CHECK(Amount>0), 
  PRIMARY KEY (WithdrawID));
CREATE TABLE CurrentAccount (
  AccountAccountID number(19) NOT NULL, 
  MaximumWithdraw  number(10), 
  PRIMARY KEY (AccountAccountID));
ALTER TABLE Costumer ADD CONSTRAINT FKCostumer923053 FOREIGN KEY (PersonGovID) REFERENCES Person (GovID);
ALTER TABLE Employee ADD CONSTRAINT FKEmployee249023 FOREIGN KEY (PersonGovID) REFERENCES Person (GovID);
ALTER TABLE Account ADD CONSTRAINT FKAccount895601 FOREIGN KEY (CostumerCostumerID) REFERENCES Costumer (CostumerID);
ALTER TABLE RoleHistory ADD CONSTRAINT FKRoleHistor647811 FOREIGN KEY (RoleRoleID) REFERENCES Role (RoleID);
ALTER TABLE RoleHistory ADD CONSTRAINT FKRoleHistor516821 FOREIGN KEY (EmployeeEmployeeID) REFERENCES Employee (EmployeeID);
ALTER TABLE RoleHistory ADD CONSTRAINT FKRoleHistor171832 FOREIGN KEY (BranchBranchId) REFERENCES Branch (BranchId);
ALTER TABLE Loan ADD CONSTRAINT FKLoan357293 FOREIGN KEY (BranchBranchId) REFERENCES Branch (BranchId);
ALTER TABLE SavingsAccount ADD CONSTRAINT FKSavingsAcc25288 FOREIGN KEY (AccountAccountID) REFERENCES Account (AccountID);
ALTER TABLE Payment ADD CONSTRAINT FKPayment955503 FOREIGN KEY (LoanLoanID) REFERENCES Loan (LoanID);
ALTER TABLE Deposit ADD CONSTRAINT FKDeposit626030 FOREIGN KEY (AccountAccountID) REFERENCES Account (AccountID);
ALTER TABLE Transfer ADD CONSTRAINT FKTransfer731892 FOREIGN KEY (AccountAccountIDFrom) REFERENCES Account (AccountID);
ALTER TABLE Transfer ADD CONSTRAINT FKTransfer432158 FOREIGN KEY (AccountAccountIDTo) REFERENCES Account (AccountID);
ALTER TABLE Payment ADD CONSTRAINT FKPayment25568 FOREIGN KEY (CurrentAccountAccountID) REFERENCES CurrentAccount (AccountAccountID);
ALTER TABLE Withdraw ADD CONSTRAINT FKWithdraw546165 FOREIGN KEY (CurrentAccountAccountID) REFERENCES CurrentAccount (AccountAccountID);
ALTER TABLE CurrentAccount ADD CONSTRAINT FKCurrentAcc16041 FOREIGN KEY (AccountAccountID) REFERENCES Account (AccountID);
ALTER TABLE Account ADD CONSTRAINT FKAccount396299 FOREIGN KEY (BranchBranchId) REFERENCES Branch (BranchId);
ALTER TABLE Loan ADD CONSTRAINT FKLoan522632 FOREIGN KEY (CurrentAccountAccountAccountID) REFERENCES CurrentAccount (AccountAccountID);
