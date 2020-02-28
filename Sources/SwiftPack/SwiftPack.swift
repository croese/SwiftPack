
public protocol Packable {
    func pack() -> [UInt8]
}

extension Optional: Packable where Wrapped: Packable {
    public func pack() -> [UInt8] {
        if let v = self {
            return v.pack()
        }
        
        return [0xc0]
    }
}

extension Bool: Packable {
    public func pack() -> [UInt8] {
        return self ? [0xc3] : [0xc2]
    }
}

extension Int: Packable {
    public func pack() -> [UInt8] {
        if self >= 0 && self <= UInt8.max {
            return UInt8(self).pack()
        }
        
        return []
    }
}

extension Int8: Packable {
    public func pack() -> [UInt8] {
        if self >= 0 && self <= UInt8.max {
            return UInt8(self).pack()
        }
        
        return []
    }
}

extension Int16 {
    
}

extension Int32 {
    
}

extension Int64 {
    
}

extension UInt: Packable {
    public func pack() -> [UInt8] {
        if self <= UInt8.max {
            return UInt8(self).pack()
        }
        
        return []
    }
}

extension UInt8: Packable {
    public func pack() -> [UInt8] {
        if self <= 0x7f {
            return [self]
        }
        
        return [0xcc, self]
    }
}

extension UInt16 {
    
}

extension UInt32 {
    
}

extension UInt64 {
    
}
