# Governance on Base

## Base Governance Model
Base does not have its own governance token. Protocol decisions are made by:
- **Coinbase** — primary operator and sequencer
- **Optimism Collective** — Base contributes to OP governance via sequencer fee sharing

## Optimism Governance
Base shares revenue with the Optimism Collective:
- 15% of Base sequencer revenue → Optimism RetroPGF
- OP token holders vote on protocol upgrades via the OP Governance Forum

## On-chain Governance for dApps
Common patterns for Base dApps:
- **OpenZeppelin Governor** — standard governance contract
- **Tally** — governance UI
- **Snapshot** — off-chain voting (gasless)
- **Aragon** — full DAO framework

## Governor Setup
```solidity
import "@openzeppelin/contracts/governance/Governor.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorVotes.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorTimelockControl.sol";
```

## Resources
- Optimism Governance: https://vote.optimism.io
- Tally: https://www.tally.xyz
