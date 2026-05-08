# Basenames

Basenames are onchain usernames for the Base ecosystem (like ENS but native to Base).

## Contract
- Registry: `0x03c4738Ee98aE44591e1A4A4F3CaB6641d95DD9a` (Base mainnet)
- Resolver: Standard ENS resolver pattern

## Registering
- URL: https://www.base.org/names
- Cost: 0.002 ETH/year (3+ char), free for 5+ char during campaigns

## Usage in Code
```js
import { normalize } from "viem/ens";
const address = await client.getEnsAddress({
  name: normalize("yourname.base.eth"),
});
```

## Notes
- Compatible with ENS resolution
- `.base.eth` suffix
