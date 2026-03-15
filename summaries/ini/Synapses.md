# Synapses
Synapses are the connection between [[Neurons]]. They convert the electrical signal (action potential) coming from the axons into a **chemical signal** (neurotransmitter), that is transported to the next neuron, where it again is converted into an electrical signal (excitatory or inhibitory). 

![[overview_synapses.png]]

Contrary to electrical transmission multiple steps are required to release transmitter chemicals and for them to act on postsynaptic receptors, resulting in a ***time delay*** (can be as short as 0.2ms, from Ca2+ entry to secretion). Synapses are ***highly modulatable*** as it involves many different steps at the presynaptic / postsynaptic terminal.

Synapses do not always connect to dendrites, they may also connect to other axons or the the soma of another cell.

>Synapses are not reliable, sometimes they may not transmit a signal or they might spontaneously transmit. 

## Steps to chemical synaptic transmission
- reaching of activation threshold of the presynaptic neuron
- conduct down the axon
- opening of voltage gated Ca channels
- diffusion and action of Ca2+ at release site
- exocytosis and diffusion of neurotransmitter in the synaptic cleft
- activation of postsynaptic receptors

Notice that the calcium influx is sufficient for the release of neurotransmitter.

![[chemical_synaptic_transmission.png]]

## Neurotransmitter
Neurotransmitter are **small molecules or peptides** released by the Ca2+ dependent depolarization at the presynaptic terminal. 
The mechanisms and sites of synthesis are different for the two types of neurotransmitters:
- small molecule transmitters are synthesized at terminals, packaged into small clear-core vesicles
- peptides, or neuropeptides are synthesized in the endoplasmic reticulum and transported to the synapse, sometimes they are processed along the way. Neuropeptides are packaged in large dense-core vesicles

Notice that neurotransmitter are always released in discrete packages / quanta, depending on the vesicles. 
The number of readily releasable vesicles a synapse has available is variable. A consequence of having a limited number is depletion at high stimulus frequency.

## Standard Katz (Quantal) Model of Synaptic Transmission
- One packet of neurotransmitter = 1 quantum
- action potential transiently increases in the probability of releasing nx quanta
- several quanta are available to be released
- each quanta approximately gives the same postsynaptic response
- average number of quanta released = (number of quanta available) x (average release probability)

Quantal release follows a binomial distribution.

## Synaptic release cycle

![[synaptic_cycle.png]]

The synaptic vesicle release consists of three principle steps:
- Docking - Docked vesicles lie close to plasma membrane (within 30 nm)
- Priming - Primed vesicles can be induced to fuse with the plasma membrane by sustained depolarization, high K+, elevated Ca++, hypertonic sucrose treatment
- Fusion - Vesicles fuse with the plasma membrane to release transmitter. Physiologically this occurs near calcium channels.

### Priming
Vesicles in the reserve pool undergo priming to enter the readily-releasable pool. Priming corresponds to the assembly of the SNARE complex.

![[priming_synapses.png|600]]

## Postsynaptic Receptors
When neurotransmitter cross the synaptic-cleft, they can bind to two types of receptors:
- Ionotropic (LGIC)
- Metabotropic  (GPCR)

### Ionotropic
Contains a transmitter binding site, after coupling the closed ion channels opens. Contributes to fast changes in the membrane potential.

### Metabotropic
Here a secondary messenger is involved. After the transmitter is coupled to the receptor a G-protein (messenger) is released. This G-protein is then responsible for signaling the ion channel to open. This process is much slower.

#### NMDA Receptor
NMDA receptors are one of the most important metabotropic receptors. They play a very important role in synaptic plasticity. NMDA receptors are excitatory, glutamate receptors.

## Electrical synapses
Until now we have discussed only chemical synapses, but there are also electrical synapses! 

![[electrical_vs_chemical_synapses.png]]

These synapses are bidirectional. Here the synapses are much closer to each other than in chemical synapses. An advantage of electrical synapses is, that they are much faster.

| Electrical Synapse                    | Chemical Synapse                             |
| ------------------------------------- | -------------------------------------------- |
| simple primitive system               | highly developed structure                   |
| often symmetrical / bidirectional     | polarized, structurally and functionally     |
| gap junction                          | pre: active zone, post: postsynaptic density |
| very fast, no synaptic delay          | slower, synaptic delay (~0.5ms)              |
| Ca2+ independent                      | transmitter release requires Ca2+ influx     |
| temperature-insensitive               | temperature-sensitive                        |
| large synapses                        | thousands of small synapses                  |
| limited functions, usually excitatory | versatile, excitatory and inhibitory         |
| synchronized activity                 | point to point communication                 |

## Plasticity
>**Hebb's law:** Neurons that fire together wire together

