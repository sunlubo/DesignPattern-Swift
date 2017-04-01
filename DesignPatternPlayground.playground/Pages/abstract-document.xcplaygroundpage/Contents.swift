/*:
 [Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
 ****
 # Abstract Document
 
 The Abstract Document pattern enables handling additional, non-static properties. This pattern uses concept of traits to enable type safety and separate properties of different classes into set of interfaces.
 
 In Abstract Document pattern, `AbstractDocument` fully implements `Document` interface. Traits are then defined to enable access to properties in usual, static way.
 */
/// HasType trait for static access to 'type' property.
public protocol HasType: Document {
    
    static var typeKey: String { get }
    
    var type: String? { get set }
}

extension HasType {
    
    public static var typeKey: String {
        return "type"
    }
    
    public var type: String? {
        get {
            return get(key: Self.typeKey) as? String
        }
        set {
            guard let newValue = newValue else {
                return
            }
            put(key: Self.typeKey, value: newValue)
        }
    }
}

/// HasModel trait for static access to 'model' property.
public protocol HasModel: Document {
    
    static var modelKey: String { get }
    
    var model: String? { get set }
}

extension HasModel {
    
    public static var modelKey: String {
        return "model"
    }
    
    public var model: String? {
        get {
            return get(key: Self.modelKey) as? String
        }
        set {
            guard let newValue = newValue else {
                return
            }
            put(key: Self.modelKey, value: newValue)
        }
    }
}

/// HasPrice trait for static access to 'price' property.
public protocol HasPrice: Document {
    
    static var priceKey: String { get }
    
    var price: Double? { get set }
}

extension HasPrice {
    
    public static var priceKey: String {
        return "price"
    }
    
    public var price: Double? {
        get {
            return get(key: Self.priceKey) as? Double
        }
        set {
            guard let newValue = newValue else {
                return
            }
            put(key: Self.priceKey, value: newValue)
        }
    }
}

/// HasParts trait for static access to 'parts' property.
public protocol HasParts: Document {
    
    static var partsKey: String { get }
    
    var parts: [Part] { get}
}

extension HasParts {
    
    public static var partsKey: String {
        return "parts"
    }
    
    public var parts: [Part] {
        get {
            return children(key: Self.partsKey, constructor: Part.init(properties:))
        }
    }
}

public class Car: AbstractDocument, HasModel, HasPrice, HasParts {}

public class Part: AbstractDocument, HasType, HasModel, HasPrice, CustomStringConvertible {
    
    public var description: String {
        return "type: \(type ?? "nil") model: \(model ?? "nil") price: \(price ?? 0)"
    }
}


let wheelProperties: [String: Any] = [
    Part.typeKey: "wheel",
    Part.modelKey: "15C",
    Part.priceKey: 100.00
]
let doorProperties: [String: Any] = [
    Part.typeKey: "door",
    Part.modelKey: "Lambo",
    Part.priceKey: 300.00
]
let carProperties: [String: Any] = [
    Car.modelKey: "300SL",
    Car.priceKey: 1000000.00,
    Car.partsKey: [wheelProperties, doorProperties]
]

let car = Car(properties: carProperties)
car.model
car.price
car.parts.map({ print($0) })

car.put(key: "color", value: "red")
car.get(key: "color")
/*:
 ****
 [Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
 */
