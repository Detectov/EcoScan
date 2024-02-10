//
//  ContentView.swift
//  HackInterno
//
//  Created by Daniel Moukarzel on 05/02/24.
//

import SwiftUI

struct StartView: View {
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("background1")
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    Spacer()
                    Spacer()
                    HStack{
                        Text ("ESCANEA")
                            .foregroundColor(Color("btext"))
                        Text("UN")
                            .foregroundColor(.white)
                    }
                    .font(.system(size: 40, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 100)
                    VStack{
                        Text("FUTURO MÁS")
                            .foregroundColor(.white)
                            .font(.system(size: 40, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 100)
                    }
                    VStack{
                        Text("SUSTENTABLE")
                            .foregroundColor(.white)
                            .font(.system(size: 40, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.bottom)
                    }
                    Spacer()
                    NavigationLink(destination: BarcodeView()){
                        Text("EMPIEZA AHORA")
                            .font(.custom("Roboto-Bold",size: 26))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("navLink"))
                            .cornerRadius(10)
                            .navigationBarBackButtonHidden(true)
                            
                    }
                    .padding()
                    .frame(width: 400,alignment: .center)
                    .padding(.bottom, 50)
                    
                    LottieView(url: Bundle.main.url(forResource: "hands", withExtension: "lottie")!)
                        .frame(width: 450, height: 250, alignment: .center)
                        .padding(.bottom, 50)
                    
                }
            }
        }
    }
}



