# L1 ↔ L2 Messaging on Base

Base supports passing arbitrary messages between Ethereum (L1) and Base (L2).

## L1 → L2 (Deposit)
Messages sent from Ethereum are automatically relayed to Base.

```solidity
// On L1
IL1CrossDomainMessenger messenger = IL1CrossDomainMessenger(
    0x866E82a600A1414e583f7F13623F1aC5d58b0Afa
);
messenger.sendMessage(
    l2TargetAddress,
    abi.encodeWithSignature("receiveFromL1(uint256)", value),
    1_000_000 // gas limit on L2
);
```

## L2 → L1 (Withdrawal)
Messages from Base to Ethereum take ~7 days to finalize.

```solidity
// On L2
IL2CrossDomainMessenger messenger = IL2CrossDomainMessenger(
    0x4200000000000000000000000000000000000007
);
messenger.sendMessage(
    l1TargetAddress,
    abi.encodeWithSignature("receiveFromL2(uint256)", value),
    0 // gas limit on L1 (estimated automatically)
);
```

## Fast Exits
Use third-party bridges (Across, Relay) to avoid the 7-day window.

## SDK
```bash
npm install @eth-optimism/sdk
```
