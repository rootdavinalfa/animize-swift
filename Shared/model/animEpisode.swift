//
//  animEpisode.swift
//  animize
//
//  Created by davin on 10/07/21.
//

import Foundation
struct AnimeEpisodeModel : Codable,Hashable {
    let id_anim : String
    let name_anim : String
    let episode_anim : Int
    let thumbnail : URL
}

extension AnimeEpisodeModel : Identifiable{
    var id : String {return id_anim}
}
