INSERT INTO Person(GovID,Name, PhoneNumber, Email, Address, Birthday, Nationality) VALUES ('10293029','Albertina','351929100789', 'albertina_10@gmail.com', 'Lisbon, Portugal', to_date('01-11-1989','DD-MM-YYYY'), 'Portuguese');
INSERT INTO Person(GovID,Name, PhoneNumber, Email, Address, Birthday, Nationality) VALUES ('10221219','Samuel','351927287289', 'samuel_lucio@gmail.com', 'Torres Vedras, Portugal', to_date('02-02-1987','DD-MM-YYYY'), 'German');
INSERT INTO Person(GovID,Name, PhoneNumber, Email, Address, Birthday, Nationality) VALUES ('10243242','Daniel','351927428769', 'daniel32porto@gmail.com', 'Faro, Portugal', to_date('05-10-1997','DD-MM-YYYY'), 'Spanish');
INSERT INTO Person(GovID,Name, PhoneNumber, Email, Address, Birthday, Nationality) VALUES ('10295329','Joana','351989372299', 'joanavaicomtodos@gmail.com', 'Santarem, Portugal', to_date('09-05-1978','DD-MM-YYYY'), 'French');
INSERT INTO Person(GovID,Name, PhoneNumber, Email, Address, Birthday, Nationality) VALUES ('10265439','Alice','351928297789', 'aliceislinda@gmail.com', 'Vila Real, Portugal', to_date('01-10-2000','DD-MM-YYYY'), 'Polish');

INSERT INTO Costumer(PersonGovID) VALUES ('10293029');
INSERT INTO Costumer(PersonGovID) VALUES ('10221219');
INSERT INTO Costumer(PersonGovID) VALUES ('10243242');
INSERT INTO Costumer(PersonGovID) VALUES ('10295329');
INSERT INTO Costumer(PersonGovID) VALUES ('10265439');

INSERT INTO Account(CostumerCostumerID, Amount, BeginDate, EndDate) VALUES ('1', '3000', to_date('21-01-2001','DD-MM-YYYY'), null);
INSERT INTO Account(CostumerCostumerID, Amount, BeginDate, EndDate) VALUES ('2', '4000', to_date('11-03-2002','DD-MM-YYYY'), null);
INSERT INTO Account(CostumerCostumerID, Amount, BeginDate, EndDate) VALUES ('3', '2000', to_date('02-07-2007','DD-MM-YYYY'), null);
INSERT INTO Account(CostumerCostumerID, Amount, BeginDate, EndDate) VALUES ('4', '1000', to_date('06-03-2003','DD-MM-YYYY'), null);
INSERT INTO Account(CostumerCostumerID, Amount, BeginDate, EndDate) VALUES ('5', '300', to_date('09-11-2011','DD-MM-YYYY'), null);
INSERT INTO Account(CostumerCostumerID, Amount, BeginDate, EndDate) VALUES ('1', '3000', to_date('21-01-2001','DD-MM-YYYY'), null);
INSERT INTO Account(CostumerCostumerID, Amount, BeginDate, EndDate) VALUES ('2', '4000', to_date('11-03-2002','DD-MM-YYYY'), null);
INSERT INTO Account(CostumerCostumerID, Amount, BeginDate, EndDate) VALUES ('3', '2000', to_date('02-07-2007','DD-MM-YYYY'), null);
INSERT INTO Account(CostumerCostumerID, Amount, BeginDate, EndDate) VALUES ('4', '1000', to_date('06-03-2003','DD-MM-YYYY'), null);
INSERT INTO Account(CostumerCostumerID, Amount, BeginDate, EndDate) VALUES ('5', '300', to_date('09-11-2011','DD-MM-YYYY'), null);


INSERT INTO CurrentAccount(AccountAccountID, Name, MaximumWithdraw) VALUES ('1', 'ContaCorrent1', '50');
INSERT INTO CurrentAccount(AccountAccountID, Name, MaximumWithdraw) VALUES ('2', 'ContaCorrent2', '100');
INSERT INTO CurrentAccount(AccountAccountID, Name, MaximumWithdraw) VALUES ('3', 'ContaCorrent3', '200');
INSERT INTO CurrentAccount(AccountAccountID, Name, MaximumWithdraw) VALUES ('4', 'ContaCorrent4', '300');
INSERT INTO CurrentAccount(AccountAccountID, Name, MaximumWithdraw) VALUES ('5', 'ContaCorrent5',null);


INSERT INTO SavingsAccount(AccountAccountID, InterestRate, TypeOfInterest, DurationYears) VALUES ('6', '2.5', 'S', '10')
INSERT INTO SavingsAccount(AccountAccountID, InterestRate, TypeOfInterest, DurationYears) VALUES ('7', '2.5', 'S', '10')
INSERT INTO SavingsAccount(AccountAccountID, InterestRate, TypeOfInterest, DurationYears) VALUES ('8', '2.5', 'S', '10')
INSERT INTO SavingsAccount(AccountAccountID, InterestRate, TypeOfInterest, DurationYears) VALUES ('9', '2.5', 'S', '10')
INSERT INTO SavingsAccount(AccountAccountID, InterestRate, TypeOfInterest, DurationYears) VALUES ('10', '2.5', 'S', '10')