//
//  PetProfileView.swift
//  Claudia_App
//
//  Created by Claudia on 14/12/24.
//
import SwiftUI

struct PetProfileView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("Joy")
                        .font(.system(size: 26)) // Testo grande
                        .fontWeight(.bold)
                        .padding(.bottom, 1)
                }
                Image ("joy")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .padding()
                
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("Breed")
                            .font(.system(size: 15))
                            .foregroundColor(.black)
                            .bold()
                        Spacer()
                        Text("Bichon à poil frisé")
                            .font(.system(size: 15))
                            .fontWeight(.regular)
                            .foregroundColor(.gray)
                        
                    }
                    Divider()
                    
                    HStack {
                        Text("Sex")
                            .font(.system(size: 15))
                            .foregroundColor(.black)
                            .bold()
                        Spacer()
                        Text("Female")
                            .font(.system(size: 15))
                            .fontWeight(.regular)
                            .foregroundColor(.gray)
                    }
                    Divider()
                    
                    HStack {
                        Text("Date of birth")
                            .font(.system(size: 15))
                            .foregroundColor(.black)
                            .bold()
                        Spacer()
                        Text("05/12/2015")
                            .font(.system(size: 15))
                            .fontWeight(.regular)
                            .foregroundColor(.gray)
                    }
                    Divider()
                    
                    HStack {
                        Text("Age")
                            .font(.system(size: 15))
                            .foregroundColor(.black)
                            .bold()
                        Spacer()
                        Text("9")
                            .font(.system(size: 15))
                            .fontWeight(.regular)
                            .foregroundColor(.gray)
                        
                    }
                    Divider()
                }
                .padding(.horizontal, 30)
                .padding(.top)
            }
            .padding(.top)
            
            .frame(maxWidth: .infinity)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.accentColor)
                        .font(.system(size: 20))
                }
            }
            .background(Color(red: 243/255, green: 245/255, blue: 244/255))
        }
    }
}

struct PetProfileView_Previews: PreviewProvider {
    static var previews: some View {
        PetProfileView()
    }
}

