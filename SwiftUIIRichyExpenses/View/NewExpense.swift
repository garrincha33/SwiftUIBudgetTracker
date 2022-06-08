//
//  NewExpense.swift
//  SwiftUIIRichyExpenses
//
//  Created by Richard Price on 07/06/2022.
//

import SwiftUI
//step 5 create a new expense view
struct NewExpense: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    //step 6 enviroment variable
    @Environment(\.self) var env
    
    var body: some View {
        
        //step 7 create a double vstack
        VStack {
            VStack(spacing: 15) {
                //step 9
                Text("Add Expenses")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .opacity(0.5)
                
                //step 10 currency symbol custom textfield
                if let symbol =
                    expenseViewModel.convertNumberToPrice(value: 0).first {
                    TextField("0", text: $expenseViewModel.amount)
                        .font(.system(size: 35))
                        .foregroundColor(Color("Gradient2"))
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .background {
                            Text(expenseViewModel.amount == "" ? "0" : expenseViewModel.amount)
                                .font(.system(size: 35))
                                .opacity(0)
                                .overlay(alignment: .leading) {
                                    Text(String(symbol))
                                        .opacity(0.5)
                                        .offset(x: -15, y: 5)
                                }
                        }
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background {
                            Capsule().fill(.white)
                        }
                        .padding(.horizontal, 20)
                        .padding(.top)
                }
                //step 11 custom lables, create one then copy and adjust accordingly
                //MARK: - Expense Type
                Label {
                    TextField("Test", text: $expenseViewModel.remark)
                } icon: {
                    Image(systemName: "list.bullet.rectangle.portrait.fill")
                        .font(.title3)
                        .foregroundColor(Color("Gray"))
                        
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 15)
                .background {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.white)
                }.padding(.top, 25)
                //MARK: - CheckBoxes
                Label {
                    //step 13
                    CustomCheckBoxes()
                } icon: {
                    Image(systemName: "arrow.up.arrow.down")
                        .font(.title3)
                        .foregroundColor(Color("Gray"))
                        
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 15)
                .background {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.white)
                }.padding(.top, 5)
                //MARK: - Calendar TextField
                Label {
                    DatePicker.init("", selection: $expenseViewModel.date, in: Date.distantPast...Date(), displayedComponents: [.date])
                        .datePickerStyle(.compact)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .labelsHidden()
                } icon: {
                    Image(systemName: "calendar")
                        .font(.title3)
                        .foregroundColor(Color("Gray"))
                        
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 15)
                .background {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.white)
                }.padding(.top, 5)
            }
            .frame(maxHeight: .infinity, alignment: .center)
            //step 15 add a save button (for now test data but this needs to save to core data managed context)
            Button {
                
            } label: {
                Text("Save")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.vertical, 15)
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(
                                LinearGradient(colors: [
                                Color("Gradient1"),
                                Color("Gradient2"),
                                Color("Gradient3"),
                                ], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
            }
            //step 16 add a disabled option until selection
            .disabled(expenseViewModel.remark == "" || expenseViewModel.type == .all || expenseViewModel.amount == "")
            .opacity(expenseViewModel.remark == "" || expenseViewModel.type == .all || expenseViewModel.amount == "" ? 0.6 : 1)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        //step 8 add an X which will be the close button and set background
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color("BG").ignoresSafeArea()
        }
        .overlay(alignment: .topTrailing) {
            Button {
                env.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(.black)
                    .opacity(0.7)
                    
            }.padding()
        }
    }
    //step 12 create a view builder for the custom check box
    @ViewBuilder
    func CustomCheckBoxes()-> some View {
        HStack(spacing: 10) {
            ForEach([ExpenseType.income, ExpenseType.expense], id: \.self) { type in
                ZStack {
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(.black, lineWidth: 2)
                        .opacity(0.5)
                        .frame(width: 20, height: 20)
                    
                    //step 13 add checkmark
                    if expenseViewModel.type == type {
                        Image(systemName: "checkmark")
                            .font(.caption.bold())
                            .foregroundColor(Color("Green"))
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    expenseViewModel.type = type
                }
                //step 14 add in the type for the text
                Text(type.rawValue.capitalized)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .opacity(0.7)
                    .padding(.trailing, 10)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 20)
    }
}

struct NewExpense_Previews: PreviewProvider {
    static var previews: some View {
        NewExpense().environmentObject(ExpenseViewModel())
    }
}
