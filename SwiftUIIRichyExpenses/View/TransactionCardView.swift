//
//  TransactionCardView.swift
//  SwiftUIIRichyExpenses
//
//  Created by Richard Price on 06/06/2022.
//

import SwiftUI
//step 3 create a card view for all the transactions
struct TransactionCardView: View {
    var expense: Expense
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    var body: some View {
        //step 5 create first letter avatar
        HStack {
            if let first = expense.remark.first {
                Text(String(first))
                    .font(.title.bold())
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background {
                        Circle().fill(Color(expense.color))
                    }.shadow(color: .black.opacity(0.08), radius: 5, x: 5, y: 5)
            }
            //step 6 add text for avatar
            Text(expense.remark)
                .fontWeight(.semibold)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
            //step 8 display the price and date of purchase
            VStack(alignment: .trailing, spacing: 7) {
                // TEST FIRST  let price = expenseViewModel.convertNumberToPrice(value: expense.amount)
                let price = expenseViewModel.convertNumberToPrice(value: expense.type == .expense ? -expense.amount : expense.amount)
                Text(price)
                    .font(.callout)
                    .opacity(0.7)
                    .foregroundColor(expense.type == .expense ? Color("Red") : Color("Green"))
                Text(expense.date.formatted(date: .numeric, time: .omitted))
                    .font(.caption)
                    .opacity(0.5)
            }
        }
        //step 9 add a rounded rect background
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 15, style: .continuous).fill(.white)
        }
    }
}

struct TransactionCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
