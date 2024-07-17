//
//  RatingView.swift
//  HuliPizzaApp
//
//  Created by Sahana  Rao on 13/06/24.
//

import SwiftUI

struct RatingView: View {
    var rating : Int
    var body: some View {
        HStack(spacing: 5) {
            ForEach(1...6,id: \.self) { number in
                Image(systemName: (number <= rating) ? "fork.knife.circle.fill" :"circle").font(.title3)
                
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 3)
    }
}
