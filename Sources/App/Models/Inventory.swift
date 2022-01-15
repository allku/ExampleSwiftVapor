import Fluent
import Vapor

final class Inventory: Model, Content {

    static let schema = "inventories"

    @ID(custom: "id")
    var id: Int?

    @Field(key: "code_warehouse")
    var codeWarehouse: String
    
    @Field(key: "code_batch")
    var codeBatch: String

    @Field(key: "quantity")
    var quantity: Float 

    @Parent(key: "ingredient_id")
    var ingredient: Ingredient
    
    init() { }

    init(id: Int? = nil, 
         codeWarehouse: String, 
         codeBatch: String, 
         quantity: Float) throws {
        self.id = id
        self.codeWarehouse = codeWarehouse
        self.codeBatch = codeBatch
        self.quantity = quantity
    }
}
