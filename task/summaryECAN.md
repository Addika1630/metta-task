# ECAN: Economic Attention Network

ECAN (Economic Attention Network) is an associative memory model designed to efficiently store and retrieve memories in AI systems. It is inspired by the Hopfield network but introduces unique dynamics for enhanced performance. ECAN leverages noise-resistant memory retrieval and convergence properties, making it suitable for cognitive systems such as OpenCog.

## Key Features

### Memory Imprinting & Retrieval
- **Storage**: ECAN stores memories as binary patterns.
- **Retrieval**: Memories are retrieved through noisy input cues, ensuring robustness to incomplete or noisy data.

### Variant 1: 
- **Stimulus Update**: STI values are updated through rent and wages based on node importance, with periodic adjustments.
- **Connection Matrix**: The matrix is updated using conjunction equations, with a decay function to refine relationships.
- **Diffusion Process**: A diffusion matrix spreads STI values across nodes using a stochastic approach, maintaining homeostasis.

### Variant 2: Lyapunov Function and Rent Collection
- **Lyapunov Function**: The network employs the Lyapunov function (AVDIFF) to control convergence, minimizing the discrepancy between inputs and outputs in each "Atom."
- **Rent Collection**: A dynamic wealth distribution process ensures fair resource allocation, driving the system toward equilibrium and preventing profit or loss.

### Memory Capacity & Associative Memory
- ECAN’s memory capacity is determined by the network's sparsity and key parameters.
- Memory retrieval efficiency is compared to a Hopfield network, with performance depending on the number of memories stored and their alignment with the "focus of attention" (AF).

### Integration with OpenCog Components
- **OpenCog Framework**: OpenCog is an open-source AGI framework focused on building AI systems, with ECAN implemented as part of the OpenCogPrime (OCP) design.
- **CogServer and AtomTable**: ECAN nodes and links are stored in the AtomTable, with the CogServer managing STI and LTI funds and scheduling MindAgents for cognitive operations.
- **MindAgent Collaboration**: ECAN MindAgents (HebbianLinkUpdating, ImportanceUpdating) interact with other cognitive MindAgents like PLN and MOSES to perform complex tasks and manage resources.

### Key Properties
- **Hebbian Probability**: The updating scheme is governed by Hebbian-like rules and the diffusion process, ensuring that nodes with higher STI values receive more rewards but also pay more rent.
- **Systemic Homeostasis**: The model ensures that both total STI and LTI values of the system remain conserved within the boundaries.

### Integration with OpenCog Components
- ECAN uses these updating mechanisms in combination with OpenCog's components for driving cognitive processes and creating new concepts.

## Benefits
- **Noise-Resistant**: ECAN can retrieve memories even with noisy inputs.
- **High Memory Capacity**: The sparse network architecture allows for storing a large number of memories.
- **Scalable**: ECAN is well-suited for large cognitive systems, such as OpenCog and other AI models.



