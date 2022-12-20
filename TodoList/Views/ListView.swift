//
//  ListView.swift
//  TodoList
//
//  Created by User on 16/12/2022.
//

import SwiftUI

struct ListView: View {
    //[]
    @EnvironmentObject var listViewModel : ListViewModel
    
    var body: some View {
        
        List {
            ForEach(listViewModel.items)
                {item in
                    ListRowView(item: item).onTapGesture{
                        withAnimation(.linear){
                            listViewModel.updateItems(item: item)
                        }
                    }
                }.onDelete(perform: listViewModel.deleteItem).onMove(perform: listViewModel.moveItem)
          
        }.listStyle(PlainListStyle())
        .navigationTitle("Liste des choses à faire ✐")
            .navigationBarItems(
                leading: EditButton(),
                trailing: NavigationLink( "ajouter", destination: AddView())
                    )
        }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }.environmentObject(ListViewModel())
        
    }
}


