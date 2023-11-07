//
//  FeedView.swift
//  play
//
//  Created by Jai Nijhawan on 07/11/23.
//

import SwiftUI

struct FeedView: View {
    @StateObject var vm: FeedViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    HStack {
                        Image("logo")
                            .padding(.leading)
                        
                        Spacer()
                        
                        TopButton(imageName: "HandHeart") {
                            print("HandHeart Tapped")
                        }
                        TopButton(imageName: "Bell") {
                            print("Bell Tapped")
                        }
                        TopButton(imageName: "User") {
                            print("User Tapped")
                        }
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(vm.categoryDataSournce,
                                    id: \.title) { category in
                                CategoryView(category: category,
                                             isSelected: category.isSelected,
                                             onTap: { category in
                                    vm.updateCategory(category: category)
                                })
                                .padding(.vertical, 4.0)
                            }
                        }
                    }
                    HStack {
                        Text("Must read articles")
                            .padding([.top, .leading], 10.0)
                            .foregroundStyle(.gray)
                            .font(.system(size: 22))
                            .bold()
                        Spacer()
                        Button(action: {
                            print("View All Tapped")
                        }, label: {
                            Text("View All")
                                .padding([.top, .trailing], 10.0)
                                .foregroundStyle(.white)
                                .font(.system(size: 16))
                                .bold()
                        })
                    }
                    
                    ForEach(vm.feedData, id: \.self) { text in
                        FeedViewRow()
                            
                    }

                    Spacer()
                }
            }
        }
    }
}

extension FeedView {
    struct TopButton: View {
        var imageName: String
        var onTap: (() -> Void)
        var body: some View {
            Button {
                onTap()
            } label: {
                Image(imageName)
            }
            .padding()
            .background(Color.white.opacity(0.2))
            .clipShape(Circle())
        }
    }
}

extension FeedView {
    struct CategoryView: View {
        var category: CategoryDataSournce
        var isSelected: Bool
        var onTap: ((CategoryDataSournce) -> Void)
        let selectedColor = Color(uiColor: UIColor(red: 1.00,
                                                   green: 0.73,
                                                   blue: 0.96,
                                                   alpha: 1.00))
        
        var body: some View {
            Button(action: {
                onTap(category)
            }, label: {
                Text(category.title)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .foregroundColor(isSelected ? Color.black : Color.white)
                    .background(isSelected ? selectedColor : Color.black)
                    .font(.custom("Brule-Bold", size: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.white, lineWidth: 3)
                    )
                    .cornerRadius(20)
                    .rotationEffect(.degrees(isSelected ? -4 : 0))
            })
            
        }
    }
}



#Preview {
    FeedView(vm: FeedViewModel())
}
