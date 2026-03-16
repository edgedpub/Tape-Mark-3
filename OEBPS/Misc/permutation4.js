var t = 0,
  adjectives = [
    "INDEFFERENT",
    "OMNIPOTENT",
    "SECRET",
    "RIGID",
    "LAST",
    "GLASSY",
    "ARID",
    "DRUNKEN",
    "USUAL",
    "LATE",
  ],
  nouns = [
    "STREETS",
    "SUNSET",
    "TIME",
    "ONE",
    "RULES",
    "MEASURE",
    "SHADOWS",
    "DREAMS",
    "FORMS",
    "LIFE",
    "END",
    "RATE",
    "HOUSE",
    "MORNING",
    "MIRACLE",
    "NOTHINGNESS",
    "EMPTINESS",
    "TERROR",
    "SCREEN",
    "TREES",
    "HOUSES",
    "HILLS",
    "DECEPTION",
    "MEN",
    "SECRET",
  ],
  verbs = [
    "PLUNGE",
    "MUST",
    "KNOW",
    "HAVE",
    "WALKED",
    "GUESSING",
    "SUBJECTING",
    "PREDETERMINES",
    "WEAVE",
    "UNWEAVE",
    "IS",
    "FORGETTING",
    "TELL",
    "KNOWING",
    "HAVE",
    "SAID",
    "GOING",
    "LOOKING",
    "SEE",
    "TAKE PLACE",
    "RISE",
    "BE",
    "GO",
  ];

  function rand_range(maximum) {
    return Math.floor(Math.random() * (maximum + 1));
}
function choose(array) {
    return array[rand_range(array.length - 1)];
}
function line() {
    return choose(adjectives) + ' ' + choose(nouns) + ' ' +
        choose(verbs) + ' THE ' + choose(nouns);
}
function litany() {
    var last, text, main = document.getElementById('main');
    if (25 > t) {
        t += 1;
    } else {
        main.removeChild(document.getElementById('main').firstChild);
    }
    last = document.createElement('div');
    last.innerHTML = line();
    main.appendChild(last);
}
function produce_litany() {
    "use strict";
    litany();
    setInterval(litany, 2000);
}