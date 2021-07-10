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
    @State private var searchText = ""
    
    var body: some View {
        NavigationView{
            List {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search ..", text: $searchText)
                        .frame(height: 20)
                }
                .frame(height:25)
                .cornerRadius(5)
                
                .foregroundColor(.gray)
                .padding(.vertical, 5)
                NavigationLink(destination: DiscoverView(),tag:"Discover",selection:$selection)
                {
                    Label("Discover",systemImage:"star")
                        .font(.system(size: 14))
                        .padding(.vertical, 5)
                }
                NavigationLink(destination: PackageView(),tag:"NewPackage",selection:$selection)
                {
                    Label("New Package",systemImage:"sun.max")
                        .font(.system(size: 14))
                        .padding(.vertical, 5)
                }
                NavigationLink(destination: EpisodeView(),tag:"NewUp",selection:$selection)
                {
                    Label("New Upload",systemImage:"moon")
                        .font(.system(size: 14))
                        .padding(.vertical, 5)
                }
                NavigationLink(destination: PackageView(),tag:"Genre",selection:$selection)
                {
                    Label("Discover",systemImage:"play")
                        .font(.system(size: 14))
                        .padding(.vertical, 5)
                }
            }.listStyle(SidebarListStyle())
            .onAppear{
                selection = "Discover"
            }.toolbar{
                Button(action: toggleSidebar) {
                    Image(systemName: "sidebar.left")
                        .help("Toggle Sidebar")
                }
            }
        }
        
    }
}

private func toggleSidebar() {
    NSApp.keyWindow?.firstResponder?
        .tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
