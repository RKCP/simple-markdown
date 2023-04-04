//
//  CSBaseDataTransaction+Querying.swift
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


// MARK: - CSBaseDataTransaction

@available(*, unavailable, message: "CoreStore Objective-C is now obsoleted in preparation for Swift concurrency.")
extension CSBaseDataTransaction {

    @objc
    public func fetchExistingObject(_ object: NSManagedObject) -> Any? {

        fatalError()
    }

    @objc
    public func fetchExistingObjectWithID(_ objectID: NSManagedObjectID) -> Any? {

        fatalError()
    }

    @objc
    public func fetchExistingObjects(_ objects: [NSManagedObject]) -> [Any] {

        fatalError()
    }

    @objc
    public func fetchExistingObjectsWithIDs(_ objectIDs: [NSManagedObjectID]) -> [Any] {

        fatalError()
    }

    @objc
    public func fetchOneFrom(_ from: CSFrom, fetchClauses: [CSFetchClause]) -> Any? {

        fatalError()
    }

    @objc
    public func fetchAllFrom(_ from: CSFrom, fetchClauses: [CSFetchClause]) -> [Any]? {

        fatalError()
    }

    @objc
    public func fetchCountFrom(_ from: CSFrom, fetchClauses: [CSFetchClause]) -> NSNumber? {

        fatalError()
    }

    @objc
    public func fetchObjectIDFrom(_ from: CSFrom, fetchClauses: [CSFetchClause]) -> NSManagedObjectID? {

        fatalError()
    }

    @objc
    public func queryValueFrom(_ from: CSFrom, selectClause: CSSelect, queryClauses: [CSQueryClause]) -> Any? {

        fatalError()
    }

    @objc
    public func queryAttributesFrom(_ from: CSFrom, selectClause: CSSelect, queryClauses: [CSQueryClause]) -> [[String: Any]]? {

        fatalError()
    }
}
