pragma solidity ^0.4.0;
contract sdf
{
    uint256 []a;
    uint256 temp;
    uint256 a1;
    uint256 b1;
    struct voters
    {
        uint256 vote;
    }
    mapping(uint256=>voters)voter;
    function voting(uint256 whoto)
    {
        voter[whoto].vote+=1;

    }
    function order()
    {
     for(uint256 k=0;k<3;k++)
     {
         a.push(voter[k].vote);
     }
        for(uint256 i=0;i<a.length-1;i++)
        {
            for(uint256 j=i+1;j<a.length;j++)
            {
                if(a[i]<a[j])
                {
                    temp=a[i];
                    a[i]=a[j];
                    a[j]=temp;
                }
            }
       }
    }
    function result() constant returns(string,uint256,uint256,string,uint256,uint256)
    {
        
       for(uint256 i1=0;i1<a.length;i1++)
       {
           if(a[0]==voter[i1].vote)
           {
               a1=i1;
           }
           if(a[1]==voter[i1].vote)
           {
               b1=i1;
           }
       }
       return("winner is",a1,a[0],"runner is",b1,a[1]);
       
    }
}
