const axios = require('axios')

const User = {

  getAll: () => {
    return axios.get('https://pokeapi.co/api/v2/pokemon?offset=20&limit=20')
  }
}

module.exports = { User }
