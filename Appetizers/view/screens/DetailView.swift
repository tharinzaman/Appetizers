import SwiftUI

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var order: Order
    
    @Binding var shouldShowDetail: Bool
    
    let appetizer: Appetizer
    let network: NetworkClientProtocol
    
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(
                network: network,
                urlString: appetizer.imageURL
            )
            .aspectRatio(
                contentMode: .fit
            )
            .frame(
                width:300,
                height: 225
            )
            AppetizerDetailsTextView(
                appetizer: appetizer
            )
            Spacer()
            NutritionInfoView(
                appetizer: appetizer
            )
            OrderButton(
                price: appetizer.price,
                toDo: "Add to order"
            ) {
                order.add(
                    appetizer
                )
                shouldShowDetail = false
            }.accessibilityIdentifier("add-to-order-button")

        }
        .frame(
            width: 300,
            height: 525
        )
        .background(
            Color(
                .systemBackground
            )
        )
        .cornerRadius(
            12
        )
        .shadow(
            radius: 40
        )
        .overlay(
            ExitButton(
                shouldShowDetail: $shouldShowDetail
            ),
            alignment: .topTrailing
        )
    }
}
