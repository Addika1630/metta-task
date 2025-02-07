# ECAN: Economic Attention Network

ECAN (Economic Attention Network) is an associative memory model designed to efficiently store and retrieve memories in AI systems. It is inspired by the Hopfield network but introduces unique dynamics for enhanced performance. ECAN leverages noise-resistant memory retrieval and convergence properties, making it suitable for cognitive systems such as OpenCog.

## Key Features

### Memory Imprinting & Retrieval
- **Storage**: ECAN stores memories as binary patterns.
- **Retrieval**: Memories are retrieved through noisy input cues, ensuring robustness to incomplete or noisy data.

### Variant 1: Hyperbolic Decision Functions
- ECAN utilizes **hyperbolic decision functions** to model memory retrieval, which enhance the system's ability to converge to the correct memory under noisy conditions.
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

## Mathematical Framework for Variant 1: Memory Updates and Diffusion Process

In this variant, we define several key equations that govern the update and diffusion processes:

### STI (Stimulus) Value Updates
- The **STI values** for nodes are updated periodically based on **wages** and **rent**:
  - Rent is determined by:
    - If `si > 0`, `rent = Rent * max(0, log(20 * si) / recentMaxSTI)^2`.
    - If `si ≤ 0`, rent = 0.
  - Wages are calculated based on the cue pattern and stimulus:
    - If `pi = 1`, wages = `Wage Stimulus * sum(pi)`.
    - If `pi = 0`, wages = `Wage Stimulus * sum(pi)`.

### Connection Matrix Updates
- The **connection matrix** is updated based on the **"conjunction" equations**:
  - `normi = si / recentMaxSTI` if `si ≥ 0`, else `normi = si / recentMinSTI`.
  - `conj = Conjunction(si, sj) = normi * normj`.
  - The updated connection matrix element is: `c'ij = ConjDecay(conj) + (1 − conj) * cij`.

### Diffusion Process
- The **diffusion matrix** is constructed from the connection matrix:
  - If `cij ≥ 0`, then `dij = cij`, else set `dji = -cij`.
  - Normalize the columns of the diffusion matrix `D` to make it a **left stochastic matrix**.
  - The **scaled STI vector `v`** is updated via the matrix multiplication `v' = Dv`.

### Homeostatic Adjustments
- To maintain overall system funds, a **mid-cycle tax and rent adjustment** may be triggered. This ensures homeostasis in the diffusion and rent stages.

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


