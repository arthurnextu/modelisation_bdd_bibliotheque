SELECT E.id_emprunt, M.nom, M.prenom, L.titre, E.date_emprunt
FROM Emprunts E
JOIN Demandes D ON E.id_demande = D.id_demande
JOIN Membres M ON D.id_membre = M.id_membre
JOIN Livres L ON D.id_livre = L.id_livre


SELECT etat_demande, COUNT(*) AS nombre_demandes
FROM Demandes
GROUP BY etat_demande;

SELECT M.nom, M.prenom, L.nom, E.date_emprunt, E.date_retour
FROM Emprunts E
JOIN Demandes D ON E.id_demande = D.id_demande
JOIN Membres M ON D.id_membre = M.id_membre
JOIN Livres L ON D.id_livre = L.id_livre
WHERE M.id_membre = 1;
