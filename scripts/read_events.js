const { ethers } = require("ethers");

const RPC = "https://mainnet.base.org";
const provider = new ethers.JsonRpcProvider(RPC);

// Example: read Transfer events from any ERC-20
async function getTransfers(tokenAddress, fromBlock, toBlock) {
  const iface = new ethers.Interface([
    "event Transfer(address indexed from, address indexed to, uint256 value)",
  ]);

  const logs = await provider.getLogs({
    address: tokenAddress,
    topics: [iface.getEventTopic("Transfer")],
    fromBlock,
    toBlock,
  });

  return logs.map((log) => {
    const parsed = iface.parseLog(log);
    return {
      from: parsed.args.from,
      to: parsed.args.to,
      value: ethers.formatUnits(parsed.args.value, 18),
      tx: log.transactionHash,
      block: log.blockNumber,
    };
  });
}

// Usage
getTransfers("0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913", "latest" - 1000, "latest")
  .then(console.log)
  .catch(console.error);
