//
//  ContentView.swift
//  Onboadrding Practice
//
//  Created by Tariq Almazyad on 11/7/20.
//

import SwiftUI


struct ContentView: View {
    
    // to track the paging circle index
    @State private var selectedTab = 0
    // to change the bg color
    @State private var backgroundColor = Color.clear
    
    var body: some View {
        // we made the zstack to make the bottons go above the TabView
        ZStack {
            // we pass in the page index $selectedTab
            TabView(selection: $selectedTab){
                ForEach(viewModel, id: \.self){ item in
                    VStack(){
                        Image(systemName: item.mainImageName)
                            .resizable()
                            .foregroundColor(Color(#colorLiteral(red: 0.3677974939, green: 0.3611263037, blue: 0.9022430182, alpha: 1)))
                            .frame(width: 100, height: 100)
                        ForEach(item.detailViewModel, id: \.id){ detailViewModel in
                            DetailsHStackView(detailViewModel: detailViewModel)
                        }
//                        Print(selectedTab)
                    }.tag(viewModel.firstIndex(of: item) ?? 0) // <<-- it is important to update current index page
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            VStack {
                ButtonsHStackView(selectedTab: $selectedTab)
                    .padding()
            }
        }.background(backgroundColor)
        .onChange(of: selectedTab) { _ in
            withAnimation{
                backgroundColor = viewModel[selectedTab].color
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
