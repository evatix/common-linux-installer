VsCodeShell = "./vscode/vscode.sh"

ins-wget:
	yes | sudo apt install wget

ins-curl:
	yes | sudo apt install curl

ins-vscode:
    yes | sudo sh $(VsCodeShell)

