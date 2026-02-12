# Decentralized Voting DApp

A blockchain-based voting application built with Solidity and Hardhat. This project demonstrates a transparent and tamper-proof voting system on the Ethereum blockchain.

## About This Project

This is a learning project developed as part of my journey in blockchain development. As a 3rd year engineering student, I built this to understand:
- Smart contract development with Solidity
- Blockchain deployment using Hardhat
- Decentralized application architecture
- Testing and deployment on test networks

## Features

- **Transparent Voting**: All votes are recorded on the blockchain
- **Admin Controls**: Election administrators can manage candidates and voters
- **Voter Registration**: Only registered voters can participate
- **Vote Tracking**: Prevent double voting
- **Real-time Results**: View voting results anytime
- **Secure**: Leverages blockchain's immutability

## Tech Stack

- **Smart Contracts**: Solidity ^0.8.0
- **Development Framework**: Hardhat 3 Beta
- **Testing**: Node.js test runner + Foundry
- **Ethereum Library**: Viem
- **Language**: TypeScript
- **Network**: Ethereum Sepolia Testnet (for deployment)

## Prerequisites

Before running this project, make sure you have:

- Node.js (v18 or higher)
- npm or yarn
- MetaMask wallet (for deployment)
- Basic understanding of Solidity and Ethereum

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/ShreyasHegde0105/Voting-DApp.git
cd Voting-DApp
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Compile Smart Contracts

```bash
npx hardhat compile
```

### 4. Run Tests

Run all tests:
```bash
npx hardhat test
```

Run only Solidity tests:
```bash
npx hardhat test solidity
```

Run only Node.js tests:
```bash
npx hardhat test nodejs
```

## Smart Contract Overview

### Voting.sol (Main Contract)

The voting contract includes:

- **Candidate Management**: Add candidates to the election
- **Voter Registration**: Register eligible voters
- **Voting Mechanism**: Cast votes securely
- **Result Calculation**: Determine the winner
- **Access Control**: Admin-only functions for setup

### Key Functions

```solidity
// Admin Functions
addCandidate(string name)          // Add a new candidate
registerVoter(address voter)       // Register a voter
startVoting()                      // Open voting period
endVoting()                        // Close voting period

// Voter Functions
vote(uint candidateId)             // Cast a vote

// View Functions
getWinner()                        // Get election results
candidates(uint id)                // View candidate details
voters(address voter)              // Check voter status
```

## Deployment

### Local Deployment

Deploy to Hardhat local network:

```bash
npx hardhat node
npx hardhat ignition deploy ignition/modules/Voting.ts --network localhost
```

### Testnet Deployment (Sepolia)

1. **Set up your private key**:

Using hardhat-keystore:
```bash
npx hardhat keystore set SEPOLIA_PRIVATE_KEY
```

Or set as environment variable:
```bash
export SEPOLIA_PRIVATE_KEY="your-private-key-here"
```

2. **Get Sepolia ETH**: 
   - Visit [Sepolia Faucet](https://sepoliafaucet.com/)
   - Get free test ETH

3. **Deploy**:
```bash
npx hardhat ignition deploy --network sepolia ignition/modules/Voting.ts
```

## Testing

The project includes comprehensive tests:

- **Unit Tests**: Test individual contract functions
- **Integration Tests**: Test complete voting workflows
- **Edge Cases**: Test security and edge scenarios

Example test scenarios:
- Only admin can add candidates
- Voters cannot vote twice
- Unregistered voters cannot vote
- Voting only allowed when open
- Correct winner calculation

## Project Structure

```
Voting-DApp/
├── contracts/           # Solidity smart contracts
│   └── Voting.sol      # Main voting contract
├── ignition/           # Deployment modules
│   └── modules/
│       └── Voting.ts   # Deployment script
├── scripts/            # Utility scripts
├── test/              # Test files
│   ├── Voting.test.ts # TypeScript tests
│   └── Voting.t.sol   # Solidity tests
├── hardhat.config.ts  # Hardhat configuration
├── package.json       # Dependencies
└── README.md          # This file
```

## Security Considerations

- Admin private key must be kept secure
- Voter addresses should be verified before registration
- Consider adding time-locks for voting periods
- Implement re-entrancy guards for production
- Audit contracts before mainnet deployment

## Future Enhancements

As I continue learning, I plan to add:

- [ ] React frontend for better user experience
- [ ] Multiple concurrent elections support
- [ ] Vote delegation feature
- [ ] Anonymous voting using cryptography
- [ ] IPFS integration for candidate information
- [ ] Mobile-responsive UI
- [ ] Email notifications for voters
- [ ] Advanced analytics dashboard

## What I Learned

Through this project, I gained hands-on experience with:

1. **Solidity Development**
   - Writing smart contracts
   - Implementing access control
   - Event emission and listening
   - Gas optimization basics

2. **Hardhat Framework**
   - Project setup and configuration
   - Testing strategies
   - Deployment workflows
   - Network management

3. **Blockchain Concepts**
   - Transaction finality
   - Gas fees and optimization
   - Testnet vs Mainnet
   - Wallet integration

## Contributing

This is a learning project, but suggestions and improvements are welcome!

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Contact

Shreyas Hegde - [@ShreyasHegde0105](https://github.com/ShreyasHegde0105)

Project Link: [https://github.com/ShreyasHegde0105/Voting-DApp](https://github.com/ShreyasHegde0105/Voting-DApp)

## License

This project is open source and available under the [MIT License](LICENSE).

## Acknowledgments

- Hardhat documentation and community
- Ethereum development resources
- OpenZeppelin for smart contract patterns
- My college professors and peers for guidance

---

**Note**: This project is for educational purposes. Do not use in production without proper security audits and testing.

---

### Quick Start Commands Cheat Sheet

```bash
# Install
npm install

# Compile
npx hardhat compile

# Test
npx hardhat test

# Deploy locally
npx hardhat node
npx hardhat ignition deploy ignition/modules/Voting.ts --network localhost

# Deploy to Sepolia
npx hardhat ignition deploy --network sepolia ignition/modules/Voting.ts

# Clean
npx hardhat clean
```

Happy Voting! 🗳️✨