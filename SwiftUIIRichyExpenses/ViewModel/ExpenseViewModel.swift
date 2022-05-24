//
//  ExpenseViewModel.swift
//  SwiftUIIRichyExpenses
//
//  Created by Richard Price on 23/05/2022.
//

import SwiftUI
//step 3 create your view model for a reference to your sample data
class ExpenseViewModel: ObservableObject {
    
    @Published var expense: [Expense] = sample_expenses

}
