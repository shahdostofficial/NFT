// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.8.3/token/ERC721/ERC721.sol";
contract CODERNFT is ERC721{    

    uint256 public setnftRate = 0.001 ether;
    mapping(uint256 => uint256) public listing;

    constructor() ERC721("CODERNFT", "CNFT") {}

    function _baseURI() internal pure override returns (string memory) {
        return "provide your CID";
    }

    function safeMint(address to, uint256 tokenId) public payable  {
        
        require(msg.value >= setnftRate, "Not have enough Ether" );
        _safeMint(to, tokenId);
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal
        override(ERC721)
    {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    function buy(uint256 tokenId) public payable returns (bool) {
        
        require(listing[tokenId] > 0, "Token not listed for sale");
        require( msg.value >= listing[tokenId], "Not enough Ether to purchase the token");
        require(msg.sender != ownerOf(tokenId),"Minter Can't Buy it's own nft");
        address seller = ownerOf(tokenId);
        payable(seller).transfer(msg.value);
        _safeTransfer(seller, msg.sender, tokenId, "");  
        return true;
    }
    function sell(uint256 tokenId, uint256 price) public returns (bool) {
        require(ownerOf(tokenId) == msg.sender, "Not the owner of the token");
        listing[tokenId] = price;
        return true;
    }


}
