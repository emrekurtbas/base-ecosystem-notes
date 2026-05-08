# Coinbase Wallet SDK

## Install
```bash
npm install @coinbase/wallet-sdk
```

## Setup (EIP-1193 Provider)
```js
import CoinbaseWalletSDK from "@coinbase/wallet-sdk";

const sdk = new CoinbaseWalletSDK({
  appName: "My App",
  appChainIds: [8453],
});

const provider = sdk.makeWeb3Provider();
await provider.request({ method: "eth_requestAccounts" });
```

## Smart Wallet vs EOA
- Pass `options: { keysUrl: "https://keys.coinbase.com/connect" }` for Smart Wallet
- Falls back to Coinbase Wallet extension if installed

## Wagmi Integration
```js
import { coinbaseWallet } from "wagmi/connectors";
coinbaseWallet({ appName: "App", preference: "smartWalletOnly" })
```
