# Paymaster Patterns on Base

Paymasters sponsor gas for users, improving UX by abstracting fees.

## Types of Paymasters

### 1. Verifying Paymaster
Only sponsors txs from whitelisted users or signed by a trusted backend:
```solidity
function _validatePaymasterUserOp(PackedUserOperation calldata op, ...)
    internal view override returns (bytes memory, uint256) {
    bytes32 hash = getHash(op);
    address signer = ECDSA.recover(hash, op.paymasterAndData[20:85]);
    require(signer == trustedSigner, "Invalid paymaster signature");
    return ("", 0);
}
```

### 2. Token Paymaster
Let users pay gas in ERC-20 tokens instead of ETH:
- Swap tokens to ETH via Uniswap in postOp
- OpenGSN has reference implementations

### 3. Coinbase CDP Paymaster
Hosted paymaster for Base, free for qualifying apps:
```ts
import { createPaymasterClient } from "viem/account-abstraction";
const paymasterClient = createPaymasterClient({
  transport: http("https://api.developer.coinbase.com/rpc/v1/base/..."),
});
```

## Gas Policy Tips
- Set spending limits per user
- Whitelist specific contract calls only
- Monitor Paymaster ETH balance
