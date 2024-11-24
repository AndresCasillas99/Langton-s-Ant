# Langton's-Ant
Langton's ant is a two-dimensional Turing machine with a very simple set of rules but complex emergent behavior. I present a code made in Processing.

Squares on a plane are colored variously either black or white. We arbitrarily identify one square as the "ant". The ant can travel in any of the four cardinal directions at each step it takes. The "ant" moves according to the rules below:

<ul>
<li>At a white square, turn 90 degrees clockwise, flip the color of the square, move forward one unit</li>
<li>At a black square, turn 90° counter-clockwise, flip the color of the square, move forward one unit</li>
</ul>

Langton's ant can also be described as a cellular automaton, where the grid is colored black or white and the "ant" square has one of eight different colors assigned to encode the combination of black/white state and the current direction of motion of the ant.

### Why is it interesting?

These simple rules lead to complex behavior. Three distinct modes of behavior are apparent, when starting on a completely white grid.
<ol>
  <li> Simplicity: During the first few hundred moves it creates very simple patterns which are often symmetric.</li>
  <li> Chaos: After a few hundred moves, a large, irregular pattern of black and white squares appears. The ant traces a pseudo-random path until around 10,000 steps.</li>
  <li>Emergent order: Finally the ant starts building a recurrent "highway" pattern of 104 steps that repeats indefinitely.</li>
</ol>

All finite initial configurations tested eventually converge to the same repetitive pattern, suggesting that the "highway" is an attractor of Langton's ant, but no one has been able to prove that this is true for all such initial configurations. It is only known that the ant's trajectory is always unbounded regardless of the initial configuration – this is known as the Cohen-Kong theorem.

### How does the program work?

Simply press the space bar to assign the ant randomly and watch its evolution. By clicking on any square you change its state.
