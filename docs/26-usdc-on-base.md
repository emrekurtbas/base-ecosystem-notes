# USDC on Base

Base has **native USDC** — issued directly by Circle, not a bridged version.

## Address
`0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913`

## Why Native USDC Matters
- No bridge risk (unlike bridged USDC.e)
- Supports Circle's Cross-Chain Transfer Protocol (CCTP)
- Redeemable 1:1 with USD directly through Circle

## CCTP (Cross-Chain Transfer)
CCTP allows burning USDC on Base and minting natively on another chain (Ethereum, Arbitrum, etc.).

Key addresses:
- TokenMessenger: `0x1682Ae6375C4E4A97e4B583BC394c861A46D8962`
- MessageTransmitter: `0xAD09780d193884d503182aD4588450C416D6F9D4`

## Transferring USDC Cross-Chain
```js
// 1. approve TokenMessenger
// 2. call depositForBurn(amount, destinationDomain, mintRecipient, burnToken)
// 3. wait for attestation from Circle
// 4. call receiveMessage on destination chain
```

## Docs
https://developers.circle.com/stablecoins/cctp-getting-started
