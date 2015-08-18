//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


struct Stack<T: Equatable> {
  var items = [T]()
  mutating func push(item : T) {
    items.append(item)
  }
  mutating func pop() -> T? {
    
  return items.count > 0 ? items.removeLast() : nil
  }
  
  mutating func compareTopTwo() -> Bool {
    if let topItem = pop(),
    nextTopItem = pop(){
      return topItem == nextTopItem
    }
    return false
  }
}

var numbers = Stack<Int>()
numbers.push(32)
//numbers.push("hi")

var names = Stack<String>()
names.push("Brad")

let myInfo = Dictionary<String,Int>()




