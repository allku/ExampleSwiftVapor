import Fluent
import Vapor

final class Beer: Model, Content {
    static let schema = "beers"
    
    @ID(custom: "id")
    var id: Int?
    
    @Field(key: "name")
    var name: String
    
//    @Field(key: "brand")
//    var brand: String
    
    init() { }
    
    init(id: Int? = nil, name: String) {
        self.id = id
        self.name = name
    }
}
