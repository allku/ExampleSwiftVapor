import Fluent
import Vapor

final class Location: Model, Content {
    static let schema = "locations"

    @ID(custom: "id")
    var id: Int?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "observation")
    var observation: String?
    
    @Field(key: "status")
    var status: String

    @OptionalParent(key: "location_id")
    var location: Location?

    init() { }
    
    init(id: Int? = nil, 
         name: String, 
         observation: String? = nil, 
         status: String, 
         location: Location? = nil) throws  {
        self.id = id
        self.name = name
        self.observation = observation
        self.status = status
        self.$location.id = try location?.requireID()
    }
}
