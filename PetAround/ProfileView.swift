//
//  ProfileView.swift
//  Claudia_App
//
//  Created by Claudia on 14/12/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("Hi, Claudia!")
                        .font(.system(size: 26)) // Testo grande
                        .fontWeight(.bold)
                        .padding(.bottom, 1)
                    Image ("profilo")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .padding()
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                            .frame(width: 373, height: 52)
                        HStack{
                            Image(systemName: "person.fill")
                                .font(.system(size: 17))
                                .foregroundColor(.accentColor)
                            Text("Your Profile")
                        }
                        .padding(.trailing, 220)
                        
                        Image(systemName: "chevron.right")
                            .padding(.leading, 320)
                            .foregroundColor(.accent)
                            .fontWeight(.medium)
                    }
                    
                    .padding(.top, 20)
                    
                    HStack {
                        ZStack {
                            NavigationLink (destination: PetProfileView()) {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.white)
                                    .frame(width: 373, height: 52)
                            }
                            HStack{
                                Image(systemName: "pawprint.fill")
                                    .font(.system(size: 17))
                                    .foregroundColor(.accentColor)
                                Text("Pet Profile")
                            }
                            .padding(.trailing, 220)
                            
                            Image(systemName: "chevron.right")
                                .padding(.leading, 320)
                                .foregroundColor(.accent)
                                .fontWeight(.medium)
                        }
                    }
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .frame(width: 373, height: 52)
                            HStack{
                                Image(systemName: "photo.on.rectangle.angled")
                                    .font(.system(size: 17))
                                    .foregroundColor(.accentColor)
                                Text("Memories")
                            }
                            .padding(.trailing, 220)
                            
                            Image(systemName: "chevron.right")
                                .padding(.leading, 320)
                                .foregroundColor(.accent)
                                .fontWeight(.medium)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.accentColor)
                            .font(.system(size: 20))
                    }
                }
            }
            .background(Color(red: 243/255, green: 245/255, blue: 244/255))
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


