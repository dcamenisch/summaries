 # Population Codes
In [[The Neural Code]] we discussed the fact that neurons are tuned to a specific value of a stimulus. Meaning that their response is strongest if the stimulus matches their tuning. An example would be the angle of a line at a location on the retina.

The **population code** is the response of all the neurons for a give value of a stimulus. Example all the responses of the neurons for a line with an angle of $60^o$. This approach allows us to easily decode the stimulus value as it is very robust to noise.

Now the question arises how neurons can compute with this form of encoded information. We discussed the following example:

![[example_population_code.jpeg]]

Here we can interpret a diagonal of the population matrix as a defined value for $H$. Now how does the neuronal system find $H$? This is simple, it connects all the neurons of the diagram to a value of $H$. We can modify this example to find any value for $E, R, H$ and to work for spherical angles.

In the end this population encodes the relation between $E, R, H$ and these connections can be learned via **Hebbian learning**. These relations can be expanded to larger systems (by connecting smaller subsystems).

## Threshold-based sensory neurons
Instead of neurons that are value based, there are also threshold-based neurons. These neurons are active, if the stimulus reaches a certain threshold. For such neuronal systems, the same property holds, it is easy to decode the stimulus value as the system is very robust to noise.

We can convert from one system to the other: 

![[threshold_to_value_based.jpeg]]

## The Aperture Problem
It is often simpler for a neuron to only compute the time derivative of light intensity. This reduces the "data throughput" needed. But this introduces a new problem, locally, we cannot detect the direction of motion. The motion appears to, locally, be perpendicular to the spatial gradient of the light intensity. To find the motion, we need a complex system. We can describe this by the **optic flow equation**:
$$V = -\vec{F} \cdot \vec{G}$$
Using a population we can represent this equation and it's subsystems. 

