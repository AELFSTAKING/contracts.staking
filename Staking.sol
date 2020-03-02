pragma solidity ^0.4.24;

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 {
    function totalSupply() public view returns (uint256);
    function balanceOf(address _who) public view returns (uint256);
    function allowance(address _owner, address _spender) public view returns (uint256);
    function transfer(address _to, uint256 _value) public returns (bool);
    function approve(address _spender, uint256 _value) public returns (bool);
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract StackingDex{

    address internal admin;

    event LogOrderCreate(address creater, uint value, address tokenAddress, string message);
    event LogOrderCancel(address sender, string message);
    event LogOrderExecute(address sender, address receiver, uint value, address tokenAddress, string message);
    event LogAdminChange(address admin);

    constructor() public {
        admin = msg.sender;
    }

    modifier isAdmin() {
        require(msg.sender == admin);
        _;
    }

    function getAdmin() external isAdmin view returns (address) {
        return admin;
    }

    function changeAdmin(address _admin) external isAdmin {
        require(_admin != address(0));
        admin = _admin;
        emit LogAdminChange(_admin);
    }

    function orderCreate(address _creater, uint _value, string _message) public {
        emit LogOrderCreate(_creater, _value, msg.sender, _message);
    }

    function orderCancel(string _message) public {
        emit LogOrderCancel(msg.sender, _message);
    }

    function orderExecute(address _receiver, uint _value, address _tokenAddress, string _message) public isAdmin {
        require(_receiver != address(0));
        require(_tokenAddress != address(0));
        require(_value > 0);
        ERC20(_tokenAddress).transfer(_receiver, _value);
        emit LogOrderExecute(msg.sender, _receiver, _value, _tokenAddress, _message);
    }
}
