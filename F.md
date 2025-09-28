### 思路：

题目要求最短路径，深度优先在搜索过程中会回溯，将已访问打下的标记重置，而广度优先不需要回溯，所以深度优先的复杂度显然高于广度优先，我们使用 $BFS$ 算法。

先将起点入队，再依次遍历当前点的四个方向，同时记录痕迹。第一次遍历到某点时一定是最短路，所以我们可以在这个点记录来时的方向。同理，第一次遍历到 $B$ 点时也是最短路，我们可以直接停止搜索工作了，然后沿着来时的痕迹记录路线。

### std:

```cpp
#include <bits/stdc++.h>
using namespace std;
#define int long long

//四个移动方向及其对应的操作字母
int dx[] = {1, 0, -1, 0};
int dy[] = {0, 1, 0, -1};
char dir[] = {'D', 'R', 'U', 'L'};

void solve() {
    int n, m;
    cin >> n >> m;
    //a数组记录输入的地图，pre数组记录到达该点的前一次操作
    vector<vector<char>> a(n, vector<char>(m)), pre(n, vector<char>(m)); 
    //b数组记录访问
    vector<vector<bool>> b(n, vector<bool>(m, false));  
    //q队列执行BFS
    //为什么要用队列呢？
    //队列的性质是先进先出
    //也就是说先拿出来的进队的时间早
    //进的早就意味先访问
    //先访问就意味着离起点近
    //把队首元素拿出，再把他能走到的点推入队尾
    //可以想一下，新加进去的元素离得一定比原队列中所有的元素远，或者距离一样，反正不可能更近
    //我们就是用这种性质来维护最短路嘟
    queue<pair<int, int>> q;  
    //记录A和B的位置
    int ax = -1, ay = -1, bx = -1, by = -1; 
    //处理输入
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; i++) {
            cin >> a[i][j];
            if (a[i][j] == 'A') {
                ax = i;
                ay = j;
                b[i][j] = true;  
                q.push({i, j});        
            } else if (a[i][j] == 'B') {
                bx = i;
                by = j;
            }
        }
    }
    //ok来标记是否已搜索到终点
    bool ok = false;
    //开搜！！！
    while (!q.empty() && !ok) {
    	//拿出队首元素
        auto [x, y] = q.front();  
        q.pop();
        //四个移动方向
        for (int i = 0; i < 4; i++) {
        	//下一个位置
            int nx = x + dx[i];  
            int ny = y + dy[i];  
            //下一个位置是否在图内，是否可以行走，是否已被访问
            if (nx >= 0 && nx < n && ny >= 0 && ny < m && !b[nx][ny] && a[nx][ny] != '#') {
            	//打上已访问标记
                b[nx][ny] = true; 
                //在下一个点上，记录从此处到下一点的操作
                //如果从别的点也能过来咋办捏
                //就记录第一次就够了，第一次一定是最短滴
                pre[nx][ny] = dir[i];    
                //处理完将下一个点入队
                q.push({nx, ny});     
				//如果走到了终点就不搜了  
                if (nx == bx && ny == by) {
                    ok = true;
                    break;
                }
            }
        }
    }
    //没搜到QAQ
    if (!ok) {
        cout << "NO\n";
        return;
    }
    //从B点沿着我们之前的记录回溯到A
    string s;
    int x = bx, y = by;
    while (x != ax || y != ay) {
        char d = pre[x][y];
        s += d;
        if (d == 'D') x -= 1;
        else if (d == 'R') y -= 1;
        else if (d == 'U') x += 1;
        else if (d == 'L') y += 1;
    }
    //居然是反着的QAQ~
	//嗬！乾坤翻转！！！
    reverse(s.begin(), s.end());
    cout << "YES\n";
    cout << s.size() << "\n";
    cout << s << "\n";
}

signed main() {
	std::ios::sync_with_stdio(false);
	std::cin.tie(nullptr);

	int _ = 1;
//	cin >> _;
	while (_--) {
		solve();
	}

	return 0;
}
```

