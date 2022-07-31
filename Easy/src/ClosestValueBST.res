type rec bst = {
  mutable value: int,
  left: option<bst>,
  right: option<bst>,
}

open Belt
let rec findClosestValue = (tree, target, closest: int): int => {
  let current = ref(tree.value)
  let closeKeeper = ref(closest)

  if Js.Math.abs_int(target - closest) > Js.Math.abs_int(target - tree.value) {
    closeKeeper := tree.value
  }

  let res = switch true {
  | true if target < tree.value && Option.isSome(tree.left) =>
    findClosestValue(Option.getExn(tree.left), target, closest)
  | true if target > tree.value && Option.isSome(tree.right) =>
    findClosestValue(Option.getExn(tree.left), target, closest)
  | true if tree.value == target =>
    closest
    _ => -1
  }
  res
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

findValue(testTree, testTarget)->Js.log
