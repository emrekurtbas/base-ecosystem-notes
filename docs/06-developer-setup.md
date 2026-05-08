# Developer Setup for Base

## Prerequisites
- Node.js >= 18
- Git

## Hardhat
```bash
npm install --save-dev hardhat @nomicfoundation/hardhat-toolbox
npx hardhat init
```

hardhat.config.js:
```js
networks: {
  base: {
    url: "https://mainnet.base.org",
    chainId: 8453,
    accounts: [process.env.PRIVATE_KEY],
  },
  baseSepolia: {
    url: "https://sepolia.base.org",
    chainId: 84532,
    accounts: [process.env.PRIVATE_KEY],
  },
}
```

## Foundry
```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

foundry.toml:
```toml
[rpc_endpoints]
base = "https://mainnet.base.org"
base_sepolia = "https://sepolia.base.org"
```
