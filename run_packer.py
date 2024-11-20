import subprocess

def run_packer():
    try:
        subprocess.run(["packer", "build", "windows.json"], check=True)
        print("Image Windows générée avec succès.")
    except subprocess.CalledProcessError as e:
        print(f"Erreur lors de l'exécution de Packer : {e}")

if __name__ == "__main__":
    run_packer()
