//
//  ContentView.swift
//  Shared
//
//  Created by davin on 01/05/21.
//

import SwiftUI
import Kingfisher

struct AnimePackage: View {
    let data : PackageSource
    var body: some View {
        KFImage.url(data.cover)
            .resizable()
            .placeholder {
                HStack {
                    Image(systemName: "arrow.2.circlepath.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(10)
                    Text("Loading...").font(.title)
                }
                .foregroundColor(.gray)
            }
            .fade(duration: 1)
            .cancelOnDisappear(true)
            .aspectRatio(contentMode: .fit)
            .cornerRadius(20)
        
        Spacer()
    }
}

struct PackageView: View {
    @State var datas : [PackageSource] = []
    
    
    var body: some View {
        List (datas){
            dat in AnimePackage(data: dat)
                .padding(.horizontal)
        }
        .onAppear{
            networkCaller().getData(url:"https://api.dvnlabs.xyz/animize/anim/list/package/page/1", completion:{
                (data :ResponseAnim ) in datas = data.anim
            })
        }
    }
}

struct PackageView_Previews: PreviewProvider {
    static var previews: some View {
        PackageView()
    }
}
