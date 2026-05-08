# Smart Contract Security Checklist for Base

## Common Vulnerabilities
- [ ] Reentrancy — use `ReentrancyGuard` or CEI pattern
- [ ] Integer overflow — Solidity 0.8+ has built-in checks
- [ ] Access control — `onlyOwner`, `onlyRole` where needed
- [ ] Front-running — commit-reveal, slippage limits
- [ ] Oracle manipulation — TWAP over spot price
- [ ] Flash loan attacks — same-block price checks
- [ ] Signature replay — include `chainId` + `nonce` in signed data

## Base-Specific Notes
- Same EVM as Ethereum — all standard vulnerabilities apply
- L1 → L2 message delay: check cross-chain assumptions
- Block time is ~2s — don't use `block.number` for long time windows

## Audit Tools
- Slither: `pip install slither-analyzer && slither .`
- Mythril: `myth analyze contracts/MyContract.sol`
- Foundry fuzz: `forge test --fuzz-runs 10000`

## Pre-Deploy Checklist
- [ ] Testnet deployment + testing
- [ ] Fuzz tests written
- [ ] Access control reviewed
- [ ] Emergency pause mechanism
- [ ] Upgrade pattern (if proxy) documented
