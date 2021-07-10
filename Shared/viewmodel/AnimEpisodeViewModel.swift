//
//  AnimEpisodeViewModel.swift
//  animize
//
//  Created by davin on 10/07/21.
//

import Foundation

class AnimEpisodeViewModel: ObservableObject {
    @Published var datas : [AnimeEpisodeModel] = []
    
    func getItem(page : Int){
        print("Calling page: \(page)")
        networkCaller().getData(url:"https://api.dvnlabs.xyz/animize/anim/list/page/\(page)", completion:{
            (data :ResponseAnimEpisode ) in
            if !data.anim.isEmpty {
                self.datas += data.anim
            }
        })
    }
}
