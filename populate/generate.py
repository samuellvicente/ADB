import random
import math

def newDate(year, month, numeroMeses):
    newMonth=(month+numeroMeses)%12 if (month+numeroMeses)%12 != 0 else 12
    newYear=year + (math.floor(numeroMeses/12 +1) if month>newMonth else math.floor(numeroMeses/12))
    return (newYear, newMonth)
phoneNumber=900000000
govId=1111111111

loanID=1
costumerID=1
employeeID=1
branchID=1
accountID=1
with open("./resources/citiesCountries.txt", 'r', encoding='utf-8') as cities:
    places=cities.read().splitlines()
    with open("./resources/nomesBues.txt", 'r', encoding='utf-8') as costumerNames: 
        with open("./resources/employeeName.txt", 'r', encoding='utf-8') as employeeNames: 
            with open("./resources/Roles.txt", 'r', encoding='utf-8') as roles:
                #Create Roles
                for role in roles:
                    baseSalary=role.split(",")[1].strip()
                    name=role.split(",")[0].strip()
                    print(f"INSERT INTO Role(BaseSalary, Name) VALUES ({baseSalary}, '{name}');")
                #Finish Roles

                #create branch
                for place in places:
                    print(f"INSERT INTO Branch(Address) VALUES ('{place}');")
                    i=1
                    #create 8 employees per branch
                    beginDate=f"TO_DATE('{random.randint(1,28)}-{random.randint(1,12)}-{random.randint(2001,2018)}','DD-MM-YYYY')"
                    for name in employeeNames:
                        name=name.strip()
                        email=f"{name.strip().replace(' ', '_')}{random.randint(0,100)}@sapo.pt"
                        address=place
                        birthday=f"TO_DATE('{random.randint(1,28)}-{random.randint(1,12)}-{random.randint(1950,2000)}','DD-MM-YYYY')"
                        nationality=address.split(",")[1].strip()
                        print(f"INSERT INTO Person(GovID,Name, PhoneNumber, Email, Address, Birthday, Nationality) VALUES ({govId},'{name}','{phoneNumber}', '{email}', '{address}', {birthday}, '{nationality}');")
                        bonus=random.uniform(0,1)
                        sickDays=random.randint(0,9)
                        print(f"INSERT INTO Employee(PersonGovID, Bonus, SickDays) VALUES ({govId},{format(bonus, '.4f')},{sickDays});")
                        #create RoleHistory
                        print(f"INSERT INTO RoleHistory(RoleRoleID, EmployeeEmployeeID, BranchBranchId, BeginDate, EndDate) VALUES ({i},{employeeID},{branchID},{beginDate},NULL);")
                        #Finish RoleHistory
                        govId=govId+1
                        phoneNumber=phoneNumber+1
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
                    print(f"INSERT INTO Person(GovID,Name, PhoneNumber, Email, Address, Birthday, Nationality) VALUES ({govId},'{name}','{phoneNumber}', '{email}', '{address}', {birthday}, '{nationality}');")

                    print(f"INSERT INTO Costumer(PersonGovID) VALUES ({govId});")
                    #Create Accounts
                    #Create the first CurrentAccount
                    branchID=random.randint(1,1252)
                    amount=random.randint(50000, 1000000)
                    beginDateDay=random.randint(1,28)
                    beginDateMonth=random.randint(1,12)
                    beginDateYear=random.randint(2000,2018)
                    beginDate=f"TO_DATE('{beginDateDay}-{beginDateMonth}-{beginDateYear}','DD-MM-YYYY')"
                    endDate=f"NULL"
                    print(f"INSERT INTO Account(CostumerCostumerID, BranchBranchID, Amount, BeginDate, EndDate) VALUES ({costumerID}, {branchID}, {amount/4}, {beginDate}, {endDate});")
                    maximumWithdraw=400
                    print(f"INSERT INTO CurrentAccount(AccountAccountID, MaximumWithdraw) VALUES ({accountID}, {maximumWithdraw});")
                    print(f"INSERT INTO Deposit(AccountAccountID, DepositDate, Amount) VALUES ({accountID}, {beginDate},{amount});")
                    print(f"INSERT INTO Withdraw(CurrentAccountAccountID, WithdrawDate, Amount) VALUES ({accountID}, {beginDate}, {amount/4});")
                    accountID=accountID+1
                    #Create the second SavingsAccount
                    print(f"INSERT INTO Account(CostumerCostumerID, BranchBranchID, Amount, BeginDate, EndDate) VALUES ({costumerID}, {branchID}, {amount/2}, {beginDate}, {endDate});")
                    interestRate=0.05
                    duration=random.randint(3,10)
                    print(f"INSERT INTO SavingsAccount(AccountAccountID, InterestRate, DurationYears) VALUES ({accountID}, {interestRate}, {duration});")
                    print(f"INSERT INTO Transfer(AccountAccountIDFrom, AccountAccountIDTo, TransferDate, Amount) VALUES ({accountID-1}, {accountID}, {beginDate}, {amount/2});")
                    accountID=accountID+1

                    if(random.randint(0,100)>97):
                        #Create Loan
                        loanAmount=random.randint(5000, 1000000)
                        loanInterestRate=0.07
                        loanCompletionYear=beginDateYear+random.randint(1,2)
                        loanDateOfCompletion=f"TO_DATE('{beginDateDay}-{beginDateMonth}-{loanCompletionYear}','DD-MM-YYYY')"
                        loanDateOfCreation=beginDate

                        print(f"INSERT INTO Account(CostumerCostumerID, BranchBranchID, Amount, BeginDate, EndDate) VALUES ({costumerID}, {branchID}, {loanAmount}, {beginDate}, {endDate});")

                        print(f"INSERT INTO CurrentAccount(AccountAccountID, MaximumWithdraw) VALUES ({accountID}, {maximumWithdraw});")

                        currentYear=2019
                        currentMonth=11
                        currentDay=6

                        loanMonthsToCurrentDate=(currentYear-beginDateYear)*12+(currentMonth-beginDateMonth)+(-1 if currentDay < beginDateDay else (0))

                        loanMonthsToCompletion=(loanCompletionYear-beginDateYear)*12

                        paymentAmountPerMonth=math.ceil((loanAmount/loanMonthsToCompletion)*1+loanInterestRate)

                        print(f"INSERT INTO Loan(BranchBranchID, CurrentAccountAccountAccountID, Amount, InterestRate, DateOfCreation, DateOfCompletion) VALUES ({branchID}, {accountID}, {loanAmount}, {loanInterestRate}, {loanDateOfCreation}, {loanDateOfCompletion});")
                        
                        for j in range(1,min(loanMonthsToCompletion, loanMonthsToCurrentDate)+1):
                            date=newDate(beginDateYear, beginDateMonth, j)
                            paymentDate=f"TO_DATE('{beginDateDay}-{date[1]}-{date[0]}','DD-MM-YYYY')"

                            print(f"INSERT INTO Payment(LoanLoanID, CurrentAccountAccountID, PaymentDate, Amount) VALUES ({loanID}, {accountID}, {paymentDate}, {paymentAmountPerMonth});")
                            print(f"INSERT INTO Deposit(AccountAccountID, DepositDate, Amount) VALUES ({accountID}, {paymentDate},{paymentAmountPerMonth});")
                        
                        loanID=loanID+1
                        accountID=accountID+1
                    #Finish Accounts
                    costumerID=costumerID+1
                #Finish Costumer
