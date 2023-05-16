# NFT
The provided code is a Solidity smart contract that represents an ERC-721 compliant non-fungible token (NFT) contract named "CODERNFT". Let's break down its key components:

1. SPDX-License-Identifier: MIT: This is a SPDX license identifier that specifies the license under which the contract is distributed. In this case, it is the MIT License.

2. Pragma Directive: This line specifies the version of the Solidity compiler that should be used to compile the contract. The caret symbol (^) indicates that the contract is compatible with any version greater than or equal to 0.8.9.

3. Import Statements: The contract imports other Solidity files using the import keyword. It imports three different contracts from the OpenZeppelin library: ERC721, ERC721Enumerable, and Ownable. These contracts provide standard implementations for ERC-721 tokens, including enumerable functionality and ownership management.

4. Contract Inheritance: The contract "CODERNFT" inherits from ERC721, ERC721Enumerable, and Ownable. By inheriting these contracts, "CODERNFT" inherits their functions and state variables, allowing it to extend and customize the inherited functionality.

5. State Variables: 
- "setnftRate": This variable represents the price required in Ether for minting an NFT. It is set to 0.001 Ether.
- "listing": This mapping associates a token ID with its sale price. It keeps track of NFTs that are listed for sale.

6. Constructor: The contract's constructor is executed once during contract deployment. In this case, it initializes the inherited ERC721 contract with the name "CODERNFT" and the symbol "CNFT".

7. Function Overrides:
- "_baseURI": This internal function overrides the baseURI function inherited from ERC721. It returns the base URI (Uniform Resource Identifier) for the NFTs, which is a prefix used to generate the metadata URI for each token.
- "_beforeTokenTransfer": This internal function overrides the _beforeTokenTransfer function inherited from ERC721 and ERC721Enumerable. It is called before each token transfer, allowing for additional checks or actions.
- "supportsInterface": This function overrides the supportsInterface function inherited from ERC721 and ERC721Enumerable. It returns a boolean indicating whether a given interface is supported by the contract.

8. Public and External Functions:
- "safeMint": This function allows users to mint (create) a new NFT by providing an address to assign the token to and a unique tokenId. It requires the sender to send enough Ether (equal to or greater than setnftRate) to complete the minting process.
- "buy": This function allows users to purchase an NFT by providing the tokenId and sending enough Ether to meet the listed sale price. It transfers the Ether to the current owner of the token, transfers the token to the buyer, and removes the token from the listing.
- "sell": This function allows the owner of an NFT to list it for sale by providing the tokenId and the desired sale price. It sets the listing price for the token in the listing mapping.

Overall, this smart contract enables the minting, listing, selling, and buying of NFTs while incorporating ERC-721 standard functionalities. It also includes ownership management through the Ownable contract and inherits from the OpenZeppelin library for reliable implementations of ERC-721 standards.
