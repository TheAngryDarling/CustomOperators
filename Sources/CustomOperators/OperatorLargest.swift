//
//  OperatorLargest.swift
//  CustomOperators
//
//  Created by Tyler Anger on 2018-09-09.
//
// Operator to return the largest of two comparable objects.
// This reduces the (A>B)? A:B statement for largest comparison

import Foundation

infix operator ?>: ComparisonPrecedence
infix operator ??>: ComparisonPrecedence

/// Returns the largest of two objects
///
///     return (lhs > rhs) ? lhs : rhs
///
/// - Parameters:
///   - lhs: First comparable object
///   - rhs: Second comparable object
/// - Returns: Returns the greater of the two objects
public func ?> <Object>(lhs: @autoclosure () -> Object,
                        rhs: @autoclosure () -> Object) -> Object where Object: Comparable {
    let lhs = lhs()
    let rhs = rhs()
    return (lhs > rhs) ? lhs : rhs
}
/// Returns the largest of two objects
///
///     guard lhs != nil else { return rhs }
///     return (lhs > rhs) ? lhs : rhs
///
/// - Parameters:
///   - lhs: First comparable object or nil
///   - rhs: Second comparable object
/// - Returns: Returns the greater of the two objects
public func ??> <Object>(lhs: @autoclosure () -> Object?,
                         rhs: @autoclosure () -> Object) -> Object where Object: Comparable {
    let rhs = rhs()
    guard let lhs = lhs() else { return rhs }
    return (lhs > rhs) ? lhs : rhs
}
/// Returns the largest of two objects
///
///     guard rhs != nil else { return lhs }
///     return (lhs > rhs) ? lhs : rhs
///
/// - Parameters:
///   - lhs: First comparable object
///   - rhs: Second comparable object or nil
/// - Returns: Returns the greater of the two objects
public func ??> <Object>(lhs: @autoclosure () -> Object,
                         rhs: @autoclosure () -> Object?) -> Object where Object: Comparable {
    let lhs = lhs()
    guard let rhs = rhs() else { return lhs }
    return (lhs > rhs) ? lhs : rhs
}

/// Returns the largest of two objects or nil if both are nil
///
///     lhs = (lhs ??> rhs)
///
/// - Parameters:
///   - lhs: First comparable object
///   - rhs: Second comparable object or nil
/// - Returns: Returns the greater of the two objects   or nil if both parameters are nil
public func ??> <Object>(lhs: @autoclosure () -> Object?,
                         rhs: @autoclosure () -> Object?) -> Object? where Object: Comparable {
    guard let lhs = lhs() else { return rhs() }
    guard let rhs = rhs() else { return lhs }
    guard lhs < rhs else { return rhs }
    return lhs
}

infix operator ?>=: AssignmentPrecedence
infix operator ??>=: AssignmentPrecedence
/// Assigns lhs to the greater of the two objects
///
///     lhs = (lhs ?> rhs)
///
/// - Parameters:
///   - lhs: First comparable object
///   - rhs: Second comparable object
public func ?>= <Object>(lhs: inout Object,
                         rhs: @autoclosure () -> Object) where Object: Comparable {
    lhs = (lhs ?> rhs)
}
/// Assigns lhs to the greater of the two objects
///
///     lhs = (lhs ??> rhs)
///
/// - Parameters:
///   - lhs: First comparable object
///   - rhs: Second comparable object or nil
public func ??>= <Object>(lhs: inout Object,
                          rhs: @autoclosure () -> Object?) where Object: Comparable {
    guard let rhs = rhs() else { return }
    lhs = (lhs ?> rhs)
}
/// Assigns lhs to the greater of the two objects or nil if both are nil
///
///     lhs = (lhs ??> rhs)
///
/// - Parameters:
///   - lhs: First comparable object or nil
///   - rhs: Second comparable object or nil
public func ??>= <Object>(lhs: inout Object?,
                          rhs: @autoclosure () -> Object) where Object: Comparable {
    guard let innerLHS = lhs else {
        lhs = rhs()
        return
    }

    lhs = (innerLHS ?> rhs())
}
/// Assigns lhs to the greater of the two objects or nil if both are nil
///
///     lhs = (lhs ??> rhs)
///
/// - Parameters:
///   - lhs: First comparable object or nil
///   - rhs: Second comparable object or nil
public func ??>= <Object>(lhs: inout Object?,
                          rhs: @autoclosure () -> Object?) where Object: Comparable {
    guard let innerLHS = lhs else {
        lhs = rhs()
        return
    }
    guard let innerRHS = rhs() else { return }

    lhs = (innerLHS ?> innerRHS)
}
