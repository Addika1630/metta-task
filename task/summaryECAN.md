# ECAN: Elastic Cognitive Associative Network

ECAN (Elastic Cognitive Associative Network) is an associative memory model designed to efficiently store and retrieve memories in AI systems. It is inspired by the Hopfield network but introduces unique dynamics for enhanced performance. ECAN leverages noise-resistant memory retrieval and convergence properties, making it suitable for cognitive systems such as OpenCog.

## Key Features

### Memory Imprinting & Retrieval
- **Storage**: ECAN stores memories as binary patterns.
- **Retrieval**: Memories are retrieved through noisy input cues, ensuring robustness to incomplete or noisy data.

### Variant 1: Hyperbolic Decision Functions
- ECAN utilizes hyperbolic decision functions to model memory retrieval, which enhance the system's ability to converge to the correct memory under noisy conditions.
- The model leverages these functions to ensure stable convergence, helping to refine memory recall even when inputs are partial or disturbed.

### Variant 2: Lyapunov Function and Rent Collection
- **Lyapunov Function**: The network employs the Lyapunov function (AVDIFF) to control convergence, minimizing the discrepancy between inputs and outputs in each "Atom."
- **Rent Collection**: A dynamic wealth distribution process ensures fair resource allocation, driving the system toward equilibrium and preventing profit or loss.

### Memory Capacity & Associative Memory
- ECAN’s memory capacity is determined by the network's sparsity and key parameters.
- Memory retrieval efficiency is compared to a Hopfield network, with performance depending on the number of memories stored and their alignment with the "focus of attention" (AF).

### Integration with OpenCog Components
- **OpenCogPrime**: ECAN is used to drive concept creation and enhance memory capacity.
- **PLN**: It integrates with the Probabilistic Logic Network (PLN) to guide cognitive functions like inference, ensuring effective knowledge retrieval and processing.

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


