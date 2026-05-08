# Testing Smart Contracts on Base

## Local Testing with Foundry
```bash
# Fork Base mainnet locally
forge test --fork-url https://mainnet.base.org -vvv
```

## Unit Tests
```solidity
// test/Token.t.sol
import "forge-std/Test.sol";
import "../contracts/BaseToken.sol";

contract TokenTest is Test {
    BaseToken token;

    function setUp() public {
        token = new BaseToken("Test", "TST", 1_000_000);
    }

    function test_initialSupply() public {
        assertEq(token.totalSupply(), 1_000_000 * 1e18);
    }

    function testFuzz_transfer(uint256 amount) public {
        amount = bound(amount, 1, token.balanceOf(address(this)));
        token.transfer(address(1), amount);
        assertEq(token.balanceOf(address(1)), amount);
    }
}
```

## Integration Tests (fork)
```solidity
function test_swapOnAerodrome() public {
    // fork at specific block for determinism
    vm.createSelectFork("base", 12_000_000);
    // interact with live Aerodrome contracts
}
```

## Coverage
```bash
forge coverage --report lcov
```
