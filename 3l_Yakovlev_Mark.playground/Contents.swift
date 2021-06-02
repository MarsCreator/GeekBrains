import UIKit

//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

enum CarEngineState{
    case on, off
}

enum CarDoorState{
    case open, close
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
}

var myBmw = SportCar(maxSpeed: 250, brand: "BMW", year: 2014, trunkVolume: 80, trunkFullness: 10, engineState: .on, windowState: .open)
print(myBmw.brand)
print(myBmw.windowState)
print(myBmw.openWindows())
print(myBmw.trunkFullness)
myBmw.addBaggage(baggageWeight: 100)
myBmw.addBaggage(baggageWeight: 10)

var deliveryCar = TrunkCar(passengerSeats: 2, brand: "Ford", year: 2007, trunkVolume: 380, trunkFullness: 50, engineState: .on, windowState: .open)
print(deliveryCar.brand)
print(deliveryCar.passengerSeats)
deliveryCar.addBaggage(baggageWeight: 200)
print(deliveryCar.trunkFullness)
