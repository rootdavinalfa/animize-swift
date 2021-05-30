//
//  AnimpackageViewModel.swift
//  animize
//
//  Created by davin on 30/05/21.
//

import Foundation

class AnimpackageViewModel: ObservableObject {
    @Published var datas : [PackageSource] = []
    
    func getItem(page : Int){
        print("Calling page: \(page)")
        networkCaller().getData(url:"https://api.dvnlabs.xyz/animize/anim/list/package/page/\(page)", completion:{
            (data :ResponseAnim ) in
            if !data.anim.isEmpty {
                self.datas += data.anim
            }
        })
    }
}
