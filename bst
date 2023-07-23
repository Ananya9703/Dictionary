package assign7p;
import java.util.*;
class Node{
	Node left, right;
	String word, meaning;
	Node(String word, String meaning){
		left=right=null;
		this.word=word;
		this.meaning=meaning;
	}
}
class tree{
	Scanner sc=new Scanner(System.in);
	Node root;
	
	public void create() {
		String word,meaning;
		int o;
		do {
			System.out.println("Enter word:");
			word=sc.next();
			System.out.println("Enter meaning:");
			meaning=sc.next();
			Node temp=new Node(word,meaning);
			if(root==null) {
				root=temp;
			}
			else {
				Node ptr=root;
				while(ptr!=null) {
					if(word.compareTo(ptr.word)<0) {
						if(ptr.left==null) {
							ptr.left=temp;
							break;
						}
						ptr=ptr.left;
					}else if(word.compareTo(ptr.word)>0) {
						if(ptr.right==null) {
							ptr.right=temp;
							break;
						}
						ptr=ptr.right;
					}else {
						System.out.println("Word already exists in dictionary");
						break;
					}
				}
			}
			System.out.println("Enter 1 to continue:");
			o=sc.nextInt();
		}while(o==1);
		System.out.println("dictionary is created");
	}
	
	public void search() {
		System.out.println("Enter word to be searched: ");
		String word1=sc.next();
		Node ptr=root;
		while(ptr!=null) {
			if(word1.equals(ptr.word)) {
				System.out.println("Word is found");
				System.out.println("Its meaning is: "+ptr.meaning);
				return;
			}
			else if(word1.compareTo(ptr.word)<0) {
				ptr=ptr.left;
			}
			else {
				ptr=ptr.right;
			}
		}
		System.out.println("Word isn't found");
	}
	
	public void display() {
		inorder(root);
	}
	
	public void inorder(Node root) {
		if(root!=null) {
			inorder(root.left);
			System.out.println("word: "+root.word+"\nmeaning: "+root.meaning);
			inorder(root.right);
		}
	}
	
	public void update() {
		System.out.println("Enter word to be updated:");
		String word1=sc.next();
		Node ptr=root;
		while(ptr!=null) {
			if(word1.equals(ptr.word)) {
				System.out.println("enter meaning to be updated to:");
				ptr.meaning=sc.next();
				System.out.println("word is updated");
				return;
			}
			else if(word1.compareTo(ptr.word)<0) {
				ptr=ptr.left;
			}
			else {
				ptr=ptr.right;
			}
		}
		System.out.println("Word isn't found");
	}
	
	public void del() {
		System.out.println("Enter word to delete:");
		String word1=sc.next();
		this.root=delete(this.root,word1);
		System.out.println("word deleted");
	}
	
	public Node delete(Node root, String word1) {
		if(root==null) {
			return root;
		}
		else if(word1.compareTo(root.word)<0) {
			root.left=delete(root.left,word1);
			
		}
		else if(word1.compareTo(root.word)>0) {
			root.right=delete(root.right,word1);
			
		}
		else {
			if(root.left==null) {
				return root.right;
			}
			if(root.right==null) {
				return root.left;
			}
			Node temp=successor(root.right);
			root.word=temp.word;
			root.meaning=temp.meaning;
			root.right=delete(root.right,root.word);
		}
		return root;
	}
	
	public Node successor(Node n) {
		String word=n.word;
		String meaning=n.meaning;
		while(n.left==null) {
			word=n.left.word;
			meaning=n.left.meaning;
			n=n.left;
		}
		return new Node(word,meaning);
	}
	
}
public class bst{
	public static void main(String args[]) {
		Scanner sc=new Scanner(System.in);
		tree obj=new tree();
		int choice;
		do {
			System.out.println("Menu");
			System.out.println("1. Create and insert");
			System.out.println("2. Display");
			System.out.println("3. Search");
			System.out.println("4. Delete");
			System.out.println("5. Update");
			System.out.println("6. Exit");
			System.out.println("Enter choice:");
			choice=sc.nextInt();
			switch(choice) {
			case 1:
				obj.create();
				break;
			case 2:
				if(obj.root==null) {
					System.out.println("tree is empty");
				}
				obj.display();
				break;
			case 3:
				obj.search();
				break;
			case 4:
				obj.del();
				break;
			case 5:
				obj.update();
				break;
			case 6:
				System.out.println("exit");
				System.exit(6);
			default: System.out.println("invalid choice");
			}
		}while(choice!=6);
	}
	
}
