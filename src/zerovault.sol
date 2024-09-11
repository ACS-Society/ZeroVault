/*
   *******************************************************
   *                                                     *
   *             ACS Contract Audit Program              *
   *   _______________________________________________   *
   *                                                     *
   *   A structured path for auditors and bug bounty      *
   *   hunters to learn by finding and reporting          *
   *   vulnerabilities in smart contracts.                *
   *                                                     *
   *   Level: Beginner                                    *
   *   Special thanks: Aniket Tyagi                       *
   *                                                     *
   *******************************************************
*/

// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract Zerovault {


    uint256 public totalCollateral;
    uint256 public tokenPrice = 1 ether;
    uint256 public collateralizationRatio = 150;
    string private ownerkey;
    mapping(address => uint256) public collateralBalances;
    mapping(address => uint256) public tokenBalances;
    mapping(address => mapping(address => uint256)) public allowances;
    address public owner;

    event onlyOwnercallthefunction();

    constructor(address _owner) {
        owner = _owner;
    }

    modifier onlyOwner { 
        owner == msg.sender;
        _;
    }

    // @info This function allows users to mint new tokens by sending collateral.
    // @notice The caller must be the contract owner and should send a valid amount of collateral.
    
    function mint() public payable {

        require(msg.sender != owner, "Only Owner Call this function");
        require(msg.value > 0, "No collateral provided");
        uint256 tokensToMint = msg.value * 100 / collateralizationRatio / tokenPrice;
        collateralBalances[msg.sender] += msg.value;
        tokenBalances[msg.sender] += tokensToMint;
        totalCollateral += msg.value;
    }

    // @info This function allows users to burn their tokens in exchange for returning collateral.
    // @notice The caller must have enough tokens to burn, and the appropriate collateral will be returned to them.
    // @param amount The number of tokens the caller wants to burn.

    function burn(uint256 amount) public {
        
        require(tokenBalances[msg.sender] >= amount, "Not enough tokens");

        uint256 collateralToReturn = amount * collateralizationRatio * tokenPrice / 100;
        payable(msg.sender).transfer(collateralToReturn);

        tokenBalances[msg.sender] -= amount;
        collateralBalances[msg.sender] -= collateralToReturn;
      
        totalCollateral -= collateralToReturn;
    }

    // @info This function allows the owner to change the collateralization ratio for minting and burning tokens.
    // @param 'newRatio' The new collateralization ratio to be set.

    function changeCollateralizationRatio(uint256 newRatio) public {

        if (msg.sender != owner) { 
            emit onlyOwnercallthefunction();
        } else {
            collateralizationRatio = newRatio;
        }
    }

    // @info This function allows a user to liquidate another user's position if it is under-collateralized.
    // @notice The caller can only liquidate if the targeted user's collateral is less than the required collateral for their tokens.
    // @param user The address of the user whose position is to be liquidated.

    function liquidate(address user) public  {

        uint256 userCollateral = collateralBalances[user];
        uint256 userTokens = tokenBalances[user];

        // If user token = 20 and if attacker make the collateral ratio zero then user never receive their token
        
        uint256 requiredCollateral = userTokens * collateralizationRatio * tokenPrice / 100;
        require(userCollateral < requiredCollateral, "Position is sufficiently collateralized");


        payable(msg.sender).transfer(userCollateral);
        collateralBalances[user] = 0;
        tokenBalances[user] = 0;

        totalCollateral -= userCollateral;
    }

    // @info This function allows a user to approve another address to spend a specified amount of tokens on their behalf.
    // @notice The approval amount is set for the specified spender address, and this function does not require a transfer of tokens.
    // @param 'spender' The address that is allowed to spend the tokens.
    // @param 'amount' The amount of tokens that the spender is allowed to spend.

    function approve(address spender, uint256 amount) public {

        allowances[msg.sender][spender] = amount;
    }

    // @info This function allows the owner to transfer tokens from one address to another on behalf of the token holder.
    // @notice The transfer is only allowed if the sender is the owner, and the transfer amount does not exceed the available balance or allowance.
    // @param from The address from which tokens will be transferred.
    // @param to The address to which tokens will be transferred.
    // @param amount The amount of tokens to transfer.

    function transferFrom(address from, address to, uint256 amount) public onlyOwner {
        
        require(tokenBalances[from] >= amount, "Insufficient token balance");
        require(allowances[from][msg.sender] >= amount, "Allowance exceeded");


        tokenBalances[from] -= amount;
        tokenBalances[to] += amount;

        allowances[from][msg.sender] -= amount;
    }

    // @info This function allows owner to withdraw all Ether from the contract.
    // @notice Use with caution, as it enables withdrawing the entire balance of the contract.
    // @param '_owner' The address to which the Ether should be sent

    function emergencyWithdraw(address _owner) public  {
        require(msg.sender != owner, "Only owner can withdraw");


        payable(_owner).transfer(address(this).balance);
    }

    // @info This function allows the owner to set the price of the token.
    // @notice Only the owner can call this function to update the token price.
    // @param 'm_price' The new price of the token.

    function settokenprice(uint256 m_price) public onlyOwner{

        tokenPrice = m_price;
    }

    // @info This function allows the owner to set a private key or secrets.
    // @notice Only the owner can call this function to update the owner key.
    // @param '_data' The new owner key as a string.

    function setownerkey(string memory _data) public {

        require(msg.sender == owner, "Only Owner Call this function");
        ownerkey = _data;
    }

    // @info This function allows the owner to retrieve the private key or secrets.
    // @notice Only the owner can call this function to get the owner key.
    // @return The current owner key as a string.

    function getOnwerKey() public view returns(string memory) {
        require(msg.sender == owner, "Only Owner Call this function");
        return ownerkey;
    }   

    receive() external payable {
        totalCollateral += msg.value;
    }
}
