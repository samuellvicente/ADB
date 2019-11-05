with open("./resources/firstNames.txt", 'r', encoding='utf-8') as fName, open("./resources/surnames.txt", 'r', encoding='utf-8') as sName:
    fnames=fName.read().splitlines()
    snames=sName.read().splitlines()
    for surname in snames:
        for name in fnames:
            fullName=name.strip()+" "+surname.strip()
            print(fullName)


