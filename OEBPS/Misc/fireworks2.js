try {
  //provo a controllare se il lettore è quella accozzaglia di dati che e' ade
  var lettore = navigator.epubReadingSystem.name;
  var adobeChiavicaMaledetta = "RMSDK";
  if (lettore == adobeChiavicaMaledetta) {
    //controllo

    document.getElementsByTagName("div")[0].className = "content";
    document.getElementsByTagName("div")[1].className = "row";
  } ///chiudo controllo
} catch (e) {
  // chiudo il tentativo di controllare
  // se ho a che fare con un browser programmato con i piedi...
} //...e non viene riconosciuto il browser me ne sto calmo calmino

LARGO = 600;
ALTO = 700;
console.log("yes");
lento = true;
velocity = 0.004;

var spinarosa = 0;

dico = document.getElementsByClassName("invisible")[0].innerHTML;
console.log(dico);
dicente = new Array();
dicente = dico.split(" ");

document.getElementsByTagName("html")[0].addEventListener(
  "click",
  function (event) {
    event.preventDefault();
  },
  false
);

var tuttespine = Number(
  document.getElementsByClassName("invisible")[0].getAttribute("data-spine")
);

function vivo() {
  for (i = 1; i <= tuttespine; i++) {
    //console.log(tuttespine)
    //console.log(stella.length)
    stella[i].muovo();
  }
}

var Simple1DNoise = function () {
  var MAX_VERTICES = 256;
  var MAX_VERTICES_MASK = MAX_VERTICES - 1;
  var amplitude = 1;
  var scale = 1;

  var r = [];

  for (var i = 0; i < MAX_VERTICES; ++i) {
    r.push(Math.random());
  }

  var getVal = function (x) {
    var scaledX = x * scale;
    var xFloor = Math.floor(scaledX);
    var t = scaledX - xFloor;
    var tRemapSmoothstep = t * t * (3 - 2 * t);

    /// Modulo using &
    var xMin = xFloor & MAX_VERTICES_MASK;
    var xMax = (xMin + 1) & MAX_VERTICES_MASK;

    var y = lerp(r[xMin], r[xMax], tRemapSmoothstep);

    return y * amplitude;
  };

  /**
   * Linear interpolation function.
   * @param a The lower integer value
   * @param b The upper integer value
   * @param t The value between the two
   * @returns {number}
   */
  var lerp = function (a, b, t) {
    return a * (1 - t) + b * t;
  };

  // return the API
  return {
    getVal: getVal,
    setAmplitude: function (newAmplitude) {
      amplitude = newAmplitude;
    },
    setScale: function (newScale) {
      scale = newScale;
    },
  };
};

function Spina(numero, padre) {
  var generatorox = new Simple1DNoise();
  var generatoroy = new Simple1DNoise();
  this.bip1 = 1;
  this.bip2 = 10000;
  this.conto = 0;
  this.padre = padre;

  if (!stella[this.padre]) {
    this.centrox = LARGO / 2;
  } else {
    this.centrox = stella[this.padre].x;
  }
  if (!stella[this.padre]) {
    this.centroy = ALTO / 2;
  } else {
    this.centroy = stella[this.padre].y;
  }
  if (!stella[this.padre]) {
    this.fontsize = 1.8;
  } else {
    vecchiofontsize = stella[this.padre].fontsize;
    console.log(vecchiofontsize);
    this.fontsize = vecchiofontsize / 1.5;
    console.log(this.fontsize);
  }

  this.x = generatorox.getVal(this.bip1) * LARGO;
  this.y = generatoroy.getVal(this.bip2) * ALTO;
  this.numero = numero;
  this.riga = function () {
    corpo = document.getElementById("rose");
    fine = document.getElementById("centro");
    riga = document.createElementNS("http://www.w3.org/2000/svg", "line");
    x1 = document.createAttribute("x1");
    x1.value = this.centrox;
    riga.setAttributeNode(x1);
    y1 = document.createAttribute("y1");
    y1.value = this.centroy;
    riga.setAttributeNode(y1);
    y2 = document.createAttribute("y2");
    y2.value = this.y;
    riga.setAttributeNode(y2);
    x2 = document.createAttribute("x2");
    x2.value = this.x;
    riga.setAttributeNode(x2);
    stroke = document.createAttribute("stroke");
    stroke.value = "black";
    riga.setAttributeNode(stroke);
    id = document.createAttribute("id");
    id.value = "spina" + this.numero;
    riga.setAttributeNode(id);
    strokew = document.createAttribute("stroke-width");
    strokew.value = "0.5";
    riga.setAttributeNode(strokew);
    //console.log(riga);
    corpo.insertBefore(riga, fine);

    label = document.createElementNS("http://www.w3.org/2000/svg", "text");
    ly = document.createAttribute("y");
    ly.value = this.y;
    label.setAttributeNode(ly);
    lx = document.createAttribute("x");
    lx.value = this.x;

    label.setAttributeNode(lx);
    label.textContent = dicente[spinarosa];
    spinarosa += 1;
    if (spinarosa == dicente.length) {
      spinarosa = 0;
    }
    console.log(spinarosa, " - ", dicente.length - 1);
    pungo = document.createAttribute("id");
    pungo.value = "pungo" + this.numero;
    label.setAttributeNode(pungo);
    fonto = document.createAttribute("style");
    fonto.value = "font-family:sans-serif;";
    label.setAttributeNode(fonto);

    fontd = document.createAttribute("font-size");
    fontd.value = this.fontsize;
    label.setAttributeNode(fontd);

    corpo.insertBefore(label, fine);
    ora = this.numero;

    document.getElementById("pungo" + ora).addEventListener(
      "click",
      (function (index) {
        return function () {
          tuttespine += 1;

          stella[tuttespine] = new Spina(tuttespine, index);
          stella[tuttespine].riga();
          //alert ("pungo"+index);
        };
      })(ora)
    );
  }; //fine funzione riga

  this.muovo = function () {
    this.bip1 = this.bip1 + velocity;
    this.bip2 = this.bip2 + velocity;
    //console.log(stella[this.padre].padre)
    this.x = generatorox.getVal(this.bip1) * LARGO;
    this.y = generatoroy.getVal(this.bip2) * ALTO;
    //if (this.conto>10) {this.conto=0}
    //if (Math.floor(Math.random() * 1000) == 1) {this.conto+=1}
    document.getElementById("spina" + this.numero).setAttribute("x2", this.x);
    document.getElementById("spina" + this.numero).setAttribute("y2", this.y);
    document
      .getElementById("spina" + this.numero)
      .setAttribute("x1", stella[this.padre].x);
    document
      .getElementById("spina" + this.numero)
      .setAttribute("y1", stella[this.padre].y);
    document.getElementById("pungo" + this.numero).setAttribute("x", this.x);
    document.getElementById("pungo" + this.numero).setAttribute("y", this.y);
    //document.getElementById("pungo"+this.numero).textContent=thorn[this.numero][this.conto];
  };
}

var stella = new Array();
stella[0] = new Spina(0, -1);
stella[0].x = LARGO / 2;
stella[0].y = ALTO / 2;
stella[0].fontsize = 40;

for (i = 1; i <= tuttespine; i++) {
  stella[i] = new Spina(i, 0);
  stella[i].riga();
  //console.log(i);
}

document.getElementById("centro").addEventListener("click", function () {
  if (lento) {
    velocity = 0.1;
    lento = false;
  } else {
    velocity = 0.004;
    lento = true;
  }
});

//for (a=0; a<tuttespine; a++)
//        {
//            //document.getElementById("pungo"+a).addEventListener("click", function(){alert(a)})
//            document.getElementById("pungo"+a).addEventListener("click",  (function(index){
//                return function(){
//                    alert ("pungo"+index);
//                                }
//                                                                                            }
//                                                                                        )(a)  );
//        }

setInterval(vivo, 16);

/*var w = window.innerWidth
|| document.documentElement.clientWidth
|| document.body.clientWidth;
var h = window.innerHeight
|| document.documentElement.clientHeight
|| document.body.clientHeight;

*/
