// create a variable to hold your NFT's
let arrayNFT=[];
// this function will take in some values as parameters, create an
// NFT object using the parameters passed to it for its metadata, 
// and store it in the variable above.
function mintNFT (_name, _id, _characteristic) {
    let objectNFT={
        "name": _name,
        "id": _id,
        "characteristic": _characteristic        
    };
    arrayNFT.push(objectNFT);
    console.log("Minted: " + _name);
}

// create a "loop" that will go through an "array" of NFT's
// and print their metadata with console.log()
function listNFTs () {
    for(let i=0;i<arrayNFT.length;i++){
        console.log("Name: " + arrayNFT[i].name);
        console.log("ID: " + arrayNFT[i].id);
        console.log("Characteristic: " + arrayNFT[i].characteristic);
    }
}

// print the total number of NFTs we have minted to the console
function getTotalSupply() {
    console.log("Length of NFT: " + arrayNFT.length);
}

// call your functions below this line
mintNFT("Gursimar Singh Chahal",123,"Honest");
mintNFT("Rohit",456,"Loyal");
mintNFT("Mohit",789,"Confident");
listNFTs();
getTotalSupply();
