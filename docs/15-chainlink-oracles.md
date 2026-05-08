# Chainlink Price Feeds on Base

## Key Feed Addresses (Base Mainnet)
| Pair | Address |
|------|---------|
| ETH/USD | `0x71041dddad3595F9CEd3DcCFBe3D1F4b0a16Bb70` |
| BTC/USD | `0xCCADC697c55bbB68dc5bCdf8d3CBe83CdD4E071E` |
| USDC/USD | `0x7e860098F58bBFC8648a4311b374B1D669a2bc9b` |
| cbETH/ETH | `0x806b4Ac04501c29769051e42783cF04dCE41440b` |

## Usage
```solidity
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

AggregatorV3Interface feed = AggregatorV3Interface(0x71041dddad...);
(, int256 price,,,) = feed.latestRoundData();
// price has 8 decimals
```

## Automation (Keepers)
- Chainlink Automation works on Base
- Register at https://automation.chain.link
