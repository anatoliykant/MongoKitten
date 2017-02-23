//
// This source file is part of the MongoKitten open source project
//
// Copyright (c) 2016 - 2017 OpenKitten and the MongoKitten project authors
// Licensed under MIT
//
// See https://github.com/OpenKitten/MongoKitten/blob/mongokitten31/LICENSE.md for license information
// See https://github.com/OpenKitten/MongoKitten/blob/mongokitten31/CONTRIBUTORS.md for the list of MongoKitten project authors
//

import BSON

internal protocol ValueConvertible : BSON.Primitive {
    func makePrimitive() -> BSON.Primitive
}

extension ValueConvertible {
    public func convert<S>(toType type: S.Type) -> S.SupportedValue? where S : InitializableSequence {
        return makePrimitive().convert(toType: type)
    }
    
    public func convert<S>(toType type: S.Type) -> S.SequenceType.SupportedValue? where S : SerializableObject {
        return makePrimitive().convert(toType: type)
    }
    
    public var typeIdentifier: Byte {
        return makePrimitive().typeIdentifier
    }
    
    public func makeBinary() -> Bytes {
        return makePrimitive().makeBinary()
    }
}
