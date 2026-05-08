# Pyth Network Oracle on Base

Pyth offers low-latency price feeds with a pull-based model.

## Key Difference from Chainlink
- **Pull-based**: consumer updates price on-chain when needed
- **Sub-second updates**: prices updated every 400ms off-chain
- **Confidence intervals**: each price has an uncertainty range

## Contract Address (Base Mainnet)
`0x8250f4aF4B972684F7b336503E2D6dFeDeB1487a`

## Usage
```solidity
import "@pythnetwork/pyth-sdk-solidity/IPyth.sol";
import "@pythnetwork/pyth-sdk-solidity/PythStructs.sol";

contract MyContract {
    IPyth pyth = IPyth(0x8250f4aF4B972684F7b336503E2D6dFeDeB1487a);

    // Price feed ID for ETH/USD
    bytes32 constant ETH_USD = 0xff61491a931112ddf1bd8147cd1b641375f79f5825126d665480874634fd0ace;

    function getPrice(bytes[] calldata priceUpdateData) external payable returns (int64) {
        uint fee = pyth.getUpdateFee(priceUpdateData);
        pyth.updatePriceFeeds{value: fee}(priceUpdateData);

        PythStructs.Price memory price = pyth.getPrice(ETH_USD);
        return price.price; // scaled by 10^price.expo
    }
}
```

## Hermes API (off-chain price data)
```bash
curl "https://hermes.pyth.network/v2/updates/price/latest?ids[]=0xff61491a..."
```
