//
//  OrderView.swift
//  HuliPizzaApp
//
//  Created by Sahana  Rao on 12/06/24.
//

import SwiftUI

struct OrderView: View {
   @ObservedObject var orders : OrderModel
    var body: some View {
        VStack {
            
            NavigationStack {
                List{
                    ForEach($orders.orderItems) { $order in
                        NavigationLink(value:order ) {
                            OrderRowView(order: order)
                                .padding(4)
                                .background(.regularMaterial,in:RoundedRectangle(cornerRadius: 10))
                                .padding(.bottom, 5)
                                .shadow(radius: 10)
                                .padding([.leading, .trailing],7)
                        }.navigationDestination(for: OrderItem.self) { order in
                            OrderDetailView(orderItem: $order, presentSheet: .constant(false), newOrder: .constant(false))
                        }.navigationTitle("Your Order")
                        
                    }
                    .onDelete { indexSet in
                        orders.orderItems.remove(atOffsets: indexSet)
                    }
                    .onMove { source, destination in
                        orders.orderItems.move(fromOffsets: source, toOffset: destination)
                    }
                }
            }
            
            //                HStack {
            //                    Text("Order Pizza")
            //                        .font(.title)
            //                    Spacer()
            //                    //Image(systemName: orders.isEmpty ? "cart" : "cart.circle.fill")
            //                    //Text("$59.99")
            ////                    Label {
            ////                        Text(orders.orderTotal,format:.currency(code: "USD"))
            ////                    } icon: {
            ////                        Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.circle.fill")
            ////                    }
            //
            //                }
            //                .padding()
            //                .background(.ultraThinMaterial)
            
            
            
            
//            Button("Delete Order") {
//                if !orders.orderItems.isEmpty {
//                    orders.removeLast()
//                }
//            }
//            .padding(5)
//            .background(.regularMaterial,in:Capsule())
//            .padding(7)
        }
        
        .background(.regularMaterial)
        .padding([.leading,.trailing],7)
        .padding([.top,.bottom], 10)
        .cornerRadius(10)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(orders: OrderModel())
    }
}
