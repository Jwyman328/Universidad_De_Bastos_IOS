//
//  GetLibrosQueryService.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/14/21.
//

import Foundation

class GetLibrosQueryService {
    init(setLibrosData: @escaping ([LibroModel]?) -> Void){
        self.setLibrosViewModelData = setLibrosData
    }
    
    let setLibrosViewModelData:([LibroModel]?) -> Void
    
    func handleGetLibrosSucces(librosData:[LibroModel]?){
        self.setLibrosViewModelData(librosData)
    }
    
    func handleResponse(data: Data?, response:URLResponse?, error:Error?) -> Void{
        if ((error) != nil){
            print("recieved error", error!)
            return
        }
        
        //check if 200 response
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else{
            //do this
            print("httpRespone is nil", response!)
            return
        }
        
        guard httpResponse.mimeType == "application/json" else{
            print("wrong mime type")
            return
        }
        
        do {
            let jsonValue = try JSONDecoder().decode([LibroModel].self, from:data!)
            DispatchQueue.main.async {
                self.handleGetLibrosSucces(librosData: jsonValue)
            }
    //        return
        } catch {
            print("JSON error: \(error.localizedDescription)", error)
        }
    }
    
    func getLibros(){
        let getLibrosRequest = Networking.setGetRequest(urlRawExtension: "books/")
        let responseDataTask: Void = URLSession.shared.dataTask(with: getLibrosRequest, completionHandler: self.handleResponse).resume()
    }
}
