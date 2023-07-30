// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract MyNFT is ERC721Enumerable {
    address public owner;
    string[] public promptDescription;

    // Base URL for the NFTs
    string public baseUrl = "https://orange-wonderful-catshark-766.mypinata.cloud/ipfs/QmZo7uw4fqz41HTrLfsi8RS8b9cKXfKz8W7QVoSGp2AA8S/?_gl=1*hq93ov*_ga*NDk0NTY1MjM0LjE2ODgzODEzNzE.*_ga_5RMPXG14TE*MTY5MDczMDc4NC40LjEuMTY5MDczMjUyOS42MC4wLjA.";

    constructor() ERC721("MyNFT", "MNFTT") {
        owner = msg.sender;

        // Initialize the prompt descriptions by the Pinta !
        promptDescription = [
            "house at the middle of the ocean with an extremely luxurious glass and pastel walled villa surrounding a huge jungle at night",
            "A shiba doge playing electric guitar on top of The Berlin Wall",
            "Cool motorcyclist with space suit riding on moon with storm and galaxy in background",
            "Monkey with sunglasses in the woods",
            "okaybear with sunglasses in the woods"
        ];

        // Mint the initial NFTs
        for (uint256 i = 0; i < promptDescription.length; i++) {
            _mint(msg.sender, i + 1);
        }
    }

    // Modifier that only allows the owner to execute a function ! 
    modifier ownerAllowed() {
        require(msg.sender == owner, "Only the owner can perform this action!");
        _;
    }

    // Function to mint NFTs, which only the owner can perform
    function mint(uint256 quantity) external payable ownerAllowed() {
        require(quantity <= 5, "You can only mint up to 5 NFTs at a time");
        require(totalSupply() + quantity <= 100, "Maximum NFT supply reached");

        for (uint256 i = 0; i < quantity; i++) {
            uint256 tokenId = totalSupply() + 1;
            _mint(msg.sender, tokenId);
        }
    }

    // Override the baseURI function to return the base URL for the NFTs
    function _baseURI() internal view override returns (string memory) {
        return baseUrl;
    }

    // Return the prompt descriptions
    function getPromptDescriptions() external view returns (string[] memory) {
        return promptDescription;
    }
}