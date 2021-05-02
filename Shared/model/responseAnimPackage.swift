//
//  responseAnimPackage.swift
//  animize
//
//  Created by davin on 02/05/21.
//

import Foundation

struct ResponseAnim : Codable{
    let error : Bool
    let message : String
    var anim = [PackageSource]()
}
