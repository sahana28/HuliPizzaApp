//
//  OrderingDetailView.swift
//  HuliPizzaApp
//
//  Created by Sahana  Rao on 22/06/24.
//

import SwiftUI

struct OrderingDetailView: View {
    @Binding var orderItem : OrderItem
    @Binding var presentSheet : Bool
    @Binding var newOrder : Bool
    @State private var comments: String = ""
    @State private var pizzaCrust : PizzaCrust
    @State private var quantity : Int
    @State private var doubleIngredients : Bool
    @State private var name : String
    @State private var presentAlert : Bool = false
    @EnvironmentObject var orders:OrderModel
    
    init(orderItem: Binding<OrderItem>, presentSheet:Binding<Bool>, newOrder:Binding<Bool>) {
        self._orderItem = orderItem
        self._presentSheet = presentSheet
        self._newOrder = newOrder
        self.name = orderItem.name.wrappedValue
        self.comments = orderItem.comments.wrappedValue
        self.pizzaCrust = orderItem.preferredCrust.wrappedValue
        self.quantity = Int(orderItem.quantity.wrappedValue)
        self.doubleIngredients = orderItem.extraIngredients.wrappedValue
    }
    
    func updateOrder() {
        orderItem.comments = comments
        orderItem.quantity = quantity
        orderItem.extraIngredients = doubleIngredients
        orderItem.preferredCrust = pizzaCrust
        orderItem.name = name
    }
    
    var body: some View {
        VStack {
            HStack {
                if let image = UIImage(named: "\(orderItem.item.id)_lg") {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .padding([.top,.bottom],7)
                        
                }
                else {
                    Image("surfboard_lg")
                        .resizable()
                        .scaledToFit()
                }
                
                Text(orderItem.item.name)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                    .padding(.trailing)
                     
            }
            .background(.linearGradient(colors: [Color("Surf"),Color("Sky")], startPoint: .leading, endPoint: .trailing),in:Capsule())
            .padding()
            Spacer()
            
            TextField("Make this pizza for", text: $name)
                .frame(height: 35)
                .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 3))
                .padding()
                
            
            Spacer()
            
            VStack {
                Picker(selection: $pizzaCrust) {
                    ForEach(PizzaCrust.allCases,id:\.self) { crust in
                        Text(crust.rawValue).tag(crust)
                    }
                } label: {
                    Text("Pizza Crust" + pizzaCrust.rawValue)
                }
                .pickerStyle(.segmented)
                .backgroundStyle(.ultraThickMaterial)
                .padding([.leading,.trailing],7)
                
                Toggle(isOn: $doubleIngredients) {
                    Text(( doubleIngredients ? "Double Toppings" : "Single Toppings"))
                }
                .padding([.leading,.trailing],7)
                Stepper(value: $quantity, in: 1...10) {
                    Text("\(quantity) " + (quantity > 1 ? "pizzas" : "pizza"))
                }
                .padding([.leading,.trailing,.bottom],7)
               
            }
            
            .background(.regularMaterial)
            .padding([.leading,.trailing],7)
            
            
            VStack {
                Text("Comments").font(.caption)
                    .foregroundColor(.secondary)
                TextEditor(text: $comments)
                    .clipShape(RoundedRectangle(cornerRadius: 3))
                    .shadow(radius: 3)
            }
            .padding()
            Spacer()
            HStack {
                Button("Update") {
                    updateOrder()
                    
                    if newOrder {
                        orders.addOrder(orderItem: orderItem)
                    }
                    else {
                        orders.replaceOrder(id: orderItem.id, with: orderItem)
                    }
                    presentSheet = false
                    presentAlert = true
                    
                }
                .padding()
                .padding([.leading,.trailing])
                .foregroundColor(.white)
                .background(.green,in: Capsule())
                .font(.title)
                .shadow(radius:7,x:2,y:2)
                .alert("Huli Pizza Company \n \(orderItem.name)", isPresented: $presentAlert) {
                    
                }
//                .frame(width: 110,height: 45)
//                .background(Color.green,in:RoundedRectangle(cornerRadius: 20))
//                .font(.title2)
//                .foregroundColor(.white)
//                .padding()
//                .shadow(radius: 3)
                
                Button("Cancel") {
                    presentSheet = false
                }
                .padding()
                .padding([.leading,.trailing])
                .foregroundColor(.white)
                .background(.red,in: Capsule())
                .font(.title)
                .shadow(radius:7,x:2,y:2)
                
            }
           // Spacer()
                .padding()
        }
        .background(Color("Surf"))
        
    }
    
}

struct OrderingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrderingDetailView(orderItem: .constant(testOrderItem),presentSheet: .constant(false),newOrder: .constant(false))
    }
}



extension OrderModel{
    func replaceOrder(id:Int,with item:OrderItem){
        if let index = self.orderItems.firstIndex(where: {$0.id == id}){
            self.orderItems.remove(at: index)
            self.orderItems.insert(item, at: index)
        }
    }
}
