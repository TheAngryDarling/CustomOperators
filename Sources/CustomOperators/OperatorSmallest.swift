//
//  OperatorSmallest.swift
//  CustomOperators
//
//  Created by Tyler Anger on 2018-09-09.
//
// Operator to return the smallest of two comparable objects.  This reduces the (A<B)? A:B statement for smallest comparison

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
public func ?<<Object>(lhs: @autoclosure () -> Object,
                       rhs: @autoclosure () -> Object) -> Object where Object: Comparable {
    let l = lhs()
    let r = rhs()
    return (l < r) ? l : r
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
public func ??<<Object>(lhs: @autoclosure () -> Object?,
                        rhs: @autoclosure () -> Object) -> Object where Object: Comparable {
    let r = rhs()
    guard let l = lhs() else { return r }
    
    return (l < r) ? l : r
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
public func ??<<Object>(lhs: @autoclosure () -> Object,
                        rhs: @autoclosure () -> Object?) -> Object where Object: Comparable {
    let l = lhs()
    guard let r = rhs() else { return l }
    
    return (l < r) ? l : r
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
public func ??<<T>(lh: @autoclosure () -> T?,
                   rh: @autoclosure () -> T?) -> T? where T: Comparable {
    guard let lhs = lh() else { return nil }
    guard let rhs = rh() else { return nil }
    if lhs < rhs { return lhs }
    else { return rhs }
    
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
public func ??<=<Object>(lhs: inout Object,
                         rhs: @autoclosure () -> Object?) where Object: Comparable {
    guard let r = rhs() else { return }
    lhs = (lhs ?< r)
}
/// Assigns lhs to the smaller of the two objects or nil if either are nil
///
///     lhs = (lhs ??< rhs)
///
/// - Parameters:
///   - lhs: First comparable object, will store the results from the operation
///   - rhs: Second comparable object or nil
public func ??<=<Object>(lhs: inout Object?,
                         rhs: @autoclosure () -> Object?) where Object: Comparable {
    lhs = (lhs ??> rhs())
}
