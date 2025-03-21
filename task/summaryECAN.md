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



# AttentionBank

## Overview

The `AttentionBank` class is designed to manage and manipulate attention values in an atom space. The attention mechanism helps in prioritizing atoms based on their significance, with the `AttentionBank` class providing functionality to manage those values in real time. It operates using short-term and long-term attention values to determine the importance of atoms.

### Core Features:
- **Short-Term Importance (STI)**: Reflects immediate attention.
- **Long-Term Importance (LTI)**: Reflects the long-term value of an atom.
- **Very Long-Term Importance (VLTI)**: Tracks the value of an atom's attention over an extended period.

## Files

### `AttentionBank.h`

This header file defines the `AttentionBank` class and interfaces for managing and manipulating attention values of atoms. It provides methods for setting and updating attention values, as well as stimulating atoms and managing attentional focus.

#### Key Components:
- **`AttentionBank` Class**: Manages and updates attention values, including STI, LTI, and VLTI for atoms.
- **Constants**:
  - `startingFundsSTI`, `startingFundsLTI`: Initial funds for STI and LTI.
  - `stiFundsBuffer`, `ltiFundsBuffer`: Buffers for STI and LTI calculations.
  - `maxAFSize`: Maximum size for the attentional focus list.
  - `STIAtomWage`, `LTIAtomWage`: Wage rates for STI and LTI adjustments.

#### Methods:
- **`set_sti(const Handle&, AttentionValue::sti_t)`**: Sets the short-term importance (STI) of an atom.
- **`set_lti(const Handle&, AttentionValue::lti_t)`**: Sets the long-term importance (LTI) of an atom.
- **`stimulate(const Handle&, double)`**: Stimulates an atom and updates its attention values.
- **`AVChanged(const Handle&, const AttentionValuePtr&, const AttentionValuePtr&)`**: Called when an atom's attention value changes.

---

### `AttentionBank.cc`

This source file implements the methods declared in `AttentionBank.h`. It handles the core logic for managing attention values and updating the attentional focus, integrating with other OpenCog components like `AtomSpace` and `AttentionValue`.

#### Key Features:
- **Managing Attention Values**: Implements functionality for setting, updating, and stimulating STI and LTI values.
- **Stimulus Calculation**: Updates attention values when an atom is stimulated based on a provided stimulus.
- **Focus Management**: Updates the attentional focus list based on the most important atoms and ensures that only the top priorities are maintained.
- **Funds Management**: Handles the allocation and consumption of STI and LTI funds when updating attention values.
- **Thread-Safety**: Uses mutexes to safely manage concurrent access in a multi-threaded environment.

#### Key Methods:
- **`remove_atom_from_bank(const AtomPtr&)`**: Removes an atom from the attention bank.
- **`calculateSTIWage()`**: Calculates the STI wage rate based on available funds.
- **`calculateLTIWage()`**: Similar to `calculateSTIWage()`, but for LTI adjustments.
- **`updateAttentionalFocus(const Handle&, const AttentionValuePtr&, const AttentionValuePtr&)`**: Updates the attentional focus list with new attention values.

### Singleton Pattern

The `AttentionBank` class follows the singleton pattern to ensure there is a single instance per `AtomSpace`. This prevents conflicts and minimizes overhead when managing attention across different atom spaces.

- **`attentionbank(AtomSpace*)`**: Returns the singleton instance of `AttentionBank` for a given `AtomSpace`.

### Thread-Safety and Signal Emission

The class is thread-safe, using mutexes to ensure safe access in concurrent operations. Signals are emitted when atoms are added or removed from the attentional focus list, or when their attention values change.

---

# ImportanceIndex


## Overview

The `ImportanceIndex` class is part of the OpenCog framework and provides a thread-safe mechanism for managing the short-term importance (STI) of atoms within an atomspace. It organizes atoms into bins based on their importance and supports efficient querying, updating, and retrieval of atoms based on their importance values.

This class is crucial for cognitive systems where the importance of entities (atoms) fluctuates over time and influences decision-making or actions. The class handles the dynamic nature of importance through continuous updates and tracks the maximum and minimum STI values.

## Features

- **Thread Safety**: Utilizes `std::mutex` to ensure thread safety for concurrent operations.
- **Importance Binning**: Organizes atoms into bins based on their importance value (STI).
- **Dynamic Updates**: Supports real-time updates of atom importance.
- **Range Queries**: Allows querying of atoms within a specified importance range.
- **Random Atom Retrieval**: Provides functionality for selecting a random atom from the index.
- **Exponential Decay**: Tracks exponential decays of maximum and minimum STI values.

## Classes and Methods

### `ImportanceIndex` Class

#### Key Methods
- `update()`: Updates the importance index.
- `getMaxSTI(bool average=true)`: Gets the maximum STI, with an option for an exponentially decaying average.
- `getMinSTI(bool average=true)`: Gets the minimum STI, with an option for an exponentially decaying average.
- `getHandleSet(AttentionValue::sti_t lowerBound, AttentionValue::sti_t upperBound = AttentionValue::MAXSTI)`: Returns a set of atoms within a specified STI range.
- `getRandomAtom()`: Returns a random atom from the index.

### Dependencies

- `std::mutex` for thread safety.
- `AtomBins`: Used to store atoms in importance bins.
- `AttentionValue`: Stores the importance value (STI) of atoms.
- `recent_val`: Used for tracking exponentially decaying values.


