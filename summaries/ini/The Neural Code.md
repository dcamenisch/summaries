# The Neural Code
We want to have a look at how information is encoded in the brain. When considering a code, it is important to think about three elements:
- Correspondence - a code is a correspondence between two domains, e.g. visual signals and spike trains
- Representation - how is a code represented
- Causality - a code needs to be a causal relation

We want to learn how to encode a stimulus - how does the pattern of response look like - and how to decode - what does the response tell us about the stimulus.

To understand neuronal responses, one often measures neuronal activity, depending on a parameter of the stimulus. Example:

![[direction_encoding_cat.png]]

We have seen many different examples of encoding, one of the most interesting ones was about the encoding of space via hippocampal place cells in rats.

![[space_encoding_rats.mp4]]

What one can see here is how different neurons are active, when the rat is in a specific position.

## Rate Code vs Temporal Code
**Rate coding** refers to information being carried by the firing rate. It is often argues that ***firing rate captures essentially all relevant information***.

**Temporal coding** on the other hand may refer to several quite different ideas: 
1. much of the information may be transmitted by a neuron during certain small intervals of time (phase)
2. synchronous, or what one could call quasi-synchronous, firing of neurons within and across ensembles may carry important information (synchrony)
3. the precise timing, or pattern, of spikes may carry information (time to first spike)

![[rate_coding_temporal_coding.png]]

Often information that one sees in one encoding, can also be seen in the other encoding.

## How to investigate the stimulus encoding
We want to find out how we can model a relation of the stimulus to the firing rate of a neuron.

![[stimulus_encoding.png|600]]

We have to consider that there are many factors like noise or recurrent / network effects, that make it almost impossible to find an accurate relation.

### Linear Temporal Filter
The simplest possible relation is a so called linear temporal filter given by the convolution of $s$ and $f$:
$$r(t) = (s \ast f)_t =\sum_{k = 0}^n s_{t-k}f_k$$
Examples:
- running average filter - average over last n time points
- leaky average filter - average over last n time points where recent time points are weighted more

### Linear Spatial Filter
Another possible relation is a linear spatial filter (e.g. visual signals):
$$r(t) = \sum_{x' = 0, y'=0}^n s_{x-x', y-y'} f_{x', y'}$$
Clearly we can combine these two types of filters into one.

### Nonlinearity
We have some problems, spike rates can't be negative, spike rates can't increase indefinitely, etc. Therefore we have to combine this linear filter with a sigmoid function.

![[nonlinearity_filters.png]]

## Population Activity
Normally this linear filter and nonlinear sigmoid function are not known. We only know the high-dimensional data that results in a low-dimensional neuronal firing. We therefore are interested in how a whole population of neurons behave. (Nowadays a single probe can record the activity of up to 1'000'000 neurons)

>Population coding refers to information available from an ensemble of neurons.

### Finding the mean population response vector
We measure the spiking activity given by combination of features. In the diagram, we plot a stimulus as blue if it causes a spike and red if it doesn't.

![[population_response_vector.png]]

The blue vector is then the so called response vector, it connects the mean of the baseline with the mean of the spike cluster. With this we can project a stimuli in the direction of neuronal response and determine if it will cause a spike or not, depending on with side of the decision boundary it lies.

![[population_responce_projection.png]]

### Finding the I/O function
The I/O function is given by:
$$P(\text{spike} | \text{stimulus}) = P(\text{spike}|s_1)$$
which can be found from data using the Bayes rule. If the probability of a stimulus is the same as the probability of a stimulus given a spike, we can say that they are unrelated. If however these are not the same, we found a criteria for the I/O function.

### Population Distance Metrics
Given multiple neurons: 

![[population_distances_1.png]]

![[population_distances_2.png]]

