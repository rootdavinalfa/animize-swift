//
//  networkCaller.swift
//  animize
//
//  Created by davin on 01/05/21.
//

import Foundation

class networkCaller{
    func getData<T : Decodable>(url : String,completion :@escaping (T) -> ()){
        guard let uri = URL(string: url) else { return }
        URLSession.shared.dataTask(with: uri){
            (data,_,_) in
            //print(data)
            let dats = try! JSONDecoder().decode(T.self, from:data!)
            DispatchQueue.main.async {
                completion(dats)
            }
        }
        .resume()
    }
}
