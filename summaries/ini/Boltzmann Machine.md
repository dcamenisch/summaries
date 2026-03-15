# Boltzmann Machine
A Boltzmann Machine is a probabilistic version of a [[Hopfield Network]] with -1 / +1 outputs. The structure of the network is the same as a hopfield network, but when we update a unit, we consider the energy of the system. We define the total energy as:
$$E = -\Big(\sum_{i,j} w_{i,j} x_i x_j + \sum_i w_i x_i\Big)$$
The second term represents the biases, while the first term represents the inter-unit connections.

In such a Boltzmann machine the probability of a state $s$ is proportional to $e^{\frac{-E_s}{tk}}$, where $E_s$ is the energy of the state, $t$ is the temperature and $k$ is the Boltzmann's constant. Since we are not interested in the temperature, we can ignore the bottom part of the fraction.

Generally we can say that states with lower energy are preferable and the systems spends more time in such states.

## Updating a unit
Say we are in a given state $s$ and we want to update a unit $k$. We compare the current state with the state that we would enter if we flipped this single unit. Here we assume that we are currently in the positive output state.
$$\frac{P(s_+)}{P(s_+) + P(s_-)} = \frac{e^x}{e^x + 1}$$
where $x = (-2\sum_i w_{k,i} x_i + 2 w_k)/(kt)$.

## State of the system
Now we don't have stable states, the system is always "working". When updating the state, we travel across the state space according to the relative probability. We choose between 2 states based on their relative probability, this is a form of **Gibbs sampling**. The system **converges to the right distribution** (time it spends in each state) in the same way that connecting chambers (2 at a time) will lead to gas reaching equilibrium. 

## Training a Boltzmann machine
With learning, we can learn to approximate a distribution. For this we use the Kullback-Leibler divergence:
$$KL = \sum_s P^*(s) \ln\frac{P^*(s)}{P^n(s)}$$
where $P^*$ is the true distribution and $P^n$ is the machine's distribution. This divergence is 0 if the two distributions match. To update the weights to get our machine closer to the distribution we want, we use gradient descent, where we update like this:
$$w_{i,j} \text{ += } \alpha (E[x_i x_j]_* - E[x_i x_j]_n)$$
$$w_i \text{ += } \alpha (E[x_i]_* - E[x_i]_n)$$
The first term corresponds to Hebbian learning, while the second term is anti Hebbian learning. The first term is useful for learning while the second one destroys the bad learning. This is also called a **Wake / Sleep** algorithm. 

>In reality Boltzmann machines are very slow to learn and therefore they do not get used.

There are some approaches to make the Boltzmann machine faster: 
- Restricted Boltzmann machine - we split the units into input and internal in the form of a bipartite graph
- Mean-field approximation - deterministic system with real-valued output (expected value of output)