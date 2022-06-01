//
//  ExpenseViewModel.swift
//  SwiftUIIRichyExpenses
//
//  Created by Richard Price on 23/05/2022.
//

import SwiftUI

class ExpenseViewModel: ObservableObject {
    //step 1 add publised vars for dates
    @Published var expenses: [Expense] = sample_expenses
    @Published var startDate: Date = Date()
    @Published var endDate: Date = Date()
    @Published var currentMonthStartDate: Date = Date()
    //step 2 create an init to give date values
    init() {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: Date())
        startDate = calendar.date(from: components)!
        currentMonthStartDate = calendar.date(from: components)!
    }
    
    
    //step 3 fetch current month date string
    func currentMonthStartDateString()-> String {
        return currentMonthStartDate.formatted(date: .abbreviated, time: .omitted) + " - " + Date().formatted(date: .abbreviated, time: .omitted)
    }
    
    //step 5 convert expenses to currency function
    func convertExpensesToCurrency(expenses: [Expense], type: ExpenseType = .all) -> String {
        var value: Double = 0
        //using reduce will accumilate the expenses into a partial result then
        //either add an expense or take away
        value = expenses.reduce(0, { partialResult, expense in
            return partialResult + (expense.type == .all ? (expense.type == .income ? expense.amount : -expense.amount) : (expense.type == type ? expense.amount : 0))
        })
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: .init(value: value)) ?? "£0.00"
    }

}
