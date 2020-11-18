//
//  ButtonsPageView.swift
//  Onboadrding Practice
//
//  Created by Tariq Almazyad on 11/8/20.
//

import SwiftUI

struct ButtonsHStackView: View {
    @Binding var selectedTab: Int
    var body: some View {
        Spacer()
        HStack {
            Button {
                withAnimation(.spring()) {
                    selectedTab -= 1
                }
            } label: {
                Text("Previous")
            }
            .frame(width: 80, height: 80)
            .background(selectedTab != 0 ? Color.purple.clipShape(Circle()) : Color.gray.clipShape(Circle()))
            .foregroundColor(.white)
            .disabled(selectedTab == 0)
            
            Spacer()
            
            Button {
                withAnimation(.spring()) {
                    selectedTab += 1
                }
            } label: {
                Text("Next")
            }
            .frame(width: 80, height: 80)
            .background(selectedTab != (viewModel.endIndex - 1) ? Color.purple.clipShape(Circle()) : Color.gray.clipShape(Circle()))
            .foregroundColor(.white)
            .disabled(selectedTab == (viewModel.endIndex - 1))
        }
    }
}

struct ButtonViews: View {
    @State var selectedTab: Int = 0
    var body: some View{
        ButtonsHStackView(selectedTab: $selectedTab)
    }
}

struct ButtonViews_Preview: PreviewProvider {
    static var previews: some View {
        ZStack{
            ButtonViews()
        }
        .preferredColorScheme(.dark)
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

