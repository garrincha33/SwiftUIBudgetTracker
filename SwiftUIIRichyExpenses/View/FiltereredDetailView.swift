//
//  FiltereredDetailView.swift
//  SwiftUIIRichyExpenses
//
//  Created by Richard Price on 06/06/2022.
//

import SwiftUI
//step 1 create a detail view for filtered results

struct FiltereredDetailView: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    @Environment(\.self) var env
    
    var body: some View {
        //step 2 create a scrollview
        ScrollView(.vertical, showsIndicators: false) {
            //step 3 copy top hstack from homeview and adjust as needed for the appearance of this view
            VStack(spacing: 15) {
                HStack(spacing: 15) {
                    //step 4 create a back button (copy image from below and adjust) remove overlay
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
                    //step 1 remove button and cut the image and create a navigationlink, put image inside lable
                    Button {
                        
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.gray)
                            .frame(width: 40, height: 40)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                    }
                }
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
