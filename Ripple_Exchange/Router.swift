//
//  ExchangeClient.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/22/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    case createUser(parameters: Parameters)
    case newAccount(parameters: Parameters)
    case createCustomer(parameters: Parameters)
    case signIn(parameters: Parameters)
    case addInbound(parameters: Parameters)
    case createOutBound(parameters: Parameters)
    case charge(parameters: Parameters)
    case withdrawInbound(parameters: Parameters)
    case withdrawOutbound(parameters: Parameters)
    case deposit(parameters: Parameters)
    case transaction(parameters: Parameters)
    case exchangeTransaction(parameters: Parameters)
    case accountInfo(parameters: Parameters)
    case rippleInfo(parameters: Parameters)
    case addSource(parameters: Parameters)
    case updateSource(parameters: Parameters)
    case getSource(parameters: Parameters)
    case deletetSource(parameters: Parameters)
    case customerCards(parameters: Parameters)
    case accountBanks(parameters: Parameters)
    case customerBanks(parameters: Parameters)
    case accountCards(parameters: Parameters)
    case newCard(parameters: Parameters)
    case payout(parameters: Parameters)
    case setPayout(parameters: Parameters)
    case verifyToken(parameters: Parameters)
    case exist(parameters: Parameters)
    case instantPayout(parameters: Parameters)
    
    static let baseURLString = "https://ripple-exchange-app.herokuapp.com"
    static var token = ""
    
    var method: HTTPMethod {
        switch self {
            case .createUser:
                return .post
            case .newAccount:
                return .post
            case .createCustomer:
                return .post
            case .signIn:
                return .post
            case .addInbound:
                return .post
            case .createOutBound:
                return .post
            case .withdrawInbound:
                return .post
            case .withdrawOutbound:
                return .post
            case .deposit:
                return .get
            case .transaction:
                return .get
            case .exchangeTransaction:
                return .post
            case .accountInfo:
                return .get
            case .rippleInfo:
                return .get
            case .addSource:
                return .post
            case .updateSource:
                return .post
            case .getSource:
                return .post
            case .deletetSource:
                return .post
            case .customerCards:
                return .post
            case .accountBanks:
                return .post
            case .customerBanks:
                return .post
            case .accountCards:
                return .post
            case .newCard:
                return .post
            case .payout:
                return .post
            case .instantPayout:
                return .post
            case .setPayout:
                return .post
            case .verifyToken:
                return .get
            case .exist:
                return .post
            default:
                return .get
        }
    }
    
    var path: String {
        switch self {
            case .createUser:
                return "/createUser"
            case .newAccount:
                return "/newAccount"
            case .createCustomer:
                return "/createCustomer"
            case .signIn:
                return "/signin"
            case .addInbound:
                return "/addInbound"
            case .createOutBound:
                return "/createOutBound"
            case .withdrawInbound:
                return "/withdrawInbound"
            case .withdrawOutbound:
                return "/withdrawOutbound"
            case .deposit:
                return "/deposit"
            case .transaction:
                return "/transaction"
            case .exchangeTransaction:
                return "/exchangeTransaction"
            case .accountInfo:
                return "/accountInfo"
            case .rippleInfo:
                return "/rippleInfo"
            case .addSource:
                return "/addSource"
            case .updateSource:
                return "/updateSource"
            case .getSource:
                return "/getSource"
            case .deletetSource:
                return "/deletetSource"
            case .customerCards:
                return "/customerCards"
            case .accountBanks:
                return "/accountBanks"
            case .customerBanks:
                return "/customerBanks"
            case .accountCards:
                return "/accountCards"
            case .newCard:
                return "/newCard"
            case .payout:
                return "/payout"
            case .instantPayout:
                return "/instantPayout"
            case .setPayout:
                return "/setPayout"
            case .verifyToken:
                return "/verifyToken"
            case .exist:
                return "/exist"
            default:
                return ""
        }
    }
    // MARK: URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url = try Router.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
            case .createUser(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .newAccount(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .createCustomer(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .signIn(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .addInbound(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .createOutBound(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .withdrawInbound(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .withdrawOutbound(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .deposit(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .transaction(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .exchangeTransaction(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .accountInfo(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .rippleInfo(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .addSource(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .updateSource(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .getSource(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .deletetSource(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .customerCards(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .accountBanks(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .customerBanks(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .accountCards(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .newCard(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .payout(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .instantPayout(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .setPayout(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .verifyToken(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .exist(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        
            default:
                break
        }
        //urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue(Router.token, forHTTPHeaderField: "Authorization")
        return urlRequest
    }
}
