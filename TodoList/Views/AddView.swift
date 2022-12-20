//
//  AddView.swift
//  TodoList
//
//  Created by User on 16/12/2022.
//

import SwiftUI

struct AddView: View {
    @State var textFieldText: String = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var showAlert : Bool = false
    @State var alertTitle : String = ""
    var body: some View {
        
        
        ScrollView {
            Text("coucou")
            VStack {
                TextField("Ecrire ici", text: $textFieldText)
                    .background(Color(.lightGray)).cornerRadius(10)
                    .frame(height : 50)
                    .padding(.horizontal)
                Button(action:  saveButtonPressed, label:  {
                    Text("sauvegarder").foregroundColor(.white).frame(maxWidth: .infinity).frame(height: 55)
                        .background(.blue)
                        .cornerRadius(20)
                        .font(.headline).padding(.horizontal)
                })
            }.padding(14)
        }.navigationTitle("ajouter un texte ✍︎").alert(isPresented: $showAlert, content: getAlert)
    }
    func saveButtonPressed(){
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        } else {
            
        }
     
    }
    func textIsAppropriate()-> Bool{
       if  textFieldText.count < 3 {
           alertTitle = "il faut moins 3 Caractères 😵‍💫"
           showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert()-> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }.environmentObject(ListViewModel())
        
    }
}
