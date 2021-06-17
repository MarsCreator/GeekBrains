import Foundation

struct AutoPark {
    var brand: String
    var year: Int
}

extension AutoPark: CustomStringConvertible {
    var description : String {
        return "Brand: \(brand), Year: \(year)"
    }
}


struct queue <T> {
    private var elements: [T] = []
    
    public var isEmpty: Bool {
        return elements.count == 0
    }
    
    mutating func enqueue(element: T) {
        elements.append(element)
    }
    mutating func dequeue()->T {
        return elements.removeLast()
    }
    
    public var head: T? {
        if isEmpty {
            print("Elemnets not found. Array is empty.")
            return nil
        } else {
            print("Last element is \(elements.last!)")
            return elements.last
        }
    }
    
    public var front: T? {
        if isEmpty {
            print("Elemnets not found. Array is empty.")
            return nil
        } else {
            print("First element is \(elements.first!)")
            return elements.first
        }
    }
    
    func printMyQueue() {
        print(elements)
    }
}

extension queue {
    func myFilter(predicate:(T) -> Bool) -> [T] {
        var result = [T]()
        for i in elements {
            if predicate(i) {
                result.append(i)
            }
        }
        return result
    }
}

var myAutoPark = queue<AutoPark>()
myAutoPark.enqueue(element: .init(brand: "BMW", year: 2014))
myAutoPark.enqueue(element: .init(brand: "VW", year: 2021))
myAutoPark.enqueue(element: .init(brand: "BMW", year: 2021))
myAutoPark.enqueue(element: .init(brand: "Toyota", year: 2013))
myAutoPark.enqueue(element: .init(brand: "Mazda", year: 2014))
myAutoPark.enqueue(element: .init(brand: "Audi", year: 2017))
myAutoPark.enqueue(element: .init(brand: "Lada", year: 1994))
myAutoPark.enqueue(element: .init(brand: "Nissan", year: 2000))

myAutoPark.printMyQueue()
myAutoPark.head
myAutoPark.front

let test = myAutoPark.myFilter(predicate: {$0.year == 2014})
print(test)
