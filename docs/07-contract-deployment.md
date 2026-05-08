# Deploying Contracts on Base

## With Hardhat
```bash
npx hardhat run scripts/deploy.js --network base
```

## With Foundry
```bash
forge create --rpc-url https://mainnet.base.org \
  --private-key $PRIVATE_KEY \
  src/MyContract.sol:MyContract
```

## Verifying on Basescan
```bash
forge verify-contract <ADDRESS> src/MyContract.sol:MyContract \
  --chain-id 8453 \
  --etherscan-api-key $BASESCAN_API_KEY
```

Get a free Basescan API key at https://basescan.org/myapikey
