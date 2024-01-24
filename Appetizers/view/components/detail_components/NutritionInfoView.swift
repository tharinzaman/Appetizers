//
//  NutritionInfoView.swift
//  Appetizers
//
//  Created by Tharin Zaman on 19/12/2023.
//

import SwiftUI

struct NutritionInfoView: View {
    let appetizer: Appetizer
    var body: some View {
        HStack(spacing: 40) {
            NutritionInfo(
                category: .calories,
                amount: appetizer.calories
            )
            NutritionInfo(
                category: .protein,
                amount: appetizer.protein
            )
            NutritionInfo(
                category: .carbs,
                amount: appetizer.carbs
            )
        }
    }
}

struct NutritionInfo: View {
    let category: NutritionCategory
    let amount: Int
    var measurement: String {
        switch category {
        case .calories: " cal"
        case .protein: "g"
        case .carbs: "g"
        }
    }
    var body: some View {
        VStack(spacing: 5) {
            Text(
                category.rawValue
            )
            .font(
                .caption
            )
            .fontWeight(
                .bold
            )
            Text(
                "\(amount)\(measurement)"
            )
            .foregroundColor(
                .secondary
            )
            .fontWeight(
                .semibold
            )
            .italic()
        }
    }
}



#Preview {
    NutritionInfoView(
        appetizer: MockData.sampleAppetizer
    )
}
