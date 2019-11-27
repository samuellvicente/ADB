with open("./firstNames.txt", 'r', encoding='utf-8') as firstNames: 
    i=0
    test1=firstNames.readlines()
    with open("./surnames.txt", 'r', encoding='utf-8') as surnames:
        test2=surnames.readlines()
        for firstName in test1:
            for surname in test2:
                print(firstName.strip()+" "+surname.strip())
                i=i+1
                if i > 200000:
                    break


