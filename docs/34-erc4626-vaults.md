# ERC-4626 Tokenized Vaults on Base

ERC-4626 is the standard for yield-bearing vault tokens.

## Interface
```solidity
interface IERC4626 {
    function asset() external view returns (address);
    function totalAssets() external view returns (uint256);
    function deposit(uint256 assets, address receiver) external returns (uint256 shares);
    function mint(uint256 shares, address receiver) external returns (uint256 assets);
    function withdraw(uint256 assets, address receiver, address owner) external returns (uint256 shares);
    function redeem(uint256 shares, address receiver, address owner) external returns (uint256 assets);
    function convertToShares(uint256 assets) external view returns (uint256);
    function convertToAssets(uint256 shares) external view returns (uint256);
}
```

## Popular ERC-4626 Vaults on Base
- Morpho MetaMorpho vaults (USDC, WETH)
- Yearn v3 vaults
- Beefy Finance vaults

## Using with viem
```ts
const shares = await publicClient.readContract({
  address: vaultAddress,
  abi: erc4626Abi,
  functionName: "convertToShares",
  args: [parseUnits("100", 6)], // 100 USDC
});
```
