console.log("5행 5열 빙고");

let bingo = "-"
let doneX = "X"
var tryBingo = 15; 
// 빙고 시도회수
var bingArr = [[bingo,bingo,bingo,bingo,bingo],
[bingo,bingo,bingo,bingo,bingo],[bingo,bingo,bingo,bingo,bingo],
[bingo,bingo,bingo,bingo,bingo],[bingo,bingo,bingo,bingo,bingo]];

for (var i = 0; i < bingArr.length; i++) {
  // console.log("i = "+ i)
  for (var j = 0; j < bingArr[i].length; j++) {
    process.stdout.write(bingArr[i][j]+"\t");
  }console.log();
};
