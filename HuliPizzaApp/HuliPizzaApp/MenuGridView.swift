//
//  MenuGridView.swift
//  HuliPizzaApp
//
//  Created by Sahana  Rao on 20/06/24.
//

import SwiftUI

struct MenuGridView: View {
    var menu : [MenuItem]
    @Binding var menuItem : MenuItem
    @State private var favoriteMenuItem : [Int] = [-1]
    let columnLayout = Array(repeating: GridItem(), count: 3)
    let columnLayout2 = Array(repeating: GridItem(), count: 5)
    @Namespace private var namespace
    
    func menu(id:Int) -> MenuItem {
        menu.first { item in
            item.id == id
        } ?? noMenuItem
    }
    var body: some View {
        
        VStack {
            LazyVGrid(columns:columnLayout2) {
                ForEach(favoriteMenuItem.sorted(),id:\.self) { itemId in
                    FavoriteTileView(menuItem: menu(id: itemId))
                        .matchedGeometryEffect(id: itemId, in: namespace)
                        .onTapGesture {
                            menuItem = menu(id: itemId)
                        }
                        .onLongPressGesture {
                        
                            if let index = favoriteMenuItem.firstIndex(where: {
                                $0 == itemId
                            }) {
                                print(index)
                                favoriteMenuItem.remove(at: index)
                            }
                        }
                }
            }
            VStack {
                Text(menuItem.name)
                ScrollView {
                    LazyVGrid(columns: columnLayout) {
                        ForEach(menu) { item in
                            if !favoriteMenuItem.contains(item.id) {
                                MenuItemTileView(menuItem: item)
                                    .matchedGeometryEffect(id: item.id, in: namespace)
                                    .onTapGesture(count:2) {
                                        if !favoriteMenuItem.contains(item.id) {
                                            withAnimation(.easeOut) {
                                                favoriteMenuItem.append(item.id)
                                            }
                                            
                                        }
                                    }
                                    .onTapGesture {
                                        menuItem = item
                                    }
                                    .onLongPressGesture {
                                        menuItem = noMenuItem
                                    }
                                
                            }
                        }
                    }
                }
            }
        }
        //.animation(.easeOut(duration: 0.5), value: favoriteMenuItem)
    }
}

struct MenuGridView_Previews: PreviewProvider {
    static var previews: some View {
        MenuGridView(menu: MenuModel().menu, menuItem: .constant(noMenuItem))
    }
}
