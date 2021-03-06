#include<bits/stdc++.h>
using namespace std;
class Graph	{
	int V;
	list<int> *adj;
	public:
	Graph(int v);
	void addedge(int v,int w);
	void dfs(int v,bool a[]);
	void DFS(int v);
};
Graph::Graph(int v)	{
	this->V=v;
	adj=new list<int>[v];
}
void Graph::addedge(int v,int w)	{
	adj[v].push_back(w);
}
void Graph::dfs(int v,bool visited[])	{
	visited[v]=true;
	cout<<v<<" ";
	for(auto i=adj[v].begin();i!=adj[v].end();i++)	{
		if(!visited[*i])
			dfs(*i,visited);
	}
}
void Graph::DFS(int v)	{
	bool visited[4];
	for(int i=0;i<4;i++)
		visited[i]=false;
	dfs(v,visited);
}
int main()	{
	Graph g(4);
	g.addedge(0, 1); 
    	g.addedge(0, 2); 
	g.addedge(1, 2); 
	g.addedge(2, 0); 
        g.addedge(2, 3); 
	g.addedge(3, 3); 
	cout << "Following is Depth First Traversal"
		    " (starting from vertex 2) \n"; 
	g.DFS(2); 
	  
    	return 0; 
} 
addEdge(2, 3); 
    	g.addEdge(3, 3); 
  
    	cout << "Following is Breadth First Traversal "
         << "(starting from vertex 2) \n"; 
    	g.BFS(2); 
  
    	return 0; 
}
V  