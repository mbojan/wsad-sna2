# Further Topics in Social Network Analysis

Samouczek SNA.

## Spis treści

Linki prowadzą do skompilowanych gotowych części.

1. [Local neighborhoods](https://rawgit.com/mbojan/wsad-sna2/master/local_neighborhoods.html)
2. [Centrality](https://rawgit.com/mbojan/wsad-sna2/master/Centrality.html)
3. [Friendship paradox](https://rawgit.com/mbojan/wsad-sna2/master/friendship_paradox.html)
4. [Small world phenomenon](https://rawgit.com/mbojan/wsad-sna2/master/small_world.html)
5. Homophily and segregation
6. [Cohesion](https://rawgit.com/mbojan/wsad-sna2/master/cohesion.html)
7. [ERGMs](https://rawgit.com/mbojan/wsad-sna2/master/ergm.html)



(stuby w [`sylabus.md`](sylabus.md))




## Workflow

[https://nathanhoad.net/git-workflow-forks-remotes-and-pull-requests](https://nathanhoad.net/git-workflow-forks-remotes-and-pull-requests)


## Dane

Wrzucajmy do katalogu `data`.

Kilka zbiorów danych w pakiecie `isnar` [tu](https://github.com/mbojan/isnar).
W szczególności jedna z klas z badania IBE (`IBE121`).


## Bibliografia

Robimy bibliografię zgodnie z mechanizmem opisanym tutaj
[http://rmarkdown.rstudio.com/authoring_bibliographies_and_citations.html](http://rmarkdown.rstudio.com/authoring_bibliographies_and_citations.html).

Baza pozycji znajduje się w pliku `references.bib` w formacie BibTeX. Szczegóły
patrz np. [Wikipedia](http://en.wikipedia.org/wiki/BibTeX)
Przykładowe pozycje dla artykułu i książki już umieściłem. 

Pozycje (prawie) gotowe do wklejenia do `references.bib` można uzyskać z Google Scholar. W wynikach wyszukiwania
kilkamy "Cytuj" a następnie "BibTeX". Kopiujemy, wklejamy, edytujemy klucz i gotowe. Np dla artykułu
McPherson et al "Birds of a feather..." dostaniemy

```
@article{mcpherson2001birds,
  title={Birds of a feather: Homophily in social networks},
  author={McPherson, Miller and Smith-Lovin, Lynn and Cook, James M},
  journal={Annual review of sociology},
  pages={415--444},
  year={2001},
  publisher={JSTOR}
}
```

Proponuję następujący format klucza (to, co wstawiamy w tekście w nawiasach po
`@`):

- `autor1_rok` jeżeli jeden autor
- `autor1_autor2_rok` jeżeli dwóch autorów
- `autor1_etal_rok` jeżeli więcej niż dwóch autorów

A więc na przykład `burt_1992` albo `mcpherson_etal_2001`
