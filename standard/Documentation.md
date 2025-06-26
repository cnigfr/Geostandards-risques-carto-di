# Installations préalables :

-> Installez l'outil Pandoc (https://pandoc.org/installing.html)

-> Installez l'outil Visual Studio Code (https://code.visualstudio.com/)

-> Installez Python (ex version : 3.13.3) (https://www.python.org/downloads/),
pip install chardet --proxy=http://proxy.ign.fr:3128

-> Installez MiKTeX (https://miktex.org/download) en choisissant : “Install for: Only for me (user mode)” , 
Ouvrir MiKTeX Console, 
Dans l'onglet package : Install missing packages on-the-fly en utilisant le proxy




# Documents nécessaires :

Dossier modele : 
- ModeleV4-commun.docx
- fig.py

Dossier avec les ressources
    
- Document.md
- page_de_garde.tex
- Documentation.md



# Etapes nécessaires pour conversion (dans GitBash ou équivalent) :

Etape 1 :
````
python ./modele/fig.py Document.md && pandoc -s -f gfm -t docx --toc --toc-depth=3 -o Document.docx --reference-doc=./modele/ModeleV4-commun.docx Document.md
````
Etape 2 :

Fichier Document.docx-> Exporter -> Créer PDF -> Options -> Cocher créer des signets à l'aide de "Titres" -> Publier

Etape 3 :
````
pdflatex -interaction=nonstopmode -halt-on-error page_de_garde.tex && rm -f page_de_garde.{aux,log,out}
````
Etape 4 :
````
pdfunite page_de_garde.pdf Document.pdf document_final.pdf
````
 
_"python fig.py Document.md" permet de générer à l'endroit et à la place de la balise une numérotation automatique de la figure du tye "Figure X"._

_"--toc --toc-depth=3" permet de générer automatiquement au début du document un sommaire._ 

_Utilisation du document de référence "ModeleV4-commun" pour la mise en page du document. Il faut adapter les logos et les en-têtes en focntion de votre standard._ 

_"Fichier->Exporter->Options->Cocher "créer des signets à l'aide de "Titres""->Publier" permet la conservation des tables de matières en passant de Word à PDF._

_"pdflatex -interaction=nonstopmode -halt-on-error page_de_garde.tex" permet de convertir le fichier latex de la page de garde en un format pdf_

_"pdfunite page_de_garde.pdf rapport.pdf document_final.pdf" permet de fusionner le fichier latex de la page de garde avec le document principal._



# Utilisation et Adaptation :
## Comment utiliser le modèle : "Document.md" ?

-> Ce modèle de standard est une ossature sur laquelle vous pourrez vous appuyer pour écrire votre standard conformément aux normes d'écritures en vigueur et aux bonnes pratiques du CNIG

-> Si une partie ou section est optionnelle, cela sera indiqué. Autrement, elle devra apparaître dans votre standard.

-> Les aides et explications sont `surlignés` et entourés des symboles <>. Ls exemples sont seulement `surlignés` (si vous choisissez de reprendre le texte de l'exemple, retirez le surlignage).


-> Si vous avez plusieurs sponsors, ils pourront être indiqués en partie 1.2,

-> Préférez un logo officiel en format PNG (souvent disponible sur le site du collaborateur via le service communication) plutôt qu'une image récupérée sur un moteur de recherche,

-> Le logo du sponsor doit être de la même hauteur que le logo du CNIG.


-> Utilisez < br > pour aller à la ligne suivante.

-> Pour souligner un mot : <u>mot</u>


## Comment numéroter automatiquement les figures en utilisant la balise [FIG] ?

La balise [FIG] et la ligne de commande : "python fig.py Document.md" permet de générer à l'endroit et à la place de la balise une numérotation automatique de la figure du tye "Figure X". Pour ce faire, il suffit simplement de placer la balise [FIG] une ou plusieurs fois à ou aux endroits, où vous souhaiteriez indiquer la numérotation d'une figure dans le **Document.md**. Ainsi, une fois la ligne de commande "python fig.py Document.md" lancée, elle remplacera automatiquement la balise par la bonne numérotation.


## Comment générer une table des matières en utilisant toc ?

La ligne de commande "--toc --toc-depth=3" permet de générer automatiquement au début du document un sommaire qui reprend les titres et sous-titres du même document. "depth=3" indiqe le niveau maximal de titres à inclure, dans cet exemple il est préréglé à 3.


## Comment adapter sa mise en page en utilisant le ModeleV4-commun.docx ?

Le "ModeleV4-commun.docx" est un fichier Word, utile pour la mise en page du Document.md lors de sa conversion en fichier Word puis en fichier pdf.

### En-têtes :
Le modèle contient des styles prédéfinis pour les en-têtes et pieds de page. Lors de la conversion, Pandoc applique automatiquement ces styles, ce qui garantit une uniformité sur toutes les pages. Pour personnaliser les en-têtes, modifiez-les directement. Vous pouvez y insérer des numéros de pages ou toute autre information répétée.

### Style titres et texte :
Le modèle définit des styles pour les différents niveaux de titres (Titre 1, Titre 2, Titre 3, etc.) ainsi que pour le corps du texte (Normal). Pour que la conversion applique correctement les styles, veillez à utiliser ces styles dans votre Markdown via la hiérarchie des titres (#,##,###), que Pandoc associera aux styles correspondants dans Word. Il est aussi possible de personnaliser la police, la taille, l'interligne et les couleurs en modifiant le modèle.

### Mise en page des tableaux :
Les tableaux dans le document converti adoptent le style défini dans le modèle Word, notamment en termes de bordures, espacements, alignements et couleurs. Pour ajuster la présentation des tableaux : sélectionnez un tableau (ou insertion>Tableau) dans le Word -> cliquez sur l'onglet Conception de la table -> repérez la séction Styles de tableau -> cliquez sur la petite flèche en bas pour ouvrir le panneau des styles -> Allez sur Modifier le style de tableau ... -> Modifiez le style du tableau à votre convenance -> Cliquez sur ok.


## Comment adapter la page de garde de son document en utilisant page_de_garde.tex ?

C'est le fichier LaTeX qui inclut la configuration et le contenu de la page de garde.

Ce fichier contient les packages et paramètres LaTeX qui définissent la mise en forme générale de la page de garde :
-  \usepackage{geometry} avec margin=2.5cm définit les marges

Il contient également le contenu avec les différents titres, sous-titres, logos etc.
Pour personnaliser la page de garde :
- il suffit de modifier les textes et d'adapter la taille de leur police (Huge, Large ...). 
- Remplacez les chemins des images par les vôtres. 
- Vous pouvez aussi adpater les espacements en cm. 
- Une page blanche est insérée avec \newpage \thispagestyle{empty} \mbox{} \newpage pour séparer la page de garde du reste du document pour l'impression.
