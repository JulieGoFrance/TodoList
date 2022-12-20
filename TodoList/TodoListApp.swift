//
//  TodoListApp.swift
//  TodoList
//
//  Created by User on 16/12/2022.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }.environmentObject(listViewModel)
        
        }
    }
}
