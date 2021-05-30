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
            })
    }
}

struct PackageView: View {
    @ObservedObject var packageViewModel = AnimpackageViewModel()
    
    @State var page : Int = 1
    @State var position : Int = 1
    var body: some View {
        ScrollViewReader{
            proxy in
            ScrollView{
                LazyVGrid(columns: [GridItem(.flexible(minimum:50)),
                                    GridItem(.flexible(minimum:50))],
                          spacing:20){
                    ForEach(packageViewModel.datas,id:\.self){
                        dat in
                        AnimePackage(data: dat)
                            .padding(.horizontal)
                            .onAppear{
                                if self.shouldLoadNextPage(currentItem: dat){
                                    page += 1
                                    packageViewModel.getItem(page: page)
                                }
                            }
                    }
                }
                
            }
            .onAppear{
                packageViewModel.getItem(page: page)
            }
            
        }
    }
    private func shouldLoadNextPage(currentItem item: PackageSource) -> Bool {
        let currentIndex = packageViewModel.datas.firstIndex { PackageSource in
            PackageSource.id == item.id
        }
            let lastIndex = packageViewModel.datas.count - 1
            let offset = 8 //Load next page when 5 from bottom, adjust to meet needs
            return currentIndex == lastIndex - offset
        }
}

struct PackageView_Previews: PreviewProvider {
    static var previews: some View {
        PackageView()
    }
}
