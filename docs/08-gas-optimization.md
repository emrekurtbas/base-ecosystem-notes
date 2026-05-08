# Gas Optimization on Base

## L2 Fee Structure
Base fees = L2 execution fee + L1 data fee (calldata posted to Ethereum)

## Tips
1. **Minimize calldata** — shorter function selectors, packed structs
2. **Use `bytes` over `string`** where possible
3. **Batch transactions** — combine multiple operations
4. **Storage patterns** — SSTORE2 for large immutable data
5. **Use events** instead of storage for non-critical data

## Estimating L1 Data Fee
```js
const { createPublicClient } = require("viem");
// Use getL1Fee from @eth-optimism/sdk or viem L2 actions
```

## Useful Tools
- [Tenderly](https://tenderly.co) — gas profiling
- [Hardhat Gas Reporter](https://github.com/cgewecke/hardhat-gas-reporter)
