//
//  ContentView.swift
//  ContactSwiftui
//
//  Created by Myo Thandar soe on 01/04/2023.
//

import SwiftUI


struct ContactListView: View {
    @State var isAddContactViewShowing : Bool = false
    
    var body: some View{
        TabView {
            NavigationView {
                ContactList()
                    .navigationBarTitle("Contact")
                    .navigationBarItems(leading: EditButton(),trailing:
                        Button(action: {
                            self.isAddContactViewShowing = true
                        }, label: {
                            Image(systemName: "plus")
                        }).sheet(isPresented: $isAddContactViewShowing, content: {
                            AddContactView(isPresented: self.$isAddContactViewShowing)
                        })
                        )
            } 
            .tabItem({
                    VStack{
                        Image(systemName: "house")
                        Text("Home")
                }
            })
        }
    }
}

extension Color {
    static var random : Color {
        return Color(red: .random(in: 0.2...0.8),
                     green: .random(in: 0.2...0.8),
                     blue: .random(in: 0.2...0.8))
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContactListView()
        }
    }

struct ContactListItem: View {
    var data : ContactVO
    var body: some View {
        HStack{
            ZStack {
                Circle()
                    .frame(width: 50.0, height: 50.0)
                    .foregroundColor(Color.random)
                Text("\(String(data.name.first ?? "A"))")
                    .foregroundColor(Color(.white))
            }
            Text("\(data.name)")
        }
    }
}

struct ContactList: View {
    @ObservedObject var data = ContactRepo.shared
    
    var body: some View {
        List {
            ForEach(data.contacts,id: \.id, content: { data in
                NavigationLink(destination: ContactDetailsView().environmentObject(data), label: {
                ContactListItem(data: data)
            })
        }).onDelete{ (indexSet) in
            ContactRepo.shared.contacts.remove(at: indexSet.first ?? 0)
            
        }
            
        }
    }
}
