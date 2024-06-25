async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  const Token = await ethers.getContractFactory("myERC20Token");
  const token = await Token.deploy();

  console.log("Token deployed to:", token.address);
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
