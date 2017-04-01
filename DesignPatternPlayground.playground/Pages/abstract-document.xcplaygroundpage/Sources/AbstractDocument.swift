/// Abstract implementation of Document interface.
open class AbstractDocument: Document {
    private var properties: [String: Any]
    
    public init(properties: [String: Any]) {
        self.properties = properties
    }
    
    public func put(key: String, value: Any) {
        properties[key] = value
    }
    
    public func get(key: String) -> Any? {
        return properties[key]
    }
    
    public func children<T>(key: String, constructor: ([String: Any]) -> T) -> [T] {
        guard let children = get(key: key) as? [[String: Any]] else {
            return [T]()
        }
        
        return children.map(constructor)
    }
}
