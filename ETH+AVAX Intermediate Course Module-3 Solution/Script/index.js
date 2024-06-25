async function main() {
  const [owner, addr1] = await ethers.getSigners();
  const Token = await ethers.getContractFactory("myERC20Token");
  const token = await Token.attach("YOUR_DEPLOYED_CONTRACT_ADDRESS");

  console.log("Minting 1000 tokens to addr1...");
  await token.mint(addr1.address, ethers.utils.parseUnits("1000", 18));

  console.log("Transferring 100 tokens from addr1 to owner...");
  await token.connect(addr1).transfer(owner.address, ethers.utils.parseUnits("100", 18));

  console.log("Burning 50 tokens from addr1...");
  await token.connect(addr1).burn(ethers.utils.parseUnits("50", 18));

  console.log("Interaction complete.");
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
