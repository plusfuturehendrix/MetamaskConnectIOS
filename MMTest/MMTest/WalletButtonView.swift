//
//  WalletButtonView.swift
//  MMTest
//
//  Created by Danil Bochkarev on 04.04.2023.
//


import SwiftUI

struct WalletButtonView: View {
    let title: String
    let action: () -> Void
    let iconImage: Image
    
    let buttonBackground: Color = Color.black
    let buttonForeground: Color = Color.white
    let iconSize: CGFloat = 35
    
    var body: some View {
        HStack {
            iconImage
                .resizable()
                .frame(width: iconSize, height: iconSize)
            
            Button(String(describing: title)) {
                action()
            }
            
        }
        .font(.system(size: 24, weight: .semibold))
        .frame(maxWidth: 200, maxHeight: 55)
        .background(buttonBackground)
        .foregroundColor(buttonForeground)
        .cornerRadius(15)
        .shadow(color: .gray, radius: 3)
    }
}

struct WalletButtonView_Previews: PreviewProvider {
    static var previews: some View {
        WalletButtonView(
            title: "Connect",
            action: {},
            iconImage: Image("mm")
        )
    }
}

