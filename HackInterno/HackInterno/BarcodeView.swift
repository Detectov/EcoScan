//
//  BarcodeView.swift
//  EcoScan
//
//  Created by Daniel Moukarzel on 08/02/24.
//

import SwiftUI

struct BarcodeView: View {
    var page : Page
    var body: some View {
        NavigationView {
            ZStack {
                Color("background2")
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    Spacer()
                    Spacer()
                    //LottieView()
                        //.frame(width: 250, height: 250, alignment: .center)
                    Text(page)
                        .foregroundColor(.white)
                        .font(.custom("Manjari-Regular",size: 40))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text("")
                        .foregroundColor(.white)
                        .font(.system(size:16))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 150)
                    Spacer()
                    Spacer()
                   
                    
                    
                    
                }
            }
        }
    }
}
struct BarcodeView_Previews: PreviewProvider{
    static var previews: some View{
        BarcodeView(page: Page.slidePages)
    }
}
    
