//
//  StatusBarView.swift
//  HuliPizzaApp
//
//  Created by Sahana  Rao on 17/06/24.
//

import SwiftUI

struct StatusBarView: View {
    @Binding var showOrders: Bool
    @Binding var showMenu : Bool
    @EnvironmentObject var orders : OrderModel
    var body: some View {
        
        HStack {
            Text("\(orders.orderItems.count) Orders")
            Spacer()
            Button {
                showOrders.toggle()
            } label : {
                Image(systemName: showOrders ?  "menucard" : "cart" )
                    .font(.title2)
            }
            if !showOrders {
                Button {
                    showMenu.toggle()
                } label: {
                    Image(systemName: showMenu ?  "square.grid.3x2" : "list.bullet")
                        .font(.title2)
                }
            }
            Spacer()
            Label {
                Text(orders.orderTotal,format:.currency(code: "USD"))
            } icon: {
                Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.circle.fill")
            }
            
        }
        .backgroundStyle(.thickMaterial)
        .foregroundColor(.white)
        .font(.title)
    }
}

struct StatusBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatusBarView(showOrders: .constant(false), showMenu: .constant(false)).environmentObject(OrderModel())
            .background(.black)
    }
}
