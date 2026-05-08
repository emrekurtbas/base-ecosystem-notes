# Onchain Points & Rewards on Base

Many Base protocols use onchain points systems for loyalty and airdrop eligibility.

## Common Patterns

### ERC-20 Non-Transferable (Soulbound Points)
```solidity
function _update(address from, address to, uint256 value) internal override {
    require(from == address(0) || to == address(0), "Soulbound: non-transferable");
    super._update(from, to, value);
}
```

### Merkle Airdrop
Efficient bulk distribution:
```solidity
function claim(uint256 amount, bytes32[] calldata proof) external {
    bytes32 leaf = keccak256(abi.encodePacked(msg.sender, amount));
    require(MerkleProof.verify(proof, merkleRoot, leaf), "Invalid proof");
    require(!claimed[msg.sender], "Already claimed");
    claimed[msg.sender] = true;
    token.transfer(msg.sender, amount);
}
```

## Notable Base Points Programs
- Morpho — MORPHO rewards
- Aerodrome — veAERO emissions
- Base itself — "Base user" recognition via onchain activity

## Tracking Tools
- [Merkle.io](https://merkle.io) — airdrop checker
- Dune dashboards for protocol-specific tracking
