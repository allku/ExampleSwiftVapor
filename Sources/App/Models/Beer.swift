import Fluent
import Vapor

final class Beer: Model, Content {
    static let schema = "beers"
    
    @ID(custom: "id")
    var id: Int?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "brand")
    var brand: String
    
    @Field(key: "date_released")
    var dateReleased: Date

    @Parent(key: "location_id")
    var location: Location

    init() { }
    
    init(id: Int? = nil, 
         name: String, 
         brand: String, 
         dateReleased: Date,
         location: Location) 
    {
        self.id = id
        self.name = name
        self.brand = brand
        self.dateReleased = dateReleased
        self.$location.id = try! location.requireID()
    }
}
