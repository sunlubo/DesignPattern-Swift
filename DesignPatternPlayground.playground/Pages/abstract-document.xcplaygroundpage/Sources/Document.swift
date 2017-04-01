/// Document interface.
public protocol Document: class {
    
    /// Puts the value related to the key.
    ///
    /// - Parameters:
    ///   - key: element key
    ///   - value: element value
    /// - Returns: Void
    func put(key: String, value: Any)
    
    /// Gets the value for the key.
    ///
    /// - Parameter key: element key
    /// - Returns: value or null
    func get(key: String) -> Any?
    
    /// Gets the stream of child documents.
    ///
    /// - Parameters:
    ///   - key: element key
    ///   - constructor: constructor of child class
    /// - Returns: child documents
    func children<T>(key: String, constructor: ([String: Any]) -> T) -> [T]
}
