# Morpho on Base

Morpho is a permissionless lending protocol with isolated markets.

## Architecture
- **Morpho Blue** — core lending primitive (immutable)
- **MetaMorpho** — curated vaults on top of Morpho Blue
- **Bundler** — batch multiple operations atomically

## Key Features
- No governance risk on core protocol
- Oracle-agnostic (Chainlink, Uniswap TWAP, etc.)
- LLTV configurable per market
- Supply and borrow in same tx via Bundler

## Base Markets (examples)
- USDC/WETH
- cbETH/USDC
- wstETH/USDC

## Docs
https://docs.morpho.org
