const { ethers } = require("ethers");

const RPC = "https://mainnet.base.org";
const provider = new ethers.JsonRpcProvider(RPC);

async function estimateGas() {
  const feeData = await provider.getFeeData();

  console.log("=== Base Gas Info ===");
  console.log("Base fee:     ", ethers.formatUnits(feeData.gasPrice || 0n, "gwei"), "gwei");
  console.log("Max fee:      ", ethers.formatUnits(feeData.maxFeePerGas || 0n, "gwei"), "gwei");
  console.log("Priority fee: ", ethers.formatUnits(feeData.maxPriorityFeePerGas || 0n, "gwei"), "gwei");

  const block = await provider.getBlock("latest");
  console.log("\n=== Latest Block ===");
  console.log("Number:    ", block.number);
  console.log("Gas used:  ", block.gasUsed.toString());
  console.log("Gas limit: ", block.gasLimit.toString());
  console.log("Utilization:", ((Number(block.gasUsed) / Number(block.gasLimit)) * 100).toFixed(1) + "%");
}

estimateGas().catch(console.error);
