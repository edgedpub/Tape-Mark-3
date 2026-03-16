var words = ["WEAVE", "AND", "UNWEAVE", "THIS", "LIFE"];

// Note that while the following function produces all permutations,
// it does not produce them in the same order that Gysin & Sommerville
// did! Feel free to improve it...
function all_permutations(input) {
  // Thanks to user delimited on StackOverflow
  "use strict";
  var result = [];
  function permute(elements, data) {
    var current,
      memo = data || [];
    for (var i = 0; i < elements.length; i++) {
      current = elements.splice(i, 1)[0];
      if (elements.length === 0) {
        result.push(memo.concat([current]));
      }
      permute(elements.slice(), memo.concat([current]));
      elements.splice(i, 0, current);
    }
    return result;
  }
  return permute(input);
}
function display_permutations() {
  "use strict";
  var last,
    text = "",
    permutations,
    i,
    j,
    main = document.getElementById("main");
  last = document.createElement("div");
  permutations = all_permutations(words);
  for (i in permutations) {
    for (j in permutations[i]) {
      text = text + permutations[i][j] + " ";
    }
    text = text + "<br />";
  }
  last.innerHTML = text;
  main.appendChild(last);
}
