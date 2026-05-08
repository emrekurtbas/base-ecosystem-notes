# Flash Loans on Base

Flash loans allow borrowing assets without collateral within a single transaction.

## Protocols Supporting Flash Loans on Base
| Protocol | Fee | Interface |
|----------|-----|-----------|
| Aave v3 | 0.05% | `flashLoan` / `flashLoanSimple` |
| Morpho | 0% (no fee) | `flashLoan` |
| Uniswap v3 | Pool fee | `flash` callback |
| Balancer | 0% | `flashLoan` |

## Aave v3 Flash Loan Example
```solidity
import "@aave/core-v3/contracts/flashloan/base/FlashLoanSimpleReceiverBase.sol";

contract MyFlashLoan is FlashLoanSimpleReceiverBase {
    constructor(IPoolAddressesProvider provider)
        FlashLoanSimpleReceiverBase(provider) {}

    function executeOperation(
        address asset,
        uint256 amount,
        uint256 premium,
        address initiator,
        bytes calldata params
    ) external override returns (bool) {
        // Your logic here (arbitrage, liquidation, etc.)
        
        // Approve repayment
        IERC20(asset).approve(address(POOL), amount + premium);
        return true;
    }
}
```

## Aave v3 Pool Address (Base)
`0xA238Dd80C259a72e81d7e4664a9801593F98d1c5`
