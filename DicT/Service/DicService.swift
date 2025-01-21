//
//  DicService.swift
//  DicT
//
//  Created by Jamorn Suttipong on 21/1/2568 BE.
//

import Foundation

class DicService {
    
    func fetchWord(word: String, compleition: @escaping (DicModel?) -> Void) {
        let urlString = "https://api.dictionaryapi.dev/api/v2/entries/en/\(word)"
        guard let url = URL(string: urlString) else {
            compleition(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                compleition(nil)
                return
            }
            
            guard let data = data else {
                print("No data recived")
                compleition(nil)
                return
            }
            
            do {
                let word = try JSONDecoder().decode([DicModel].self, from: data)
                compleition(word.first)
            } catch {
                print("DEBUG: Error decodeing JSON: \(error.localizedDescription)")
                compleition(nil)
            }
        }
        .resume()
    }
}
