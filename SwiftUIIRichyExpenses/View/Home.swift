//
//  Home.swift
//  SwiftUIIRichyExpenses
//
//  Created by Richard Price on 23/05/2022.
//

import SwiftUI
//step 2 create a Home view to with and pass this into content view
struct Home: View {
    
    //step 4 create an instance of the view model
    @StateObject private var expenseViewModel: ExpenseViewModel = .init()
    var body: some View {
        //step 5 create a scrollview then wrap inside welcome
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 12) {
                // MARK: Top Hstack
                HStack(spacing: 15) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Welcome")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        //step 7 sub heading
                        Text("iRichy")
                            .font(.title2.bold())
                        
                        
                        
                    }
                    //step 6 add a frame with padding
                    .frame(maxWidth: .infinity, alignment: .leading)
                    //step 8 - button to right
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
                //step 9 ExpenseCardView()
                ExpenseCardView()
            }.padding()
            // MARK: background color of scroll view
        }.background {
            Color("BG").ignoresSafeArea()
        }
    }
    
    
    //step 10 - create card view with a viewBuilder
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
            
        }.frame(height: 220)
            .padding(.top)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
