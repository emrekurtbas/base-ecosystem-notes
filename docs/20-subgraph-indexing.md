# Subgraph Indexing on Base

## The Graph on Base
The Graph Protocol supports Base mainnet indexing.

## Create a Subgraph
```bash
npm install -g @graphprotocol/graph-cli
graph init --product hosted-service mysubgraph
```

schema.graphql example:
```graphql
type Transfer @entity {
  id: ID!
  from: Bytes!
  to: Bytes!
  value: BigInt!
  blockTimestamp: BigInt!
}
```

## Deploy
```bash
graph codegen && graph build
graph deploy --studio mysubgraph
```

## Alternatives
- **Envio** — faster indexing, supports Base
- **Ponder** — TypeScript-native indexer
- **Goldsky** — managed subgraph hosting

## Studio
https://thegraph.com/studio
