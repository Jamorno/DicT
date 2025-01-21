//
//  DicViewModel.swift
//  DicT
//
//  Created by Jamorn Suttipong on 21/1/2568 BE.
//

import Foundation

class DicViewModel: ObservableObject {
    
    @Published var word: String = ""
    @Published var meaning: String = ""
    @Published var example: String = ""
    @Published var searchWord: String = ""
    
    private let service = DicService()
    
    func fetchWord() {
        service.fetchWord(word: searchWord) { result in
            guard let result = result else {
                print("DEBUG: Failed to fetch word")
                return
            }
            
            DispatchQueue.main.async {
                self.word = result.word
                self.meaning = result.meanings.first?.definitions.first?.definition ?? "No meaning available"
                self.example = result.meanings.first?.definitions.first?.example ?? "No example available"
            }
        }
    }
    
    func clearWord() {
        word = ""
        meaning = ""
        example = ""
        searchWord = ""
    }
}
