# McCulloch-Pitts Neuron
During the part about learning and plasticity, we already saw the perceptron. Another name for this is the **McCulloch & Pitts Neuron** (can be used interchangeably with perceptron in this section). Such a neuron consists of $x_1, ..., x_n$ inputs that each have a weight $w_1, ..., w_n$, additionally there is a bias $b$. When the summation of these reaches a certain threshold $\theta$ the neuron turns on *(we always talk about 0 as off and 1 as on)*. 

![[mcculloch_pitts_neuron.png]]

Our basic model often works with a threshold of $\theta = 1$, meaning the neuron is on if the summation is $\geq 1$ and off is the summation is $< 1$ 

A Perceptron can implement a ***linear decision boundary*** (imagine a line in 2D space), but it can not implement non linear decision boundaries (for example a circle). With such neurons, we can compute some basic functions like AND, OR, NOT. But we have already stated that there are unsolvable problems (example XOR).

![[unsolvable_perceptron.png]]

## Perceptron Learning Algorithm
We want to find a way to automatically find the weights. This method exists and is called the **Perceptron Learning Algorithm**.

```python
# Perceptron Learning Algorithm
# -----------------------------

P <- inputs with label 1
N <- inputs with label 0

# Initialize the weights w = {w_1, ..., w_n, w_b}
Initialize the weights w randomly 

# Try all input patterns x = {x_1, ..., x_n, b} and if they 
# give the wrong output adjust the weights.
while not convergence do:
	Pick random x in (P u N)
	
	if x in P and output(x, w) < 0:
		w = w + x
	if x in N and output(x, w) >= 0:
		w = w - x
```

Note that the input for the bias is always 1 ($b=1$). This algorithm will always find a solution for solvable problems. We proved this based on these two facts:
- The weight vector has to increase linearly in magnitude in the long run
- The squared magnitude of the weight vector can increase at most linearly

We could plot this and then would see that our algorithm has to terminate after a finite amount of steps.