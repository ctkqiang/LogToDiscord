/**
 * @author John Melody Me <johnmelodyme@outlook.com>
 * @package `LogToDiscord`
 */
import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public struct LogToDiscord
{
    public var url: String
    public var app: String
    
    public init(appName: String, webhookUrl: String) throws
    {
        /** User's Discord [WebhookUrl] */
        url = webhookUrl
        
        /** User's App Name [appName] */
        app = appName
    }
    
    /** Format [message] */
    public func getFormat(message: String, level: Level) -> String
    {
        switch(level)
        {
            case Level.Info:
                return "```[Info] \n => \(message)```"
                
            case Level.Error:
                return "```[Error] \n \(message)```"
            
            case Level.Debug:
                return "```[Debug] \n \(message)```"
            
            case Level.Warn:
                return "```[Warning] \n \(message)```"
        }
    }
    
    /** Send Discord messages to channel via webhook */
    public func send(message: String, level: Level, delay: Double) throws -> Void
    {
        /** Set Dispatch to [0] */
        let semaphore = DispatchSemaphore (value: 0)

        /** Set [Endpoint] */
        var request = URLRequest(
            url: URL(string: url)!,
            timeoutInterval: Double.infinity
        )

        
        /** Set [HTTPBody] */
        let parameters = "username=\(app)&content=\(String(describing: getFormat(message: message, level: level)))"
    
        /** Set [PostData] */
        let postData = parameters.data(using: .utf8)

        
        /** Set Method [POST] */
        request.httpMethod = "POST"
        request.addValue(
            "application/x-www-form-urlencoded",
            forHTTPHeaderField:  "Content-Type"
        )
        request.httpBody = postData

        

        /** Delay function [Delay] */
        do
        {
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
                guard let data = data else {
                    print(String(describing: error))
                    semaphore.signal()
                    return
                }
                
                print(String(data: data, encoding: .utf8)!)
                print(getFormat(message: message, level: level));
                
                semaphore.signal()
            }

            task.resume()
            semaphore.wait()
            
        }
    }
}
