import Vapor
import Rainbow

class SeederCommand: Command {
    struct Signature: CommandSignature {
        @Argument(name: "option")
        var option: String
    }
    
    var app: Application

    init(app: Application)
    {
        self.app = app
    }

    var help: String {
        "Seeder"
    }

    func run(using context: CommandContext, signature: Signature) throws {
      do {
          let option = signature.option
          if (option == "create") {
              context.console.print("Seeder Begin ...".lightBlue)
        
              let earth = try Location(
                  name: "Earth",
                  status: "Active")
              try earth.save(on: self.app.db).wait()

              let locations: [Location] = try!
              [
                .init(name: "Europa", status: "Active", location: earth),
                .init(name: "America", observation: "My continent", status: "Active", location: earth)
              ]

              for l in locations {
                print("Location " + l.name)
                try l.save(on: self.app.db).wait()
              }
              
              context.console.print("Seeder End ...".lightBlue)
          }
          else if (option == "destroy") {
              try Location.query(on: app.db).delete(force: true).wait()
              context.console.print("Destroy Data ...".lightBlue)
          }
          else {
              context.console.print("Option not defined".red.bold.blink)
          }
      } catch {
            context.console.print("vapor run seeder <option>")
      }
      //Read console data
      //let name = context.console.ask("What is your \("name", color: .blue)?")
      //context.console.print("Hello, \(name) 👋")
    }
}
