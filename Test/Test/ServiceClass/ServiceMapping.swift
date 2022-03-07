//
//  ServiceMapping.swift
//  Service
//

/*
 ServiceMapping class handles different service calls.
 Pass constant method name will return you suffix url with method type(GET, POST, PUT)
 */
import UIKit

class ServiceMapping: NSObject {

    private static var serviceMapping: ServiceMapping = {
        let serviceMapping = ServiceMapping()
        
        return serviceMapping
    }()
    
    private var fileData : [String: ServiceData] = [:]
    
    override init() {
        super.init()
        self.loadServiceMappingFile()
    }
    
    //MARK:- Private Methods
    class func shared() -> ServiceMapping{
        return serviceMapping
    }
    
    //Read ServiceMapping plist file and Create model class object
    private func loadServiceMappingFile(){
        if let url = Bundle.main.url(forResource: "ServiceMapping", withExtension: "plist"){
            do {
                //Convert Plist file data into JSON
                let data = try Data(contentsOf:url)
                let dict = try PropertyListSerialization.propertyList(from: data, options: [], format: nil)
                let jsonData = try JSONSerialization.data(withJSONObject: dict , options: .prettyPrinted)
                
                //Decode JSON to model class
                do{
                    let sData = try JSONDecoder().decode([String: ServiceData].self, from: jsonData)
                    self.fileData = sData
                }catch{
                    print("Error deserializing JSON: \(error)")
                }
            } catch {
                print(error)
            }
        }
    }

    
    //MARK:- Public Methods
    //This method returns Service Data like suffix url, methodType based on serviceName that you pass
    func getServiceData(name: String) -> ServiceData?{
        if let serviceData = self.fileData[name]{
            return serviceData
        }
        else{
            return nil
        }
    }
    
}
