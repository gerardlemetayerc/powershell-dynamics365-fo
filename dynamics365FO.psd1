#
# Manifeste de module pour le module « dynamics365FO »
#
# Généré par : Charles MANGENEY
# Généré le : 10/04/2022

@{
    # RootModule = ''
    ModuleVersion = '1.0'
    
    # CompatiblePSEditions = @()
    
    GUID = '6de2349c-7524-4742-a562-e6993e8c7eaf'
    Author = 'Charles MANGENEY'
    

    # Description de la fonctionnalité fournie par ce module
    # Description = ''

    # Fonctions à exporter à partir de ce module. Pour de meilleures performances, n’utilisez pas de caractères génériques et ne supprimez pas l’entrée. Utilisez un tableau vide si vous n’avez aucune fonction à exporter.
    FunctionsToExport = @(
        Get-DynamicsFO365DataManagementExecutionJobDetails,
        Get-DynamicsFO365PersonUsers,
        Get-DynamicsFO365SystemUsers,
        Connect-DynamicsFO365,
        Test-AzureRevokation
    )


    # Variables à exporter à partir de ce module
    VariablesToExport = '*'

    # Alias à exporter à partir de ce module. Pour de meilleures performances, n’utilisez pas de caractères génériques et ne supprimez pas l’entrée. Utilisez un tableau vide si vous n’avez aucun alias à exporter.
    AliasesToExport = @()

    # Données privées à transmettre au module spécifié dans RootModule/ModuleToProcess. Cela peut également inclure une table de hachage PSData avec des métadonnées de modules supplémentaires utilisées par PowerShell.
    PrivateData = @{

        PSData = @{

            # Des balises ont été appliquées à ce module. Elles facilitent la découverte des modules dans les galeries en ligne.
            Tags = @(Dynamics365FO)

            # URL vers la licence de ce module.
            # LicenseUri = ''

            # URL vers le site web principal de ce projet.
            ProjectUri = 'https://gitlab.com/powershell-usefull-repository/dynamics365/dynamics365'

            # URL vers une icône représentant ce module.
            # IconUri = ''

            # Propriété ReleaseNotes de ce module
            # ReleaseNotes = ''

        } # Fin de la table de hachage PSData

    } # Fin de la table de hachage PrivateData

    # URI HelpInfo de ce module
    # HelpInfoURI = ''

    # Le préfixe par défaut des commandes a été exporté à partir de ce module. Remplacez le préfixe par défaut à l’aide d’Import-Module -Prefix.
    # DefaultCommandPrefix = ''

}