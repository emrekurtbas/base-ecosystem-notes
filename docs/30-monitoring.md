# Monitoring Base Transactions & Contracts

## Block Explorer
- Basescan: https://basescan.org
- Supports verified contracts, read/write, token tracking

## Tenderly
- Transaction simulations
- Alerting on contract events
- Gas profiler
- Setup: https://dashboard.tenderly.co

## OpenZeppelin Defender
- Autotask (automated scripts triggered by events)
- Sentinel (monitor and alert on txs)
- Admin (multisig actions)
- Supports Base

## Custom Monitoring with viem
```ts
import { createPublicClient, webSocket } from "viem";
import { base } from "viem/chains";

const client = createPublicClient({
  chain: base,
  transport: webSocket("wss://base-mainnet.g.alchemy.com/v2/YOUR_KEY"),
});

const unwatch = client.watchContractEvent({
  address: "0x...",
  abi: myAbi,
  eventName: "Transfer",
  onLogs: (logs) => console.log(logs),
});
```

## Alerts
- Set up Telegram/Discord bots via Tenderly webhooks
- Monitor TVL via DefiLlama API
