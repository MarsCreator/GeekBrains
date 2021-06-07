import UIKit

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.

protocol Car{
    func driveAbility() -> Bool
}

class SportCar: Car {
    var wheels: Int
    var engineState: Bool
    var brand: String
    
    init(wheels: Int, engineState: Bool, brand: String) {
        self.wheels = wheels
        self.engineState = engineState
        self.brand = brand
    }
    
    func driveAbility() -> Bool {
        if wheels != 4{
            print("В автомобилее есть поврежденное/поврежденные колеса, проверьте автомобиль.")
            return false
        } else {
            print("Автомобиль готов к поездке.")
            return true
        }
    }
}

class Trunk: Car {
    var maxTrunkFullness: Int
    var trunkFullness: Int
    
    init(maxTrunkFullness: Int, trunkFullness: Int) {
        self.trunkFullness = trunkFullness
        self.maxTrunkFullness = maxTrunkFullness
    }
    func fullnessDifference(){
        let dif = maxTrunkFullness - trunkFullness
        print ("Багажник можно заполнить еще на \(dif) кг.")
    }
    
    func driveAbility() -> Bool {
        if trunkFullness <= maxTrunkFullness {
            print("Можно ехать, загружено корректное количество багажа.")
            return true
        } else {
            print("Багажник переполнен, поехать невозможно.")
            return false
        }
    }
}

extension SportCar{
    func isEngineOn() -> Bool {
        if engineState == true{
            print("Автомобиль заведен.")
            return true
        } else {
            print("Автомобиль заглушен.")
            return false
        }
    }
}

extension SportCar: CustomStringConvertible{
    var description: String {
        return String(describing: brand)
    }
}


let car1 = SportCar(wheels: 4, engineState: true, brand: "BMW")
let car2 = SportCar(wheels: 1, engineState: false, brand: "Mercedes")
car1.driveAbility()
print(car1.engineState)
print(car1.brand)
print(car1.wheels)
print(car2.brand)
print(car2.engineState)
car2.isEngineOn()
print(car2.wheels)

let trunk1 = Trunk(maxTrunkFullness: 250, trunkFullness: 180)
let trunk2 = Trunk(maxTrunkFullness: 150, trunkFullness: 200)
trunk1.fullnessDifference()
trunk1.driveAbility()
trunk2.driveAbility()
