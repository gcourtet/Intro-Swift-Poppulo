//
//  Model.swift
//  cool
//
//  Created by Guillaume Courtet on 03/07/2017.
//  Copyright © 2017 Guillaume Courtet. All rights reserved.
//

import Foundation

class Model {
    var list : [String] = []
    var selected : [String:Bool] = [:]
    
    func add(_ action : String) -> Bool {
        if let _ = self.selected[action] {
            return false
        } else {
        self.list += [action]
        self.selected[action] = false
            return true
        }
    }
    
    func getAction(_ i : Int) -> String {
        return self.list[i]
    }
    
    func changeState(_ action : String) {
        self.selected[action] = !(self.selected[action]!)
    }
    
    func deleteAction(_ action : String){
        let array = list.filter() { $0 != action }
        self.list = array
        self.selected.removeValue(forKey: action)
    }
    
    func isActionSelected(_ action : String) -> Bool {
        return self.selected[action]!
    }
    
    func getActions() -> [String] {
        return self.list
    }
}
