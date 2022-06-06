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
                        
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.gray)
                            .frame(width: 40, height: 40)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                    }
                }
                //MARK: Expsense Card
            }
            .padding()
        }
        .navigationBarHidden(true)
        .background {
            Color("BG").ignoresSafeArea()
        }
    }
}

struct FiltereredDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FiltereredDetailView().environmentObject(ExpenseViewModel())
    }
}
