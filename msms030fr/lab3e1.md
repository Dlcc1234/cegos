---
layout: stage
title: "Utilisation de Microsoft 365 connectivity analyzer"
length: "00"
date: "15/05/2024"
script: "msms030.js"
---
# Scénario
Le *Remote Connectivity Analyzer* est un outil web pensé pour aider les administrateurs IT à dépanner les soucis de connectivité avec leurs déploiement Exchange, Microsoft 365 et Teams. Dominique Skyetson, en tant qu'administrateur de Adatum, doit savoir utiliser cet outil si une configuration erronnée vient interrompre les communications dans le projet pilote par exemple.

# Objectifs
A la fin de cet exercice, vous aurez une meilleure connaissance de l'outil *Microsoft Connectivity Analyzer*

## Tâche 1 - Test de connectivité
1. Vous devriez encore être connecté sur **LON-CL1** à l'issue de l'atelier précédent. Le **Microsoft 365 admin center** devrait encore être resté ouvert dans votre navigateur et vous devriez y être connecté avec le compte *Dominique Skyetson*.
1. Ouvrez un nouvel onglet dans le navigateur et rendez-vous à l'adresse du *Remote Connectivity Analyzer* : ```https://testconnectivity.microsoft.com```  
1. Sur la page **Microsoft Remote Connectivity Analyzer**, dans le menu de navigation vertical à gauche, l'onglet **Exchange Online** est affiché par défaut. Sur cet onglet, sélectionnez la tuile intitulée **Exchange Online Custom Domain DNS Connectivity Test**.
1. Sur la page **Exchange Online Custom Domain DNS Connectivity Test**, saisissez les informations suivantes :  
	- Entrez ```[onmicrosoftDomain].onmicrosoft.com``` dans le champ **Domain Name**
	- Dans la section **Service Selection**, Laissez cochée la case **Office 365 (Default)**
	- Dans la section  **Verification**, saisissez la suite de caractères affichés en violet (Le code de vérification est insensible à la casse) avant de cliquer sur **Verify**.
1. Si la vérification se passe correctement, un message apparaît en bas de page indiquant : **You are now verified for the rest of this browser session (30 minute maximum).**
1. Cliquez sur **Perform Test**.
	>**Note :** Si vous recevez un message concernant le fait d'avoir réalisé trop de tests les 60 dernières secondes, attendez quelques instant avant de réessayer.

1. Lorsque vous voyez appraître le message **Successfully verified specified external domain name settings for your domain in Office 365**, cliquez sur la flèche basse **V** à gauche de **Test Steps** (cliquez sur le texte **Test Steps** lui-même ne fonctionne pas) afin de parcourir les étapes vérifiées lors de ce test de votre domainde de tenant.

## Tâche 2 - Test de connectivité Exchange
1. Sur la page **Microsoft Remote Connectivity Analyzer**, dans le menu de navigation vertical à gauche, cliquez sur l'onglet **Exchange Online**.
1. Sélectionnez la tuile intitulée **Outlook Connectivity**.
1.Sur la page **Outlook Connectivity**, saisissez les informations suivantes :  
	- Entrez ```admin@[onmicrosoftDomain].onmicrosoft.com``` dans le champ **Email Address**
	- Cliquez sur le bouton bleu **Sign in** et authentifiez vous avec les informations de *MOD Administrator*
	- En bas de page, cochez la case **I understand that I must use the credentials of a working account from my Exchange domain to be able to test connectivity to it remotely. I also acknowledge that I am responsible for the management and security of this account**.
1. Cliquez sur **Perform Test**.
	>**Note :** Si vous recevez un message concernant le fait d'avoir réalisé trop de tests les 60 dernières secondes, attendez quelques instant avant de réessayer.

1. Lorsqu'apparait le message **The Outlook connectivity test completed successfully** message, cliquez sur la flèche basse **V** à gauche de **Test Steps** (cliquez sur le texte **Test Steps** lui-même ne fonctionne pas) afin de parcourir les étapes vérifiées lors de ce test de connectivité.  
Chaque étape a une mention **Test Steps** que vous pouvez utiliser pour consulter des opérations détaillées. 
1. Fermez votre navigateur Internet, vous pouvez passez à l'atelier suivant.

# Fin de l'atelier 3