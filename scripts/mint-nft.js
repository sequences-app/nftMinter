require('dotenv').config();
const API_URL = process.env.API_URL;
const PUBLIC_KEY = process.env.PUBLIC_KEY;
const PRIVATE_KEY = process.env.PRIVATE_KEY;

const { createAlchemyWeb3 } = require("@alch/alchemy-web3");
const web3 = createAlchemyWeb3(API_URL);

const contract = require("../artifacts/contracts/MyNFT.sol/MyNFT.json");
const NFT_CONTRACT_ADDRESS = process.env.NFT_CONTRACT_ADDRESS;
const nftContract = new web3.eth.Contract(contract.abi, NFT_CONTRACT_ADDRESS);

async function mintNFT(address, tokenURI) {
  const nonce = await web3.eth.getTransactionCount(PUBLIC_KEY, 'latest'); //get latest nonce

  //the transaction
  const tx = {
    'from': PUBLIC_KEY,
    'to': contractAddress,
    'nonce': nonce,
    'gas': 500000,
    'maxPriorityFeePerGas': 2999999987,
    'data': nftContract.methods.mintNFT(address, tokenURI).encodeABI()
  };

  const signedTx = await web3.eth.accounts.signTransaction(tx, PRIVATE_KEY);
  const transactionReceipt = await web3.eth.sendSignedTransaction(signedTx.rawTransaction);

  console.log(`Transaction receipt: ${JSON.stringify(transactionReceipt)}`);
};

mintNFT("0x43c1e5e2c7e9364a2a01679bf7870eed4513c43e", "https://gateway.pinata.cloud/ipfs/QmZ2pXu5rtWJPmJakbbH8q8vK4dMmSuovGcu6iTQkFP3wJ");
