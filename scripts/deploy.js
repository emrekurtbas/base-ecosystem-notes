const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying from:", deployer.address);
  console.log("Balance:", ethers.formatEther(await ethers.provider.getBalance(deployer.address)), "ETH");

  // Deploy BaseToken
  const Token = await ethers.getContractFactory("BaseToken");
  const token = await Token.deploy("My Base Token", "MBT", 1_000_000);
  await token.waitForDeployment();
  console.log("BaseToken deployed to:", await token.getAddress());

  // Deploy BaseNFT
  const NFT = await ethers.getContractFactory("BaseNFT");
  const nft = await NFT.deploy();
  await nft.waitForDeployment();
  console.log("BaseNFT deployed to:", await nft.getAddress());
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
