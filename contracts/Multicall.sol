// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Multicall — batch multiple read calls in one request
contract Multicall {
    struct Call {
        address target;
        bytes callData;
    }

    struct Result {
        bool success;
        bytes returnData;
    }

    function aggregate3(Call[] calldata calls)
        external
        view
        returns (Result[] memory results)
    {
        results = new Result[](calls.length);
        for (uint256 i = 0; i < calls.length; i++) {
            (results[i].success, results[i].returnData) =
                calls[i].target.staticcall(calls[i].callData);
        }
    }
}

// Multicall3 deployed on Base: 0xcA11bde05977b3631167028862bE2a173976CA11
