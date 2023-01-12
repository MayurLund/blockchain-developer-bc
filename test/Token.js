const { ethers } = require('hardhat');  
const { expect } = require('chai');

const tokens = (n)=>{
    return ethers.utils.parseUnits(n.toString(),'ether')
}

//create a container for test
describe('Token', ()=>{
    
    //create globally so that it can be used in test cases
    let token,accounts,deployer
    
    //tests go inside here...
    beforeEach(async()=>{
        //code goes here
        const Token = await ethers.getContractFactory('Token')
        token = await Token.deploy('Mac Token','MAC','1000000');
        //to get alla accounts - ethers.getSigners
        accounts = await ethers.getSigners()
        deployer = accounts[0]
    })

    describe('Deployment', () => {
        const name = 'Mac Token'
        const symbol = 'MAC'
        const decimals = '18'
        const totalSupply = tokens('1000000')
         
        it('has correct name', async () => {
            //3 step process
            //fetch Token from blockchain -- already done in beforeEach now
            //read token name
            //check that name is correct
            expect(await token.name()).to.equal(name)
        })
    
        it('has correct symbol', async () => {
            expect(await token.symbol()).to.equal(symbol) 
        })
    
        it('has correct decimals', async () => {
            expect(await token.decimals()).to.equal('18')
        })
    
        it('has correct totalSupply', async () => {
            //const value = ethers.utils.parseUnits('1000000','ether')
            expect(await token.totalSupply()).to.equal(totalSupply)
        })

        it('assigns total supply to deployer', async() => {
            //console.log(deployer)
            expect (await token.balanceOf(deployer.address)).to.equal(totalSupply)
        })
    })

    

})