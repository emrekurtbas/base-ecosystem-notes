# Coinbase Developer Platform (CDP)

CDP provides APIs and tools for building on Base and other chains.

## Products
| Product | Description |
|---------|-------------|
| **Node** | Managed RPC with archive access |
| **Commerce** | Accept crypto payments |
| **Wallet SDK** | Embed Smart Wallet in apps |
| **OnchainKit** | React UI components |
| **AgentKit** | AI agent + onchain actions |
| **Paymaster** | Sponsor gas for users |
| **MPC Wallet** | Custodial wallet API |

## AgentKit
Framework for building AI agents that can transact onchain:
```bash
npm install @coinbase/agentkit
```

```ts
import { AgentKit } from "@coinbase/agentkit";
const agent = await AgentKit.from({ walletProvider, actionProviders: [...] });
```

## Getting Started
1. Sign up at https://portal.cdp.coinbase.com
2. Create an API key
3. Install SDK: `npm install @coinbase/cdp-sdk`

## Docs
https://docs.cdp.coinbase.com
