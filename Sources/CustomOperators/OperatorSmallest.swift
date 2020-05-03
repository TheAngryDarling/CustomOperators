//
//  OperatorSmallest.swift
//  CustomOperators
//
//  Created by Tyler Anger on 2018-09-09.
//
// Operator to return the smallest of two comparable objects.
// This reduces the (A<B)? A:B statement for smallest comparison

import Foundation

infix operator ?<: ComparisonPrecedence
infix operator ??<: ComparisonPrecedence

/// Returns the smallest of two objects
///
///     return (lhs < rhs) ? lhs : rhs
///
/// - Parameters:
///   - lhs: First comparable object
///   - rhs: Second comparable object
/// - Returns: Returns the smaller of the two objects
public func ?< <Object>(lhs: @autoclosure () -> Object,
                        rhs: @autoclosure () -> Object) -> Object where Object: Comparable {
    let lhs = lhs()
    let rhs = rhs()
    return (lhs < rhs) ? lhs : rhs
}
/// Returns the smallest of two objects
///
///     guard lhs != nil else { return rhs }
///     return (lhs < rhs) ? lhs : rhs
///
/// - Parameters:
///   - lhs: First comparable object or nil
///   - rhs: Second comparable object
/// - Returns: Returns the smaller of the two objects.  If lhs is nil, rhs is automatically returned
public func ??< <Object>(lhs: @autoclosure () -> Object?,
                         rhs: @autoclosure () -> Object) -> Object where Object: Comparable {
    let rhs = rhs()
    guard let lhs = lhs() else { return rhs }

    return (lhs < rhs) ? lhs : rhs
}
/// Returns the smallest of two objects
///
///     guard rhs != nil else { return lhs }
///     return (lhs < rhs) ? lhs : rhs
///
/// - Parameters:
///   - lhs: First comparable object
///   - rhs: Second comparable object or nil
/// - Returns: Returns the smaller of the two objects.  If rhs is nil, lhs is automatically returned
public func ??< <Object>(lhs: @autoclosure () -> Object,
                         rhs: @autoclosure () -> Object?) -> Object where Object: Comparable {
    let lhs = lhs()
    guard let rhs = rhs() else { return lhs }

    return (lhs < rhs) ? lhs : rhs
}

/// Returns the smallest of two objects or nil if found
///
///     guard rhs != nil else { return lhs }
///     return (lhs < rhs) ? lhs : rhs
///
/// - Parameters:
///   - lhs: First comparable object or nil
///   - rhs: Second comparable object or nil
/// - Returns: Returns the smaller of the two objects or nil if found
public func ??< <T>(lhs: @autoclosure () -> T?,
                    rhs: @autoclosure () -> T?) -> T? where T: Comparable {
    guard let lhs = lhs() else { return nil }
    guard let rhs = rhs() else { return nil }
    guard lhs > rhs else { return rhs }
    return lhs
}

infix operator ?<=: AssignmentPrecedence
infix operator ??<=: AssignmentPrecedence
/// Assigns lhs to the smaller of the two objects
///
///     lhs = (lhs ?< rhs)
///
/// - Parameters:
///   - lhs: First comparable object, will store the results from the operation
///   - rhs: Second comparable object
public func ?<=<Object>(lhs: inout Object,
                        rhs: @autoclosure () -> Object) where Object: Comparable {
    lhs = (lhs ?< rhs)
}
/// Assigns lhs to the smaller of the two objects
///
///     lhs = (lhs ??< rhs)
///
/// - Parameters:
///   - lhs: First comparable object, will store the results from the operation
///   - rhs: Second comparable object or nil
public func ??<= <Object>(lhs: inout Object,
                          rhs: @autoclosure () -> Object?) where Object: Comparable {
    guard let rhs = rhs() else { return }
    lhs = (lhs ?< rhs)
}
/// Assigns lhs to the smaller of the two objects or nil if either are nil
///
///     lhs = (lhs ??< rhs)
///
/// - Parameters:
///   - lhs: First comparable object, will store the results from the operation
///   - rhs: Second comparable object or nil
public func ??<= <Object>(lhs: inout Object?,
                          rhs: @autoclosure () -> Object) where Object: Comparable {

    guard let innerLHS = lhs else { return }
    let rhs = rhs()
    lhs = (innerLHS ?< rhs)
}
/// Assigns lhs to the smaller of the two objects or nil if either are nil
///
///     lhs = (lhs ??< rhs)
///
/// - Parameters:
///   - lhs: First comparable object, will store the results from the operation
///   - rhs: Second comparable object or nil
public func ??<= <Object>(lhs: inout Object?,
                          rhs: @autoclosure () -> Object?) where Object: Comparable {

    guard let innerLHS = lhs else { return }
    guard let rhs = rhs() else { return }
    lhs = (innerLHS ?< rhs)
}
