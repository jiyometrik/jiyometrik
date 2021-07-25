#include <bits/stdc++.h>
using namespace std;
int main()
{
	int n, e;
	cin >> n >> e;

	// adjacency matrix - 2D array
	int adj[n][n];

	// initialise all values to 0
	for (int l = 0; l < n; l++)
	{
		for (int o = 0; o < n; o++)
		{
			adj[l][o] = 0;
		}
	}

	/* Since each edge is bidirectional,
	we can change both elements to 1.
	However, we have to take a - 1 and b - 1
	as arrays are zero-indexed */

	for (int i = 0; i < e; i++)
	{
		int a, b;
		cin >> a >> b;
		adj[a - 1][b - 1] = 1;
		adj[b - 1][a - 1] = 1;
	}

	// output the adjacency matrix
	for (int j = 0; j < n; j++)
	{
		for (int k = 0; k < n; k++)
			cout << adj[j][k];
		cout << '\n';
	}

	return 0;
}
