//
//  CSUnsafeDataTransaction.swift
//  CoreStore
//
//  Copyright © 2018 John Rommel Estropia
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation
import CoreData


// MARK: - CSUnsafeDataTransaction

@available(*, unavailable, message: "CoreStore Objective-C is now obsoleted in preparation for Swift concurrency.")
@objc
public final class CSUnsafeDataTransaction: CSBaseDataTransaction, CoreStoreObjectiveCType {

    @objc
    public func commitWithSuccess(_ success: (() -> Void)?, _ failure: ((CSError) -> Void)?) {

        fatalError()
    }

    @objc
    public func commitAndWait(error: NSErrorPointer) -> Bool {

        fatalError()
    }

    @objc
    public func rollback() {

        fatalError()
    }

    @objc
    public func undo() {

        fatalError()
    }

    @objc
    public func redo() {

        fatalError()
    }

    @objc
    public func flush() {

        fatalError()
    }

    @objc
    public func flush(_ block: () -> Void) {

        fatalError()
    }

    @objc
    public func beginUnsafe() -> CSUnsafeDataTransaction {

        fatalError()
    }

    @objc
    public func beginUnsafeWithSupportsUndo(_ supportsUndo: Bool) -> CSUnsafeDataTransaction {

        fatalError()
    }

    @objc
    public func unsafeContext() -> NSManagedObjectContext {

        fatalError()
    }
    
    
    // MARK: NSObject
    
    public override var description: String {

        fatalError()
    }
    
    
    // MARK: CoreStoreObjectiveCType
    
    public typealias SwiftType = UnsafeDataTransaction
    
    public var bridgeToSwift: UnsafeDataTransaction {

        fatalError()
    }
    
    public required init(_ swiftValue: UnsafeDataTransaction) {

        fatalError()
    }
}


// MARK: - UnsafeDataTransaction

@available(*, unavailable, message: "CoreStore Objective-C is now obsoleted in preparation for Swift concurrency.")
extension UnsafeDataTransaction: CoreStoreSwiftType {
    
    // MARK: CoreStoreSwiftType
    
    public var bridgeToObjectiveC: CSUnsafeDataTransaction {

        fatalError()
    }
}
