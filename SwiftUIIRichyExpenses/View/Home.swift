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
                            .foregroundColor(Color("Gray"))
                        
                        Text("iRichy")
                            .font(.title2.bold())
                            .foregroundColor(Color("Gray2"))
                    }
                    
                    .frame(maxWidth: .infinity, alignment: .leading)
                    NavigationLink {
                        FiltereredDetailView()
                            .environmentObject(expenseViewModel)
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
                ExpenseCard().environmentObject(expenseViewModel)
                TransactionView()
            }.padding()
            // MARK: background color of scroll view
        }.background {
            Color("BG").ignoresSafeArea()
        }
        .fullScreenCover(isPresented: $expenseViewModel.addNewExpense) {
            //step 2 add in clear data function
            expenseViewModel.clearData()
        } content: {
            NewExpense().environmentObject(expenseViewModel)
        }
        //step 6 add the button as an overlay after the new expense content
        .overlay(alignment: .bottomTrailing) {
            AddButton()
        }
    }
    //step 5 add new expense button
    @ViewBuilder
    func AddButton() -> some View {
        Button {
            expenseViewModel.addNewExpense.toggle()
        } label: {
            Image(systemName: "plus")
                .font(.system(size: 26, weight: .medium))
                .foregroundColor(.white)
                .frame(width: 55, height: 55)
                .background {
                    Circle().fill(
                        .linearGradient(colors: [
                        Color("Gradient1"),
                        Color("Gradient2"),
                        Color("Gradient3"),
                        ], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                }
                .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
        }
        .padding()
    }
    
    @ViewBuilder
    func TransactionView()-> some View {
        VStack(spacing: 15) {
            Text("Transactions")
                .font(.title2.bold())
                .foregroundColor(Color("Gray2"))
                .opacity(0.7)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding(.bottom)
            
            ForEach(expenseViewModel.expenses) { expense in
                TransactionCardView(expense: expense).foregroundColor(Color("Gray2"))
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
