# Performs a config transformation.
# Microsoft.Web.XmlTransform.dll must be in the same path as this script

param(
    [Parameter(Mandatory)] $paramXml,
    [Parameter(Mandatory)] $paramXdt,
    [Parameter(Mandatory)] $paramXmlPath
)

function XmlDocTransform($xml, $xdt, $xmlPath)
{
    $xml = $xmlPath + "\" + $xml
    $xdt = $xmlPath + "\" + $xdt

    Write-Verbose "xml path is $xml" -Verbose
    if (!$xml -or !(Test-Path -path $xml -PathType Leaf)) {
        throw "File not found. $xml";
    }

    Write-Verbose "xdt path is $xdt" -Verbose
    if (!$xdt -or !(Test-Path -path $xdt -PathType Leaf)) {
        throw "File not found. $xdt";
    }

    $scriptPath = $PSScriptRoot

    Write-Verbose "script path is $scriptPath" -Verbose

    Add-Type -LiteralPath "$scriptPath\Microsoft.Web.XmlTransform.dll"

    $xmldoc = New-Object Microsoft.Web.XmlTransform.XmlTransformableDocument;
    $xmldoc.PreserveWhitespace = $true
    $xmldoc.Load($xml);

    Write-Verbose "Applying transform $xdt to $xml" -Verbose 

    $transf = New-Object Microsoft.Web.XmlTransform.XmlTransformation($xdt);
    if ($transf.Apply($xmldoc) -eq $false)
    {
        throw "Transformation failed."
    }
    $xmldoc.Save($xml);

    Write-Verbose "Done" -Verbose
}

XmlDocTransform $paramXml $paramXdt $paramXmlPath