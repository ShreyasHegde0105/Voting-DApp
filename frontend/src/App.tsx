import React, { useState } from "react";
import { ethers } from "ethers";
import Web3Modal from "web3modal";
import { CONTRACT_ADDRESS, CONTRACT_ABI } from "./contract";

function App() {
  const [provider, setProvider] = useState<ethers.providers.Web3Provider | null>(null);
  const [account, setAccount] = useState<string>("");

  async function connectWallet() {
    const web3Modal = new Web3Modal();
    const connection = await web3Modal.connect();
    const provider = new ethers.providers.Web3Provider(connection);
    setProvider(provider);

    const signer = provider.getSigner();
    const address = await signer.getAddress();
    setAccount(address);
  }

  return (
    <div>
      {!account ? (
        <button onClick={connectWallet}>Connect Wallet</button>
      ) : (
        <p>Connected: {account}</p>
      )}
    </div>
  );
}

async function getContract(signerOrProvider: any) {
  return new ethers.Contract(CONTRACT_ADDRESS, CONTRACT_ABI, signerOrProvider);
}

async function loadCandidates() {
  if (!provider) return;

  const contract = await getContract(provider);
  const candidates = await contract.getAllCandidates(); // change to your function
  console.log(candidates);
}

async function voteForCandidate(id: number) {
  if (!provider) return;

  const signer = provider.getSigner();
  const contract = await getContract(signer);

  const tx = await contract.vote(id);
  await tx.wait();
  alert("Voted!");
}


export default App;
