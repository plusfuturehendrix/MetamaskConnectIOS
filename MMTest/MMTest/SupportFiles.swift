//
//  SupportFiles.swift
//  MMTest
//
//  Created by Danil Bochkarev on 05.04.2023.
//

import Foundation

func shortenAddress(_ address: String) -> String {
    let prefix = String(address.prefix(5))
    let suffix = String(address.suffix(4))
    return "\(prefix)..\(suffix)"
}
