# Token Standards on Base

## ERC-20 (Fungible Tokens)
Most common. Key functions: `transfer`, `approve`, `transferFrom`, `balanceOf`.
- Extension: ERC-2612 (permit — gasless approvals)

## ERC-721 (NFTs)
Non-fungible, one token per ID.
- Extension: ERC-721A (gas-optimized batch minting)

## ERC-1155 (Multi-Token)
Both fungible and non-fungible in one contract.
Used for gaming items, editions.

## ERC-4626 (Vault Shares)
Yield-bearing vault standard.

## ERC-6909 (Minimal Multi-Token)
Lightweight alternative to ERC-1155, gaining adoption in DeFi.

## Popular on Base
- USDC: ERC-20 (native Circle)
- Zora NFTs: ERC-1155
- Aerodrome LP tokens: ERC-20
- Basenames: ERC-721

## OpenZeppelin Reference
```bash
npm install @openzeppelin/contracts
```
Import: `@openzeppelin/contracts/token/ERC20/ERC20.sol`
