import UIKit

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

enum CarEngineState{
    case on, off
}

enum CarWindowState{
    case open, close
}

class Car {
    let brand: String
    let year: Int
    let trunkVolume: Int
    var trunkFullness: Int
    var engineState: CarEngineState
    var windowState: CarWindowState

    init(brand: String, year: Int, trunkVolume: Int, trunkFullness: Int, engineState: CarEngineState, windowState: CarWindowState) {
        self.brand = brand
        self.year = year
        self.trunkVolume = trunkVolume
        self.trunkFullness = trunkFullness
        self.engineState = engineState
        self.windowState = windowState
    }
    
    func openWindows() {
        windowState = .open
        print("Окна открыты")
    }
    
    func closeWindows() {
        windowState = .close
        print("Окна закрыты")
    }
    
    func addBaggage(baggageWeight: Int) {
        if (self.trunkFullness+baggageWeight > self.trunkVolume) {
            print("Добавить багаж невозможно, багажник переполнен")
        } else {
            self.trunkFullness += baggageWeight;
            print("Багажник заполнен на \(self.trunkFullness) из \(self.trunkVolume)")
        }
    }
}

class SportCar: Car{
    var maxSpeed: Int
    init(maxSpeed: Int, brand: String, year: Int, trunkVolume: Int, trunkFullness: Int, engineState: CarEngineState, windowState: CarWindowState){
        self.maxSpeed = maxSpeed
        super.init(brand: brand, year: year, trunkVolume: trunkVolume, trunkFullness: trunkFullness, engineState: engineState, windowState: windowState)
    }
    
    override func openWindows() {
        super.openWindows()
        print("Закройте окна")
    }
}

class TrunkCar: Car{
    var passengerSeats: Int
    
    init(passengerSeats: Int, brand: String, year: Int, trunkVolume: Int, trunkFullness: Int, engineState: CarEngineState, windowState: CarWindowState){
        self.passengerSeats = passengerSeats
        super.init(brand: brand, year: year, trunkVolume: trunkVolume, trunkFullness: trunkFullness, engineState: engineState, windowState: windowState)
    }
    
    override func openWindows() {
        print("Окно сломано, открыть невозможно")
    }
}

var myBmw = SportCar(maxSpeed: 250, brand: "BMW", year: 2014, trunkVolume: 80, trunkFullness: 10, engineState: .on, windowState: .open)
print(myBmw.brand)
print(myBmw.windowState)
print(myBmw.openWindows())
print(myBmw.trunkFullness)
myBmw.addBaggage(baggageWeight: 100)
myBmw.addBaggage(baggageWeight: 10)

var deliveryCar = TrunkCar(passengerSeats: 2, brand: "Ford", year: 2007, trunkVolume: 380, trunkFullness: 50, engineState: .on, windowState: .close)
print(deliveryCar.brand)
print(deliveryCar.passengerSeats)
deliveryCar.addBaggage(baggageWeight: 200)
print(deliveryCar.trunkFullness)
print(deliveryCar.windowState)
print(deliveryCar.openWindows())
