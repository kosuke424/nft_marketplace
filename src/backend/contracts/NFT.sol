// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

// アイテムを創造して保存するコントラクト
contract NFT is ERC721URIStorage {
    uint public tokenCount;

    // コントラクトのデブロイ時に一度だけ実行する処理。
    // アイテム名とシンボルを指定
    constructor() ERC721("DApp NFT", "DAPP"){}

    // アイテムを鋳造する関数
    function mint(string memory _tokenURI) external returns(uint) {
        // トークンIDの発行
        tokenCount ++;
        // msg.sender(この関数の実行者)にトークンIDを渡す
        _safeMint(msg.sender, tokenCount);
        // アイテムのメタデータ(アドレス)を保存する
        _setTokenURI(tokenCount, _tokenURI);
        return(tokenCount);
    }
}