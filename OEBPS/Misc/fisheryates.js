///gsap.registerPlugin(MotionPathPlugin);

function fisherYatesShuffle(array) {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [array[i], array[j]] = [array[j], array[i]];
  }
  return array;
}

// Function to display the first 17 verses
function displayInitialVerses() {
  const verses = Array.from(document.querySelectorAll(".verse"));
  for (let i = 0; i < 17; i++) {
    verses[i].style.display = "block";
  }
}

function shuffleVerses() {
  const verses = Array.from(document.querySelectorAll(".verse"));
  const visibleVerses = verses.filter((v) => v.style.display === "block");

  // Shuffle the list of verses
  const shuffledVerses = fisherYatesShuffle(verses);

  // Reset visibility for all verses
  verses.forEach((verse) => {
    verse.style.display = "none";
  });

  // Get the first 17 verses from the shuffled array and make them visible
  for (let i = 0; i < 17; i++) {
    shuffledVerses[i].style.display = "block";
  }

  // Animate transition from the positions of previous visible verses to the new positions
  for (let i = 0; i < 17; i++) {
    const verse = shuffledVerses[i];
    const initialRect = visibleVerses[i].getBoundingClientRect();
    const finalRect = verse.getBoundingClientRect();
    const dx = initialRect.left - finalRect.left;
    const dy = initialRect.top - finalRect.top;
  }
}

// Call the function to display the first 17 verses when the page loads
displayInitialVerses();

// Listen for clicks on the shuffle button
document
  .getElementById("shuffle-button")
  .addEventListener("click", shuffleVerses);

// Set an initial background color
document.getElementById("animated-bg").style.background =
  "linear-gradient(0deg, rgba(205, 237, 246, 1) 0%, rgba(36, 123, 160, 1) 100%)"; // same background colors used below in GSAP timeline;

// Create sun and moon elements
const sun = document.createElement("div");
const animatedBg = document.getElementById("animated-bg");

sun.id = "sun";

animatedBg.appendChild(sun);
// Style sun element with CSS
// we set the z-index of the sun to -2 because the z-index of the animated-bg is set to -1 (to be behind everything else on the page)
const css = `
    #sun {
        position: absolute;
        background-color: yellow;
        width: 100px;
        height: 100px;
        border-radius: 50%;
        z-index: -2; 
    }
`;

// Function to update the position of the sun
function updatePosition(element, angle) {
  const centerX = window.innerWidth / 2;
  const centerY = window.innerHeight; // Bottom of the window
  const a = centerX; // Semi-major axis
  const b = window.innerHeight / 2; // Semi-minor axis
  const x = centerX + (a + 100) * Math.cos(angle); // this is the position of the sun on the horizontal axis;
  const y = centerY - (b + 600) * Math.sin(angle) - 200; // Minus sign to invert the y-axis; this is the position of the sun on the vertical axis;
  gsap.set(element, { x: x - 50, y: y - 50 }); // Adjusting by 50 to account for sun size
}

// Function to start the animation
function startAnimation() {
  // Disable the button
  const button = document.getElementById("shuffle-button");
  button.disabled = true;

  // Set initial position of the sun
  const centerX = window.innerWidth / 2;
  const centerY = window.innerHeight; // Bottom of the window
  const a = centerX; // Semi-major axis
  const x = centerX + a * Math.cos((3 * Math.PI) / 2);
  const y = centerY - (window.innerHeight / 2) * Math.sin((3 * Math.PI) / 2); // Minus sign to invert the y-axis
  gsap.set("#sun", { x: x - 50, y: y - 50, visibility: "visible" }); // Adjusting by 50 to account for sun size

  const styleSheet = document.createElement("style");
  // styleSheet.type = "text/css";
  styleSheet.innerText = css;
  document.head.appendChild(styleSheet);

  // GSAP timeline
  const timeline = gsap
    .timeline()
    .set("#sun", { visibility: "visible" }) // this makes the sun appear only when the animation starts; the # means id;
    .add([
      gsap.to("#animated-bg", {
        background:
          "linear-gradient(0deg, rgba(254, 215, 102, 1) 0%, rgba(205, 237, 246, 1) 100%)", // how background-colors change; from bright blue to dawn,
        duration: 10,
      }),
      gsap.to(
        {},
        {
          duration: 20,
          onUpdate: function () {
            const angle = (3 * Math.PI) / 2 - this.progress() * 2 * Math.PI; // Adjusted angle
            updatePosition(sun, angle);
          },
          onComplete: function () {
            // Re-enable the button
            button.disabled = false;
          },
        }
      ),
    ])
    .to("#animated-bg", {
      background:
        "linear-gradient(0deg, rgba(205, 237, 246, 1) 0%, rgba(36, 123, 160, 1) 100%)", // how background-colors change; from dawn to late noon,
      duration: 10,
    });
}

// // Update the timelines whenever the window is resized
// window.addEventListener("resize", () => {
//   sunTimeline.restart();
//   moonTimeline.restart();
//   bgColorTimeline.restart();
// });

// Event listener for the button
document.getElementById("shuffle-button").addEventListener("click", () => {
  startAnimation();
});


