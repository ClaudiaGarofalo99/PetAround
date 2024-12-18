//
//  ContentView.swift
//  Claudia_App
//
//  Created by Claudia on 10/12/24.
//
import SwiftUI

struct ContentView: View {
    var rating: Double = 4.5
    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack {
                    // Testo centrale (Hi, User! e Torre del Greco)
                    VStack {
                        Text("Hi, User!")
                            .font(.system(size: 26)) // Testo grande
                            .fontWeight(.bold)
                            .padding(.bottom, 1)
                        
                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.gray)
                                .font(.system(size: 15))
                            
                            Text("Torre del Greco (Na), Italy")
                                .font(.system(size: 15))
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.bottom, 20) // Sposta il testo più in basso
                    
                    VStack {
                        HStack {
                            Text("Favorites")
                                .font(.system(size: 18))
                                .bold()
                            Spacer()
                            Text("More")
                                .font(.system(size: 14))
                                .foregroundColor(.accent)
                        }
                        .padding()
                        .padding(.bottom, 0)
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 12) {
                                NavigationLink (destination: DogParkView()){
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 205, height: 208)
                                        .foregroundStyle(Color.white)
                                    
                                    VStack {
                                        Image("cane")
                                            .resizable()
                                            .frame(width: 181, height: 115)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .padding(.bottom, 8)
                                        
                                        Text("Portici Dog Park")
                                            .font(.system(size: 13.5))
                                            .bold()
                                            .foregroundColor(.black)
                                        
                                        Text("Portici (Na), Italy")
                                            .font(.system(size: 11.5))
                                            .fontWeight(.semibold)
                                            .foregroundColor(.gray)
                                        
                                        HStack(spacing: 2) {
                                            ForEach(0..<5) { index in
                                                Image(systemName: index < Int(rating) ? "star.fill" : "star")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: 12)
                                                    .foregroundColor(.orange)
                                            }
                                            }
                                        }
                                    }
                                }
                                .padding(.leading, 15)
                                
                                HStack(spacing: 16) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: 205, height: 208)
                                            .foregroundStyle(Color.white)
                                        
                                        VStack {
                                            Image("RISTORANTE")
                                                .resizable()
                                                .frame(width: 181, height: 115)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                .padding(.bottom, 8)
                                            
                                            Text("Ristorante La Bersagliera ")
                                                .font(.system(size: 13.5))
                                                .bold()
                                            
                                            Text("Portici (Na), Italy")
                                                .font(.system(size: 11.5))
                                                .fontWeight(.semibold)
                                                .foregroundColor(.gray)
                                            
                                            HStack(spacing: 2) {
                                                ForEach(0..<5) { index in
                                                    Image(systemName: index < Int(rating) ? "star.fill" : "star")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(height: 12)
                                                        .foregroundColor(.orange)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .frame(height: 190)
                        Spacer()
                    }
                    Text("Recents")
                        
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.top, .leading])
                        .padding([.top], 10)
                        .padding([.bottom], 10)
                        .font(.system(size: 18))
                        .bold()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 373, height: 62)
                            .foregroundStyle(Color.white)
                            
                        HStack(){
                            Image("pizza")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.leading)
                                .padding(.trailing, 5.0)
                            
                            VStack(alignment: .leading) {
                                               Text("Starita")
                                                   .foregroundColor(.black)
                                                   .font(.system(size: 15))
                                                   .bold()
                               
                                               
                                               Text("Via Materdei, 27/28, Naples")
                                                   .foregroundColor(.gray)
                                                   .font(.system(size: 13))
                                                   .fontWeight(.light)
                                
                                           }
                        } .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10.0)
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 373, height: 62)
                            .foregroundStyle(Color.white)
                            
                        HStack(){
                            Image(systemName: "fork.knife.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.leading)
                                .padding(.trailing, 5.0)
                                .foregroundColor(.accent)
                            
                            VStack(alignment: .leading) {
                                               Text("Etto")
                                                   .foregroundColor(.black)
                                                   .font(.system(size: 15))
                                                   .bold()
                               
                                               
                                               Text("Via Santa Maria di Costantinopoli, 102, Naples")
                                                   .foregroundColor(.gray)
                                                   .font(.system(size: 13))
                                                   .fontWeight(.light)
                                
                                           }
                        } .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10.0)
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 373, height: 62)
                            .foregroundStyle(Color.white)
                            
                        HStack(){
                            Image(systemName: "bed.double.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.leading)
                                .padding(.trailing, 5.0)
                                .foregroundColor(.accent)
                            
                            VStack(alignment: .leading) {
                                               Text("B&B Hotel Napoli")
                                                   .foregroundColor(.black)
                                                   .font(.system(size: 15))
                                                   .bold()
                               
                                               
                                               Text("P.za Giuseppe Garibaldi, 32, Naples")
                                                   .foregroundColor(.gray)
                                                   .font(.system(size: 13))
                                                   .fontWeight(.light)
                                
                                           }
                        } .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10.0)
                    }
                }
            }
            
            

            .background(Color(red: 243/255, green: 245/255, blue: 244/255))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "person.fill")
                            .foregroundColor(.accentColor)
                            .font(.system(size: 20))
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }

        
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink (destination: Mappa()) {
                        Image(systemName: "location.fill")
                            .foregroundColor(.accentColor)
                        .font(.system(size: 20))}
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
