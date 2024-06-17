import Foundation

func generateRandomNumber() -> [Int] {
    var numbers = [Int]()
    while numbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if !numbers.contains(randomNumber) {
            numbers.append(randomNumber)
        }
    }
    return numbers
}

func calculateResult(userInput: [Int], randomNumber: [Int]) -> (strikes: Int, balls: Int) {
    var strikes = 0
    var balls = 0
    
    for i in 0..<userInput.count {
        if userInput[i] == randomNumber[i] {
            strikes += 1
        } else if randomNumber.contains(userInput[i]) {
            balls += 1
        }
    }
    
    return (strikes, balls)
}

func playNumberBaseballGame() {
    print("숫자 야구 게임을 시작합니다!")
    
    let randomNumber = generateRandomNumber()
    var gameOver = false
    
    while !gameOver {
        print("3개의 숫자를 입력하세요 (1에서 9까지의 숫자, 중복 없음):", terminator: " ")
        if let input = readLine(), input.count == 3 {
            let userInput = input.compactMap { Int(String($0)) }
            
            if userInput.count == 3 && Set(userInput).count == 3 {
                let result = calculateResult(userInput: userInput, randomNumber: randomNumber)
                
                print("스트라이크: \(result.strikes), 볼: \(result.balls)")
                
                if result.strikes == 3 {
                    print("축하합니다! 정답을 맞추셨습니다!")
                    gameOver = true
                }
            } else {
                print("잘못된 입력입니다. 1에서 9까지의 숫자를 중복 없이 입력하세요.")
            }
        } else {
            print("잘못된 입력입니다. 3자리 숫자를 입력하세요.")
        }
    }
    
    print("게임 종료!")
}

playNumberBaseballGame()

