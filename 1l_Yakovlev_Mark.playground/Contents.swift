//HomeWork 1 - Yakovlev Mark

import Foundation

//1. Решить квадратное уравнение.

func quadraticEquation(a: Double, b: Double, c: Double) {
    let d: Double = b * b - 4 * a * c
    let x1: Double
    let x2: Double
    
    if (d > 0) {
        x1 = (-b + sqrt(d)) / (2 * a)
        x2 = (-b - sqrt(d)) / (2 * a)
        print("Уравнение имеет два корня: x1 = \(x1) и x2 = \(x2). \n")
    } else  if (d == 0) {
        x1 = -b / (2 * a)
        print("Уравнение имеет 1 корень: x1 = \(x1). \n")
    } else {
        print("Уравнение не имеет корней. \n")
    }
}

quadraticEquation(a: 1, b: 3, c: 2)

//2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

func triangleSides (cathetus1: Double, cathetus2: Double) {
    let hypotenuse: Double = round(sqrt((cathetus1 * cathetus1) + (cathetus2 * cathetus2)))
    let perimeter: Double = cathetus1 + cathetus2 + hypotenuse
    let square: Double = (cathetus1 * cathetus2) / 2
    
    print("При катетах \(cathetus1) и \(cathetus2) гипотенуза равна: \(hypotenuse), периметр равен: \(perimeter), площадь равна: \(square). \n")
}

triangleSides(cathetus1: 5, cathetus2: 10)

//3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

func depositCalculator (depositInitialValue: Double, rate: Double, years: Int) {
    var deposit = depositInitialValue
    for _ in 1...years {
        deposit += (deposit / 100) * rate
    }
    print("Сумма вклада через \(years) лет равна: \(deposit). \n")
}

depositCalculator(depositInitialValue: 100, rate: 10, years: 2)
