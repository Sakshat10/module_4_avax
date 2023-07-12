// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DegenGamingToken {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) private allowed;

    address public owner;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Redeem(address indexed from, uint256 value);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can perform this action");
        _;
    }

    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _initialSupply) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _initialSupply * (10 ** uint256(decimals));
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0), "Invalid recipient address");
        require(_value <= balances[msg.sender], "Insufficient balance");

        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require(_to != address(0), "Invalid recipient address");
        require(_value <= balances[_from], "Insufficient balance");
        require(_value <= allowed[_from][msg.sender], "Allowance exceeded");

        balances[_from] -= _value;
        balances[_to] += _value;
        allowed[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool) {
        require(_spender != address(0), "Invalid spender address");

        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256) {
        return allowed[_owner][_spender];
    }

    function mint(address _to, uint256 _value) public onlyOwner returns (bool) {
        require(_to != address(0), "Invalid recipient address");
        require(totalSupply + _value >= totalSupply, "Total supply overflow");

        totalSupply += _value;
        balances[_to] += _value;
        emit Transfer(address(0), _to, _value);
        return true;
    }

    function burn(uint256 _value) public returns (bool) {
        require(_value <= balances[msg.sender], "Insufficient balance");

        balances[msg.sender] -= _value;
        totalSupply -= _value;
        emit Transfer(msg.sender, address(0), _value);
        return true;
    }

    function redeem(uint256 _value) public returns (bool) {
        require(_value <= balances[msg.sender], "Insufficient balance");

        balances[msg.sender] -= _value;
        emit Redeem(msg.sender, _value);
        return true;
    }
}
