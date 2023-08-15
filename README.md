# METACRAFTERS-POLY_Module1
## BRIDGING OF THE ASSETS BTW ONE CHAIN AND OTHER 

# Getting Started

1. Clone the repository by : `git clone https://github.com/punks783/Polygon_module_1.git` .
2. `cd Polygon_module_1`.
3. run `npm install`.
4. next check the `hardhat.config.js` file and make necessary changes and also check `contracts/MyNFTS.sol` file .
5. run : `npx hardhat run scripts/deploy.js --network goerli` to deploy the smart contract on the ETH testnet.
6. run : `node scripts/batchmint.js` . to mint 5 NFTS at one go !
7. run : `npx hardhat run scripts/batchtransfer.js --network goerli` to send nfts to the Fx portal and => Matic testnet chain and at end we get our balance also !.

# MyNFT Smart Contract Explanation : 

This is a Solidity smart contract for creating and managing Non-Fungible Tokens (NFTs) using the ERC721 standard. The contract extends the ERC721Enumerable contract from the OpenZeppelin library to provide additional functionalities. The contract allows the owner to mint new NFTs with unique token IDs and provides functions for querying and managing the NFTs.

## Overview of Functions

### `constructor()`

- Constructor function to initialize the contract. It sets the owner of the contract and mints initial NFTs with unique token IDs. The contract name is set as "MyNFT" and the symbol as "MNFTT".

### `function mint(uint256 quantity) external payable ownerAllowed()`

- Allows the owner to mint new NFTs with a specified quantity. The `quantity` parameter determines how many NFTs will be minted in a single transaction. The function checks that the total supply of NFTs does not exceed the maximum limit of 100 and restricts the quantity to be minted to a maximum of 5 in a single transaction.

### `function _baseURI() internal view override returns (string memory)`

- An internal function that overrides the baseURI function from the ERC721 library. It returns the base URL for the NFTs, which will be used to construct the token URI for each NFT.

### `function getPromptDescriptions() external view returns (string[] memory)`

- Allows anyone to query the prompt descriptions available for minting NFTs. It returns an array of string containing the prompt descriptions provided during the contract deployment.

## Project Working

1. The contract allows the contract owner to mint new NFTs. The minted NFTs have unique token IDs starting from 1. The maximum supply of NFTs is limited to 100.
2. The contract comes with an array of prompt descriptions, which were initialized during deployment. These descriptions serve as ideas for the artwork of the NFTs.
3. The base URL for the NFTs is set to "ipfs://bafybeidmme6am4y47ikr6keqr3cwh4q7psjnquiu3sieeuxe5rhpefszwm/" It will be used as a prefix to construct the unique token URI for each NFT.
4. The `mint()` function allows the contract owner to mint new NFTs with a specified quantity. The `quantity` parameter determines how many NFTs will be minted in a single transaction. The maximum allowed quantity is 5.
5. The `getPromptDescriptions()` function allows anyone to query the prompt descriptions available for minting NFTs.
Please note that the contract allows only the owner to mint new NFTs and provides a maximum limit to the quantity of NFTs that can be minted in a single transaction. Additionally, the base URL for the NFTs is predefined and cannot be changed after deployment.
