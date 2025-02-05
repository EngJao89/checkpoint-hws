import UIKit
import Foundation

enum SquareRootError: Error {
    case outOfBounds
    case noRoot
}

func integerSquareRoot(of number: Int) throws -> Int {
    guard number >= 1 && number <= 10_000 else {
        throw SquareRootError.outOfBounds
    }
    
    for i in 1...100 {
        let square = i * i
        if square == number {
            return i
        } else if square > number {
            break
        }
    }
    
    throw SquareRootError.noRoot
}

// Testando a função
let testNumbers = [9, 25, 50, 100, 10_000, 10_001, 0]

for num in testNumbers {
    do {
        let result = try integerSquareRoot(of: num)
        print("A raiz quadrada inteira de \(num) é \(result)")
    } catch SquareRootError.outOfBounds {
        print("Erro: \(num) está fora dos limites permitidos.")
    } catch SquareRootError.noRoot {
        print("Erro: \(num) não tem uma raiz quadrada inteira.")
    } catch {
        print("Erro desconhecido para \(num).")
    }
}

