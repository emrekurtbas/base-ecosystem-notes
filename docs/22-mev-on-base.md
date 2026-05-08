# MEV on Base

## Is MEV Present on Base?
Yes — Base has a centralized sequencer (operated by Coinbase), which means:
- No traditional mempool competition
- Sequencer imposes FIFO ordering (reduces sandwich attacks vs Ethereum)
- Some MEV still exists via arbitrage and liquidations

## MEV Types on Base
| Type | Present? | Notes |
|------|----------|-------|
| Sandwich attacks | Reduced | FIFO ordering helps |
| Arbitrage | Yes | DEX price differences |
| Liquidations | Yes | Lending protocol MEV |
| Backrunning | Yes | Post-tx arbitrage |

## Protection Tips
- Use `amountOutMin` slippage protection on swaps
- Private RPC for sensitive txs (Flashbots Protect works on Base)
- Avoid large swaps in low-liquidity pools

## Resources
- Flashbots Protect: https://protect.flashbots.net
