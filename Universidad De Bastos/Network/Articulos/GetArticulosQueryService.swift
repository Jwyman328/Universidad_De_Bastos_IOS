//
//  GetArticulosQueryService.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/8/21.
//

import Foundation

class GetArticulosQueryService {
    init(setArticulosData: @escaping ([ArticuloModel]?) -> Void){
        self.setArticulosViewModelData = setArticulosData
    }
    
    let setArticulosViewModelData:([ArticuloModel]?) -> Void
    
    func handleGetArticulosSucces(articuloData:[ArticuloModel]?){
        self.setArticulosViewModelData(articuloData)
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
            let jsonValue = try JSONDecoder().decode([ArticuloModel].self, from:data!)
            DispatchQueue.main.async {
                self.handleGetArticulosSucces(articuloData: jsonValue)
            }
    //        return
        } catch {
            print("JSON error: \(error.localizedDescription)", error)
        }
    }
    
    func getArticlos(){
        var getArticulosRequest = Networking.setGetRequest(urlRawExtension: "article/")
        let responseDataTask: Void = URLSession.shared.dataTask(with: getArticulosRequest, completionHandler: self.handleResponse).resume()
    }
}
