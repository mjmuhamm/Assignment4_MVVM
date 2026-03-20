//
//  PersonDetailScreen.swift
//  Assignment4MVVM
//
//  Created by Malik Muhammad on 3/20/26.
//

import SwiftUI

struct PersonDetailScreen: View {
    let person : People
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                AsyncImage(url: URL(string: person.avatar)) { image in
                    image
                        .image?.resizable()
                        .scaledToFit()
                        .cornerRadius(8)
                        .frame(width: 100, height: 100)
                }
                
                VStack(alignment: .leading) {
                    Text(person.firstName)
                    Text(person.lastName)
                }
            }.padding(10)
            
            VStack(alignment: .leading) {
                Text("Created: \(person.createdAt)").padding(.top, 0.5)
                Text("Job Title: \(person.jobtitle)").padding(.top, 0.5)
                Text("Email: \(person.email)").padding(.top, 0.5)
                Text("Favorite Color: \(person.favouriteColor)").padding(.top, 0.5)
                Text("Id: \(person.id)").padding(.top, 0.5)
                
                
            }.padding(10)
        }.frame(alignment: .topLeading)
        
        
    }
}

#Preview {
    PersonDetailScreen(person: People(createdAt: "", firstName: "Malik", avatar: "https://randomuser.me/api/portraits/women/21.jpg", lastName: "Muhammad", email: "tc", jobtitle: "Android", favouriteColor: "", id: ""))
}
