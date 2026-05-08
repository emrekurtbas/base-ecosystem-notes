// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title Simple ERC-721 NFT for Base deployment
contract BaseNFT is ERC721URIStorage, Ownable {
    uint256 private _tokenIds;

    constructor() ERC721("BaseNFT", "BNFT") Ownable(msg.sender) {}

    function mint(address to, string memory tokenURI) external onlyOwner returns (uint256) {
        _tokenIds++;
        uint256 newId = _tokenIds;
        _mint(to, newId);
        _setTokenURI(newId, tokenURI);
        return newId;
    }

    function totalSupply() external view returns (uint256) {
        return _tokenIds;
    }
}
