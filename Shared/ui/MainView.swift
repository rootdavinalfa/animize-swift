//
//  MainView.swift
//  animize
//
//  Created by davin on 02/05/21.
//

import SwiftUI

struct NavViewItem : View {
    let text : String
    @State var isClicked : Bool = false
    var body: some View{
        Text(text)
            .font(Font.system(size:16, design: .default))
            .foregroundColor(isClicked ? .blue : .white)
        
        
    }
}

struct MainView: View {
    @State private var selection: String? = nil
    
    var body: some View {
        
        NavigationView{
            ZStack {
                List {
                    NavigationLink(destination: DiscoverView(),tag:"Discover",selection:$selection)
                    {
                        NavViewItem(text: "Discover")
                    }
                    NavigationLink(destination: PackageView(),tag:"NewPackage",selection:$selection)
                    {
                        NavViewItem(text: "New Package")
                    }
                    NavigationLink(destination: PackageView(),tag:"NewUp",selection:$selection)
                    {
                        NavViewItem(text: "New Upload")
                    }
                    NavigationLink(destination: PackageView(),tag:"Genre",selection:$selection)
                    {
                        NavViewItem(text: "Genre")
                    }
                }
                
                
            }
        }.onAppear{
            selection = "Discover"
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
