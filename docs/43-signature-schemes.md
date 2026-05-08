# Signature Schemes on Base

## ECDSA (Standard)
Used by EOAs — standard `eth_sign` / `personal_sign`:
```solidity
address signer = ECDSA.recover(messageHash, signature);
```

## EIP-712 (Typed Data)
Structured data signing — prevents cross-context replay:
```solidity
bytes32 hash = _hashTypedDataV4(structHash);
address signer = ECDSA.recover(hash, signature);
```

## EIP-1271 (Contract Signatures)
For smart contract wallets (Safe, Smart Wallet):
```solidity
bytes4 constant MAGIC_VALUE = 0x1626ba7e;

function isValidSignature(bytes32 hash, bytes memory signature)
    external view returns (bytes4) {
    // verify signature against contract owners
    return MAGIC_VALUE;
}
```

Always check EIP-1271 for contract signers:
```solidity
if (signer.code.length > 0) {
    require(
        IERC1271(signer).isValidSignature(hash, sig) == MAGIC_VALUE,
        "Invalid contract signature"
    );
}
```

## Passkeys (WebAuthn / P-256)
Used by Coinbase Smart Wallet. Verified via `P256Verifier` precompile on Base.
Precompile address: `0x0000000000000000000000000000000000000100`
