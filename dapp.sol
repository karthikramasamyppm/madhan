
contract bank
{
    struct bk
    {
     uint256 balance;
     }
    mapping(uint256 => bk)bk1;
    mapping(uint256=>mapping(uint256 => uint256))bk2;
    uint owner=11;
   function deposit(uint256 depo)returns(uint)
    {
        bk1[owner].balance=depo;
        return bk1[owner].balance;
    }
    function transaction(uint256 reciver,uint256 transferamt) public returns(uint256)
    {
        require(bk1[owner].balance>transferamt);
        bk1[reciver].balance+=transferamt;
        bk1[owner].balance-=transferamt;
        return bk1[reciver].balance;
    }
     function approve(uint256 _spender, uint256 _value) returns (bool success) {
        
        bk2[owner][_spender] = _value;
        
        return true;
    }
    function allowance(uint256 _owner,uint256 _spender) constant returns (uint256 remaining) 
   {
      return bk2[_owner][_spender];
   }
    function transferFrom(uint256 _from, uint256 _to, uint256 _value) returns (bool success) 
    {
       if (bk2[owner][_from] >= _value && _value > 0) 
       {
           bk1[_to].balance += _value;
            bk1[owner].balance -= _value;
            bk2[owner][_from] -= _value;
            
            return true;
        } 
        else 
        {
            return false; 
            
        }
    }
    function balance(uint256 balcheck)public view returns(uint256)
    {
        return bk1[balcheck].balance;
    }
}
