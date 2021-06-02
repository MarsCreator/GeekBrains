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

enum CarWindowState{
    case open, close
}

struct SportCar {
    let brand: String
    let year: Int
    let trunkVolume: Int
    var sportCarFullness: Int
    
    var CarEngineState : CarEngineState {
        willSet {
            if newValue == .on {
                print ("\(brand) - двигатель включен")
            } else {print("\(brand) - двигатель выключен")}
        }
    }
    
    var CarWindowState : CarWindowState {
        willSet {
            if newValue == .open {
                print("\(brand) - окна открыты")
            } else { print("\(brand) - окна закрыты") }
        }
    }

    mutating func addBaggage(baggageWeight: Int) {
        if (self.sportCarFullness+baggageWeight > self.trunkVolume) {
            print("Добавить багаж невозможно, багажник переполнен")
        } else {
            self.sportCarFullness += baggageWeight;
            print("Багажник заполнен на \(self.sportCarFullness) из \(self.trunkVolume)")
        }
    }
}

struct TrunkCar {
    let brand: String
    let year: Int
    let trunkVolume: Int
    var trunkCarFullness: Int

    var CarEngineState : CarEngineState {
        willSet {
            if newValue == .on {
                print ("\(brand) - двигатель включен")
            } else {print("\(brand) - двигатель выключен")}
        }
    }
    
    var CarWindowState : CarWindowState {
        willSet {
            if newValue == .open {
                print("\(brand) - окна открыты")
            } else { print("\(brand) - окна закрыты") }
        }
    }

    mutating func addBaggage(baggageWeight: Int) {
        if (self.trunkCarFullness+baggageWeight > self.trunkVolume) {
            print("Добавить багаж невозможно, багажник переполнен")
        } else {
            self.trunkCarFullness += baggageWeight;
            print("Багажник заполнен на \(self.trunkCarFullness) из \(self.trunkVolume)")
        }
    }
}

var myBmw = SportCar(brand: "BMW", year: 2014, trunkVolume: 80, sportCarFullness: 10, CarEngineState: .on, CarWindowState: .open)
print(myBmw.brand)
print(myBmw.CarWindowState)
myBmw.CarWindowState = .close
print(myBmw.CarWindowState)
print(myBmw.sportCarFullness)
myBmw.addBaggage(baggageWeight: 1000)
print(myBmw.sportCarFullness)
myBmw.addBaggage(baggageWeight: 30)
print(myBmw.sportCarFullness)

var deliveryCar = TrunkCar(brand: "Ford", year: 2007, trunkVolume: 800, trunkCarFullness: 100, CarEngineState: .on, CarWindowState: .open)
print(deliveryCar.brand)
print(deliveryCar.CarWindowState)
deliveryCar.CarWindowState = .close
print(deliveryCar.CarWindowState)
print(deliveryCar.trunkCarFullness)
deliveryCar.addBaggage(baggageWeight: 1000)
print(deliveryCar.trunkCarFullness)
deliveryCar.addBaggage(baggageWeight: 30)
print(deliveryCar.trunkCarFullness)
