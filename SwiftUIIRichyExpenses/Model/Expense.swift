//
//  Expense.swift
//  SwiftUIIRichyExpenses
//
//  Created by Richard Price on 23/05/2022.
//

import SwiftUI

// MARK: Expense Model And Sample Data  //create a dummy model after importing gradients and color assets
struct Expense: Identifiable,Hashable{
    var id = UUID().uuidString
    var remark: String
    var amount: Double
    var date: Date
    var type: ExpenseType
    var color: String
}

enum ExpenseType: String{
    case income = "Income"
    case expense = "expenses"
    case all = "ALL"
}

var sample_expenses: [Expense] = [
    Expense(remark: "Magic Keyboard", amount: 99, date: Date(timeIntervalSince1970: 1653309444), type: .expense, color: "Yellow"),
    Expense(remark: "Food", amount: 19, date: Date(timeIntervalSince1970: 1653309444), type: .expense, color: "Red"),
    Expense(remark: "Magic Trackpad", amount: 99, date: Date(timeIntervalSince1970: 1653309444), type: .expense, color: "Purple"),
    Expense(remark: "Uber Cab", amount: 20, date: Date(timeIntervalSince1970: 1653309444), type: .expense, color: "Green"),
    Expense(remark: "Amazon Purchase", amount: 299, date: Date(timeIntervalSince1970: 1653309444), type: .expense, color: "Yellow"),
    Expense(remark: "Stocks", amount: 2599, date: Date(timeIntervalSince1970: 1653309444), type: .income, color: "Purple"),
    Expense(remark: "In App Purchase", amount: 499, date: Date(timeIntervalSince1970: 1653309444), type: .income, color: "Red"),
    Expense(remark: "Movie Ticket", amount: 99, date: Date(timeIntervalSince1970: 1653309444), type: .expense, color: "Yellow"),
    Expense(remark: "Apple Music", amount: 25, date: Date(timeIntervalSince1970: 1653309444), type: .expense, color: "Green"),
    Expense(remark: "Snacks", amount: 49, date: Date(timeIntervalSince1970: 1653309444), type: .expense, color: "Purple"),
]

