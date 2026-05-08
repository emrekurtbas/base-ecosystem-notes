# Running a Base Node

## Requirements
- 8-core CPU, 16GB RAM (minimum)
- 2TB+ SSD (growing ~10GB/week)
- Stable internet (>25 Mbps)

## Using Docker
```bash
git clone https://github.com/base-org/node
cd node
cp .env.example .env
# Edit .env: set L1_RPC_URL to your Ethereum mainnet RPC
docker compose up -d
```

## Components
- `op-node` — L2 consensus, derives chain from L1
- `op-geth` — L2 execution client

## Sync Types
- **Full sync**: downloads all blocks, verifies all state transitions (~days)
- **Snap sync**: fast sync using state snapshots (~hours)

## Monitor
```bash
docker compose logs -f op-node
docker compose logs -f op-geth
```

## Public Archive Providers (no node needed)
- Alchemy, QuickNode, Infura, Ankr all offer Base archive RPC
