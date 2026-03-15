# Hopfield Network
A **hopfield network** consists of multiple [[McCulloch-Pitts Neuron]] that are fully connected (all to all). This would be an example of a network with 4 units:

![[hopfield-net-vector.svg.png|300]]

Hopfield networks serve as **content-addressable ("associative") memory**, therefore providing a model for understanding human memory and hebbian learning. Some basic rules for these type of networks:
- connections are symmetric: $w_{i,j} = w_{j,i} \Rightarrow$ symmetric weight matrix
- no self-weights
- we can use either 0 / 1 or -1 / +1 as outputs (we use 0 / 1)

To get an output, we first need to set the input (initial state) of some of the units and then update the units until we reach a stable state. This stable state will depend on the update order. Note that for asynchronous updates a network will always converge to a stable state! The proof is based on the fact, that the sum of the weights of the active units will always stay the same or increase. 

We can think of all the stable states of a network to be the memory. As the stable states will be close to the initial state.

## Updating
A unit updates how we described it in the part about [[McCulloch-Pitts Neuron]], but then the question arises how do we proceed if multiple units want to update. We have two different approaches:
- **asynchronous** - only one unit updates at a time, this unit can be randomly picked or there can be a pre-defined order
- **synchronous** - all units update at the same time / in parallel 

>Note that asynchronous updating can be view as a **greedy max-clique algorithm** for 0 / 1 or as **greedy min-cut algorithm** for -1 / +1.

### Synchronous updating
We have seen that a network might not converge to a stable state when we use synchronous updating. We can analyze the network by thinking of it in terms of single-unit updates in a network twice as big.

For this we introduce an intermediary node after each existing node. Therefore in one time-step, the update first propagates to these new node, before it propagates further in the next time-step. In this larger network we update asynchronously and therefore it will converge to a stable state. 

If the original network converges to a stable state, the large network will have the same values for the old and new node. If this is not the case, the original network will converge to a pair of states, where the old nodes are the first state and the new nodes are the second state (the network alternates between them).

## Bias
To include the bias in the network, we can add a new unit that is always on and never gets updated. From there we work with the same rules as before.

## Setting the weights
Given a list of desired stable states, we can set the weight between two units according to their correlation in the listed states. If the are the same we use 1, if the are the opposite of each other we use -1 and if they do not correlate, we use 0 as the weight.