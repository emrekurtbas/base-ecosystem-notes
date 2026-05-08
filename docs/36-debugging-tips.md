# Debugging on Base

## Tenderly Simulation
Simulate any transaction before sending:
```bash
curl -X POST https://api.tenderly.co/api/v1/simulate \
  -H "X-Access-Key: $TENDERLY_KEY" \
  -d '{
    "network_id": "8453",
    "from": "0x...",
    "to": "0x...",
    "input": "0x...",
    "value": "0"
  }'
```

## Foundry `cast`
```bash
# Decode calldata
cast 4byte-decode 0xa9059cbb...

# Call view function
cast call 0x833589... "balanceOf(address)(uint256)" 0xYOUR_ADDRESS --rpc-url https://mainnet.base.org

# Get tx trace
cast run <TX_HASH> --rpc-url https://mainnet.base.org --trace
```

## Common Errors
| Error | Cause |
|-------|-------|
| `insufficient funds` | Not enough ETH for gas |
| `execution reverted` | Contract logic failed — decode revert reason |
| `nonce too low` | Pending tx with same nonce |
| `max fee per gas less than block base fee` | Increase `maxFeePerGas` |

## Revert Reason Decoding
```bash
cast abi-decode "Error(string)" 0x08c379a0...
```
