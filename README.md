# DegenGamingToken

DegenGamingToken is an ERC-20 compliant token contract developed on the Ethereum blockchain. It allows for the creation, transfer, and management of tokens for gaming purposes.

## Contract Details

- **Name:** DegenGamingToken
- **Symbol:** DGT
- **Decimals:** 18
- **Total Supply:** [totalSupply]

## Contract Owner

The contract owner has certain privileges and can perform administrative actions within the contract.

## Functions

### `balanceOf`

```solidity
function balanceOf(address _owner) public view returns (uint256)
```

This function returns the token balance of a given address.

### `transfer`

```solidity
function transfer(address _to, uint256 _value) public returns (bool)
```

This function allows the sender to transfer tokens to another address.

### `transferFrom`

```solidity
function transferFrom(address _from, address _to, uint256 _value) public returns (bool)
```

This function allows a third party to transfer tokens from one address to another, given the approval from the token owner.

### `approve`

```solidity
function approve(address _spender, uint256 _value) public returns (bool)
```

This function allows the token owner to approve a third party to spend tokens on their behalf.

### `allowance`

```solidity
function allowance(address _owner, address _spender) public view returns (uint256)
```

This function returns the remaining allowance of tokens a spender has from a particular owner.

### `mint`

```solidity
function mint(address _to, uint256 _value) public onlyOwner returns (bool)
```

This function allows the contract owner to mint new tokens and assign them to a specific address.

### `burn`

```solidity
function burn(uint256 _value) public returns (bool)
```

This function allows a token holder to burn a specific amount of their tokens, reducing the total supply.

### `redeem`

```solidity
function redeem(uint256 _value) public returns (bool)
```

This function allows a token holder to redeem a specific amount of their tokens.

## Events

### `Transfer`

This event is emitted when tokens are transferred from one address to another.

### `Approval`

This event is emitted when the token owner approves a third party to spend tokens on their behalf.

### `Redeem`

This event is emitted when tokens are redeemed by a token holder.

---
