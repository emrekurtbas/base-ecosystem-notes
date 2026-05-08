# Error Handling in Solidity on Base

## Custom Errors (Solidity 0.8.4+)
More gas-efficient than `require` strings:
```solidity
error InsufficientBalance(address user, uint256 required, uint256 available);
error Unauthorized(address caller);
error DeadlineExpired(uint256 deadline, uint256 current);

function withdraw(uint256 amount) external {
    if (balances[msg.sender] < amount)
        revert InsufficientBalance(msg.sender, amount, balances[msg.sender]);
}
```

## Decoding Errors off-chain
```ts
import { decodeErrorResult, parseAbi } from "viem";

try {
  await publicClient.simulateContract({ ... });
} catch (err) {
  const decoded = decodeErrorResult({ abi, data: err.data });
  console.log(decoded.errorName, decoded.args);
}
```

## Try/Catch in Solidity
```solidity
try externalContract.riskyCall() returns (uint256 result) {
    // success path
} catch Error(string memory reason) {
    // revert with message
} catch (bytes memory lowLevelData) {
    // custom error or panic
}
```

## Panic Codes
- 0x11: arithmetic overflow
- 0x12: division by zero
- 0x31: out-of-bounds array access
