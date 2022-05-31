require('dotenv').config();
const API_URL = process.env.API_URL;
const PUBLIC_KEY = process.env.PUBLIC_KEY;
const PRIVATE_KEY = process.env.PRIVATE_KEY;

const { createAlchemyWeb3 } = require("@alch/alchemy-web3");
const web3 = createAlchemyWeb3(API_URL);

const contract = require("../artifacts/contracts/MyNFT.sol/MyNFT.json");
const contractAddress = process.env.NFT_CONTRACT_ADDRESS;
const nftContract = new web3.eth.Contract(contract.abi, contractAddress);

async function priceNFT(address) {
  // const nonce = await web3.eth.getTransactionCount(PUBLIC_KEY, 'latest'); //get latest nonce

  //the transaction
  // const tx = {
  //   'from': PUBLIC_KEY,
  //   'to': contractAddress,
  //   'nonce': nonce,
  //   'gas': 500000,
  //   'maxPriorityFeePerGas': 2999999987,
  //   'data': nftContract.methods.price().encodeABI(),
  //   'value': 100
  // };
  // console.log('nftContract', nftContract);
  const price = await nftContract.methods.price().call();
  console.log('price', price);
  // console.log('tx', tx);
  // const signedTx = await web3.eth.accounts.signTransaction(tx, PRIVATE_KEY);
  // const transactionReceipt = await web3.eth.sendSignedTransaction(signedTx.rawTransaction);

  // console.log(`Transaction receipt: ${JSON.stringify(transactionReceipt)}`);
};

priceNFT();
