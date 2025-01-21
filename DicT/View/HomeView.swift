//
//  HomeView.swift
//  DicT
//
//  Created by Jamorn Suttipong on 21/1/2568 BE.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel = DicViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading) {
                Text(viewModel.word)
                    .font(.title)
                Text(viewModel.meaning)
                    .font(.headline)
                    .padding(.bottom)
                Text(viewModel.example)
                    .font(.subheadline)
            }
            .foregroundStyle(.black)
            
            Spacer()
            
            HStack {
                TextField("Search word", text: $viewModel.searchWord)
                    .font(.headline)
                    .foregroundStyle(.black)
                
                Spacer()
                
                //button to fetch word
                Button {
                    if viewModel.word == "" {
                        viewModel.fetchWord()
                    } else {
                        viewModel.clearWord()
                    }
                } label: {
                    Image(systemName: viewModel.word != "" ? "xmark" : "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.pink)
                        .frame(width: 24, height: 24)
                        .padding()
                        .background(.black)
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
