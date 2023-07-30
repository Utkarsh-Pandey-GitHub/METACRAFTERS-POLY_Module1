const { ethers } = require("hardhat");
const  FXRootContractAbi  = require('../fxRootContractABI.json');
const ABI = require('../artifacts/contracts/MyNFT.sol/MyNFT.json');
require('dotenv').config();

async function main() {

  // connection btw rpc and wallet !
  const networkAddress = 'https://ethereum-goerli.publicnode.com';
  const privateKey = process.env.PRIVATE_KEY;
  const provider = new ethers.JsonRpcProvider(networkAddress);

  // Create a wallet instance
  const wallet = new ethers.Wallet(privateKey, provider);

  // Get the signer instance
  const [signer] = await ethers.getSigners();

  // Get ERC721 contract instance of MyNFT
  const NFT = await ethers.getContractFactory("MyNFT");
  const nft = await NFT.attach('0x5eBf5E6bB9357Edc442D47ba5E1184FD218b8A7f');

  // Get FXRoot contract instance
  const fxRootAddress = '0xF9bc4a80464E48369303196645e876c8C7D972de';
  const fxRoot = await ethers.getContractAt(FXRootContractAbi, fxRootAddress);

  // NFTIds to transfer
  const tokenIds = [1, 2, 3, 4, 5]; 

  // Approve the nfts for transfer
  const approve = await nft.connect(signer).setApprovalForAll(fxRootAddress, true);
  await approve.wait();
  console.log('\n Just Started the token bridge!! 👍👍 ........');

  // Deposit the nfts to the FXRoot contracts
  for (let i = 1; i < tokenIds; i++) {
    const deposit = await fxRoot.connect(signer).deposit(
      nft.address,
      wallet.address, 
      tokenIds[i],
      '0x6566'
    );

    // Wait for the deposit to be confirmed
    await deposit.wait();
  }

  console.log("\n 🎊 🎉 Congracts !! Your bridge and deposite is succesffuly");

  
  // Test balanceOf
  const balance = await nft.balanceOf(wallet.address);

  // Print the balance of the wallet
  console.log("\n The Amount of NFT in your wallet remaining is : ", balance.toString());
}


// Call the main function and handle any errors
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });