/* Thanks to wowjesus for this */
const fs = require("fs")
const path = require("path")

const html = path.join("../dist", "index.html")
const index = fs.readFileSync(html).toString().replaceAll('"/', '"')
fs.writeFileSync(html, index)
console.log("Post build tasks finished")