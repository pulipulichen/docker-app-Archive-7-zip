const fs = require('fs');

const dockerAPPDirectoryPath = '/input/.docker-app';
    
let stats = fs.statSync(dockerAPPDirectoryPath)
  
const IS_IN_COLAB = stats.isDirectory()

module.exports = IS_IN_COLAB