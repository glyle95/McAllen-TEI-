<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    <sch:pattern>
        <sch:rule context="tei:body//tei:p//tei:persName/@ref">
            <sch:let name="indexDoc" value="doc('https://raw.githubusercontent.com/glyle95/McAllen-TEI-/master/McAllenIndex.xml')"/>
            <sch:let name="personIDs" value="$indexDoc//tei:body/tei:listPerson/tei:person/@xml:id"/>
            <sch:let name="personPtrs" value="for $i in $personIDs return concat('#', $i)"/>
            <sch:assert test=". = $personPtrs">Value must be one of the following: <sch:value-of
                    select="string-join($personPtrs, ', ')"/>
            </sch:assert>
        </sch:rule>
        <sch:rule context="tei:body//tei:p//tei:placeName/@ref">
            <sch:let name="indexDoc" value="doc('https://raw.githubusercontent.com/glyle95/McAllen-TEI-/master/McAllenIndex.xml')"/>
            <sch:let name="placeIDs" value="$indexDoc//tei:body/tei:listPlace/tei:place/@xml:id"/>
            <sch:let name="placePtrs" value="for $i in $placeIDs return concat('#', $i)"/>
            <sch:assert test=". = $placePtrs"> Value must be one of the following: <sch:value-of
                    select="string-join($placePtrs, ', ')"/>
            </sch:assert>
        </sch:rule>
        <sch:rule context="tei:body//tei:p//tei:orgName/@ref">
            <sch:let name="indexDoc" value="doc('https://raw.githubusercontent.com/glyle95/McAllen-TEI-/master/McAllenIndex.xml')"/>
            <sch:let name="orgIDs" value="$indexDoc//tei:body/tei:listOrg/tei:org/@xml:id"/>
            <sch:let name="orgPtrs" value="for $i in $orgIDs return concat('#', $i)"/>
            <sch:assert test=". = $orgPtrs"> Value must be one of the following: <sch:value-of select="string-join($orgPtrs, ', ')"/>
            </sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>
