# Zora Protocol on Base

Zora is a creator-focused NFT protocol with Base as a primary chain.

## Zora Network vs Zora Protocol
- **Zora Network**: OP Stack L2 chain
- **Zora Protocol**: NFT contracts deployed on Base, Ethereum, Zora Network, etc.

## Creator Contracts on Base
- ZoraCreatorERC721Implementation
- ZoraCreatorERC1155Implementation
- Free mint support (only gas cost)

## Minting with Zora SDK
```bash
npm install @zoralabs/zora-contracts
```

```ts
import { createCreatorClient } from "@zoralabs/protocol-sdk";

const creatorClient = createCreatorClient({ chainId: 8453, publicClient });

const { parameters } = await creatorClient.create1155({
  contract: { name: "My Collection", uri: "ipfs://..." },
  token: { tokenMetadataURI: "ipfs://..." },
  account: creatorAddress,
});
```

## Rewards
Zora has a protocol rewards system:
- Creator reward per mint
- Referral reward
- Zora platform fee (small)

## Docs
https://docs.zora.co
