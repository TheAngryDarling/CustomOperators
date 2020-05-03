//
//  OperatorLargest.swift
//  CustomOperators
//
//  Created by Tyler Anger on 2018-09-09.
//
// Operator to return the largest of two comparable objects.  This reduces the (A>B)? A:B statement for largest comparison


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
public func ?><Object>(lhs: @autoclosure () -> Object,
                       rhs: @autoclosure () -> Object) -> Object where Object: Comparable {
    let l = lhs()
    let r = rhs()
    return (l > r) ? l : r
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
public func ??><Object>(lhs: @autoclosure () -> Object?,
                        rhs: @autoclosure () -> Object) -> Object where Object: Comparable {
    let r = rhs()
    guard let l = lhs() else { return r }
    return (l > r) ? l : r
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
public func ??><Object>(lhs: @autoclosure () -> Object,
                        rhs: @autoclosure () -> Object?) -> Object where Object: Comparable {
    let l = lhs()
    guard let r = rhs() else { return l}
    return (l > r) ? l : r
}

/// Returns the largest of two objects or nil if both are nil
///
///     lhs = (lhs ??> rhs)
///
/// - Parameters:
///   - lhs: First comparable object
///   - rhs: Second comparable object or nil
/// - Returns: Returns the greater of the two objects   or nil if both parameters are nil
public func ??><Object>(lh: @autoclosure () -> Object?,
                        rh: @autoclosure () -> Object?) -> Object? where Object: Comparable {
    guard let lhs = lh() else { return rh() }
    guard let rhs = rh() else { return lhs }
    if lhs > rhs { return lhs }
    else { return rhs }
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
public func ?>=<Object>(lhs: inout Object,
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
public func ??>=<Object>(lhs: inout Object,
                         rhs: @autoclosure () -> Object?) where Object: Comparable {
    guard let r = rhs() else { return }
    lhs = (lhs ?> r)
}
/// Assigns lhs to the greater of the two objects or nil if both are nil
///
///     lhs = (lhs ??> rhs)
///
/// - Parameters:
///   - lhs: First comparable object or nil
///   - rhs: Second comparable object or nil
public func ??>=<Object>(lhs: inout Object?,
                         rhs: @autoclosure () -> Object) where Object: Comparable {
    guard let l = lhs else {
        lhs = rhs()
        return
    }
    let r = rhs()
    
    lhs = (l ?> r)
}
/// Assigns lhs to the greater of the two objects or nil if both are nil
///
///     lhs = (lhs ??> rhs)
///
/// - Parameters:
///   - lhs: First comparable object or nil
///   - rhs: Second comparable object or nil
public func ??>=<Object>(lhs: inout Object?,
                         rhs: @autoclosure () -> Object?) where Object: Comparable {
    guard let l = lhs else {
        lhs = rhs()
        return
    }
    guard let r = rhs() else { return }
    
    lhs = (l ?> r)
}
