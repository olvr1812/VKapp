//
//  NetworkFuncs.swift
//  VKapp
//
//  Created by Оливер Салихов on 27.03.2022.
//

import Foundation

final class NetworkFuncs {
    
    lazy var session = URLSession(configuration: configuration)
    let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10.0
        return config
    }()
    
    private var urlComp: URLComponents = {
       var components = URLComponents()
        components.scheme = "https"
        components.host = "api.vk.com"
        return components
    }()
    
    func getFriends(complition: @escaping(Result<Friends, Error>) -> Void) {
        var urlFriends = urlComp
        urlFriends.path = "/method/friends.get"
        urlFriends.queryItems = [
            URLQueryItem(name: "user_id", value: "\(Session.session.userId)"),
            URLQueryItem(name: "order", value: "name"),
            URLQueryItem(name: "fields", value: "sex,photo_200"),
            URLQueryItem(name: "access_token", value: "\(Session.session.token)"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard let friendsRequest = urlFriends.url else { return }
        var request = URLRequest(url: friendsRequest)
        
        request.httpMethod = "POST"
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard
                error == nil,
                  let data = data
            else { return }
            do {
                let friendsResponse = try JSONDecoder().decode(FriendsResponse.self, from: data)
                complition(.success(friendsResponse.response))
            } catch {
                complition(.failure(error))
            }
        }
        task.resume()
    }
    
    func getGroups(complition: @escaping(Result<Groups, Error>) -> Void) {
        var urlGroups = urlComp
        urlGroups.path = "/method/groups.get"
        urlGroups.queryItems = [
            URLQueryItem(name: "user_id", value: "\(Session.session.userId)"),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "fields", value: "status"),
            URLQueryItem(name: "access_token", value: "\(Session.session.token)"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard let isUrl = urlGroups.url else { return }
        var request = URLRequest(url: isUrl)
        print(request)
        request.httpMethod = "POST"
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard
                error == nil,
                  let data = data
            else { return }
            do {
                let groupsResponse = try JSONDecoder().decode(GroupsResponse.self, from: data)
                complition(.success(groupsResponse.response))
                print(groupsResponse)
            } catch {
                complition(.failure(error))
                print("Error")
            }
        }
        task.resume()
    }
    
    func getUserPhoto(complition: @escaping(Result<Photos, Error>) -> Void) {
        var urlPhoto = urlComp
        urlPhoto.path = "/method/photos.get"
        urlPhoto.queryItems = [URLQueryItem(name: "access_token", value: Session.session.token),
                               URLQueryItem(name: "owner_id", value: "\(Session.session.userId)"),
                               URLQueryItem(name: "album_id", value: "profile"),
                               URLQueryItem(name: "extended", value: "1"),
                               URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard let urlAlbum = urlPhoto.url else { return }
        
        print(urlAlbum)
        
        var request = URLRequest(url: urlAlbum)
        
        request.httpMethod = "POST"
        
        print(request)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard
                error == nil,
                let data = data
            else { return }
            do {
                let albumResponse = try JSONDecoder().decode(PhotoResponse.self, from: data)
                complition(.success(albumResponse.response))
            } catch {
                complition(.failure(error))
            }
        }
        task.resume()
    }
    
}


