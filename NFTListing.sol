// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.8.3/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.8.3/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts@4.8.3/access/Ownable.sol";

contract CODERNFT is ERC721, ERC721Enumerable, Ownable {
    uint256 public setnftRate = 0.001 ether;
     mapping(uint256 => uint256) private listing;
    constructor() ERC721("CODERNFT", "CNFT") {

    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://gateway.pinata.cloud/ipfs/QmNdsSq86cQZHAheQjATWdfdLmDpsLwLm7LofGepe4QVHS";
    }

    function safeMint(address to, uint256 tokenId) public payable  {
        
        require(msg.value >= setnftRate, "Not have enough Ether" );
        _safeMint(to, tokenId);
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
    function buy(uint256 tokenId) public payable returns (bool) {
        require(listing[tokenId] > 0, "Token not listed for sale");
        require(msg.value >= listing[tokenId], "Not enough Ether to purchase the token");
        address seller = ownerOf(tokenId);
        payable(seller).transfer(msg.value);
        _safeTransfer(seller, msg.sender, tokenId, "");
        delete listing[tokenId];
        return true;
    }
    function sell(uint256 tokenId, uint256 price) public returns (bool) {
        require(ownerOf(tokenId) == msg.sender, "Not the owner of the token");
        listing[tokenId] = price;
        return true;
    }
}
