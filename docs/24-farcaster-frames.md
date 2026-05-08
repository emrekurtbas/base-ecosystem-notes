# Farcaster Frames on Base

Farcaster Frames are interactive mini-apps embedded in casts, often with onchain actions on Base.

## Frame Spec (v2)
- Returns HTML with `<meta>` Frame tags
- Can trigger wallet transactions
- Hosted anywhere (Vercel, Railway, etc.)

## OnchainKit Frames
```bash
npm create onchain@latest
```

Example frame handler:
```ts
import { getFrameMetadata } from "@coinbase/onchainkit/frame";

export const frameMetadata = getFrameMetadata({
  buttons: [{ label: "Mint on Base" }],
  image: "https://myapp.com/og.png",
  postUrl: "https://myapp.com/api/frame",
  action: {
    type: "tx",
    endpoint: "/api/tx",
    postUrl: "/api/tx-success",
  },
});
```

## Deploy
Frame backends need to be publicly accessible.
Use Vercel: `vercel deploy`

## Resources
- Farcaster Frame spec: https://docs.farcaster.xyz/reference/frames/spec
- OnchainKit: https://onchainkit.xyz
