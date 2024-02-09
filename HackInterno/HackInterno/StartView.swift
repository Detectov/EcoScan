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
                    HStack{
                        Text ("ESCANEA")
                            .foregroundColor(Color("gtext"))
                        Text("UN")
                            .foregroundColor(.white)
                    }
                    .font(.system(size: 40, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 40)
                    VStack{
                        Text("FUTURO MÁS\nSUSTENTABLE")
                            .foregroundColor(.white)
                            .font(.system(size: 40, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 40)
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    NavigationLink(destination: BarcodeView()){
                        Text("EMPIEZA AHORA")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("gtext"))
                            .cornerRadius(10)
                            .padding()
                    }
                    Spacer()
                    Spacer()
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                }
                
            }
        }
        
    }


