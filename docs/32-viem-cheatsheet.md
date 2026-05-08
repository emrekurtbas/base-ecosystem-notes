# viem Cheatsheet for Base

## Setup
```ts
import { createPublicClient, createWalletClient, http } from "viem";
import { base } from "viem/chains";
import { privateKeyToAccount } from "viem/accounts";

const publicClient = createPublicClient({ chain: base, transport: http() });
const account = privateKeyToAccount("0x...");
const walletClient = createWalletClient({ account, chain: base, transport: http() });
```

## Read Contract
```ts
const balance = await publicClient.readContract({
  address: "0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913", // USDC
  abi: erc20Abi,
  functionName: "balanceOf",
  args: [address],
});
```

## Write Contract
```ts
const hash = await walletClient.writeContract({
  address: "0x...",
  abi: myAbi,
  functionName: "mint",
  args: [to, amount],
});
const receipt = await publicClient.waitForTransactionReceipt({ hash });
```

## Simulate Before Write
```ts
const { request } = await publicClient.simulateContract({ ... });
const hash = await walletClient.writeContract(request);
```
