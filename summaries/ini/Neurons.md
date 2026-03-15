# Neurons
Cells that make up the [[Brain]]. These are very similar between different species. Certain types of neurons occur in specific parts of the brain, this is consistent between species. A neuron can be thought of as a processing unit that receives electrical input (dendrites) and generates electrical output (axon). Communication between neurons happen through [[Synapses]], in a directed way (pre -> post). This can cause a long effect called learning through spikes or acrion potential.

There are over 100 types of neurons. We looked at two ways of classifying them:
- morphology: how the look
- electrophysiological profile: how they work

## Anatomy
There might be a lot of different types of neurons, but the all consist of the same parts:

![[neuron_overview.png]]

- membrane - separating inside from outside
- soma - cell body, contains nucleus and organelles
- dendrites - connect to soma and provide inputs
- axons - connect to soma and conducts away from it, often myelinated and end in synapses, carry output
- [[Synapses]] - pre / post synaptic terminals, transmit information between neurons (about 10'000 per neuron)

### Dendrites
Dendrites can be seen as the input of the neuron. The electrical signal arrives at the dendrite. Can connect to many different synapses.

### Soma
Cell body of the neuron. Here the electrical signal from the dendrites arrive and are "added up". If the activation threshold is reached, another electrical signal is sent through the axon.

### Axon
Works like a cable to transfer the electrical signal from the soma to the synapse. Since normally the this transfer would take a long time, nature has developed a solution, the myelin sheet surrounding the axon (this sheet makes the white matter white). 

### Synapse
At the synapse the electrical signal, coming from the soma via the axon, gets translated into a chemical signal. 
When a signal arrives at the synapse, vesicles release neurotransmitter into the synaptic cleft. At the other side the post-synaptic receptors receive these transmitters and react. 
We can differentiate between excitatory and inhibitory transmitter. One type of neuron only releases one of these types.

Inhibitory -> ion channels open and let negatively charges ions in
Excitatory -> ion channels open and let positively charged ions in

## Single neuron computations
Neurons are complex structures, therefore it can get really complicated to simulate them. Therefore we can have different levels of abstraction. Clearly as we simplify our model, we loose some details that can have an effect on the larger system. (e.g. back propagation in dendrites)

![[neuron_models.png]]

## Resting potentials
The **resting potential** exists due to the differences in membrane
permeabilities for potassium, sodium, calcium, and chloride ions, which in
turn result from functional activity of various ion channels, ion transporters,
and exchangers. Conventionally, resting membrane potential can be defined
as a relatively stable, ground value of transmembrane voltage in cells.

Normally the inside is about $-70mV$, while the outside is $0mV$.

### Basic components
First we need to introduce some basic components:
1. The **cell membrane**, works as a barrier and an electrical insulator between the outside and inside of the cell. The membrane contains **ionic pumps** that can move ions from one side to the other.
2. Due to the ionic pumps we achieve a **concentration gradient**, some ions are more common in the inside while others are more common on the outside.
3. Additionally we have **ionic channels** that selectively let ions through the membrane. We differentiate between active and passive channels. Passive channels are always open, while active channels can be controlled.

>Remember that the concentration wants to reach an equilibrium state! We call this **diffusion**.

The ions we looked at are:
- $K^+$ (Potassium), 
- $Ca^{2+}$ (Calcium), 
- $Cl^-$ (Chlorid), 
- $Na^+$ (Sodium).

The **resting potential** is given by the passive ion channels.

### Nernst equation 
We want to try and describe this potential difference with equations. We simplify this by looking at a single ion type, we choose potassium as it is the most common.

#### Ionic Flux
First we introduce the ionic flux and get an equation for the equilibrium $(Flux_{out \rightarrow in} = Flux_{in \rightarrow out})$:
$$Flux_{out \rightarrow in} = \gamma[K^+]_{out}$$
$$Flux_{in \rightarrow out} = \gamma [K^+]_{in} \cdot p (E_{kinetic} > |qV_{eq}|)$$
where we have the following factors:
- $p(...) =$ probability for an ions to fulfil the condition
- $\gamma =$ fraction of ions getting to channel entrances
- $q=$ elementary charge $1.6 \cdot 10^{-19}$ Coulombs
- $E_{kinetic} =$ kinetic energy (thermal motion)

#### The Boltzmann factor
$$p (E_{kinetic} > |qV_{eq}|) = e^{\frac{qV_{eq}}{k_BT}} = e^{\frac{-E}{k_BT}}$$
With the following factors:
- $E =$ Energy
- $k_B =$ Boltzmann constant
- $T =$ Temperature

#### The Nernst equation
Combining these two we end up with the following equation for the resting potential with a single ion type:
$$V_{eq} = \frac{k_B T}{zq} \ln \Big( \frac{[X]_{out}} {[X]_{in}} \Big)$$
Where $z =$ ionic charge (signed).

### Reversal potential
The **reversal potential** of an ion is the membrane potential at which there is no net flow of that particular ion from one side of the membrane to the other. In a single ion system it is synonymous with the equilibrium potential. We can describe this with a graph, where $V_{eq}$ is the reversal potential and $E_K$ is the equilibrium potential of a single ion type:

![[reversal_potential.png|500]]

Each channel type will have a different reversal potential. Assuming we now have two different channel types (i.e. different ion types). We can draw the reversal potential of both channel types and end up with the following graph:

![[multiple_reversal_potential.png|500]]

The resting potential now is in between the reversal potential of the two channels.

### Goldman-Hodgkin-Katz Equation
We now generalise this equation for channels that is accessible to multiple ion types:
$$V_{eq} = \frac{k_B T}{q} \ln \Big( \frac{P_K [K]_{out} + P_{Na} [Na]_{out} + P_{Cl} [Cl]_{in}} {P_{K}[K]_{in} + P_{Na}[Na]_{in} + P_{Cl}[Cl]_{out}} \Big)$$
where $P_X$ stands for the permeability of $X$. 

## Passive membrane
The inside of the neuron is separated from the outside by the membrane. When an electrical potential travels along the dendrites, we encounter so called leak current. This means that the electrical potential gets smaller the longer it has to travel as current escapes through the membrane. This phenomenon can be described by the cable equation. But before we get to that we first start with a simpler model, the so called **single-compartment model** of a neuron.

### Single-compartment model

![[membran_capacity.png|700]]

We end up with the following expression:
$$R_m I_e - (V - E_m) = \tau_m \frac{dV}{dt}$$
where $R_m = \frac{1}{g_m}$ is the input resistance and $\tau_m = R_m C_m$ is the membrane time constant. We can now use this equation to derive a **steady-state solution** (steady input current):
$$V_\infty = R_m I_e + E_m$$
We can now make some interesting observations, that are nicely summaries by this slide:

![[membrane_potential_observations.png]]

#### General solution
$$V(t) = V_\infty + (V(0) - V_\infty) \cdot e^\frac{-t}{\tau_m}$$
This equation describes $V$ over time, when plotting the graph we see that $V$ asymptotically gets closer to $V_\infty$ as time progresses. When looking at $\tau_m \approx 10 - 100$ms we have the following implications:
- time-scale of change in the cell is slow compared to computers
- activity gets forgotten after $\tau_m$ 
- for longer memory we need other mechanisms (e.g. plasticity)

#### Spatial and temporal summation
For a neuron to reach its activation threshold we need a certain amount of current. Looking at this equation, we can see that we have two ways of getting to this threshold:
- **Spatial summation**: multiple, simultaneous inputs adding up
- **Temporal summation**: multiple, time-delayed inputs adding up

![[neuron_summation.png]]

### Cable equation
Now we want to describe the same thing but we have to take into consideration the length / area of the dendrite. For this we use the cable equation:
$$c_m \frac{\partial}{\partial x} V = \frac{1}{2ar_L} \frac{\partial}{\partial x}\Big(a^2 \frac{\partial}{\partial x} V \Big) - i_m + i_e$$
This is a very complicated equation, for example the radius $a$ does not need to be a constant.  We want to simplify this. Assuming $a$ is constant, $v = V - E_m$ and $i_m = \frac{v}{r_m}$ (leak current), we get the linear cable equation (that we can solve analytically):
$$c_m \frac{\partial}{\partial t} v = \frac{a}{2r_L} \frac{\partial^2}{\partial x^2}v - \frac{v}{r_m} + i_e$$
We then looked at some results of the cable equation:
- ***Case 1***: *Infinite cable & constant current* - $V(x)$ decays exponentially with distance
- ***Case 2***: *Infinite cable & pulse current* - at each time $t$, $V(x,t)$ is a Gaussian

### Result
The input at the dendrite can be very large, but the fraction that reaches the soma is small. We showed that ***injecting the current into the soma directly does not make a very large difference***, as dendrites are very efficient. In total we need about **~25 inputs for a neuron to fire**.

## Action Potential
In the previous sections we have seen how inputs reach the soma. When a series of input triggers a neuron to fire, we will see an action potential propagate along the axon to the synapses. This is what we want to look at now.
Axons can be very long and therefore we need an effective way to transport this signal to the pre-synaptic terminals.

![[action_potential.png|500]]

This diagram shows an action potential. This last only 1-2ms and is an all-or-none signal. There are several phases:

1. No input, neuron is at resting potential
2. Current $I_E \Rightarrow V - V_\infty \sim \exp(-t/\tau)$  
3. $V \Rightarrow$ rapid increase in $V$
4. Peak @ $V > 0$
5. Rapid decrease in $V$
6. Undershoot: $V < V_{rest}$

The axon contains some special **voltage-dependent channels**, they change the conductance. This gives the axon its special properties.

### Voltage Clamp Experiment
These channel where found by Hodgkin and Huxley in the voltage clamp experiment. This is a technique invented by Hodgkin and Huxley to measure the current $I$ at a set voltage $V$.

![[voltage_clamp.png]]

For the experiment to work, they needed to inject a voltage $V_{set}$, further they injected a current $I_L$ to compensate for the leak current and a current $L_C$ to depolarize the membrane at the start and repolarize it at the end. 

![[voltage_clamp_data.png|400]]

They found that when setting a higher initial $I_C$, the axon first wants to depolarize and then hyperpolarize, meaning that we need to inject a lot more current than $I_L$ to keep the voltage at $V_{set}$. 
From this they hypothesised the existence of these channels and later confirmed it with similar experiments.

### Conductance
With Ohm's law we are able to obtain the conductance $g_{Na}(v,t)$ & $g_K(V,t)$. 

- $g_{Na}$ has fast activation and fast inactivation
- $g_K$ hast slow activation and no inactivation

This explain what Hodgkin and Huxley observed in their voltage clamp experiment.

Today we now that these channels are either open or closed, proven by the patch clamp experiment. As the action potential moves across the membrane, we see channels opening and closing.

![[conductance.png]]

### Hodgkin and Huxley Model
The following model accurately models these channels:

![[hodgkin_huxley_model.png|400]]

### Starting an action potential
These experiments showed that the action potential works with a positive feedback loop. At the resting potential we have $I_L$ & $I_K$ > $I_{Na}$ therefore we have no action potential. But when we start an action potential we will have $I_L + I_K = I_{Na}$ resulting in this the generation of an action potential.

This was all for unmyelinated axons. If we have myelinated axons, this process will happen at the nodes of ranvier, resulting in faster action potential propagation, smaller currents and faster $v_{AP}$ increase with radius. Making them better for longer distances.

Why does this only happen in axons?  - These channels are only present in sufficient amount in the axons.

### The big picture

![[overview_action_potential.png]]
