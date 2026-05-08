# Cross-Chain with Chainlink CCIP

CCIP (Cross-Chain Interoperability Protocol) enables token transfers and messages between chains.

## Supported Lanes (Base)
- Base ↔ Ethereum
- Base ↔ Arbitrum
- Base ↔ Optimism
- Base ↔ Polygon
- Base ↔ Avalanche

## Router Address (Base Mainnet)
`0x881e3A65B4d4a04dD529061dd0071cf975F58bCD`

## Send Tokens + Message
```solidity
IRouterClient router = IRouterClient(0x881e3A65B4d4a04dD529061dd0071cf975F58bCD);
Client.EVM2AnyMessage memory msg = Client.EVM2AnyMessage({
    receiver: abi.encode(receiverAddress),
    data: abi.encode(payload),
    tokenAmounts: new Client.EVMTokenAmount[](0),
    feeToken: address(0), // pay in ETH
    extraArgs: ""
});
uint256 fee = router.getFee(destinationChainSelector, msg);
router.ccipSend{value: fee}(destinationChainSelector, msg);
```

## Docs
https://docs.chain.link/ccip
