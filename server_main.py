import os
import sys

# Configuration automatique pour le mode serveur
os.environ['DOCKER_ENV'] = 'true'
os.environ['ACTIVATION_KEY'] = '1480429608592161480444412'

# Simuler une entrée utilisateur automatique pour contourner input()
class MockInput:
    def __init__(self, activation_key):
        self.activation_key = activation_key
        self.called = False
    
    def __call__(self, prompt=""):
        if not self.called:
            self.called = True
            print(f"[AUTO] Using activation key: {self.activation_key}")
            return self.activation_key
        return self.activation_key

# Remplacer la fonction input() globalement
__builtins__['input'] = MockInput('1480429608592161480444412')

# Maintenant importer et exécuter votre programme principal
import main

# Si votre main.py a un if __name__ == "__main__", 
# vous pouvez l'exécuter directement ici
if hasattr(main, 'main'):
    main.main()
