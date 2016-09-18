import PlaygroundSupport

// Extensions to make my life easier
extension String {
    
    private subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(start, offsetBy: r.upperBound - r.lowerBound)
        return self[Range(start ..< end)]
    }
}


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
    
    // Project 7: 10001st prime
    static func project7() -> String {
        // Build array of possible prime numbers
        var primeNumbers = [true, true]
        for _ in 1...16 {
            primeNumbers += primeNumbers
        }
        // Find all of the prime numbers
        var maxNum = primeNumbers.count - 1
        for i in 2..<10000 {
            if primeNumbers[i] {
                for j in stride(from: i * i, to: maxNum, by: i) {
                    primeNumbers[j] = false
                }
            }
        }
        // Return the 10001st prime
        var primeCount = 0
        for i in 2..<maxNum {
            if primeNumbers[i] {
                primeCount += 1
                if primeCount == 10001 {
                    return "\(i)"
                }
            }
        }
        return "Project 7 failure"
    }
    
    // Project 8: Largest product in a series
    static func project8() -> String {
        let digitToProcess = "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450"
        var maxProduct = 0
        var numbersToMultiply = [Int]()
        var maxNumbers = [Int]()
        var currentProduct = 1
        for i in 12..<digitToProcess.characters.count {
            currentProduct = 1
            for j in (i - 12)...i {
                currentProduct *= Int(digitToProcess[j]) ?? 0
            }
            if currentProduct > maxProduct {
                maxProduct = currentProduct
            }
        }
        return "\(maxProduct)"
    }
}

print(Euler.project8())
