# EIP-712 Typed Data Signing on Base

EIP-712 provides structured data signing — used in permit, metatransactions, and off-chain auth.

## Domain Separator
```solidity
bytes32 public DOMAIN_SEPARATOR = keccak256(abi.encode(
    keccak256("EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)"),
    keccak256("MyApp"),
    keccak256("1"),
    8453, // Base mainnet
    address(this)
));
```

## Sign with viem (frontend)
```ts
import { useSignTypedData } from "wagmi";

const { signTypedData } = useSignTypedData();

signTypedData({
  domain: { name: "MyApp", version: "1", chainId: 8453, verifyingContract: "0x..." },
  types: { Order: [{ name: "amount", type: "uint256" }, { name: "nonce", type: "uint256" }] },
  primaryType: "Order",
  message: { amount: 100n, nonce: 1n },
});
```

## Verify on-chain
```solidity
address signer = ECDSA.recover(
    _hashTypedDataV4(structHash),
    signature
);
require(signer == expectedSigner, "Invalid signature");
```
