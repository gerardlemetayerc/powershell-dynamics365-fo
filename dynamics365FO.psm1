function Test-AzureRevokation{
    return ((([System.DateTimeOffset]::FromUnixTimeSeconds($dynamics365Token.expires_on)).LocalDateTime) -le (Get-Date))
}


function Connect-DynamicsFO365{
    param(
        $tenant = $global:dynamics365Token.homeTenant,
        $dynamicsURL = $global:dynamics365Token.resource,
        $azureAppID =  $global:dynamics365Token.azureAppID,
        [Parameter(Mandatory=$true)]$azureSecret,
        $proxy
    )
    if(!$tenant){$tenant = Read-Host "tenant"}
    if(!$dynamicsURL){$dynamicsURL = Read-Host "dynamicsURL"}
    if(!$azureAppID){$azureAppID = Read-Host "azureAppId"}

    $microsoftLoginURI = "https://login.microsoft.com/$tenant/oauth2/token"
    $reqTokenBody = @{
        resource        = $dynamicsURL
        grant_type      = "client_credentials"
        client_id       = $azureAppID
        client_secret   = $azureSecret
    }
    try{
        $global:dynamics365Token = Invoke-RestMethod -Uri $microsoftLoginURI -Method POST -Body $reqTokenBody | Select *, @{Name="homeTenant";Expression={$tenant}}, @{Name="azureAppId";Expression={$azureAppID}}
        Write-Host -ForeGround "Green" "You are connected to $($dynamicsURL)"
    }catch{
        Write-Error "Failed to generate authentication using parameters."
        Write-Error $_.Message
    }
}

function Get-DynamicsFO365SystemUsers {
    param($name)
    if(Test-AzureRevokation){Connect-DynamicsFO365}
    $header = @{Authorization = "Bearer $($global:dynamics365Token.access_token)"}
    $api = "data/SystemUsers"
    $filter = "?"
    if($name){
        $filter += "`$filter=UserID eq '$name'"
    }
    $requestURI = "$($global:dynamics365Token.resource)/$api$filter"
    return (Invoke-RestMethod -Uri $requestURI -Method GET -header $header).value
}

function Get-DynamicsFO365PersonUsers {
    param($name)
    if(Test-AzureRevokation){Connect-DynamicsFO365}
    $header = @{Authorization = "Bearer $($global:dynamics365Token.access_token)"}
    $api = "data/PersonUsers"
    $filter = "?"
    if($name){
        $filter += "`$filter=UserId eq '$name'"
    }
    $requestURI = "$($global:dynamics365Token.resource)/$api$filter"
    return (Invoke-RestMethod -Uri $requestURI -Method GET -header $header).value
}

function Set-DynamicsFO365PersonUsers {
    if(Test-AzureRevokation){Connect-DynamicsFO365}
}

function Set-DynamicsFO365SystemUsers {
    if(Test-AzureRevokation){Connect-DynamicsFO365}
}

function New-DynamicsFO365PersonUsers {
    if(Test-AzureRevokation){Connect-DynamicsFO365}
}

function New-DynamicsFO365SystemUsers{
    if(Test-AzureRevokation){Connect-DynamicsFO365}
}


function Get-DynamicsFO365DataManagementExecutionJobDetails {
    param($projectName,$executionID)
    if(Test-AzureRevokation){Connect-DynamicsFO365}
    $header = @{Authorization = "Bearer $($global:dynamics365Token.access_token)"}
    $api = "data/DataManagementExecutionJobDetails"
    $filter = "?"
    if($projectName){
        $filter += "`$filter=DefinitionGroupId eq '*$projectName*'"
    }
    if($executionID){
        if($args.Count -gt 1){$filter += " and "}
        else{$filter = "?`$filter="}
        $filter += "JobId eq '*$executionID*'"
    }
    $requestURI = "$($global:dynamics365Token.resource)/$api$filter"
    return (Invoke-RestMethod -Uri $requestURI -Method GET -header $header).value
}


Export-ModuleMember -Function *