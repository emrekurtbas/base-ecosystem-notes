# Upgradeable Contracts on Base

## Proxy Patterns

### Transparent Proxy (OpenZeppelin)
Admin calls go to proxy, user calls go to implementation:
```bash
npm install @openzeppelin/contracts-upgradeable @openzeppelin/hardhat-upgrades
```
```js
const proxy = await upgrades.deployProxy(MyContract, [arg1], { kind: "transparent" });
await upgrades.upgradeProxy(proxy.address, MyContractV2);
```

### UUPS Proxy
Upgrade logic lives in implementation (cheaper to deploy):
```solidity
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract MyContractV2 is Initializable, UUPSUpgradeable {
    function _authorizeUpgrade(address) internal override onlyOwner {}
}
```

### Beacon Proxy
One beacon controls implementation for many proxies:
- Useful for factory patterns (e.g., deploy many vaults sharing same implementation)

## Storage Layout
- Never change order of existing storage variables
- Only append new variables at the end
- Use storage gaps: `uint256[50] private __gap;`

## Timelock for Safety
Add `TimelockController` before upgrade goes live:
- Minimum 24-48h delay for non-emergency upgrades
