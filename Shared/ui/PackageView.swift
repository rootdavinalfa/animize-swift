//
//  ContentView.swift
//  Shared
//
//  Created by davin on 01/05/21.
//

import SwiftUI
import Kingfisher

struct AnimePackage: View {
    @State private var hovered = false
    
    let data : PackageSource
    var body: some View {
        KFImage.url(data.cover)
            .setProcessor(
                RoundCornerImageProcessor(cornerRadius: 10)
            )
            
            .fade(duration: 1)
            .cancelOnDisappear(true)
            .aspectRatio(contentMode: .fit)
            .scaleEffect(CGSize(width: 0.6, height: 0.6))
            .scaleEffect(hovered ? 1.5 : 1.0)
            .animation(.spring())
            .opacity(hovered ? 0.3 : 1.0)
            .blur(radius: hovered ? 4.0 : 0.0)
            .onHover{hover in
                if hover {
                    hovered = true
                } else {
                    hovered = false
                }
                
            }
            .overlay(VStack{
                if self.hovered {
                    Text(data.name_anim)
                }else{
                    EmptyView()
                }
            }
            
            )
    }
}

struct PackageView: View {
    @State var datas : [PackageSource] = []
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.flexible(minimum:50)),
                                GridItem(.flexible(minimum:50))],
                      spacing:20){
                ForEach(datas,id:\.self){
                    dat in
                    AnimePackage(data: dat)
                        .padding(.horizontal)
                }
            }
            .onAppear{
                networkCaller().getData(url:"https://api.dvnlabs.xyz/animize/anim/list/package/page/1", completion:{
                    (data :ResponseAnim ) in datas = data.anim
                })
            }
        }
    }
}

struct PackageView_Previews: PreviewProvider {
    static var previews: some View {
        PackageView()
    }
}
