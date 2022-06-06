//
//  Home.swift
//  SwiftUIIRichyExpenses
//
//  Created by Richard Price on 23/05/2022.
//

import SwiftUI

struct Home: View {
    @StateObject private var expenseViewModel: ExpenseViewModel = .init()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 12) {
                // MARK: Top Hstack
                HStack(spacing: 15) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Welcome To")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                      
                        Text("iRichy")
                            .font(.title2.bold())
                    }

                    .frame(maxWidth: .infinity, alignment: .leading)
               
                    Button {
                        
                    } label: {
                        Image(systemName: "hexagon.fill")
                            .foregroundColor(.gray)
                            .overlay {
                                Circle()
                                    .stroke(.white, lineWidth: 2)
                                    .padding(7)
                            }
                            .frame(width: 40, height: 40)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                    }
                }
                ExpenseCardView()
                TransactionView()
            }.padding()
            // MARK: background color of scroll view
        }.background {
            Color("BG").ignoresSafeArea()
        }
        
        
    }
    @ViewBuilder
    func ExpenseCardView()->some View {
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
    
    //MARK: Transactions View 9:59
    //step 2 create the transactions view, add this function BELOW ExpenseCardView()
    @ViewBuilder
    func TransactionView()-> some View {
        //step 10 add some spacing
        VStack(spacing: 15) {
            Text("Transactions")
                .font(.title2.bold())
                .opacity(0.7)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding(.bottom)
            
            ForEach(expenseViewModel.expenses) { expense in
                //step 4 implenment transaction card view
                TransactionCardView(expense: expense)
                    .environmentObject(expenseViewModel)
            }
        }
        .padding(.top)
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
