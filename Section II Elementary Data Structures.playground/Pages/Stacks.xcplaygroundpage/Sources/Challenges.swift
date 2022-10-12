import Foundation

public struct Challenge {
    public init() {
        
    }
}

extension Challenge {
    public func printInReverse<T>(_ array: [T]) {
        var stack = Stack<T>()
        for value in array {
            stack.push(value)
        }
        
        while let value = stack.pop() {
            print(value)
        }
    }
}

extension Challenge {
    public func checkParentheses(_ string: String) -> Bool {
        var stack = Stack<Character>()
        
        for character in string {
            if character == "(" {
                stack.push(character)
            } else if character == ")" {
                if stack.isEmpty {
                    return false
                } else {
                    stack.pop()
                }
            }
        }
        return stack.isEmpty
    }
}




