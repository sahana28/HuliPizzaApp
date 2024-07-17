//
//  MenuRowView.swift
//  HuliPizzaApp
//
//  Created by Sahana  Rao on 12/06/24.
//

import SwiftUI

struct MenuRowView: View {
    var item : MenuItem
    var body: some View {
        HStack(alignment: .top,spacing: 15) {
          //  Image(systemName: "\(item).circle.fill").font(.largeTitle)
            if let image = UIImage(named: "\(item.id)_sm") {
                Image(uiImage: image)
                    .clipShape(Circle())
                    .padding(.trailing, -25)
            }
            else {
                Image("surfboard_sm")
//                    .clipShape(Circle())
//                    .padding(.trailing, -25)
            }
            VStack(alignment: .leading) {
                HStack {
                    Text(item.name)
                    Spacer()
                    Text(item.price,format: .currency(code: "USD"))
                }
                RatingView(rating: item.rating)
            }
            Spacer()
        }
    }
}

struct MenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        MenuRowView(item: testMenuItem)
    }
}
