param ($query)

function Get-IP-Info{
  [CmdletBinding()]
  [OutputType([string])]
  param(
    [Parameter(Mandatory=$true)][string]$ip
  )
  process {
    # Default to TLS 1.2 for API calls
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    # Bake the request
    $Uri = 'https://rest.db.ripe.net/search.json?query-string=' + $ip
    $Headers  = @{
      'Content-Type' = 'application/json'
      'Accept'       = 'application/json'
    }

    # Request
    $Response = Invoke-RestMethod -Method 'Get' -Uri $Uri

    # Handle response
    $Result = $Response.objects.object | ConvertTo-JSON
    Write-Output $Result
    $Result
  }
  end {}
}

function Get-Domain-Info {
  [CmdletBinding()]
  [OutputType([string])]
  param(
    [Parameter(Mandatory=$true)][string]$domain
  )
  process {
    # Default to TLS 1.2 for API calls
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    # Bake the request

    # Request

    # Handle response
  }
  end {}
}

function Get-IP-From-Domain {
  [CmdletBinding()]
  [OutputType([array])]
  param(
    [Parameter(Mandatory=$true)][string]$domain
  )
  process {
    [array]$Result = Resolve-DnsName -Name $domain -Server 8.8.8.8 -NoHostsFile |
      Format-Table IPAddress -HideTableHeader
    $Result
  }
  end {}
}

Get-IP-Info($query)
