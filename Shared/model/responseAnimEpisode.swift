//
//  responseAnimEpisode.swift
//  animize
//
//  Created by davin on 10/07/21.
//

import Foundation

struct ResponseAnimEpisode : Codable{
    let error : Bool
    let message : String
    var anim = [AnimeEpisodeModel]()
}
