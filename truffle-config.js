require('babel-register');
require('babel-polyfill');
const Web3 = require("web3");
var web3 = new Web3();
module.exports = {
  networks: {
    development: {
      provider: () => new web3.providers.HttpProvider("http://127.0.0.1:7545"),
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    },
  },
  contracts_directory: './src/contracts/',
  contracts_build_directory: './src/abis/',
  compilers: {
    solc: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  }
}
