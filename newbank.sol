contract bank
{
    struct bk
    {
        
        uint256 balance;
        
     }
    mapping(address => bk)bk1;
    mapping(address=>mapping(address => uint256))bk2;
    address owner=msg.sender;
   
   function deposit(uint256 depo)
    {
        bk1[msg.sender].balance=depo;
    }
    function transaction(address reciver,uint256 transferamt) public
    {
        require(bk1[msg.sender].balance>transferamt);
        bk1[reciver].balance+=transferamt;
        bk1[msg.sender].balance-=transferamt;
    }
     function approve(address _spender, uint256 _value) returns (bool success) {
        
        bk2[msg.sender][_spender] = _value;
        
        return true;
    }
    
   function allowance(address _owner, address _spender) constant returns (uint256 remaining) 
   {
      return bk2[_owner][_spender];
   }

    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) 
    {
       if (bk2[msg.sender][_from] >= _value && _value > 0) 
       {
           bk1[_to].balance += _value;
            bk1[msg.sender].balance -= _value;
            bk2[msg.sender][_from] -= _value;
            
            return true;
        } 
        else 
        {
            return false; 
            
        }
    }
    function balance(address balcheck)public view returns(uint256)
    {
        return bk1[balcheck].balance;
    }
}
