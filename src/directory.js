import { ethers } from 'ethers';
import deployed from './deployedContracts';

const directoryAbi = require('../build/contracts/Directory.json');

const { abi } = directoryAbi;

// Connect to the network
const provider = ethers.getDefaultProvider();

// Deployed Contract Addresses
// // Ropsten:
// const contractAddress = deployed.ropsten.Directory;
// Rinkeby:
const contractAddress = deployed.rinkeby.Directory;

// We connect to the Contract using a Provider, so we will only
// have read-only access to the Contract
const contract = new ethers.Contract(contractAddress, abi, provider);

export default contract;
