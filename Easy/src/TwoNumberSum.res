let twoNumberSum = (inArray, targetNum) => {
  let break = ref(false)
  Array.sort((a, b) => a - b, inArray)
  let left = ref(0)
  let right = ref(Array.length(inArray) - 1)

  while left.contents < right.contents && break.contents != true {
    let arrLeft = inArray[left.contents]
    let arrRight = inArray[right.contents]

    let currentSum = arrLeft + arrRight

    if currentSum == targetNum {
      Js.log([arrLeft, arrRight])
      break := true
    }

    if currentSum < targetNum {
      left := left.contents + 1
    }

    if currentSum > targetNum {
      right := right.contents + 1
    }
  }
  []
}

let testArr = [3, 5, -4, 8, 11, 1, -1, 6]
let testTarget = 10

let _ = twoNumberSum(testArr, testTarget)
