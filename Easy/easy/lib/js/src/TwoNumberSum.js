// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var $$Array = require("rescript/lib/js/array.js");
var Caml_array = require("rescript/lib/js/caml_array.js");

function twoNumberSum(inArray, targetNum) {
  var $$break = false;
  $$Array.sort((function (a, b) {
          return a - b | 0;
        }), inArray);
  var left = 0;
  var right = inArray.length - 1 | 0;
  while(left < right && $$break !== true) {
    var arrLeft = Caml_array.get(inArray, left);
    var arrRight = Caml_array.get(inArray, right);
    var currentSum = arrLeft + arrRight | 0;
    if (currentSum === targetNum) {
      console.log([
            arrLeft,
            arrRight
          ]);
      $$break = true;
    }
    if (currentSum < targetNum) {
      left = left + 1 | 0;
    }
    if (currentSum > targetNum) {
      right = right + 1 | 0;
    }
    
  };
  return [];
}

var testArr = [
  3,
  5,
  -4,
  8,
  11,
  1,
  -1,
  6
];

twoNumberSum(testArr, 10);

var testTarget = 10;

exports.twoNumberSum = twoNumberSum;
exports.testArr = testArr;
exports.testTarget = testTarget;
/*  Not a pure module */
