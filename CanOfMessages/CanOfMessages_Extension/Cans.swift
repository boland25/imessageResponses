//
//  Cans.swift
//  CanOfMessages
//
//  Created by boland on 4/24/17.
//  Copyright © 2017 mallocmedia. All rights reserved.
//

import Foundation

enum Can: Int {
    case milenials = 0
    case sixtys
    case fiftys
}

struct Cans {
    
    let fiftysCans = ["A Gas", "Hey Big Daddy", "Are you copping a bit", "square", "cube", "cats", "Yo Daddy-o", "dig it man, that's crazy!", "Out to get your kicks?"]
    let sixtysCans = ["Right On, Man!", "Power to the People", "Never Trust the Man, Man!", "On the Bus or off the Bus", "Dont Flip Your Wig"]
    let milenialCans = ["FOMO", "Sorry not sorry", "I can't even", "the struggle is real", "On fleek", "Perf", "It me", "tbh", "Respek"]
    let total = 3
    
    func current(index: Int) -> [String]? {
        guard let can = Can(rawValue: index) else { return nil }
        var canArray: [String]
        switch can {
        case .fiftys:
            canArray = fiftysCans
        case .sixtys:
            canArray = sixtysCans
        case .milenials:
            canArray = milenialCans
        }
        return canArray
    }
}
