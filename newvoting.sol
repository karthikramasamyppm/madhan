pragma solidity ^0.4.0;
contract sdf
{
    uint256 []a;
    uint256 temp;
    uint256 a1;
    uint256 b1;
    uint256 public c;
    uint256 public d;
    struct voters
    {
        string candidate;
        uint256 vote;
    }
    mapping(uint256=>voters)voter;
    mapping(string=>voters)voter1;
    function sdf()
    {
        c=3;
    }
    function candidatedetails(string name)
    {
        require(d<c);
        {
        voter[d].candidate=name;
        d++;
        }
    }
    function voting(string whoto)
    {
        voter1[whoto].vote+=1;

    }
    function order()
    {
     for(uint256 k=0;k<c;k++)
     {
         a.push(voter1[voter[k].candidate].vote);
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
    function result() constant returns(string winneris,uint256 vote,string runneris,uint256 vote1)
    {
        
       for(uint256 i1=0;i1<a.length;i1++)
       {
           if(a[0]==voter1[voter[i1].candidate].vote)
           {
               a1=i1;
           }
           if(a[1]==voter1[voter[i1].candidate].vote)
           {
               b1=i1;
           }
       }
       return(voter[a1].candidate,a[0],voter[b1].candidate,a[1]);
       
    }
}
