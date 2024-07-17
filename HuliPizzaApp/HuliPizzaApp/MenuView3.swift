//
//  MenuView3.swift
//  HuliPizzaApp
//
//  Created by Sahana  Rao on 26/06/24.
//

import SwiftUI

struct MenuView3: View {
    var menu : [MenuItem]
    @State private var selectedItem :MenuItem? = nil
    @State private var selectedCategory: MenuCategory? = .originals
    
    var categoryItems: [MenuItem] {
        if selectedCategory == nil {
            return []
        }
        else {
            return menu.filter { item in
                item.category == selectedCategory
            }
        }
        
    }
    
    var body: some View {
        NavigationSplitView {
            List(MenuCategory.allCases,id: \.self, selection: $selectedCategory) { category in
                    Text(category.rawValue)
            }.navigationTitle("Pizza Categories")
        } content: {
            List(categoryItems,selection: $selectedItem) { items in
                NavigationLink(value: items) {
                    MenuRowView(item: items)
                }
               
            }
        } detail: {
            MenuDetailView(item: $selectedItem)
        }

    }
}

struct MenuView3_Previews: PreviewProvider {
    static var previews: some View {
        MenuView3(menu: MenuModel().menu)
    }
}
