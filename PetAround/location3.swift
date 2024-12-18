//
//  location3.swift
//  PetAround
//
//  Created by Claudia on 16/12/24.
//

import SwiftUI

struct location3: View {
        var body: some View {
            NavigationStack {
                ScrollView {
                    VStack(spacing: 8) {
                        
                        Text(" Osteria La Chitarra")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                        
                        
                        Text(" Rampe S. Giovanni Maggiore, 1, Naples, Italy")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                        
                        
                        HStack(spacing: 4) {
                            ForEach(0..<4) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.orange)
                                    .font(.system(size: 10))
                            }
                            
                            Image(systemName: "star.leadinghalf.filled")
                                .foregroundColor(.orange)
                                .font(.system(size: 10))
                            
                            
                            Text("(578)")
                                .font(.system(size: 15))
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 10.0) {
                            HStack {
                                Image("ristorante1")
                                    .resizable()
                                    .frame(width: 200, height: 189)
                                    .cornerRadius(10)
                                    .padding(.leading, 12.0)
                            }
                            VStack{
                                Image("ristorante2")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 90)
                                    .cornerRadius(10)
                                Image("ristorante3")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 90)
                                    .cornerRadius(10)
                            }
                            Image("ristorante4")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 189)
                                .cornerRadius(10)
                        }
                    }
                    HStack (spacing: 12){
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 85, height: 60)
                                .foregroundStyle(Color.accentColor)
                            
                            VStack(spacing: 4){
                                Image(systemName: "arrow.uturn.left")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                                Text("Vai al luogo")
                                    .foregroundColor(.white)
                                    .font(.system(size: 10))
                            }
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 85, height: 60)
                                .foregroundColor(.white)
                            
                            VStack(spacing: 4){
                                Image(systemName: "phone.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(.accentColor)
                                Text("3313072334")
                                    .font(.system(size: 10))
                                    .foregroundColor(.accentColor)
                            }
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 85, height: 60)
                                .foregroundColor(.white)
                            
                            VStack(spacing: 4){
                                Image(systemName: "clock.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(.accentColor)
                                Text("Aperto")
                                    .font(.system(size: 10))
                                    .foregroundColor(.accentColor)
                            }
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 85, height: 60)
                                .foregroundColor(.white)
                            
                            VStack(spacing: 4){
                                Image(systemName: "safari.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(.accentColor)
                                Text("Sito Web")
                                    .font(.system(size: 10))
                                    .foregroundColor(.accentColor)
                            }
                        }
                    }
                    .padding(.top, 5)
                    
                    Text("Pet Services")
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                        .padding(.trailing, 260)
                        .padding(.top,20)
                    
                    HStack (spacing: 12) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 79, height: 81)
                                .foregroundColor(.white)
                            VStack{
                                Image("ciotola acqua")
                                
                                Text("Water")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.griglioScuro)
                                    .multilineTextAlignment(.center)
                                    .padding(.top, 7.0)
                            }
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 79, height: 81)
                                .foregroundColor(.white)
                            VStack{
                                Image("ciotola cibo")
                                
                                Text("Food")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.griglioScuro)
                                    .padding(.top, 7.0)
                            }
                        }
                    }
                    .padding(.trailing, 200.0)
                    
                    Text("Information")
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                        .padding(.trailing, 270)
                        .padding(.top,20)
                    
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 373, height: 80)
                                .foregroundColor(.white)
                            
                            Text("A dog area where dogs can socialize safely, with access regulated by educators. Food, water and training classes are available.")
                                .font(.system(size: 15))
                                .padding()
                        }
                    }
                    Text("Hours")
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                        .padding(.trailing, 310)
                        .padding(.top,20)
                    
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 373, height: 80)
                                .foregroundColor(.white)
                                .padding(.horizontal)
                            
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Mon-Sat")
                                        .font(.system(size: 15))
                                        .bold()
                                    
                                    Text("Sun")
                                        .font(.system(size: 15))
                                        .bold()
                                        .padding(.top, 2)
                                }
                                VStack(alignment: .trailing){
                                    Text("19:30 - 22:45")
                                        .font(.system(size: 15))
                                    
                                    
                                    Text("Closed")
                                        .font(.system(size: 15))
                                        .padding(.top, 2)
                                }
                                .padding(.leading, 185)
                            }
                        }
                    }
                    VStack {
                        HStack {
                            Text("Reviews")
                                .font(.system(size: 18))
                                .bold()
                                .padding(.trailing, 250.0)
                            Text("More")
                                .font(.system(size: 14))
                                .foregroundColor(.accent)
                        }
                    }
                    .padding(.top,20)
                    
                    ScrollView(.horizontal){
                        HStack(spacing: 12){
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 241, height: 157)
                                    .foregroundStyle(Color.white)
                                    .padding(.leading, 20)
                                VStack{
                                    HStack{
                                        Circle()
                                            .frame(width: 40, height: 40)
                                            .foregroundColor(.orange)
                                        VStack{
                                            HStack(spacing: 2) {
                                                ForEach(0..<5) { index in
                                                    Image(systemName: index < Int(rating) ? "star.fill" : "star")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(height: 10)
                                                        .foregroundColor(.orange)
                                                }
                                            }
                                            .padding(.trailing, 60.0)
                                            
                                            
                                            HStack{
                                                Text("Roberto")
                                                    .font(.system(size: 14))
                                                    .bold()
                                                Text("- 4 days ago")
                                                    .font(.system(size: 10))
                                                    .fontWeight(.light)
                                                    .foregroundColor(.gray)
                                                
                                            }
                                        }
                                        .padding(.trailing, 15.0)
                                    }
                                    Text ("""
                                                Pleasant discovery in the historic
                                                centre of Naples. Quiet place 
                                                with attentive and courteous
                                                service. Real Neapoletan cooking!
                                                """)
                                    .font(.system(size: 13))
                                    .foregroundColor(.gray)
                                    .padding(.leading, 18)
                                    .padding(.top, 2)
                                }
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 241, height: 157)
                                    .foregroundStyle(Color.white)
                                VStack{
                                    HStack{
                                        Circle()
                                            .frame(width: 40, height: 40)
                                            .foregroundColor(.blue)
                                        VStack{
                                            HStack(spacing: 2) {
                                                ForEach(0..<5) { index in
                                                    Image(systemName: index < Int(rating) ? "star.fill" : "star")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(height: 10)
                                                        .foregroundColor(.orange)
                                                }
                                            }
                                            .padding(.trailing, 60.0)
                                            
                                            
                                            HStack{
                                                Text("Fabiana")
                                                    .font(.system(size: 14))
                                                    .bold()
                                                Text("- 2 years ago")
                                                    .font(.system(size: 10))
                                                    .fontWeight(.light)
                                                    .foregroundColor(.gray)
                                                
                                            }
                                        }
                                        .padding(.trailing, 20)
                                    }
                                    Text ("""
                                                Dining at Osteria La 
                                                Chitarra yesterday was a 
                                                truly extraordinary.experience. 
                                                We made us feel at home.
                                                """)
                                    .font(.system(size: 13))
                                    .foregroundColor(.gray)
                                    .padding(.leading, -20)
                                    .padding(.top, 2)
                                }
                            }
                        }
                    }
                    
                    .background(Color(red: 243/255, green: 245/255, blue: 244/255))
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.accentColor)
                                .font(.system(size: 20))
                                .padding(.leading, 260)
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundColor(.accentColor)
                                .font(.system(size: 20))
                                .padding(.bottom, 5)
                            
                        }
                    }
                }
                
                .background(Color(red: 243/255, green: 245/255, blue: 244/255))
            }
        }
    }

#Preview {
    location3()
}
