//
//  ContentView.swift
//  Onboadrding Practice
//
//  Created by Tariq Almazyad on 11/7/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 0
    
    
    var body: some View {
        ZStack {
            
            TabView(selection: $selectedTab){
                ForEach(viewModel, id: \.self){ viewModel in

                    VStack(){
                        Image(systemName: viewModel.mainImageName)
                            .resizable()
                            .foregroundColor(Color(#colorLiteral(red: 0.3677974939, green: 0.3611263037, blue: 0.9022430182, alpha: 1)))
                            .frame(width: 100, height: 100)
                        ForEach(viewModel.detailViewModel, id: \.id){ detailViewModel in
                            DetailsHStackView(detailViewModel: detailViewModel)
                        }
                    }.tag(viewModel.tag)
                    
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            
            VStack {
                ButtonsPageView(selectedTab: $selectedTab)
                .padding()
            }
        }.background(viewModel[selectedTab].color).ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}


struct DetailsHStackView: View {
    let detailViewModel: DetailViewModel
    var body: some View {
        HStack(alignment: .top){
            Image(systemName: detailViewModel.imageName)
                .font(.largeTitle)
                .foregroundColor(Color(#colorLiteral(red: 0.3677974939, green: 0.3611263037, blue: 0.9022430182, alpha: 1)))
                .padding()
            VStack(alignment: .leading){
                Text(detailViewModel.titleText)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .accessibility(addTraits: .isHeader)
                Text(detailViewModel.detailText)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
        }.padding(.all)
    }
}

struct ButtonsPageView: View {
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
            .background(selectedTab != viewModel.last?.tag ? Color.purple.clipShape(Circle()) : Color.gray.clipShape(Circle()))
            .foregroundColor(.white)
            .disabled(selectedTab == viewModel.last?.tag)
        }
    }
}


struct OnboardingViewModel: Hashable, Identifiable {
    let id = UUID().uuidString
    let backgroundColor: Color
    let mainImageName: String
    let tag: Int
    let color: Color
    let detailViewModel: [DetailViewModel]
}

struct DetailViewModel: Hashable, Identifiable {
    let id = UUID().uuidString
    let imageName: String
    let titleText: String
    let detailText: String
    
}

let  viewModel = [
    OnboardingViewModel(backgroundColor: .black,
                        mainImageName: "person", tag: 0, color: Color(#colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)),
                        detailViewModel: sampleViewModel),
    
    OnboardingViewModel(backgroundColor: .black,
                        mainImageName: "car", tag: 1, color: Color(#colorLiteral(red: 0.2588235294, green: 0.2588235294, blue: 0.2588235294, alpha: 1)),
                        detailViewModel: sampleViewModel),
    
    OnboardingViewModel(backgroundColor: .black,
                        mainImageName: "star", tag: 2, color: Color(#colorLiteral(red: 0.3882352941, green: 0.3882352941, blue: 0.3882352941, alpha: 1)),
                        detailViewModel: sampleViewModel),
    
    OnboardingViewModel(backgroundColor: .black,
                        mainImageName: "star", tag: 3, color: Color.secondary,
                        detailViewModel: sampleViewModel),
    
    OnboardingViewModel(backgroundColor: .black,
                        mainImageName: "star", tag: 4, color: Color.primary,
                        detailViewModel: sampleViewModel),
    
    OnboardingViewModel(backgroundColor: .black,
                        mainImageName: "star", tag: 5, color: Color(#colorLiteral(red: 0.9725490196, green: 0.5019607843, blue: 0.2823529412, alpha: 1)),
                        detailViewModel: sampleViewModel)
]

let sampleViewModel = [
    DetailViewModel(imageName: "slider.horizontal.below.rectangle", titleText: "Lorem Ipsum",
                    detailText: "Lorem Ipsum is simply dummy text of the printing and typesetting\n Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
    
    DetailViewModel(imageName: "pencil", titleText: "Contrary to popular",
                    detailText: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin\nliterature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professo"),
    
    DetailViewModel(imageName: "bell", titleText: "he standard chunk",
                    detailText: "The standard chunk of Lorem Ipsum used since the 1500s\n is reproduced below for those interested. Sections 1.10.32 and 1.10.33\n from de Finibus Bonorum et Maloru"),
]


struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}



extension View {
    
    /// custom function for cornerRadius to give specific value in how to curve the corner
    func cornerRadius(corners: UIRectCorner, _ radius: CGFloat) -> some View {
        clipShape(
            RoundedCorner(radius: radius, corners: corners)
        )
    }
    
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
    
}

/// to dismiss keyboard when tap outside of textfielf
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

/// to load the destination lazily without making unnecessary API request
struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}

/*
 
 ///     "Mac"
 ///     "iPhone 7"
 ///     "iPhone 7 Plus"
 ///     "iPhone 8"
 ///     "iPhone 8 Plus"
 ///     "iPhone SE"
 ///     "iPhone X"
 ///     "iPhone Xs"
 ///     "iPhone Xs Max"
 ///     "iPhone Xʀ"
 ///     "iPad mini 4"
 ///     "iPad Air 2"
 ///     "iPad Pro (9.7-inch)"
 ///     "iPad Pro (12.9-inch)"
 ///     "iPad (5th generation)"
 ///     "iPad Pro (12.9-inch) (2nd generation)"
 ///     "iPad Pro (10.5-inch)"
 ///     "iPad (6th generation)"
 ///     "iPad Pro (11-inch)"
 ///     "iPad Pro (12.9-inch) (3rd generation)"
 ///     "iPad mini (5th generation)"
 ///     "iPad Air (3rd generation)"
 ///     "Apple TV"
 ///     "Apple TV 4K"
 ///     "Apple TV 4K (at 1080p)"
 ///     "Apple Watch Series 2 - 38mm"
 ///     "Apple Watch Series 2 - 42mm"
 ///     "Apple Watch Series 3 - 38mm"
 ///     "Apple Watch Series 3 - 42mm"
 ///     "Apple Watch Series 4 - 40mm"
 ///     "Apple Watch Series 4 - 44mm"
 
 */
