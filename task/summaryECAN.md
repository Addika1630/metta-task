# ECAN: Economic Attention Network

ECAN (Economic Attention Network) is an associative memory model designed to efficiently store and retrieve memories in AI systems. It is inspired by the Hopfield network but introduces unique dynamics for enhanced performance. ECAN leverages noise-resistant memory retrieval and convergence properties, making it suitable for cognitive systems such as OpenCog.

## Key Features

### Memory Imprinting & Retrieval
- **Storage**: ECAN stores memories as binary patterns.
- **Retrieval**: Memories are retrieved through noisy input cues, ensuring robustness to incomplete or noisy data.

### Variant 1: 
- Variant 1 of ECAN updates Stimulus (STI) values through a rent and wage mechanism, where nodes' STI values are influenced by their importance. The connection matrix is updated using conjunction equations with a decay function. A diffusion process spreads STI values among nodes using a stochastic matrix, ensuring homeostasis by adjusting funds. Periodic adjustments maintain the balance of the system, ensuring conserved quantities and stable behavior across nodes.

### Variant 2: Lyapunov Function and Rent Collection
- **Lyapunov Function**: The network employs the Lyapunov function (AVDIFF) to control convergence, minimizing the discrepancy between inputs and outputs in each "Atom."
- **Rent Collection**: A dynamic wealth distribution process ensures fair resource allocation, driving the system toward equilibrium and preventing profit or loss.

### Memory Capacity & Associative Memory
- ECAN’s memory capacity is determined by the network's sparsity and key parameters.
- Memory retrieval efficiency is compared to a Hopfield network, with performance depending on the number of memories stored and their alignment with the "focus of attention" (AF).

### Integration with OpenCog Components
- **OpenCogPrime**: ECAN is used to drive concept creation and enhance memory capacity.
- **PLN**: It integrates with the Probabilistic Logic Network (PLN) to guide cognitive functions like inference, ensuring effective knowledge retrieval and processing.

### Key Properties
- **Hebbian Probability**: The updating scheme is governed by Hebbian-like rules and the diffusion process, ensuring that nodes with higher STI values receive more rewards but also pay more rent.
- **Systemic Homeostasis**: The model ensures that both total STI and LTI values of the system remain conserved within the boundaries.

### Integration with OpenCog Components
- ECAN uses these updating mechanisms in combination with OpenCog's components for driving cognitive processes and creating new concepts.

## Benefits
- **Noise-Resistant**: ECAN can retrieve memories even with noisy inputs.
- **High Memory Capacity**: The sparse network architecture allows for storing a large number of memories.
- **Scalable**: ECAN is well-suited for large cognitive systems, such as OpenCog and other AI models.

## Installation & Setup
TBD

## Usage
TBD

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


