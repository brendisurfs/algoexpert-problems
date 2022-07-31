type rec bst = {
  mutable value: int,
  left: option<bst>,
  right: option<bst>,
}

open Belt
let rec findClosestValue = (tree, target, closest) => {
  let closeKeeper = ref(closest)
  let current = ref(tree.value)

  if Js.Math.abs_int(target - closest) > Js.Math.abs_int(target - tree.value) {
    closeKeeper := tree.value
  }
  if target < tree.value && Option.isSome(tree.left) {
    let res = findClosestValue(Option.getExn(tree.left), target, closeKeeper.contents)
    res
  }
}

let findValue = (tree, target) => {
  findClosestValue(tree, target, tree.value)
}

let testTree = {
  value: 10,
  left: Some({
    value: 15,
    left: None,
    right: None,
  }),
  right: Some({
    value: 8,
    left: None,
    right: None,
  }),
}

let testTarget = 10

findClosestValue(testTree, testTarget, testTree.value)->Js.log
