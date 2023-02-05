//
//  MovieEndpoint.swift
//  Techno_Task
//
//  Created by Ahmed Fathy on 05/02/2023.
//

import Foundation
import AFNetwork

enum MovieService {
    case loadMovie
}

extension MovieService: Endpoint {
    var baseURL: URL {
        return URL(string: "https://imdb-api.com")!
    }
    var path: String {
        return "/API/Top250TVs/k_vizmc9cr"
    }
    var method: AFNetwork.HTTPMethod {
        return .get
    }
    var task: AFNetwork.Task {
        return .requestPlain
    }
    var headers: AFNetwork.Headers? {
        return nil
    }
    var parametersEncoding: AFNetwork.ParametersEncoding {
        return .json
    }
}

