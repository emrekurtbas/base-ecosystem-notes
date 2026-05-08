// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/// @title Simple yield vault — deposit ERC-20, receive shares
contract SimpleVault is Ownable, ReentrancyGuard {
    using SafeERC20 for IERC20;

    IERC20 public immutable asset;
    mapping(address => uint256) public shares;
    uint256 public totalShares;
    uint256 public totalAssets;

    event Deposit(address indexed user, uint256 amount, uint256 shares);
    event Withdraw(address indexed user, uint256 amount, uint256 shares);

    constructor(address _asset) Ownable(msg.sender) {
        asset = IERC20(_asset);
    }

    function deposit(uint256 amount) external nonReentrant {
        uint256 newShares = totalShares == 0 ? amount : (amount * totalShares) / totalAssets;
        shares[msg.sender] += newShares;
        totalShares += newShares;
        totalAssets += amount;
        asset.safeTransferFrom(msg.sender, address(this), amount);
        emit Deposit(msg.sender, amount, newShares);
    }

    function withdraw(uint256 shareAmount) external nonReentrant {
        require(shares[msg.sender] >= shareAmount, "Insufficient shares");
        uint256 amount = (shareAmount * totalAssets) / totalShares;
        shares[msg.sender] -= shareAmount;
        totalShares -= shareAmount;
        totalAssets -= amount;
        asset.safeTransfer(msg.sender, amount);
        emit Withdraw(msg.sender, amount, shareAmount);
    }
}
