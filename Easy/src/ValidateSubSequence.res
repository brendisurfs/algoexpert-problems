open Js.Array

let validateSub = (arr, seq) => {
  let arrPtr = ref(0)
  let seqPtr = ref(0)

  while arrPtr.contents < Array.length(arr) && seqPtr.contents < Array.length(seq) {
    switch arr[arrPtr.contents] == seq[seqPtr.contents] {
    | true => incr(seqPtr)
    | false => incr(arrPtr)
    }
  }
  seqPtr.contents == Array.length(seq)
}

let testArr = [5, 1, 22, 25, 6, -1, 8, 10]
let testSeq = [1, 6, -1, 10]

let res = validateSub(testArr, testSeq)
Js.log(res)
