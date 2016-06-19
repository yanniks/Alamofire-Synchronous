//
//  Alamofire+Synchronous.swift
//  Alamofire-Synchronous
//
//  Created by Luda Zhuang on 15/11/8.
//  Copyright © 2015年 Luda Zhuang. All rights reserved.
//

import Foundation
import Alamofire

extension Request {
    
    
    /**
     Wait for the request to finish then return the response value.
     
     - returns: The response.
     */
    @warn_unused_result public func response() -> (request: URLRequest?, response: HTTPURLResponse?, data: Data?, error: NSError?) {
        
        let semaphore = DispatchSemaphore(value: 0)
        var result: (request: URLRequest?, response: HTTPURLResponse?, data: Data?, error: NSError?)!
        
        self.response(queue: DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault), completionHandler: { request, response, data, error in
            
            result = (
                request: request,
                response: response,
                data: data,
                error: error
            )
            
            semaphore.signal()
        })
        
        semaphore.wait(timeout: DispatchTime.distantFuture)
        
        return result
    }
    
    
    /**
     Wait for the request to finish then return the response value.
     
     - returns: The response.
     */
    @warn_unused_result public func responseData() -> Response<Data, NSError> {
        
        let semaphore = DispatchSemaphore(value: 0)
        
        var result: Response<Data, NSError>!
        
        self.responseData(queue: DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault), completionHandler: { response in
            
            result = response
            semaphore.signal()
            
        })
        
        semaphore.wait(timeout: DispatchTime.distantFuture)
        
        return result
    }
    
    
    /**
     Wait for the request to finish then return the response value.
     
     - parameter options: The JSON serialization reading options. `.AllowFragments` by default.
     
     - returns: The response.
     */
    @warn_unused_result public func responseJSON(options: JSONSerialization.ReadingOptions = .allowFragments) -> Response<AnyObject, NSError> {
        
        let semaphore = DispatchSemaphore(value: 0)
        
        var result: Response<AnyObject, NSError>!
        
        self.responseJSON(queue: DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault), options: options, completionHandler: {response in
            
            result = response
            semaphore.signal()
            
        })
        
        semaphore.wait(timeout: DispatchTime.distantFuture)
        
        return result
    }
    
    
    /**
     Wait for the request to finish then return the response value.
     
     - parameter encoding: The string encoding. If `nil`, the string encoding will be determined from the
     server response, falling back to the default HTTP default character set,
     ISO-8859-1.
     
     - returns: The response.
     */
    @warn_unused_result public func responseString(encoding: String.Encoding? = nil) -> Response<String, NSError> {
        
        let semaphore = DispatchSemaphore(value: 0)
        
        var result: Response<String, NSError>!
        
        self.responseString(queue: DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault), encoding: encoding, completionHandler: { response in
            
            result = response
            semaphore.signal()
            
        })
        
        semaphore.wait(timeout: DispatchTime.distantFuture)
        
        return result
    }
    
    
    /**
     Wait for the request to finish then return the response value.
     
     - parameter options: The property list reading options. `0` by default.
     
     - returns: The response.
     */
    @warn_unused_result public func responsePropertyList(options: PropertyListSerialization.ReadOptions = PropertyListSerialization.ReadOptions()) -> Response<AnyObject, NSError> {
        
        let semaphore = DispatchSemaphore(value: 0)
        
        var result: Response<AnyObject, NSError>!
        
        self.responsePropertyList(queue: DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault), options: options, completionHandler: { response in
            
            result = response
            semaphore.signal()
            
        })
        
        semaphore.wait(timeout: DispatchTime.distantFuture)
        
        return result
    }
}
