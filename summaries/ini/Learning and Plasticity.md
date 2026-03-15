# Learning and Plasticity
Connection in the human brain are mostly learned, it would be almost impossible to encode all these connections in our DNA. This is important, since it has been shown that with learning one achieves better performance compared to having it encoded in our DNA. Learning is the source where intelligent behaviour emerges.

## Defining learning / plasticity
**Learning** it the acquisition / storage of knowledge or the formation of a memory through experience.

**Memory** is stored information that can be recalled at a later stage.

**Plasticity** is the biological implementation of learning, it allows us to form a memory.

In neuroscience we differentiate different types of learning:
- Pavlovian Conditioning
- Instrumental Conditioning
- Reward / Aversive Learning
- Social Learning
- Perceptual Learning
- Motor Learning

There are also many ways to categorize types of memory, e.g. emotions, motor skills, language, etc. Psychological we can put them into two categories:
- explicit (declarative) - facts, events
- implicit (nondeclarative) - priming, skills, emotional responses

### Timescales of Neuronal Plasticity

![[memory_over_time.png]]

Memory is not fixed to a location in the brain. As memories go from short-term to long-term, they change the location.

## Substrates of Plasticity
This part is about how learning happens in the brain, starting at a high level and going down to a lower level.

On the highest level, the brain uses the hippocampus to learn explicit knowledge. While the hippocampus does not store this longterm memory, it is needed to form it. 

![[hippocampus_learning.png]]

### Perceptron Learning
On a cellular level, we need to talk about perceptron learning. This is also important for training deep neural networks. A neuron implementing perceptron learning is called a **Perceptron** or a **[[McCulloch-Pitts Neuron]]**.

![[mcculloch_pitts_neuron.png]]

A Perceptron can implement a ***linear decision boundary*** (imagine a line in 2D space), but it can not implement non linear decision boundaries (for example a circle).

### Short-term Plasticity
Paired activations of a synapses (with delay of 10 to 100ms) increases the probability of release.

### LTP and LTD
**Long Term Potentiation**:
- short but high frequency stimulation
- causes long term synaptic strengthening
- last from 30min to several hours, for longer lasting effect protein synthesis is required

**Long Term Depression**:
- long but low frequency stimulation
- causes long term synaptic depression

Together LTP and LTD act to change information coding and to implement new memories in the brain. **Spike-timing-dependent plasticity** (STDP) is another process believed to arise from the same mechanisms governing LTP and LTD.

### Synaptic Plasticity
We look at synapses that have Glutamate or GABA as neurotransmitter. On the post-synaptic terminal we then encounter AMPA and NDMA receptors. After undergoing LTP the synapse has increased an amount of vesicles and AMPA receptors (synaptic density). This changes the AMPA / NMDA ratio. Then on the very long term, the number of spines change (1 -> 2 synapses).

![[synaptic_plasticity_ltp.png]]

On the other hand LTD works as follows, note that NMDA receptors are required:

![[synaptic_plasticity_ltd.png]]

The role of calcium in LTP / LTD:

![[synaptic_plasticity_calcium.png]]

This synaptic plasticity is the main idea of Hebbian learning. 

![[hebbian_learning.png]]

