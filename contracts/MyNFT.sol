//Contract based on https://docs.openzeppelin.com/contracts/3.x/erc721
// SPDX-License-Identifier: MIT
pragma solidity ^0.7.3;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract MyNFT is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    string[] _tokenURIs = ["https://gateway.pinata.cloud/ipfs/QmX4Lt6n3XujaDD2L7aYSvCZwFnzf5CDMJReQspSs69qMR", "https://gateway.pinata.cloud/ipfs/QmdtNTzrTfcdCUaw9niZWLk1ZTcuZR46if29wyB2GkwfFP", "https://gateway.pinata.cloud/ipfs/QmainEiskW9YSWMc6kBBogNFjUi6wWbQEkDKqFNt2satcu", "https://gateway.pinata.cloud/ipfs/QmecSNmdPJU4rH82sr49QFo2hSqxzpSe42ytkwx87QiAJ5", "https://gateway.pinata.cloud/ipfs/QmcwvVujYJHeDLdbB9mn1rfe5gKsuGfcMpPgYkC38XvbJS"];

    constructor() ERC721("SQNCS_NFT", "NFT") {}

    // 1. Make smart contract accept new admin
    // 2. Smart contract will be deployed when given with list of tokenURI
    
    // make owner to add admin access to other address
    function mintNFT(address recipient)
        public
        returns (uint256)
    {
        // tokenIds will reach certain number and it will stop
        // require(_tokenIds <= _tokenURIs.length);
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, _tokenURIs[newItemId % 5]);

        return newItemId;
        
    }
}
