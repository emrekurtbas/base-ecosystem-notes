# OP Stack Architecture

Base is built on the OP Stack, Optimism's open-source L2 framework.

## Components
| Component | Role |
|-----------|------|
| `op-node` | Consensus / derivation layer |
| `op-geth` | Execution layer (modified go-ethereum) |
| `op-batcher` | Batches L2 txs to L1 |
| `op-proposer` | Posts output roots to L1 |

## Transaction Lifecycle
1. User submits tx to Base sequencer
2. Sequencer orders and executes tx
3. Batcher posts compressed tx data to Ethereum (as calldata or blobs)
4. Proposer posts output root (state commitment) to L1
5. Challenge period (7 days) for fraud proofs

## Fault Proofs
Base uses Optimism's fault proof system (Cannon + op-program).
Dispute game contract: `0x43edB88C4B80fDD2AdFF2412A7BebA9a6E25dCe1`
