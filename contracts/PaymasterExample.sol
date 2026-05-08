// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@account-abstraction/contracts/core/BasePaymaster.sol";

/// @title Simple verifying paymaster for Base (ERC-4337)
/// @dev Sponsors gas for whitelisted users
contract SimplePaymaster is BasePaymaster {
    mapping(address => bool) public whitelist;

    constructor(IEntryPoint _entryPoint) BasePaymaster(_entryPoint) {}

    function addToWhitelist(address user) external onlyOwner {
        whitelist[user] = true;
    }

    function _validatePaymasterUserOp(
        PackedUserOperation calldata userOp,
        bytes32,
        uint256
    ) internal view override returns (bytes memory, uint256) {
        address sender = userOp.sender;
        require(whitelist[sender], "Paymaster: sender not whitelisted");
        return ("", 0);
    }
}
