//
//  BarcodeView.swift
//  EcoScan
//
//  Created by Daniel Moukarzel on 08/02/24.
//

import SwiftUI

struct OnBoardingStep{
    let animation: String
    let title: String
    let description: String
}

private let onBoardingSteps = [
    OnBoardingStep(animation: "a", title: "Transparencia en\ncada etiqueta!", description: "CONOCE LA SUSTENTABILIDAD DE TUS\nPRODUCTOS FAVORITOS Y APRENDE SOBRE\nSUS ALTERNATIVAS."),
    OnBoardingStep(animation: "b", title: "Convierte tus\nelecciones en\nbenefeficios", description: "ACUMULA PUNTOS Y DESBLOQUEA\nRECOMPENSAS ECO-AMIGABLES DISEÑADAS\nPARA CELEBRAR TU COMPROMISO POR UN\nESTILO DE VIDA MAS CONSCIENTE."),
    //OnBoardingStep(animation: "c", title: "Descubre el poder\nde las palabras en\nnuestro chat", description: "INTERCAMBIA OPINIONES SOBRE\nPRODUCTOS, COMPARTE CONSEJOS Y EXPON TUS DUDAS SOBRE SUSTENTABILIDAD DENTRO DE UNA COMUNIDAD ECO-CONSCIENTE.")
]
struct BarcodeView: View {
    @State private var currentStep = 0
    
    init (){
        UIScrollView.appearance().bounces = false
    }
    var body: some View {
        NavigationView {
            ZStack {
                Color("background2")
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    TabView(selection: $currentStep){
                        ForEach(0..<onBoardingSteps.count) { it in
                            VStack{
                                LottieView(url: Bundle.main.url(forResource: "barcode", withExtension: "lottie")!)
                                    .frame(width: 370, height: 238, alignment: .center)
                                    .padding(.top, 100)
                                Text(onBoardingSteps[it].title)
                                    .foregroundColor(.white)
                                    .font(.custom("Manjari-Bold",size: 40))
                                    .frame(width: 397, height: 126, alignment: .center)
                                    .multilineTextAlignment(.center)
                                    .padding(.top, 150)
                                
                                Text(onBoardingSteps[it].description)
                                    .foregroundColor(.white)
                                    .font(.system(size:14))
                                    .frame(width: 344, height: 100, alignment: .center)
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 100)
                                
                            }
                            .tag(it)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    HStack{
                        ForEach(0..<onBoardingSteps.count){ it in
                            if it == currentStep{
                                Rectangle()
                                    .frame(width: 20, height: 10)
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                            } else{
                                Circle()
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(Color("graybutton"))
                                
                            }
                        }
                    }
                    .padding(.bottom, 24)
                    
                    
                    VStack{
                        HStack{
                            Button(action:{
                                self.currentStep = onBoardingSteps.count - 1
                                  
                            }){
                                Text("Inicio de Sesión")
                                    .padding(.bottom, 20)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
