import Foundation

//1. Написать функцию, которая определяет, четное число или нет.

func even_odd_numbers(number: Int) {
    if number % 2 == 0 {
        print("Число \(number) четное. \n")
    } else {
        print("Число \(number) нечетное. \n")
    }
}

even_odd_numbers(number: 12)
even_odd_numbers(number: 33)

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func multipleNumber(inputNumber: Int) {
    if inputNumber % 3 == 0 {
        print("Число \(inputNumber) кратно 3. \n")
    } else {
        print("Число \(inputNumber) не кратно 3. \n")
    }
}

multipleNumber(inputNumber: 9)
multipleNumber(inputNumber: 13)

//3. Создать возрастающий массив из 100 чисел.

func newArrayNumbers() -> Array<Int> {
    let arrayOfNumbers = Array (1...100)
    return arrayOfNumbers
}

print("Вывод нового массива 1-100: ")
print(newArrayNumbers())

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

func arrayFilter () {
    var arrayToFilter = newArrayNumbers()
    
    arrayToFilter = arrayToFilter.filter({$0 % 2 != 0})
    arrayToFilter = arrayToFilter.filter({$0 % 3 != 0})

    print("Вывод отсортированного массива: \(arrayToFilter) \n")
}

arrayFilter()

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.

func fibonacci(count: Int) {
    var fibonacciArray: [Int] = [1, 1]
    (2...count-1).forEach{ i in
        fibonacciArray.append(fibonacciArray[i - 1] + fibonacciArray[i - 2])
    }
    print("Вывод первых \(count) чисел Фибоначчи: \(fibonacciArray)")
}

fibonacci(count: 50)

//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:

func primeNumbers() {
    var tempArray = Array(2...1000)
    var primeNumbersArray: [Int] = []
    
    while let nextPrimeNumber = tempArray.first {
        primeNumbersArray.append(nextPrimeNumber)
        tempArray = tempArray.filter { $0 % nextPrimeNumber != 0 }
    }
    
    while primeNumbersArray.count > 100 {
        primeNumbersArray.removeLast()
    }

    print("Вывод 100 первых простых чисел: \(primeNumbersArray)")
}

primeNumbers()
