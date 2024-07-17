//
//  ContentView.swift
//  HuliPizzaApp
//
//  Created by Sahana  Rao on 09/06/24.
//

import SwiftUI

struct ContentView: View {
    var menu : [MenuItem]
    @State private var showOrders: Bool = true
    @State private var showMenu : Bool = false
    @State private var menuItem : MenuItem = noMenuItem
    @StateObject var orders : OrderModel = OrderModel()
    var body: some View {
//        VStack {
//
//            HeaderView()
//                .shadow(radius: 5)
//            StatusBarView(showOrders: $showOrders, showMenu: $showMenu)
//            if showOrders {
//                OrderView(orders: orders)
//                    .cornerRadius(10)
//            }
//
//            else {
//                MenuItemView(selected:$menuItem, order: orders)
//                    .padding(5)
//                    .background(.thinMaterial,in:RoundedRectangle(cornerRadius: 10))
//                if showMenu {
//                    MenuGridView(menu: MenuModel().menu, menuItem: $menuItem)
//                }
//                else {
//                    MenuView(menu: menu, selectedItem: $menuItem)
//                }
//
//
//            }
//
//            Spacer()
//        }
        TabView {
            PhotoView()
            VStack {
                HeaderView()
                    .shadow(radius: 5)
                StatusBarView(showOrders: $showOrders, showMenu: $showMenu)
//                MenuItemView(selected:$menuItem, order: orders)
//                    .padding(5)
//                    .background(.thinMaterial,in:RoundedRectangle(cornerRadius: 10))
//                if showMenu {
//                    MenuGridView(menu: MenuModel().menu, menuItem: $menuItem)
//                }
//                else {
//                    MenuView(menu: menu, selectedItem: $menuItem)
//                }
                
                MenuView2(menu: menu)
                
            }.tabItem {
                Label("Menu", systemImage: "list.bullet")
            }
            VStack {
                
                HeaderView()
                    .shadow(radius: 5)
                StatusBarView(showOrders: $showOrders, showMenu: $showMenu)
                // if showOrders {
                OrderView(orders: orders)
                    .cornerRadius(10)
            }.tabItem {
                Label("Cart", systemImage: "cart")
            }
            
        }
        .padding()
        .background(.linearGradient(colors: [.cyan,Color("Surf"),Color("Sky"),.white], startPoint: .topLeading, endPoint: .bottom))
        .environmentObject(orders)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(menu: MenuModel().menu)
    }
}
