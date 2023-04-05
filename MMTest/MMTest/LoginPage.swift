//
//  ContentView.swift
//  MMTest
//
//  Created by Danil Bochkarev on 04.04.2023.
//

import SwiftUI
import Glaip
import UIKit

struct LoginPage: View {
    @ObservedObject var glaip: Glaip
    @State var modelUser = ModelUser()
    
    init() {
        self.glaip = Glaip(
            title: "Glaip Demo App",
            description: "Demo app to demonstrate Web3 login",
            supportedWallets: [.MetaMask])
    }
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea().opacity(0.5)

            if glaip.userState == .unregistered {
                VStack {
                    WalletButtonView(
                        title: "MetaMask",
                        action: {
                            glaip.loginUser(type: .MetaMask) { result in
                                switch result {
                                case .success(let user):
                                    modelUser.walletNumber = user.wallet.address
                                    print(user.wallet.address)
                                case .failure(let error):
                                    print(error)
                                }
                            }
                        },
                        iconImage: Image("mm")
                    )
                }
            } else {
                SecondView(modelUser: $modelUser) {
                    glaip.userState = .unregistered
                    glaip.logout()
                }
            }
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}



