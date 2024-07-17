//
//  HeaderView.swift
//  HuliPizzaApp
//
//  Created by Sahana  Rao on 12/06/24.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var orders : OrderModel
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    var body: some View {
        VStack {
            if (verticalSizeClass ?? .regular) != .compact {
                ZStack(alignment: .bottomTrailing) {
                    Image("surfBanner")
                        .resizable()
                    .scaledToFit()
                    Text("Huli Pizza Company")
                        .font(.custom("Georgia", size: 30,relativeTo: .title))
                       // .foregroundColor(Color("Sky"))
                        .foregroundStyle(.regularMaterial)
                        .fontWeight(.semibold)
                        .environment(\.colorScheme, .light)
                    
                }
            }
            else {
                HStack(alignment: .bottom) {
                    Spacer()
                    Image("surfBanner")
                        .resizable()
                    .scaledToFit()
                    Text("Huli Pizza Company")
                        .font(.custom("Georgia", size: 30,relativeTo: .title))
                        .foregroundColor(Color("Surf"))
                        .fontWeight(.heavy)
                        .environment(\.colorScheme, .light)
                    Spacer()
                    
                }
            }
            
//            Label {
//                Text(orders.orderTotal,format:.currency(code: "USD"))
//            } icon: {
//                Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.circle.fill")
//            }
            
        }
        .background(.thickMaterial)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView().environmentObject(OrderModel())
    }
}
