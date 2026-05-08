# OnchainKit

OnchainKit is Coinbase's open-source React component library for Base.

## Install
```bash
npm install @coinbase/onchainkit
```

## Key Components
- `<ConnectWallet>` — wallet connection with Smart Wallet support
- `<Transaction>` — transaction flow with status
- `<NFTCard>` — display NFT metadata
- `<Swap>` — token swap UI
- `<Identity>` — display Basename + avatar
- `<Frame>` — Farcaster Frame builder

## Setup
```jsx
import { OnchainKitProvider } from "@coinbase/onchainkit";

<OnchainKitProvider chain={base} apiKey={process.env.CDP_API_KEY}>
  <App />
</OnchainKitProvider>
```

## Docs
https://onchainkit.xyz
