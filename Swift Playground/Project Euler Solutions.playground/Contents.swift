import PlaygroundSupport

enum Euler {
    // Project 1: Multiples of 3 and 5
    static func project1() -> String {
        var sum = 0
        for i in 0..<1000 {
            if ((i % 3) == 0) || ((i % 5) == 0) {
                sum += i
            }
        }
        return "\(sum)"
    }
    
    // Project 2: Even Fibonacci numbers
    static func project2() -> String {
        /// Returns the next fibonacci number in the sequence, given two numbers. Default values are the initial two values of the finonacci sequence, 0 and 1.
        /// 
        /// - parameter num1: The first number.
        /// - parameter num2: The second number.
        /// - returns: The next number in the fibonacci sequence, give the two numbers provided.
        func findNextFibonacciNumber(num1: Int = 0, num2: Int = 1) -> Int {
            return num1 + num2
        }
        var sum = 0
        var previousNumber = 0
        var currentNumber = 1
        repeat {
            if currentNumber % 2 == 0 {
                sum += currentNumber
            }
            let nextNumber = findNextFibonacciNumber(num1: previousNumber, num2: currentNumber)
            previousNumber = currentNumber
            currentNumber = nextNumber
        } while currentNumber < 4000000
        return "\(sum)"
    }
    
    // Project 3: Largest prime factor
    static func project3() -> String {
        /// Finds the first prime number that the given number is divisible by, and returns it.
        /// - parameter num: The number to analyze.
        /// - returns: The first prime of the given number.
        func findFirstPrime(ofNumber num: Int) -> Int {
            for possiblePrime in 2...num {
                if (num % possiblePrime) == 0 {
                    return possiblePrime
                }
            }
            return num
        }
        
        var number = 600851475143
        var largestFactor = 0
        while true {
            let tempNum = findFirstPrime(ofNumber: number)
            if tempNum > largestFactor {
                largestFactor = tempNum
            }
            if tempNum == number {
                break
            }
            number = number / tempNum
        }
        
        return "\(largestFactor)"
    }
    
    // Project 4: Largest palindrome product
    static func project4() -> String {
        func isPalindrome(num: Int) -> Bool {
            let numString = "\(num)"
            return numString == String(numString.characters.reversed())
        }
        
        let num1 = 999
        let num2 = 999
        var possiblePalindromes = [Int]()
        for i in (900...num1).reversed() {
            for j in (1...num2).reversed() {
                if isPalindrome(num: i * j) {
                    possiblePalindromes.append(i * j)
                }
            }
        }
        let maxPalindrome = possiblePalindromes.max()
        return "\(maxPalindrome ?? 0)"
    }
    
    // Project 5: Smallest multiple
    static func project5() -> String {
        var iteration = 11500000
        var possibleNum: Int = 20
        while true {
            for i in (1...19).reversed() {
                if possibleNum % i != 0 {
                    iteration += 1
                    possibleNum = 20 * iteration
                    break
                }
                if i == 1 {
                    return "\(possibleNum)"
                }
            }
        }
        return "0"
    }
    
    // Project 6: Sum square difference
    static func project6() -> String {
        var sumOfSquares = 0
        var squareOfSums = 0
        for i in 1...100 {
            sumOfSquares += i * i
            squareOfSums += i
        }
        squareOfSums *= squareOfSums
        return "\(squareOfSums - sumOfSquares)"
    }
    
    // Project 7
    static func project7() -> String {
        return "TODO"
    }
}

print(Euler.project6())

