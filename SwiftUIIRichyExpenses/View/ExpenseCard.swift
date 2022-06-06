//
//  ExpenseCardView.swift
//  SwiftUIIRichyExpenses
//
//  Created by Richard Price on 06/06/2022.
//

import SwiftUI

struct ExpenseCard: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    var body: some View {
        GeometryReader {proxy in
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(
                    .linearGradient(colors: [
                        Color("Gradient1"),
                        Color("Gradient2"),
                        Color("Gradient3"),
                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
            // MARK: Next create dates and expense totals
            VStack(spacing: 15) {
                VStack(spacing: 15) {
                    Text(expenseViewModel.currentMonthStartDateString())
                        .font(.callout)
                        .fontWeight(.semibold)
                    Text(expenseViewModel.convertExpensesToCurrency(expenses: expenseViewModel.expenses))
                        .font(.system(size: 35, weight: .bold))
                        .lineLimit(1)
                        .padding(.bottom)
                }
                .offset(y: -10)
                HStack {
                    Image(systemName: "arrow.down")
                        .font(.caption.bold())
                        .foregroundColor(Color("Green"))
                        .frame(width: 30, height: 30)
                        .background(.white.opacity(0.7), in: Circle()).padding()
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Income")
                            .font(.caption)
                            .opacity(0.7)
                        Text(expenseViewModel.convertExpensesToCurrency(expenses: expenseViewModel.expenses, type: .income))
                            .font(.callout)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                        .fixedSize()}
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "arrow.up")
                        .font(.caption.bold())
                        .foregroundColor(Color("Red"))
                        .frame(width: 30, height: 30)
                        .background(.white.opacity(0.7), in: Circle()).padding()
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Expense")
                            .font(.caption)
                            .opacity(0.7)
                        Text(expenseViewModel.convertExpensesToCurrency(expenses: expenseViewModel.expenses, type: .expense))
                            .font(.callout)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .fixedSize()
                        
                    }
                    
                }
                .padding(.horizontal)
                .padding(.trailing)
                .offset(y: 15)
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            
        }
        .frame(height: 220)
        .padding(.top)
    }
}

