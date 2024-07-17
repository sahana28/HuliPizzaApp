//
//  OrderItemView.swift
//  HuliPizzaApp
//
//  Created by Sahana  Rao on 18/06/24.
//

import SwiftUI

struct OrderItemView: View {
    @Binding var orderItem : OrderItem
    @State var quantity : Int = 1
    @State private var doubleIngredient : Bool = false
    @State var pizzaCrust : PizzaCrust
    @State private var name : String = ""
    @State private var comments : String = ""
    
    init(orderItem: Binding<OrderItem>) {
        self._orderItem = orderItem
        self.pizzaCrust = orderItem.item.crust.wrappedValue
    }
    
    var body: some View {
        VStack() {
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding()
            Toggle(isOn: $doubleIngredient) {
                Text("Double Ingredient " + (doubleIngredient ? "Yes":"No"))
            }
            Stepper(value: $quantity,in: 1...10) {
                Text("\(quantity) " + (quantity > 1 ? "pizzas" : "pizza"))
            }
            Picker(selection: $pizzaCrust) {
                ForEach(PizzaCrust.allCases,id: \.self){ crust in
                    Text(crust.rawValue).tag(crust)
                    
                }
            } label: {
                Text("Pizza Crust")
                
            }
            .pickerStyle(.menu)
            
            VStack {
                Text("comments")
                TextEditor(text: $comments)
            }
            
            .clipShape(RoundedRectangle(cornerRadius: 3))
            .shadow(radius: 3)
            
            Spacer()
        }.padding()
    }
}

struct OrderItemView_Previews: PreviewProvider {
    static var previews: some View {
        OrderItemView(orderItem: .constant(testOrderItem))
    }
}
