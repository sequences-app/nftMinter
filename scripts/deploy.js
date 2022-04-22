async function main() {
    // const HelloWorld = await ethers.getContractFactory("HelloWorld");
 
    // // Start deployment, returning a promise that resolves to a contract object
    // const hello_world = await HelloWorld.deploy("Hello World!");   
    // console.log("Contract deployed to address:", hello_world.address);
  // Grab the contract factory 
  const MyNFT = await ethers.getContractFactory("MyNFT");

  // Start deployment, returning a promise that resolves to a contract object
  const myNFT = await MyNFT.deploy(); // Instance of the contract 
  console.log("Contract deployed to address:", myNFT.address);
 }
 
 main()
   .then(() => process.exit(0))
   .catch(error => {
     console.error(error);
     process.exit(1);
   });

   // 0x9194F37099B6cEe42B47Fa03C6F90196AFFE60e5
   