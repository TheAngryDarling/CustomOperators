//
//  OperatorXOR.swift
//  CustomOperators
//
//  Created by Tyler Anger on 2018-09-03.
//
// Simple xor bool operators

infix operator ^^: LogicalDisjunctionPrecedence
// Returns lhs xor rhs.  ((lhs && !rhs) || (!lhs && rhs))
public func ^^(lhs: @autoclosure () -> Bool,
               rhs: @autoclosure () -> Bool) -> Bool {
    let l = lhs()
    let r = rhs()
    return ((l && !r) || (!l && r))
}

infix operator ^^=: AssignmentPrecedence
// Assigns lhs to lhs xor rhs. ((lhs && !rhs) || (!lhs && rhs))
public func ^^=(lhs: inout Bool,
                rhs: @autoclosure () -> Bool) {
    lhs = (lhs ^^ rhs)
}
