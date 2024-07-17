//
//  MenuItemView.swift
//  HuliPizzaApp
//
//  Created by Sahana  Rao on 12/06/24.
//

import SwiftUI

struct MenuItemView: View {
    @Binding var selected : MenuItem
    @ObservedObject var order : OrderModel
    @State private var showAlert : Bool = false
    @State var presentSheet : Bool = false
    @State private var addedItem : Bool = false
    @State private var newOrder : Bool = true
    @State private var orderItem : OrderItem = noOrderItem
    var body: some View {
        VStack {
            HStack { Text(selected.name)
                    .font(.title)
                    .foregroundStyle(.ultraThickMaterial)
                    .fontWeight(.semibold)
                    .padding(.leading)
                   // .frame(width: 200,height: 150)
//                    .background(.linearGradient(colors: [Color("Surf"),Color("Sky").opacity(0.1)], startPoint: .leading, endPoint: .trailing),in:Capsule())
                if let image = UIImage(named: "\(selected.id)_lg") {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .padding([.top,.bottom],5)
                        .cornerRadius(15)
//                        .shadow(color:.teal,radius: 15,x:8,y:8)
                    
                }
                else {
                    // Image(systemName: "rectangle.fill").font(.largeTitle)
                    Image("surfboard_sm")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(15)
                        .rotationEffect(.degrees(180))
                }
            }
            .background(.linearGradient(colors: [Color("Surf"),Color("Sky").opacity(0.1)], startPoint: .leading, endPoint: .trailing),in:Capsule())
            .shadow(color:.teal,radius: 15,x:8,y:8)
            VStack(alignment: .leading) {
                ScrollView {
                   // Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. In at ex odio. Donec condimentum tempus lectus, posuere dictum turpis interdum ultrices. Nunc elementum erat ac justo maximus aliquam. Vestibulum at ligula tortor. Integer faucibus nisi lacus, eu ultricies leo bibendum ut. Maecenas a lobortis libero. Curabitur nibh purus, tristique et.")
                    Text(selected.description)
                        .font(.custom("Georgia", size: 18, relativeTo: .body))
                }
                
                
                
            }
            Button {
                orderItem = OrderItem(id: -99, item: selected)
                presentSheet = true
                showAlert = true
                
            } label: {
                Spacer()
                Text(selected.price, format: .currency(code: "USD"))
                Image(systemName: addedItem ? "cart.fill.badge.plus" : "cart.badge.plus" )
                Spacer()
            }
            .disabled(selected.id < 0)
            .padding()
            .background(.red,in: Capsule())
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(5)
//            .alert("Buy a \(selected.name)", isPresented: $showAlert) {
//                Button("Yes") {
//                    addedItem = true
//                    order.addOrder(selected, quantity: 1)
//                }
//                Button("No") {
//
//                }
//                Button("Make it a double") {
//                    addedItem = true
//                    order.addOrder(selected, quantity: 2)
//                }
//            }
            .sheet(isPresented: $presentSheet) {
                addedItem = true
            } content: {
                OrderingDetailView(orderItem: $orderItem, presentSheet: $presentSheet, newOrder: $newOrder)
            }
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(selected: .constant(noMenuItem), order: OrderModel())
    }
}
