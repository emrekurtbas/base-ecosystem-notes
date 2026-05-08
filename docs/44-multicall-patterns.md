# Multicall Patterns on Base

Batch multiple calls to reduce RPC round trips and gas.

## Multicall3 (deployed on Base)
Address: `0xcA11bde05977b3631167028862bE2a173976CA11`

### Off-chain batching (viem)
```ts
const results = await publicClient.multicall({
  contracts: [
    { address: usdcAddress, abi: erc20Abi, functionName: "balanceOf", args: [user] },
    { address: wethAddress, abi: erc20Abi, functionName: "balanceOf", args: [user] },
    { address: aeroAddress, abi: erc20Abi, functionName: "balanceOf", args: [user] },
  ],
});
```

### On-chain batching (Solidity)
```solidity
IMulticall3.Call3[] memory calls = new IMulticall3.Call3[](2);
calls[0] = IMulticall3.Call3({ target: tokenA, allowFailure: true, callData: abi.encodeCall(IERC20.balanceOf, (user)) });
calls[1] = IMulticall3.Call3({ target: tokenB, allowFailure: true, callData: abi.encodeCall(IERC20.balanceOf, (user)) });
IMulticall3.Result[] memory results = multicall3.aggregate3(calls);
```

## Uniswap Universal Router
Batches multiple swap/NFT operations atomically — useful for complex DeFi flows.
