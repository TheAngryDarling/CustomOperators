//
//  OperatorXOR.swift
//  CustomOperators
//
//  Created by Tyler Anger on 2018-09-03.
//
// Simple xor bool operators

infix operator ^^: LogicalDisjunctionPrecedence

/// XOR operator on two bool values
///
/// Returns lhs xor rhs.  ((lhs && !rhs) || (!lhs && rhs))
///
/// - Parameters:
///   - lhs: First bool in operation
///   - rhs: Second bool in operation
/// - Returns: Returns true if and only if one of the two bool values is true
public func ^^ (lhs: @autoclosure () -> Bool,
                rhs: @autoclosure () -> Bool) -> Bool {
    let lhs = lhs()
    let rhs = rhs()
    return ((lhs && !rhs) || (!lhs && rhs))
}

infix operator ^^=: AssignmentPrecedence
/// Assigns lhs to lhs xor rhs. ((lhs && !rhs) || (!lhs && rhs))
///
/// - Parameters:
///   - lhs: First bool in operation
///   - rhs: Second bool in operation
public func ^^= (lhs: inout Bool,
                 rhs: @autoclosure () -> Bool) {
    lhs = (lhs ^^ rhs)
}
