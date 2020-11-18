//
//  Model.swift
//  Onboadrding Practice
//
//  Created by Tariq Almazyad on 11/8/20.
//

import SwiftUI


struct OnboardingViewModel: Hashable, Identifiable {
    let id = UUID().uuidString
    let backgroundColor: Color
    let mainImageName: String
    let color: Color
    let detailViewModel: [DetailViewModel]
}


let  viewModel = [
    
    
    OnboardingViewModel(backgroundColor: .black,
                        mainImageName: "person", color: Color(#colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)),
                        detailViewModel: sampleViewModel0),
    
    OnboardingViewModel(backgroundColor: .black,
                        mainImageName: "person", color: Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)),
                        detailViewModel: sampleViewModel0),
    
    OnboardingViewModel(backgroundColor: .black,
                        mainImageName: "person", color: Color(#colorLiteral(red: 0.5292352438, green: 0.524165988, blue: 0.5945872068, alpha: 1)),
                        detailViewModel: sampleViewModel0),
    
    OnboardingViewModel(backgroundColor: .black,
                        mainImageName: "person", color: Color(#colorLiteral(red: 0.686809957, green: 0.3218126893, blue: 0.8696811795, alpha: 1)),
                        detailViewModel: sampleViewModel0),
    
    OnboardingViewModel(backgroundColor: .black,
                        mainImageName: "car", color: Color(#colorLiteral(red: 0.5571830869, green: 0.5573602915, blue: 0.5772089362, alpha: 1)),
                        detailViewModel: sampleViewModel1),
]

struct DetailViewModel: Hashable, Identifiable {
    let id = UUID().uuidString
    let imageName: String
    let titleText: String
    let detailText: String
    
}

let sampleViewModel0 =   [
    DetailViewModel(imageName: "slider.horizontal.below.rectangle",
                    titleText: "Lorem Ipsum",
                    detailText: "Lorem Ipsum is simply dummy text of the printing and typesetting\n Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
    
    DetailViewModel(imageName: "doc.text.fill",
                    titleText: "Contrary to popular",
                    detailText: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin\nliterature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professo"),
    
    DetailViewModel(imageName: "archivebox.fill",
                    titleText: "he standard chunk",
                    detailText: "The standard chunk of Lorem Ipsum used since the 1500s\n is reproduced below for those interested. Sections 1.10.32 and 1.10.33\n from de Finibus Bonorum et Maloru"),
]

let sampleViewModel1 = [
    DetailViewModel(imageName: "square.and.arrow.up.fill",
                    titleText: "Lorem Ipsum",
                    detailText: "Lorem Ipsum is simply dummy text of the printing and typesetting\n Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
    
    DetailViewModel(imageName: "folder.badge.questionmark",
                    titleText: "Contrary to popular",
                    detailText: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin\nliterature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professo"),
    
    DetailViewModel(imageName: "externaldrive.fill",
                    titleText: "he standard chunk",
                    detailText: "The standard chunk of Lorem Ipsum used since the 1500s\n is reproduced below for those interested. Sections 1.10.32 and 1.10.33\n from de Finibus Bonorum et Maloru"),
]







