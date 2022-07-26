let print = text => {
  Js.log(text)
}

type numMap = {
  mutable number: int,
  mutable isTrue: bool,
}

let twoNumberSum = (intArray: array<int>, targetNum): array<int> => {
  let nums: numMap = {
    number: 0,
    isTrue: false,
  }
  let sorted = Js.Array2.sortInPlace(intArray)
  let arrayLength = Array.length(sorted)

  for i in 0 to arrayLength {
    let currentNum = sorted[i]
    let potentialMatch = targetNum - currentNum
    // match against inclusion
    if Js.Array.includes(potentialMatch, sorted) {
      [potentialMatch, currentNum]
    } else {

    }
  }
  [0, 0]
}

let testTarget = 10
let testArray = [3, 5, -4, 8, 11, 1, -1, 6]

let doesTestPass = twoNumberSum(testArray, testTarget) == [-1, 11]

switch doesTestPass {
| true => print("test passed")
| false => print("test failed")
}
