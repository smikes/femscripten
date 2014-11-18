// test file for native-fortran-addon
var assert = require("assert");
var times = require("./build/Release/times");

var result = times.times(2.0, "3");

assert.equal(6, result);

console.log("Expected 6, got " + result);
