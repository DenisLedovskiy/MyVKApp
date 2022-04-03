//
//  CoffeDecorator.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 03.04.2022.
//

import Foundation

protocol Coffee {

    var cost: Int { get }

}

protocol CoffeeDecorator: Coffee {
    var base: Coffee { get }
    init(base: Coffee)

}

class SimpleCoffe: Coffee {
    var cost: Int {
        return 100
    }
}

class Milk: CoffeeDecorator {
    let base: Coffee

    var cost: Int {
        return base.cost + 50
    }

    required init(base: Coffee) {
        self.base = base
    }
}

class Sugar: CoffeeDecorator {
    let base: Coffee

    var cost: Int {
        return base.cost + 20
    }

    required init(base: Coffee) {
        self.base = base
    }
}

class Sirop: CoffeeDecorator {
    let base: Coffee

    var cost: Int {
        return base.cost + 70
    }

    required init(base: Coffee) {
        self.base = base
    }
}

let cupCoffee = SimpleCoffe()
let milkCoffee = Milk(base: cupCoffee)
let sugarMilkCoffee = Sugar(base: milkCoffee)
let siropCoffee = Sirop(base: cupCoffee)
