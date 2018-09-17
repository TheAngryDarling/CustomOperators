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
// Returns the largest of two objects
public func ?><Object>(lhs: @autoclosure () -> Object,
                       rhs: @autoclosure () -> Object) -> Object where Object: Comparable {
    let l = lhs()
    let r = rhs()
    return (l > r) ? l : r
}
// Returns the largest of two objects
public func ??><Object>(lhs: @autoclosure () -> Object?,
                        rhs: @autoclosure () -> Object) -> Object where Object: Comparable {
    let r = rhs()
    guard let l = lhs() else { return r }
    return (l > r) ? l : r
}
// Returns the largest of two objects
public func ??><Object>(lhs: @autoclosure () -> Object,
                        rhs: @autoclosure () -> Object?) -> Object where Object: Comparable {
    let l = lhs()
    guard let r = rhs() else { return l}
    return (l > r) ? l : r
}

infix operator ?>=: AssignmentPrecedence
infix operator ??>=: AssignmentPrecedence
// Assigns lhs to the largest of the two objects
public func ?>=<Object>(lhs: inout Object,
                        rhs: @autoclosure () -> Object) where Object: Comparable {
    lhs = (lhs ?> rhs)
}
// Assigns lhs to the largest of the two objects
public func ??>=<Object>(lhs: inout Object,
                         rhs: @autoclosure () -> Object?) where Object: Comparable {
    guard let r = rhs() else { return }
    lhs = (lhs ?> r)
}
