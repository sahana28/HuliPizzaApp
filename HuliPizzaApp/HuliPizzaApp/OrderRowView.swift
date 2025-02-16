//
//  OrderRowView.swift
//  HuliPizzaApp
//
//  Created by Sahana  Rao on 12/06/24.
//

import SwiftUI

struct OrderRowView: View {
    var order : OrderItem
    var body: some View {
        VStack {
            HStack {
                Text(order.item.name)
                Text("- " + order.preferredCrust.rawValue)
                if order.extraIngredients {Image(systemName: "2.circle")}
                Spacer()
                Text(order.name)
            }
            HStack(alignment: .firstTextBaseline) {
                Text(order.quantity,format: .number)
                Text(order.item.price, format: .currency(code: "USD"))
                Spacer()
                Text(order.extPrice, format: .currency(code: "USD"))
                    .fontWeight(.semibold)
            }
        }
    }
}

struct OrderRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderRowView(order: testOrderItem)
    }
}
