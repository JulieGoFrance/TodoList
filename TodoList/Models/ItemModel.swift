//
//  ItemModel.swift
//  TodoList
//
//  Created by User on 17/12/2022.
//

import Foundation

struct ItemModel : Identifiable{
    
    let id : String = UUID().uuidString
    let title : String
    let isCompleted : Bool
    init(id : String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateComplition()-> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
    
}
