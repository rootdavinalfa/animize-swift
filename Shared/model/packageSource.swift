//
//  packageSource.swift
//  animize
//
//  Created by davin on 01/05/21.
//

import Foundation

struct PackageSource : Codable,Hashable {
    let package_anim : String
    let name_anim : String
    let rating : String
    let cover : URL
}

extension PackageSource : Identifiable{
    var id : String {return package_anim}
}
