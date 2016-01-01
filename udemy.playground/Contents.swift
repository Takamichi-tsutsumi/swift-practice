//: Playground - noun: a place where people can play

import UIKit

class hero {
    var hp = 0
    var coins = 0
    
    init(hp: Int) {
        self.hp = hp
    }
    
    func removeHp(hit: Int) {
        hp = hp - hit
    }
    
    func addCoins(coin: Int) {
        coins = coins + coin
    }
}

let theHero = hero(hp: 10)
theHero

theHero.removeHp(30)
theHero.addCoins(20)
