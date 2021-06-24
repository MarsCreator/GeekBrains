import Foundation

enum cardOperationError: Error {
    case insufficientFunds (moneyNeeded: Double)
    case frozenBalance
}

struct product {
    var price: Double
}


class cardOperation {
    let limit: Double = -30000
    var balance: Double = 0
    var cardIsBlocked = false
    
    func buySomethig(product: product)throws {
        guard cardIsBlocked == false else{
            throw cardOperationError.frozenBalance
        }
        guard product.price <= (-limit + self.balance) else {
            if balance < 0 {
                throw cardOperationError.insufficientFunds(moneyNeeded: product.price + limit + balance)
            } else {
                throw cardOperationError.insufficientFunds(moneyNeeded: product.price + limit - balance)
            }
        }
        balance = self.balance - product.price
    }
    
    func depositeMoney (someMoney: Double) {
        balance = self.balance + someMoney
    }
    
    func printBalance() {
        print ("Баланс вашей карты: \(balance) рублей.")
    }
    
    func changeCardState(cardIsBlocked: Bool) {
        switch cardIsBlocked {
        case true:
            self.cardIsBlocked = true
        case false:
            self.cardIsBlocked = false
        }
    }
}

extension cardOperationError: CustomStringConvertible {
    var description: String {
        switch self {
        case .insufficientFunds(let moneyNeeded): return "Недостаточно средств на карте для совершения операции. Доступный баланс: \(operation.balance) рублей, необходимо: \(moneyNeeded) рублей."
        case .frozenBalance: return "Ваша карты заблокирована банком из-за сомнительных операций. Для разблокировки свяжитесь с банком."
        }
    }
}


let operation = cardOperation()
do {
    try operation.buySomethig(product: .init(price: 750.0))
} catch let error as cardOperationError {
    print(error.description)
}
operation.printBalance()
operation.depositeMoney(someMoney: 15000)
operation.printBalance()
do {
    try operation.buySomethig(product: .init(price: 100000))
} catch let error as cardOperationError {
    print(error.description)
}
operation.printBalance()
do {
    try operation.buySomethig(product: .init(price: 22000.5))
} catch let error as cardOperationError {
    print(error.description)
}
operation.printBalance()

operation.changeCardState(cardIsBlocked: true)

do {
    try operation.buySomethig(product: .init(price: 1))
} catch let error as cardOperationError {
    print(error.description)
}
