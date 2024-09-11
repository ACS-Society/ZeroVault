
<h1 align="center">ACS Contract Audit Program</h1>

<div align="center">


<p align="center">
<a align="center" href="https://git.io/typing-svg"><img src="https://readme-typing-svg.demolab.com/?font=Space+Grotesk+Code&center=true&duration=2000&color=113569&pause=100&random=false&width=750&height=100&multiline=true&lines=Welcome+to+ACS+Contract+Audit+Program!%20;We+extend+our+best+wishes+for+you+to%20;achieve+all+your+goals." alt="Typing SVG" /></a>


**Association For Cyber Security (ACS)**

Established in 2023, the Association for Cyber Security (ACS) is dedicated to educating and raising awareness about the critical importance of cybersecurity in today's rapidly evolving digital landscape. Despite our modest beginnings, ACS has grown into a thriving community with over 3000+ members active across various social platforms, fostering a dynamic synergy between our organization and the broader community.
</div>

<div align="center">
<img src="https://github.com/user-attachments/assets/5e169fe4-b247-4807-a8b0-f19e4d449d16">
</div>


### ZeroVault 

The Zerovault contract manages collateralized tokens, allowing users to mint tokens by depositing collateral and burn tokens to reclaim their collateral. It tracks user balances and total collateral, with functions to adjust the collateralization ratio and token price. The contract includes owner-only controls and emergency withdrawal capabilities.


### Protocol Roles

### 1. **Owner**
   - Manages contract settings (`tokenPrice`, `collateralizationRatio`).
   - Has exclusive authority over minting tokens and emergency actions.
   - Key functions: `mint()`, `settokenprice()`, `changeCollateralizationRatio()`, `emergencyWithdraw()`.

### 2. **User**
   - burns tokens by providing or withdrawing collateral.
   - Can transfer tokens and approve others for transfers.
   - Key functions: `burn()`, `approve()`, `transferFrom()`.


### Getting Started 

#### Requirements 

- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [Foundry Installation](https://getfoundry.sh/)
- [Foundry Documentation](https://book.getfoundry.sh/)

#### Installation 

```
git clone [repo-name] && cd repo_name 
forge build
```

### Scope 

```
./src/
└── zerovault.sol
```

Solc Version: 0.8.0</br>
Deployment: The team is planning to deploy the protocol on the Polygon network.


### Known Vulnerabilities

Known Vulnerabilities
Currently, there are no known vulnerabilities in the protocol. However, it has not yet been audited by any external team. This means that potential security issues or weaknesses may exist, which could be discovered during a thorough audit. It is recommended to conduct a comprehensive audit before deploying the protocol in a live environment.

<b>Hint:</b> Developer team is new to the blockchain development, auditors may have a greater chance of identifying various vulnerabilities during a audit. 
