//
//  getVideos.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 7/25/21.
//

import Foundation
// example token
//eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE1OTYzMDMwMDF9.xNOY3NJKDO-u1UG6Ulse7c0T51PtJ0fwoJWb-0B4gFE

class QueryService {
    
    init(handleGetVideoSuccess:@escaping ([VideoModel]?) -> Void) {
        self.handleGetVideosSuccess = handleGetVideoSuccess
    }
    let handleGetVideosSuccess: ([VideoModel]?) -> Void
    
    
    func getVideos(){
        var getVideoUri = "https://universidad-de-bastos.herokuapp.com/videos/"
        var token = "JWT eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE1OTYzMDMwMDF9.xNOY3NJKDO-u1UG6Ulse7c0T51PtJ0fwoJWb-0B4gFE"
        var getvideosUrl = URL(string: getVideoUri)!
        var getVideosRequest = URLRequest(url: getvideosUrl)
        getVideosRequest.httpMethod = "GET"
        getVideosRequest.addValue(token, forHTTPHeaderField: "Authorization")
        getVideosRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        getVideosRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        

        
        let responseDataTask: Void = URLSession.shared.dataTask(with: getVideosRequest, completionHandler: self.handleResponse).resume()
    }

    func handleResponse(data:Data?, response:URLResponse?, error:Error?) -> Void {
        
    //    print("response", response,"data", data!)
        
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
            let jsonValue = try JSONDecoder().decode([VideoModel].self, from:data!)
//            let allVideos = try JSONSerialization.jsonObject(with: data!, options: [])
//            let videoModelVideos =  allVideos as? [VideoModel]
//
            print("all video", jsonValue[0])
            DispatchQueue.main.async {
                self.handleGetVideosSuccess(jsonValue)
            }
    //        return
        } catch {
            print("JSON error: \(error.localizedDescription)", error)
        }
    }

}

