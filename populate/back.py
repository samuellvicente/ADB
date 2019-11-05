import random

phoneNumber=900000000
govId=1111111111

costumerID=1
employeeID=1
branchID=1
accountID=1
with open("./resources/citiesCountries.txt", 'r', encoding='utf-8') as cities:
    places=cities.read().splitlines()
    with open("./resources/costumerNames.txt", 'r', encoding='utf-8') as costumerNames: 
        with open("./resources/employeeName.txt", 'r', encoding='utf-8') as employeeNames: 
            with open("./resources/Roles.txt", 'r', encoding='utf-8') as roles:
                #Create Roles
                for role in roles:
                    baseSalary=role.split(",")[1].strip()
                    name=role.split(",")[0].strip()
                    description="bldwjanwod"
                    print(f"INSERT INTO Role(BaseSalary, Name, Description) VALUES ('{baseSalary}'), '{name}'), '{description}');")
                #Finish Roles

                #create branch
                for place in places:
                    print(f"INSERT INTO Branch(Address) VALUES ('{place}');")
                    i=1
                    #create 8 employees per branch
                    beginDate=f"TO_DATE('{random.randint(1,28)}-{random.randint(1,12)}-{random.randint(2000,2018)}','DD-MM-YYYY')"
                    for name in employeeNames:
                        govId=govId+1
                        phoneNumber=phoneNumber+1
                        name=name.strip()
                        email=f"{name.strip().replace(' ', '_')}{random.randint(0,100)}@sapo.pt"
                        address=place
                        birthday=f"TO_DATE('{random.randint(1,28)}-{random.randint(1,12)}-{random.randint(1950,2000)}','DD-MM-YYYY')"
                        nationality=address.split(",")[1].strip()
                        print(f"INSERT INTO Person(GovID,Name, PhoneNumber, Email, Address, Birthday, Nationality) VALUES ('{govId}','{name}','{phoneNumber}', '{email}', '{address}', {birthday}, '{nationality}');")
                        bonus=random.uniform(0,1)
                        sickDays=random.randint(0,10)
                        print(f"INSERT INTO Employee(PersonGovID, Bonus, SickDays) VALUES ('{govId}','{bonus}','{sickDays}');")
                        #create RoleHistory
                        print(f"INSERT INTO RoleHistory(RoleRoleID, EmployeeEmployeeID, BranchBranchId, BeginDate, EndDate) VALUES ('{i}','{employeeID}','{branchID}','{beginDate}','NULL');")
                        #Finish RoleHistory
                        employeeID=employeeID+1
                        i=1+i
                        if(i==9):
                            break
                    branchID=branchID+1
                    #Finish Employee
                    #Finish Branch

                #Create Costumer
                for name in costumerNames:
                    govId=govId+1
                    name=name.strip()
                    phoneNumber=phoneNumber+1
                    email=f"{name.strip().replace(' ', '_')}{random.randint(0,100)}@sapo.pt"
                    address=random.choice(places)
                    day=random.randint(1,28)
                    month=random.randint(1,12)
                    year=random.randint(1950,2008)
                    birthday=f"TO_DATE('{day}-{month}-{year}','DD-MM-YYYY')"
                    nationality=address.split(",")[1].strip()
                    print(f"INSERT INTO Person(GovID,Name, PhoneNumber, Email, Address, Birthday, Nationality) VALUES ('{govId}','{name}','{phoneNumber}', '{email}', '{address}', {birthday}, '{nationality}');")

                    print(f"INSERT INTO Costumer(PersonGovID) VALUES ('{govId}');")
                    #Create Accounts
                    #Create the first CurrentAccount
                    branchID=random.randint(1,1252)
                    amount=random.randint(50000, 1000000)
                    beginDate=f"TO_DATE('{random.randint(1,28)}-{random.randint(1,12)}-{random.randint(year+1,2018)}','DD-MM-YYYY')"
                    endDate=f"NULL"
                    print(f"INSERT INTO Account(CostumerCostumerID, BranchBranchID, Amount, BeginDate, EndDate) VALUES ('{costumerID}', '{branchID}', '{amount/4}', {beginDate}, {endDate});")
                    maximumWithdraw=400
                    print(f"INSERT INTO CurrentAccount(AccountAccountID, MaximumWithdraw) VALUES ('{accountID}', '{maximumWithdraw}');")
                    print(f"INSERT INTO Deposit(AccountAccountID, DepositDate, Amount) VALUES ('{accountID}', '{beginDate}','{amount}')")
                    print(f"INSERT INTO Withdraw(AccountAccountID, WithdrawDate, Amount) VALUES ('{accountID}', '{beginDate}', '{amount/4}');")
                    accountID=accountID+1
                    #Create the second SavingsAccount
                    print(f"INSERT INTO Account(CostumerCostumerID, BranchBranchID, Amount, BeginDate, EndDate) VALUES ('{costumerID}', '{branchID}', '{amount/2}', {beginDate}, {endDate});")
                    interestRate=0.05
                    duration=random.randint(3,10)
                    print(f"INSERT INTO SavingsAccount(AccountAccountID, InterestRate, DurationYears) VALUES ('{accountID}', '{interestRate}', '{duration}');")
                    print(f"INSERT INTO Transfer(AccountAccountIDFrom, AccountAccountIDTo, TransferDate, Amount) VALUES ('{accountID-1}', '{accountID}', '{beginDate}', '{amount/2}');")
                    accountID=accountID+1

                    #Finish Accounts
                    costumerID=costumerID+1
                #Finish Costumer




