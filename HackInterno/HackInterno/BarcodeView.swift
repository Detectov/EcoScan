//
//  BarcodeView.swift
//  EcoScan
//
//  Created by Daniel Moukarzel on 08/02/24.
//

import SwiftUI

struct BarcodeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("background2")
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    Text("Transparencia en\ncada etiqueta!")
                        .foregroundColor(.white)
                        .font(.custom("Manjari-Regular",size: 40))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                    
                    Text("CONOCE LA SUSTENTABILIDAD DE TUS\nPRODUCTOS FAVORITOS Y APRENDE SOBRE\nSUS ALTERNATIVAS")
                        .foregroundColor(.white)
                        .font(.system(size:16))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                    Spacer()
                   
                    
                    
                    
                }
            }
        }
    }
    /*
    init(){
        for familyName in UIFont.familyNames{
            print(familyName)
            for fontName in UIFont.fontNames(forFamilyName:familyName){
                print("--\(fontName)")
            }
        }
    }*/
}

