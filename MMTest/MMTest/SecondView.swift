//
//  SecondView.swift
//  MMTest
//
//  Created by Danil Bochkarev on 04.04.2023.
//

import SwiftUI
import Glaip

struct SecondView: View {
    @Binding var modelUser: ModelUser
    let logoutAction: () -> Void
    
    var body: some View {
        ZStack {
            Color.purple
                .ignoresSafeArea()
            
            HStack {
                Button {
                    self.logoutAction()
                } label: {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 50, height: 50)
                }
                
                Button {
                    print(modelUser.walletNumber)
                } label: {
                    Text(shortenAddress(modelUser.walletNumber))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .font(.system(size: 12))
                }
                .frame(width: 100, height: 50)
                .background(Color.black)
                .cornerRadius(15)
            }
            .position(x: UIScreen.main.bounds.maxX - 100, y: UIScreen.main.bounds.minY + 30)
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(modelUser: Binding.constant(ModelUser(walletNumber: "0x41234213421342134hj4bn23hjk4nb")), logoutAction: {})
    }
}

