28.02.22: Archive, this is OUTDATED, refer to UPDATED_VERSION now




24.02.22

Import of the Aave V2 protocol, to use the flashloan services.
- reused Patrick's code for importing
- reused my brownie-config file, modified default network and OpenZeppelin contract version
- created a get_weth.py script, will try do write by myself but not sure if I can do that without looking at anybody's code yet 

==> Managed to import what is necessary (I think but will look deeper later), and compiling worked! 




26.02.22

---- not everything had been compiled, now I'm facing issues between the imported versions. I am struggling to look up the answer, every search I start leads to something very different than what I am looking for. 
I keep on digging, maybe I'll leave the node_modules folder out for now and keep working on the code itself to move forward, but at the same time it seems like something I should be able to fix as a beginner, something that will be considered a very basic move in the future.

Ok, so, I've revised my position
    1) I had decided to go through with Aave V2 flashloans, not finding information on whether there should be some kind of mix between V3 and V2 given that V3 doesn't have a tutorial for flashloans yet and keeps sending us back to V2
    2) Remembered there is a brownie mix for flashloans, the one that Patrick used in his tutorial

    I decided to download the mix and work on it, as my research keeps dragging in time and I don't reach a place where I can finally start working on scripts and the logic inside the flashloan 
    I'll take the time to go through each document and make sure I understand what's going on at a core level, use the mix as a ground to evaluate my understanding and ease to implement smart contracts. 

    => mix downloaded, get_weth script run with only the issue that I didn't have enough test ETH, so I got some, but still couldn't reach 1 ETH to trade to 1 WETH to be able to interact with the lending pool (as it only accepts wrapped ETH)
    I ended up changing the logic to only give me 0.000001 WETH, time to stack up test ETH.
    -Although I will also have to run tests on Ganache, so I could use the unlimited Ganache test ETH supply to buy WETH and test my logic.

    the integrated deployment_v2.py also got ran on kovan successfully
    