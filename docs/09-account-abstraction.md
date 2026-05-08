# Account Abstraction on Base (ERC-4337)

## Overview
ERC-4337 enables smart contract wallets without protocol changes.

## Key Components
- **UserOperation** — pseudo-transaction object
- **Bundler** — collects UserOps, submits to EntryPoint
- **EntryPoint** — singleton contract (0x5FF137D4b0FDCD49DcA30c7CF57E578a026d2789)
- **Paymaster** — sponsors gas for users

## Coinbase Smart Wallet
Built on ERC-4337, passkey-based:
- No seed phrase
- Sponsored transactions
- Multi-owner support

## OnchainKit
```bash
npm install @coinbase/onchainkit
```

Provides React hooks for Smart Wallet integration.

## Bundlers on Base
- Pimlico: https://pimlico.io
- Alchemy: https://alchemy.com/bundler
- Stackup: https://stackup.sh
