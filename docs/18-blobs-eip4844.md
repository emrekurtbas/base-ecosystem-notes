# EIP-4844 Blobs on Base

EIP-4844 (Proto-Danksharding) introduced blob transactions, reducing L2 data costs significantly.

## Impact on Base
- Data costs reduced ~10x after EIP-4844 activation (March 2024)
- Base switched from calldata to blobs for batch posting

## How Blobs Work
- Blob data is ~0.125 MB per blob, up to 6 blobs/block on L1
- Blobs are pruned after ~18 days (not stored permanently)
- Separate fee market: `blob_base_fee` (EIP-4844)

## For Developers
- No direct developer action needed
- L1 data fee for Base txs is now much lower
- Monitor: https://dune.com/hildobby/blobs

## EIP-7691
Further increases max blobs/block from 6 to 9 (planned upgrade).
