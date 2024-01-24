import SwiftUI

struct AppetizersOrderView: View {
    @EnvironmentObject var order: Order
    let network: NetworkClientProtocol
    var body: some View {
        VStack {
            List {
                ForEach(
                    order.items
                ) {
                    appetizer in
                    AppetizerCell(
                        network: network,
                        appetizer: appetizer
                    )
                }
                .onDelete(
                    perform: order.remove
                )
            }
            .listStyle(
                PlainListStyle()
            )
            OrderButton(
                price: order.totalPrice,
                toDo: "Checkout order"
            ) {
                order.removeAll()
            }.padding(
                .bottom,
                25
            )
        }
    }
}
