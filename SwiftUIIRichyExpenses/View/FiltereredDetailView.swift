//
//  FiltereredDetailView.swift
//  SwiftUIIRichyExpenses
//
//  Created by Richard Price on 06/06/2022.
//

import SwiftUI

struct FiltereredDetailView: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    @Environment(\.self) var env
    @Namespace var animation
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                HStack(spacing: 15) {
                    Button {
                        env.dismiss()
                    } label: {
                        Image(systemName: "arrow.backward.circle.fill")
                            .foregroundColor(.gray)
                            .frame(width: 40, height: 40)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Transactions")
                            .font(.title.bold())
                            .opacity(0.7)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Button {
                        //step 2 apply filter to view via viewmodel
                        expenseViewModel.showFilterView = true
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.gray)
                            .frame(width: 40, height: 40)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                    }
                }
                //MARK: Expsense Card
                ExpenseCard()
                    .environmentObject(expenseViewModel)
                CustomSegmentedControl()
                    .padding(.top)
                VStack(spacing: 15) {
                    Text(expenseViewModel.convertDateToString())
                        .opacity(0.6)
                    Text(expenseViewModel.convertExpensesToCurrency(expenses: expenseViewModel.expenses, type: expenseViewModel.tabName))
                        .font(.title.bold())
                        .opacity(0.9)
                        .animation(.none, value: expenseViewModel.tabName)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(.white)
                }
                .padding(.vertical, 20)
                ForEach(expenseViewModel.expenses.filter {
                    return $0.type == expenseViewModel.tabName
                }) { expense in
                    TransactionCardView(expense: expense)
                        .environmentObject(expenseViewModel)

                }
            }
            .padding()
        }
        .navigationBarHidden(true)
        .background {
            Color("BG").ignoresSafeArea()
        }
        //step 3 add the view
        .overlay {
            FilterView()
        }
    }
    @ViewBuilder
    func CustomSegmentedControl()-> some View {
        HStack(spacing: 0) {
            ForEach([ExpenseType.expense, ExpenseType.income], id: \.rawValue) { tab in
                Text(tab.rawValue.capitalized)
                    .fontWeight(.semibold)
                    .foregroundColor(expenseViewModel.tabName == tab ? .white : .black)
                    .opacity(expenseViewModel.tabName == tab ? 1 : 0.7)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                    .background {
                        if expenseViewModel.tabName == tab {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(
                                    LinearGradient(colors: [
                                        Color("Gradient1"),
                                        Color("Gradient2"),
                                        Color("Gradient1")], startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation{expenseViewModel.tabName = tab}
                    }
            }
        }
        .padding(5)
        .background {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.white)
        }
    }
    //step 2 create a filtered view for when tapping the button this will overlay a calendar view
    @ViewBuilder
    func FilterView() -> some View {
        ZStack {
            Color.black
                .opacity(expenseViewModel.showFilterView ? 0.25 : 0)
                .ignoresSafeArea()
            if expenseViewModel.showFilterView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Start Date")
                        .font(.caption.bold())
                        .opacity(0.7)
                    
                    DatePicker("", selection: $expenseViewModel.startDate, in: Date.distantPast...Date(), displayedComponents: [.date])
                        .labelsHidden()
                        .datePickerStyle(.compact)
                    
                    Text("End Date")
                        .font(.caption.bold())
                        .opacity(0.7)
                        .padding(.top, 10)
                    
                    DatePicker("", selection: $expenseViewModel.endDate, in: Date.distantPast...Date(), displayedComponents: [.date])
                        .labelsHidden()
                        .datePickerStyle(.compact)
                }
                //step 3 add rounded rect to display in
                .padding(60)
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.white)
                    //step 4 add a close button
                    .overlay(alignment: .topTrailing, content: {
                        Button {
                            expenseViewModel.showFilterView = false
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title3)
                                .foregroundColor(.black)
                                .padding(5)
                        }
                    }).padding()
                }
            }
        }
        .animation(.easeIn, value: expenseViewModel.showFilterView)
    }
}

struct FiltereredDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FiltereredDetailView().environmentObject(ExpenseViewModel())
    }
}
