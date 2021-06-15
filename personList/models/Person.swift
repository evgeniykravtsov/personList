
struct Person {
    let name: String
    let surname: String
    let phone: String
    let email: String
    
    var fullName:String {
        "\(name) \(surname)"
    }
}


class DataManager {
    static var names:[String] = ["Женя", "Витя", "Коля", "Сева", "Вася", "Андрей", "Сашка", "Мирон"]
    static var surnames:[String] = ["Иванов", "Петров", "Сидоров", "Васин", "Кравцов", "Орлов", "Пешкин", "Горынцев"]
    static var phones:[String] = ["89111111111", "89222222222", "89333333333", "89444444444", "89555555555", "89666666666", "89777777777", "89888888888"]
    static var emails:[String] = ["jeka@mail.ru", "kola@mail.ru", "vitya@mail.ru", "maxim@mail.ru", "miron@mail.ru", "sashka@mail.ru", "vasya@mail.ru", "andrew@mail.ru"]

    
    static func getPersonList()->[Person] {
        var personList:[Person] = []
        for _ in 0...10 {
            let newPerson = Person(name: names.randomElement() ?? "", surname:surnames.randomElement() ?? "",phone: phones.randomElement() ?? "", email:emails.randomElement() ?? "")
            personList.append(newPerson)
        }
        
        return personList
    }
}

var personListFromDataManager = DataManager.getPersonList()
